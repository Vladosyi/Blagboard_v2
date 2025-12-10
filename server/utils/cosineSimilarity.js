// utils/cosineSimilarity.js

/**
 * Вычисляет косинусное сходство между двумя векторами
 * @param {number[]} vecA
 * @param {number[]} vecB
 * @returns {number} значение от 0 до 1
 */
export function cosineSimilarity(vecA, vecB) {
  if (vecA.length !== vecB.length) {
    throw new Error('Векторы должны быть одинаковой длины');
  }

  const dotProduct = vecA.reduce((sum, val, i) => sum + val * vecB[i], 0);
  const magnitudeA = Math.sqrt(vecA.reduce((sum, val) => sum + val ** 2, 0));
  const magnitudeB = Math.sqrt(vecB.reduce((sum, val) => sum + val ** 2, 0));

  if (magnitudeA === 0 || magnitudeB === 0) {
    return 0; // чтобы избежать деления на 0
  }

  return dotProduct / (magnitudeA * magnitudeB);
}

/**
 * Вычисляет **взвешенное** косинусное сходство между двумя векторами
 * @param {number[]} vecA
 * @param {number[]} vecB
 * @param {number[]} weights - массив весов для каждого признака
 * @returns {number} значение от 0 до 1
 */
export function weightedCosineSimilarity(vecA, vecB, weights) {
  if (vecA.length !== vecB.length || vecA.length !== weights.length) {
    throw new Error('Векторы и веса должны быть одинаковой длины');
  }

  // Умножаем векторы на веса
  const weightedA = vecA.map((val, i) => val * weights[i]);
  const weightedB = vecB.map((val, i) => val * weights[i]);

  return cosineSimilarity(weightedA, weightedB);
}