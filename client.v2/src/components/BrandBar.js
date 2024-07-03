import { useContext } from 'react'
import { AppContext } from './AppContext.js'
import { observer } from 'mobx-react-lite'
import { useNavigate, createSearchParams } from 'react-router-dom'
import '../style/BrandBar.css'

const BrandBar = observer(() => {
    const { catalog } = useContext(AppContext)
    const navigate = useNavigate()

    const handleClick = (id) => {
        if (id === catalog.brand) {
            catalog.brand = null
        } else {
            catalog.brand = id
        }
        // при каждом клике добавляем в историю браузера новый элемент
        const params = {}
        if (catalog.category) params.category = catalog.category
        if (catalog.brand) params.brand = catalog.brand
        if (catalog.page > 1) params.page = catalog.page
        navigate({
            pathname: '/',
            search: '?' + createSearchParams(params),
        })
    }

    return (





        <div className="brand-bar">
      <div className="brand-bar__container">
        <div className="brand-bar__wrapper">
          {/* <h1 className="brand-bar__h1">{device.selectedType.name}</h1> */}
          <ul className="brand-bar__list">
            {catalog.brands.map((brand) => (
              <li
                className="brand-bar__item"
                key={brand.id}
                onClick={() => handleClick(brand.id)}
                // border={brand.id === device.setSelectedBrand.id ? "red" : "black"}
              >
                {brand.name}
              </li>
            ))}
          </ul>
          {/* <button className="brand-bar__button" onClick={getAllDevices}>
            Показать все товары
          </button> */}
          <div className="pagination-shop">
            {/* <Pages /> */}
          </div>
        </div>
      </div>
    </div>
        // <ListGroup horizontal>
        //     {catalog.brands.map(item =>
        //         <ListGroup.Item
        //             key={item.id}
        //             active={item.id === catalog.brand}
        //             onClick={() => handleClick(item.id)}
        //             style={{cursor: 'pointer'}}
        //         >
        //             {item.name}
        //         </ListGroup.Item>
        //     )}
        // </ListGroup>
    )
})

export default BrandBar