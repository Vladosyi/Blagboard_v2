import { Button } from "react-bootstrap";
import "../style/BasketItem.css";
import TRASH from '../img/trash.svg'

const BasketItem = (props) => {
  return (
    <div className="item__cart">
      <div className="item__cart__wrapper">
        <div className="inner-cart">
          {/* <div className="inner-cart__img">
            <img 
              src={process.env.REACT_APP_IMG_URL + props.image}
              alt="foto"
              className="inner-cart__img"
            />
          </div> */}
          <div className="inner-cart__about">
            <div className="inner-cart__title">{props.name}</div>
            {/* <div className="inner-cart__subtitle">
              Крем для увлажнения кожи 100мл.
            </div> */}
          </div>
        </div>
        <div className="item__cart__price">
          <p className="item__cart__price">{props.price}</p>
        </div>
        <div className="item__cart__quantity">
          <div className="cart-button">
            <Button
              variant="outline-dark"
              size="sm"
              onClick={() => props.decrement(props.id)}
            >
              -
            </Button>
            <div className="cart-button__value">
              <p className="cart-button__value">{props.quantity}</p>
            </div>
            <Button
              variant="outline-dark"
              size="sm"
              onClick={() => props.increment(props.id)}
            >
              +
            </Button>
            <div className="total__price__trash">
            <img
              src={TRASH}
              alt="trash"
              onClick={() => props.remove(props.id)}
            />
          </div>
          </div>
        </div>
        <div className="item__cart__total">
          <div className="total__price">
            <p className="total__price">{props.price * props.quantity}</p>
          </div>
          
        </div>
      </div>
    </div>

    // <tr>
    //     <td>{props.name}</td>
    //     <td>
    //         <Button variant="outline-dark" size="sm" onClick={() => props.decrement(props.id)}>-</Button>
    //         {' '}<strong>{props.quantity}</strong>{' '}
    //         <Button variant="outline-dark" size="sm" onClick={() => props.increment(props.id)}>+</Button>
    //     </td>
    //     <td>{props.price}</td>
    //     <td>{props.price * props.quantity}</td>
    //     <td>
    //         <Button variant="link" onClick={() => props.remove(props.id)}>
    //             Удалить
    //         </Button>
    //     </td>
    // </tr>
  );
};

export default BasketItem;
