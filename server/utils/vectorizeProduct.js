// utils/vectorizeProduct.js

/**
 * Векторизует один товар в числовой массив (только основные характеристики, без просмотров)
 * @param {Object} product - объект товара (из БД)
 * @param {Object} globalData - объект с глобальными данными (макс. цена, макс. категория, макс. бренд)
 * @returns {Array} числовой вектор [normPrice, normCategoryId, normBrandId]
 */
export function vectorizeProduct(product, globalData) {
  // Нормализуем цену (например, делим на максимальную цену)
  const normalizedPrice = product.price / globalData.maxPrice;

  // Нормализуем category_id
  const normalizedCategoryId = product.category_id / globalData.maxCategoryId;

  // Нормализуем brand_id
  const normalizedBrandId = product.brand_id / globalData.maxBrandId;

  // Собираем финальный вектор
  // Порядок: [норм. цена, норм. категория, норм. бренд]
  return [
    normalizedPrice,
    normalizedCategoryId,
    normalizedBrandId
  ];
}

/**
 * Подсчитывает глобальные данные для нормализации
 * @param {Array} products - массив товаров
 * @returns {Object}
 */
export function computeGlobalData(products) {
  const maxPrice = Math.max(...products.map(p => p.price));
  const maxVisits = Math.max(...products.map(p => p.visits || 0));
  const maxCategoryId = Math.max(...products.map(p => p.category_id));
  const maxBrandId = Math.max(...products.map(p => p.brand_id));

  return {
    maxPrice,
    maxVisits,
    maxCategoryId,
    maxBrandId
  };
}