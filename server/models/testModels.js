// models/testModels.js
import database from 'sequelize';
const { DataTypes } = database;

import testDb from '../config/testDatabase.js'; // тестовая БД

// Определяем модели для тестовой БД
export const User = testDb.define('user', {
  id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
  email: { type: DataTypes.STRING, unique: true },
  password: { type: DataTypes.STRING },
  role: { type: DataTypes.STRING, defaultValue: 'USER' },
});

export const Product = testDb.define('product', {
  id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
  name: { type: DataTypes.STRING, unique: true, allowNull: false },
  price: { type: DataTypes.INTEGER, allowNull: false },
  rating: { type: DataTypes.INTEGER, defaultValue: 0 },
  image: { type: DataTypes.STRING, allowNull: false },
  category_id: { type: DataTypes.INTEGER },
  brand_id: { type: DataTypes.INTEGER },
  visits: { type: DataTypes.INTEGER, defaultValue: 0 },
});

export const Rating = testDb.define('rating', {
  rate: { type: DataTypes.INTEGER, allowNull: false },
  user_id: { type: DataTypes.INTEGER },
  product_id: { type: DataTypes.INTEGER },
});

export const OrderItem = testDb.define('order_item', {
  name: { type: DataTypes.STRING },
  price: { type: DataTypes.INTEGER },
  quantity: { type: DataTypes.INTEGER },
  order_id: { type: DataTypes.INTEGER },
  product_id: { type: DataTypes.INTEGER },
});

export const ProductProp = testDb.define('product_prop', {
  name: { type: DataTypes.STRING },
  value: { type: DataTypes.STRING },
  product_id: { type: DataTypes.INTEGER },
});

// Связи (опционально, можно не указывать, если не используете их в bulkCreate)
// User.hasMany(Rating);
// Rating.belongsTo(User);
// и т.д.

export default {
  User,
  Product,
  Rating,
  OrderItem,
  ProductProp,
};