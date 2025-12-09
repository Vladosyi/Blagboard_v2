// services/populateTestDB.js
import testDb from '../config/testDatabase.js';

// Импортируем модели для тестовой БД
import { User, Product, Rating, OrderItem, ProductProp } from '../models/testModels.js';

import { generateUsers, generateProducts, generateProductProps, generateRatings, generateOrderItems } from './generateTestData.js';

async function populateTestDB() {
  try {
    await testDb.authenticate();
    console.log('Подключение к тестовой БД успешно');

    // Синхронизируем модели (создаём таблицы, если их нет)
    await testDb.sync({ force: false });
    console.log('Таблицы созданы');

    // Генерируем данные
    const users = generateUsers(100);
    const products = generateProducts(100);
    const props = generateProductProps(products);
    const ratings = generateRatings(users, products, 2000);
    const orderItems = generateOrderItems(users, products, 800);

    // Заливаем в БД
    await User.bulkCreate(users, { logging: false });
    await Product.bulkCreate(products, { logging: false });
    await ProductProp.bulkCreate(props, { logging: false });
    await Rating.bulkCreate(ratings, { logging: false });
    await OrderItem.bulkCreate(orderItems, { logging: false });

    console.log('Тестовые данные успешно залиты в тестовую БД `blagboard_test`');
  } catch (err) {
    console.error('Ошибка при заливке данных:', err);
  } finally {
    await testDb.close();
  }
}

populateTestDB();