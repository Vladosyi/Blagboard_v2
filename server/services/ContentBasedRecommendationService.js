// services/ContentBasedRecommendationService.js

import { Product } from '../models/testModels.js';
import { weightedCosineSimilarity } from '../utils/cosineSimilarity.js';
import { vectorizeProduct, computeGlobalData } from '../utils/vectorizeProduct.js';

export class ContentBasedRecommendationService {
  /**
   * Возвращает список похожих товаров для указанного productId
   * @param {number} productId
   * @param {number} limit - количество рекомендаций (по умолчанию 5)
   * @returns {Array} список товаров
   */
  async getRecommendations(productId, limit = 5) {
    // Загружаем все товары
    const allProducts = await Product.findAll();

    // Подготавливаем глобальные данные для нормализации
    const globalData = computeGlobalData(allProducts);

    // Находим целевой товар
    const targetProduct = allProducts.find(p => p.id === productId);
    if (!targetProduct) {
      throw new Error(`Товар с id ${productId} не найден`);
    }

    // Векторизуем целевой товар (без просмотров)
    const targetVector = vectorizeProduct(targetProduct, globalData);

    // Векторизуем все остальные товары и считаем сходство
    const scoredProducts = allProducts
      .filter(p => p.id !== productId) // исключаем сам целевой товар
      .map(product => {
        const vector = vectorizeProduct(product, globalData);
        // Считаем **взвешенное** косинусное сходство (без просмотров в векторе)
        // Веса: [цена, категория, бренд]
        const weights = [0.3, 0.4, 0.2]; // пример весов
        const similarity = weightedCosineSimilarity(targetVector, vector, weights);

        // Нормализуем просмотры (от 0 до 1)
        const normalizedVisits = product.visits / globalData.maxVisits;

        // Умножаем на **коэффициент популярности** (например, 0.1)
        const popularityBoost = 0.1 * normalizedVisits;

        // Итоговый скор = сходство + (популярность * коэффициент)
        const finalScore = similarity + popularityBoost;

        return {
          product,
          finalScore
        };
      });

    // Сортируем по итоговому скору (finalScore) и возвращаем топ-N
    const topProducts = scoredProducts
      .sort((a, b) => b.finalScore - a.finalScore)
      .slice(0, limit)
      .map(item => item.product);

    return topProducts;
  }
}