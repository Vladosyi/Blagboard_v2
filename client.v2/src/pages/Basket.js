import BasketList from "../components/BasketList.js";
import { Container } from "react-bootstrap";
import "../style/Basket.css";
// import RecommendationBaner from "../components/RecoBaner.js";
import RecBaner from "../components/RecBaner.jsx";
import { useEffect, useState } from "react";
import { fetchRecommendation } from "../http/catalogAPI.js";

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
