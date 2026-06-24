import config from 'dotenv/config'
import express from 'express'
import sequelize from './config/sequelize.js'
import * as mapping from './models/mapping.js'
import cors from 'cors'
import fileUpload from 'express-fileupload'
import cookieParser from 'cookie-parser'
import router from './routes/index.js'
import errorMiddleware from './middleware/errorMiddleware.js'
import path from 'path'
import { fileURLToPath } from 'url'

// Эмуляция __dirname для ES-модулей
const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)

const PORT = process.env.PORT || 5000
const app = express()

// CORS: в продакшене разрешаем все (так как фронт и бэк на одном домене)
if (process.env.NODE_ENV === 'production') {
  app.use(cors())
} else {
  app.use(cors({ origin: ['http://localhost:3002'], credentials: true }))
}

app.use(express.json())
app.use(express.static('static'))
app.use(fileUpload())
app.use(cookieParser(process.env.SECRET_KEY))
app.use('/api', router)

// ✅ БЛОК ДЛЯ ПРОДАКШЕНА: раздача React-билда
if (process.env.NODE_ENV === 'production') {
  // Путь к собранному React-приложению (в соседней папке client.v2)
  const clientBuildPath = path.join(__dirname, '../client.v2/build')
  
  // Раздаём статические файлы (JS, CSS, картинки)
  app.use(express.static(clientBuildPath))
  
  // Все остальные запросы отдаём index.html (для React Router)
  app.get('*', (req, res) => {
    res.sendFile(path.resolve(clientBuildPath, 'index.html'))
  })
}

app.use(errorMiddleware)

const start = async () => {
  try {
    await sequelize.authenticate()
    await sequelize.sync()
    app.listen(PORT, () => console.log('Сервер запущен на порту', PORT))
  } catch(e) {
    console.log(e)
  }
}
start()