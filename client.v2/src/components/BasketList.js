import { useContext } from "react";
import { AppContext } from "./AppContext.js";
import { increment, decrement, remove } from "../http/basketAPI.js";
import BasketItem from "./BasketItem.js";
import { observer } from "mobx-react-lite";
import SideBar from "../components/SideBar.js";
import "../style/BasketList.css";

const BasketList = observer(() => {
  const { basket } = useContext(AppContext);
  // const [fetching, setFetching] = useState(false);

  // const navigate = useNavigate();

  const handleIncrement = (id) => {
    increment(id).then((data) => (basket.products = data.products));
  };

  const handleDecrement = (id) => {
    decrement(id).then((data) => (basket.products = data.products));
  };

  const handleRemove = (id) => {
    remove(id).then((data) => (basket.products = data.products));
  };

  // if (fetching) {
  //   return <Spinner animation="border" />;
  // }

  return (
    <>
    {basket.count ? (
    <div className="cart__body">
      
        <div className="section__cart">
          <div></div>
          <div className="cart__grid">
            <ul className="grid__body">
              <li className="grid__name">Наименование</li>
              <li className=" grid_price">Цена</li>
              <li className=" grid_sum">Количество</li>
              <li className="grid__costs">Стоимость</li>
            </ul>
          </div>
          {basket.products.map((item) => (
            <BasketItem
              key={item.id}
              increment={handleIncrement}
              decrement={handleDecrement}
              remove={handleRemove}
              {...item}
              image={item.image}
            />
          ))}

          
        </div>
        <SideBar />
        </div>
      ) : (
        <p className="empty-busket">Ваша корзина пуста</p>
      )}
    </>
  );
});

export default BasketList;
