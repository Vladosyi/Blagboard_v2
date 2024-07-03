import { useContext } from "react";
import { AppContext } from "./AppContext.js";
import { observer } from "mobx-react-lite";
import { useNavigate, createSearchParams } from "react-router-dom";
import "../style/CategoryBar.css";

const CategoryBar = observer(() => {
  const { catalog } = useContext(AppContext);
  const navigate = useNavigate();

  const handleClick = (id) => {
    if (id === catalog.category) {
      catalog.category = null;
    } else {
      catalog.category = id;
    }
    // при каждом клике добавляем в историю браузера новый элемент
    const params = {};
    if (catalog.category) params.category = catalog.category;
    if (catalog.brand) params.brand = catalog.brand;
    if (catalog.page > 1) params.page = catalog.page;
    navigate({
      pathname: "/",
      search: "?" + createSearchParams(params),
    });
  };

  return (
    <section className="type-Bar">
      <div className="type-Bar__container">
        <div className="type-Bar__wrapper">
          {catalog.categories.map((category) => (
            <li
              className="type-Bar__li"
            //   active={category.id === catalog.category}
              onClick={() => handleClick(category.id)}
              key={category.id}
            >
              {category.name}
            </li>
          ))}
        </div>
      </div>
    </section>

    // <ListGroup>
    //     {catalog.categories.map(item =>
    //         <ListGroup.Item
    //             key={item.id}
    //             active={item.id === catalog.category}
    //             onClick={() => handleClick(item.id)}
    //             style={{cursor: 'pointer'}}
    //         >
    //             {item.name}
    //         </ListGroup.Item>
    //     )}
    // </ListGroup>
  );
});

export default CategoryBar;
