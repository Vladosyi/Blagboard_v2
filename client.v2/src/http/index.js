import axios from 'axios'

// Определяем, в каком режиме работает приложение
// process.env.NODE_ENV будет 'production' на Render после сборки
const isProduction = process.env.NODE_ENV === 'production'

// Базовый URL: относительный путь для продакшена, абсолютный для локалки
const baseURL = isProduction ? '/api' : process.env.REACT_APP_API_URL

const guestInstance = axios.create({
    baseURL: baseURL,
    withCredentials: true
})

const authInstance = axios.create({
    baseURL: baseURL,
    withCredentials: true
})

// добавляем в запрос данные для авторизации с помощью перехватчика (interceptor)
const authInterceptor = (config) => {
    const token = localStorage.getItem('token')
    if (token) {
        config.headers.authorization = 'Bearer ' + localStorage.getItem('token')
    }
    return config
}
authInstance.interceptors.request.use(authInterceptor)

export {
    guestInstance,
    authInstance
}