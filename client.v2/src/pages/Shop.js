// import { Container, Row, Col, Spinner } from "react-bootstrap";
import CategoryBar from "../components/CategoryBar.js";
import BrandBar from "../components/BrandBar.js";
import ProductList from "../components/ProductList.js";
import { useContext, useEffect, useState } from "react";
import { AppContext } from "../components/AppContext.js";
import {
  fetchCategories,
  fetchBrands,
  fetchAllProducts,
} from "../http/catalogAPI.js";
import { observer } from "mobx-react-lite";
import { useLocation, useSearchParams } from "react-router-dom";
import "../style/Shop.css";

const getSearchParams = (searchParams) => {
  let category = searchParams.get("category");
  if (category && /[1-9][0-9]*/.test(category)) {
    category = parseInt(category);
  }
  let brand = searchParams.get("brand");
  if (brand && /[1-9][0-9]*/.test(brand)) {
    brand = parseInt(brand);
  }
  let page = searchParams.get("page");
  if (page && /[1-9][0-9]*/.test(page)) {
    page = parseInt(page);
  }
  return { category, brand, page };
};


const Shop = observer(() => {
  const { catalog } = useContext(AppContext);

  const [categoriesFetching, setCategoriesFetching] = useState(true);
  const [brandsFetching, setBrandsFetching] = useState(true);
  const [productsFetching, setProductsFetching] = useState(true);

  const location = useLocation();
  const [searchParams] = useSearchParams();

  useEffect(() => {
    fetchCategories()
      .then((data) => (catalog.categories = data))
      .finally(() => setCategoriesFetching(false));

    fetchBrands()
      .then((data) => (catalog.brands = data))
      .finally(() => setBrandsFetching(false));

    const { category, brand, page } = getSearchParams(searchParams);
    catalog.category = category;
    catalog.brand = brand;
    catalog.page = page ?? 1;

    fetchAllProducts(
      catalog.category,
      catalog.brand,
      catalog.page,
      catalog.limit
    )
      .then((data) => {
        catalog.products = data.rows;
        catalog.count = data.count;
      })
      .finally(() => setProductsFetching(false));
    // eslint-disable-next-line
  }, []);

  // При каждом клике на категорию, бренд или номер страницы — мы добавляем элемент в историю
  // браузера, ссылки в истории имеют вид /?page=1, /?page=2, /?page=3. При нажатии кнопки
  // «Назад» браузера — мы отслеживаем изменение GET-параметров и изменяем состояние хранилища.
  useEffect(() => {
    const { category, brand, page } = getSearchParams(searchParams);

    if (category || brand || page) {
      if (category !== catalog.category) {
        catalog.category = category;
      }
      if (brand !== catalog.brand) {
        catalog.brand = brand;
      }
      if (page !== catalog.page) {
        catalog.page = page ?? 1;
      }
    } else {
      catalog.category = null;
      catalog.brand = null;
      catalog.page = 1;
    }
    // eslint-disable-next-line
  }, [location.search]);

  
  useEffect(() => {
    // setProductsFetching(true);
    fetchAllProducts(
      catalog.category,
      catalog.brand,
      catalog.page,
      catalog.limit
    )
      .then((data) => {
        catalog.products = data.rows;
        catalog.count = data.count;
      })
      // .finally(() => setProductsFetching(false));
    // eslint-disable-next-line
  }, [catalog.category, catalog.brand, catalog.page]);

  return (
    <div className="root__main main">
       <CategoryBar />

      <section className="main__hero-section hero-section">
        <div className="hero-section__container">
          <div className="hero-section__wrapper">
             <BrandBar />
            
              <ProductList />
            
          </div>
        </div>
      </section>
    </div>

    // 
  );
});

export default Shop;
