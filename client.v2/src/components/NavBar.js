import { Container, Navbar, Nav } from "react-bootstrap";
import { Link, useLocation } from "react-router-dom";
import { AppContext } from "./AppContext.js";
import { useContext } from "react";
import { observer } from "mobx-react-lite";
import {
  LOGIN_ROUTE,
  REGISTRATION_ROUTE,
  SHOP_ROUTE,
  ABOUTUS_ROUTE,
  BASKET_ROUTE,
  SUPPORT_ROUTE,
  ADMIN_ROUTE,
} from "../utils/consts.js";
import SHOPPINGCART from "../img/shopping-cart.svg";
import ADMIN from "../img/admin.svg";
import CABINET from "../img/cabinet.svg";
import USER from "../img/user.svg";
import "../style/NavBarStyle.css";

const NavBar = observer(() => {
  const { user, basket } = useContext(AppContext);
  const location = useLocation();
  const isPathAuth =
    location.pathname === REGISTRATION_ROUTE ||
    location.pathname === LOGIN_ROUTE;

  if (isPathAuth) return null;
  else {
    return (
      <header className="header">
        <div className="header__container _container">
          <div className="header__wrapper">
            <nav className="header__menu menu">
              <Link to={SHOP_ROUTE} className="header__logo">
                BlagBoard
              </Link>
              <ul className="menu__list">
                <li className="menu_item">
                  <Link to={SHOP_ROUTE} className="menu__link">
                    Магазин
                  </Link>
                </li>
                <li className="menu_item">
                  <Link to={ABOUTUS_ROUTE} className="menu__link">
                    О нас
                  </Link>
                </li>
                <li className="menu_item">
                  <Link to="/support" className="menu__link">
                    Поддержка
                  </Link>
                </li>
              </ul>
            </nav>
            <nav className="header__control control">
              <ul className="control__list">
                <li className="control_item">
                  <Link to={BASKET_ROUTE} className="control__link">
                    <img
                      className="control__img"
                      src={SHOPPINGCART}
                      alt="shopping-cart"
                    />
                    Корзина
                    {!!basket.count && <span>({basket.count})</span>}
                  </Link>
                </li>
                {user.isAuth ? (
                  <li className="control_item">
                    <Link to="/user" className="control__link">
                    <img className="control__img" src={CABINET} alt="cross" />
                      Личный кабинет
                    </Link>
                  </li>
                ) : (
                  <>
                    <li className="control_item">
                      <Link to="/login" className="control__link">
                      <img className="control__img" src={USER} alt="cross" />
                        Войти
                      </Link>
                    </li>
                    <li className="control_item">
                      <Link to="/signup" className="control__link">
                      <img className="control__img" src={USER} alt="cross" />
                        Регистрация
                      </Link>
                    </li>
                  </>
                )}

                {user.isAdmin && (
                  <li className="control_item">
                    <Link to={ADMIN_ROUTE} className="control__link">
                      <img className="control__img" src={ADMIN} alt="user" />
                      Админ панель
                    </Link>
                  </li>
                )}
              </ul>
            </nav>
          </div>
        </div>
      </header>

      // <div className="header" >
      //   <div className="header__container">
      //     <div className="header__wrapper"></div>
      //     <div className="header__menu">
      //       <Link to="/" className="header__logo">
      //         BlagBoard
      //       </Link>
      //       <Link to="/" className="menu-link">
      //         Магазин

      //       </Link>
      //       <Link to="/delivery" className="menu-link">
      //         Доставка
      //       </Link>
      //       <Link to="/contacts" className="menu-link">
      //         Контакты
      //       </Link>
      //     </div>
      //     <Link className="menu-link" to="/aboutus">О нас</Link>
      //     <div className="header__control">
      //       {user.isAuth ? (
      //         <Link to="/user" className="nav-link">
      //           Личный кабинет
      //         </Link>
      //       ) : (
      //         <>
      //           <Link to="/login" className="nav-link">
      //             Войти
      //           </Link>
      //           <Link to="/signup" className="nav-link">
      //             Регистрация
      //           </Link>
      //         </>
      //       )}
      //       {user.isAdmin && (
      //         <Link to="/admin" className="control-link">
      //           Панель управления
      //         </Link>
      //       )}
      //       <Link to="/basket" className="nav-link">
      //         Корзина
      //         {!!basket.count && <span>({basket.count})</span>}
      //       </Link>
      //     </div>
      //   </div>
      // </div>
    );
  }
});

export default NavBar;
