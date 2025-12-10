// services/testContentBased.js

import testDb from '../config/testDatabase.js';
import { Product } from '../models/testModels.js';
import { ContentBasedRecommendationService } from './ContentBasedRecommendationService.js';

async function testContentBased() {
  try {
    await testDb.authenticate();
    console.log('✅ Подключение к тестовой БД успешно');

    // Получаем ID товара из командной строки
    const productId = process.argv[2]; // node services/testContentBased.js 1

    if (!productId) {
      console.log('❌ Не указан ID товара');
      console.log('Пример: node services/testContentBased.js 1');
      return;
    }

    const id = parseInt(productId, 10);
    if (isNaN(id)) {
      console.log('❌ ID товара должен быть числом');
      return;
    }

    // Проверяем, существует ли товар
    const targetProduct = await Product.findByPk(id);
    if (!targetProduct) {
      console.log(`❌ Товар с ID ${id} не найден в тестовой БД`);
      return;
    }

    console.log(`\n🔍 Тестируем рекомендации для товара ID: ${id} ("${targetProduct.name}")`);
    console.log(`   Характеристики: цена=${targetProduct.price}, категория=${targetProduct.category_id}, бренд=${targetProduct.brand_id}, просмотры=${targetProduct.visits}`);

    const service = new ContentBasedRecommendationService();
    const recommendations = await service.getRecommendations(id, 5);

    console.log(`\n📋 Рекомендации для товара ${id}:`);
    recommendations.forEach((product, index) => {
      console.log(`${index + 1}. ${product.name} (id: ${product.id}, цена: ${product.price}, категория: ${product.category_id}, бренд: ${product.brand_id}, просмотры: ${product.visits})`);
    });

    console.log('\n✅ Тестирование завершено');
  } catch (err) {
    console.error('❌ Ошибка при тестировании:', err);
  } finally {
    await testDb.close();
  }
}

testContentBased();