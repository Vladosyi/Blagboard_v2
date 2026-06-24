import { Sequelize } from 'sequelize';

// Проверяем, задана ли DATABASE_URL (режим Render/production)
if (process.env.DATABASE_URL) {
  // Подключение через строку URL (для Render)
  export default new Sequelize(process.env.DATABASE_URL, {
    dialect: 'postgres',
    protocol: 'postgres',
    logging: false,
    timezone: 'Europe/Moscow',
    dialectOptions: {
      ssl: {
        require: true,           // Render требует SSL
        rejectUnauthorized: false // Разрешаем самоподписанные сертификаты
      }
    }
  });
} else {
  // Локальное подключение через отдельные параметры
  export default new Sequelize(
    process.env.DB_NAME,
    process.env.DB_USER,
    process.env.DB_PASS,
    {
      dialect: 'postgres',
      host: process.env.DB_HOST,
      port: process.env.DB_PORT,
      define: {
        underscored: true
      },
      logging: false,
      timezone: 'Europe/Moscow',
    }
  );
}