// services/CollaborativeRecommendationService.js

import { Matrix, SingularValueDecomposition } from "ml-matrix";
import { Rating } from "../models/testModels.js";

export class CollaborativeRecommendationService {
  constructor() {
    this.userIds = [];
    this.productIds = [];
    this.U = null;
    this.S = null;
    this.V = null;

    // Храним обучающую и тестовую выборки
    this.trainRatings = [];
    this.testRatings = [];
  }

  /**
   * Загружает рейтинги и разбивает на обучающую и тестовую выборки
   * @param {number} testRatio - доля тестовой выборки (например, 0.2 = 20%)
   */
  async loadAndSplitData(testRatio = 0.2) {
    console.log("🔍 Загружаю рейтинги из БД...");

    // Убедимся, что мы используем модели из testModels.js
    const allRatings = await Rating.findAll({
      attributes: ["user_id", "product_id", "rate"],
    });

    if (allRatings.length === 0) {
      console.log("❌ В таблице ratings нет данных");
      return;
    }

    console.log(`📊 Загружено ${allRatings.length} рейтингов`);

    // Перемешиваем рейтинги
    const shuffledRatings = [...allRatings].sort(() => Math.random() - 0.5);

    // Разбиваем на обучающую и тестовую
    const splitIndex = Math.floor(allRatings.length * (1 - testRatio));
    this.trainRatings = shuffledRatings.slice(0, splitIndex);
    this.testRatings = shuffledRatings.slice(splitIndex);

    console.log(`📈 Обучающая выборка: ${this.trainRatings.length} рейтингов`);
    console.log(`📉 Тестовая выборка: ${this.testRatings.length} рейтингов`);

    // Выведем примеры
    console.log("📋 Примеры обучающих рейтингов:");
    console.log(this.trainRatings.slice(0, 5)); // первые 5
    console.log("📋 Примеры тестовых рейтингов:");
    console.log(this.testRatings.slice(0, 5)); // первые 5
  }
  /**
   * Обучает модель на основе обучающей выборки
   */
  async train() {
    if (this.trainRatings.length === 0) {
      console.log("❌ Обучающая выборка пуста, невозможно обучить модель");
      return;
    }

    console.log(`🔍 Обучаю модель на ${this.trainRatings.length} рейтингах...`);

    // Получаем уникальные ID
    const userIdsSet = new Set(this.trainRatings.map((r) => r.user_id));
    const productIdsSet = new Set(this.trainRatings.map((r) => r.product_id));
    this.userIds = Array.from(userIdsSet).sort((a, b) => a - b);
    this.productIds = Array.from(productIdsSet).sort((a, b) => a - b);

    // Создаём индексные карты
    const userIndexMap = new Map(this.userIds.map((id, i) => [id, i]));
    const productIndexMap = new Map(this.productIds.map((id, i) => [id, i]));

    // Создаём разреженную матрицу (пользователь x товар)
    const matrixData = Array(this.userIds.length)
      .fill(0)
      .map(() => Array(this.productIds.length).fill(0));

    this.trainRatings.forEach((rating) => {
      const uIdx = userIndexMap.get(rating.user_id);
      const pIdx = productIndexMap.get(rating.product_id);
      if (uIdx !== undefined && pIdx !== undefined) {
        matrixData[uIdx][pIdx] = rating.rate;
      }
    });

    const matrix = new Matrix(matrixData);

    // Применяем SVD
    const svd = new SingularValueDecomposition(matrix, { maxIterations: 100 });
    this.U = svd.leftSingularVectors;
    this.S = svd.diagonalMatrix;
    this.V = svd.rightSingularVectors;

    console.log("✅ Модель SVD обучена");
  }

  /**
   * Возвращает список рекомендованных товаров для пользователя
   * @param {number} userId
   * @param {number} limit
   */
  async getRecommendations(userId, limit = 5) {
    if (!this.U) {
      console.log("❌ Модель не обучена");
      return [];
    }

    const userIndex = this.userIds.indexOf(userId);
    if (userIndex === -1) {
      console.log(`❌ Пользователь ${userId} не найден в обучающих данных`);
      return [];
    }

    // Восстанавливаем приближённую матрицу: U * S * V^T
    const predictedMatrix = this.U.mmul(this.S).mmul(this.V.transpose());
    const userPredictions = predictedMatrix.getRow(userIndex);

    // Фильтруем товары, которые пользователь уже оценивал в обучающей выборке
    const userTrainItems = this.trainRatings
      .filter((r) => r.user_id === userId)
      .map((r) => this.productIds.indexOf(r.product_id))
      .filter((idx) => idx !== -1);

    const predictions = userPredictions
      .map((rating, productIndex) => ({
        productIndex,
        predictedRating: rating,
      }))
      .filter((p) => !userTrainItems.includes(p.productIndex)) // Только неоценённые в обучении
      .sort((a, b) => b.predictedRating - a.predictedRating)
      .slice(0, limit);

    console.log(
      `📋 Рекомендации для пользователя ${userId}:`,
      predictions.map((p) => this.productIds[p.productIndex])
    );

    return predictions.map((p) => this.productIds[p.productIndex]);
  }

  async evaluate(k = 5) {
    if (this.testRatings.length === 0) {
      console.log("❌ Тестовая выборка пуста");
      return { precision: 0, recall: 0 };
    }

    console.log(`🔍 Оцениваю модель на тестовой выборке (k=${k})...`);

    let totalPrecision = 0;
    let totalRecall = 0;
    let userCount = 0;

    // Группируем тестовые рейтинги по пользователям
    const testRatingsByUser = this.testRatings.reduce((acc, r) => {
      if (!acc[r.user_id]) acc[r.user_id] = [];
      acc[r.user_id].push(r.product_id);
      return acc;
    }, {});

    for (const userId of Object.keys(testRatingsByUser).map(Number)) {
      const trueItems = testRatingsByUser[userId]; // Товары, которые пользователь реально оценил в тесте
      const recommendations = await this.getRecommendations(userId, k);

      // Пересечение: сколько из рекомендованных товаров реально понравилось
      const intersection = recommendations.filter((item) =>
        trueItems.includes(item)
      );

      // Проверяем, чтобы не делить на 0
      const precision =
        recommendations.length > 0
          ? intersection.length / recommendations.length
          : 0;
      const recall =
        trueItems.length > 0 ? intersection.length / trueItems.length : 0;

      totalPrecision += precision;
      totalRecall += recall;
      userCount++;
    }

    const avgPrecision = totalPrecision / userCount;
    const avgRecall = totalRecall / userCount;

    console.log(`📊 Средняя Precision@${k}: ${avgPrecision.toFixed(3)}`);
    console.log(`📊 Средняя Recall@${k}: ${avgRecall.toFixed(3)}`);

    return { precision: avgPrecision, recall: avgRecall };
  }
}
