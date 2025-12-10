// services/testContentBasedBatch.js

import testDb from '../config/testDatabase.js';
import { Product } from '../models/testModels.js';
import { ContentBasedRecommendationService } from './ContentBasedRecommendationService.js';

async function testContentBasedBatch() {
  try {
    await testDb.authenticate();
    console.log('✅ Подключение к тестовой БД успешно');

    // Выбираем товары для тестирования
    const testProductIds = [1, 10, 20, 30]; // добавьте ID товаров, которые хотите протестировать

    const service = new ContentBasedRecommendationService();

    console.log('\n🔍 Начинаем тестирование Content-Based рекомендаций...\n');

    for (const id of testProductIds) {
      console.log(`\n--- Тестируем товар ID: ${id} ---`);

      // Проверяем, существует ли товар
      const targetProduct = await Product.findByPk(id);
      if (!targetProduct) {
        console.log(`❌ Товар с ID ${id} не найден в тестовой БД`);
        continue;
      }

      console.log(`   Целевой товар: ${targetProduct.name}`);
      console.log(`   Характеристики: цена=${targetProduct.price}, категория=${targetProduct.category_id}, бренд=${targetProduct.brand_id}, просмотры=${targetProduct.visits}`);

      // Получаем рекомендации
      const recommendations = await service.getRecommendations(id, 5);

      console.log(`   Рекомендации:`);
      recommendations.forEach((product, index) => {
        console.log(`     ${index + 1}. ${product.name} (id: ${product.id}, цена: ${product.price}, категория: ${product.category_id}, бренд: ${product.brand_id}, просмотры: ${product.visits})`);
      });
    }

    console.log('\n✅ Тестирование завершено');
  } catch (err) {
    console.error('❌ Ошибка при тестировании:', err);
  } finally {
    await testDb.close();
  }
}

testContentBasedBatch();