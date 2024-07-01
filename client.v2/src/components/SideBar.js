import React, { useContext } from 'react'
import '../style/SideBar.css'
import { AppContext } from './AppContext'
import { Link, useNavigate } from 'react-router-dom'

function SideBar() {
    const {basket} = useContext(AppContext)
    const navigate = useNavigate();
  return (
    <div class="sidebar">
          <div class="sidebar__wrapper">
            <div class="sidebar__header">
              <Link to="/" class="sidebar__header__btn">
                ПРОДОЛЖИТЬ ПОКУПКИ
              </Link>
            </div>
            <h2 class="sidebar__title">ВАШ ЗАКАЗ:</h2>
            <div class="sidebar__cart">
              {/* <div class="sidebar__cart__item">
                <span class="sidebar__cart__title">В корзине:</span>
                <div class="sidebar__cart__value">1 товар</div>
              </div> */}
              <div class="sidebar__cart__item">
                <span class="sidebar__cart__title">Итого:</span>
                <div class="sidebar__cart__price">{basket.sum}</div>
              </div>
            </div>
            <div class="sidebar__delivery">
              <h4 class="sidebar__delivery__title">Доставка:</h4>
              <span class="sidebar__delivery__value">Бесплатно</span>
            </div>
            <button class="sidebar__button" onClick={() => navigate("/checkout")}>ОФОРМИТЬ ЗАКАЗ</button>
          </div>
        </div>
  )
}

export default SideBar
