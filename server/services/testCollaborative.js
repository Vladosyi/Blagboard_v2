// services/testCollaborative.js

import testDb from '../config/testDatabase.js';
import { CollaborativeRecommendationService } from './CollaborativeRecommendationService.js';

async function testCollaborative() {
  try {
    await testDb.authenticate();
    console.log('✅ Подключение к тестовой БД успешно');

    const service = new CollaborativeRecommendationService();

    // Загружаем рейтинги и разбиваем на обучающую и тестовую выборки
    await service.loadAndSplitData(0.2); // 20% на тест

    // Обучаем модель на обучающей выборке
    await service.train();

    // Оцениваем модель на тестовой выборке
    const metrics = await service.evaluate(400); // k=5

    console.log('\n✅ Тестирование коллаборативной фильтрации завершено');
    console.log('📋 Результаты:');
    console.log(`   Precision@5: ${metrics.precision.toFixed(3)}`);
    console.log(`   Recall@5: ${metrics.recall.toFixed(3)}`);

  } catch (err) {
    console.error('❌ Ошибка при тестировании:', err);
  } finally {
    await testDb.close();
  }
}

testCollaborative();