import React from 'react'
import ReactDOM from 'react-dom'
import App from './App'
import { AppContextProvider } from './components/AppContext.js'
import './style/null_style.css'

ReactDOM.render(
    <React.StrictMode>
        <AppContextProvider>
            <App />
        </AppContextProvider>
    </React.StrictMode>,
    document.getElementById('root')
);
