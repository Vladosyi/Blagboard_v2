import React, { useContext, useEffect, useState } from "react";
import BUSKET_ICON from '../img/busket_icon.svg'
import RATING from '../img/rating.svg'
import { useNavigate } from "react-router-dom";
import { fetchProdRating } from "../http/catalogAPI";
import { append } from "../http/basketAPI";
import { AppContext } from "./AppContext";

const RecItem = ({ item }) => {
  const [rating, setRating] = useState({})
  const {basket} = useContext(AppContext)


  const navigate = useNavigate();

  useEffect(({id} = item)=>{
    fetchProdRating(id).then((data) => setRating(data));

  },[item])


  const handleClick = (productId) => {
    append(productId).then((data) => {
      basket.products = data.products;
    });
  }

  return (
    <div className="device-item">
      <div className="device-item__container">
        <div className="device-item__wrapper">
          <div className="device-item__header">
            <div className="device-item__name-device">{item.name}</div>
            <img
              src={BUSKET_ICON}
              alt="busket_icon"
              className="device-item__busket-icon"
                // onClick={() => addToBasket(device, user)}
              onClick={() => handleClick(item.id)}
            />
          </div>
          <div
            className="device-item__container-img"
            onClick={() => navigate(`/product/${item.id} `)}
          >
            <img
              className="device-item__img"
              src={process.env.REACT_APP_IMG_URL + item.image}
              alt="device"
            />
          </div>
          {/* .device-item__ */}
          <div className="device-item__footer">
            <div className="device-item__price">{item.price}₽</div>

            <div className="rating__container">
              <img src={RATING} alt="rating" className="rating__img" />
              {rating.rating}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}


export default RecItem;
