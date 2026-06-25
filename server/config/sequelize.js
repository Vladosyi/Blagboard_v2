import { Sequelize } from 'sequelize';

let sequelize;

// Проверяем, задана ли DATABASE_URL (режим Render/production)
if (process.env.DATABASE_URL) {
  // Подключение через строку URL (для Render)
  sequelize = new Sequelize(process.env.DATABASE_URL, {
    dialect: 'postgres',
    protocol: 'postgres',
    logging: false,
    timezone: 'Europe/Moscow',
    define: {
        underscored: true
      },
    dialectOptions: {
      ssl: {
        require: true,           // Render требует SSL
        rejectUnauthorized: false // Разрешаем самоподписанные сертификаты
      }
    }
  });
} else {
  // Локальное подключение через отдельные параметры
  sequelize = new Sequelize(
    process.env.DB_NAME,
    process.env.DB_USER,
    process.env.DB_PASS,
    {
      host: process.env.DB_HOST,
      port: process.env.DB_PORT || 5432,
      dialect: 'postgres',
      logging: false,
      timezone: 'Europe/Moscow',
      define: {
        underscored: true
      }
    }
  );
}

export default sequelize;