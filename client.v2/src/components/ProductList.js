import { Pagination } from "react-bootstrap";
import ProductItem from "./ProductItem.js";
import { useContext } from "react";
import { AppContext } from "./AppContext.js";
import { observer } from "mobx-react-lite";
import { useNavigate, createSearchParams } from "react-router-dom";
import "../style/ProductList.css";

const ProductList = observer(() => {
  const { catalog } = useContext(AppContext);
  

  return (
    <div className="device-list__flex-container">
      {catalog.products.length ? (
        catalog.products.map((item) => (
          <ProductItem key={item.id} item={item} />
        ))
      ) : (
        <p className="m-3">По вашему запросу ничего не найдено</p>
      )}
    </div>
  );
});

export default ProductList;
