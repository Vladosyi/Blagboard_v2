import BasketList from "../components/BasketList.js";
import "../style/Basket.css";
import RecBaner from "../components/RecBaner.jsx";


const Basket = () => {
  return (
    <div className="cart">
      <div className="cart__container _container">
        <div className="header__cart">
          <div className="cart__title">КОРЗИНА</div>
        </div>
        <BasketList />
        <RecBaner />
      </div>
     
      
    </div>
  );
};

export default Basket;
