import React from "react"
import "../style/AboutUs.css"




const AboutUs = () => {
    return (
      <div className="container-aboutus-main">
        <div className="container-DevicePage-second-more">
          <div className="about-us-line"></div>
          <div className="container-about-us-second-more">
            <div className="container-about-us-second-more-text">
              В наличии большой выбор.
              <br /> Ботинки. Цена от 3950.
              <br /> Чехлы. Цена от 2950.
              <br />
              Шлемы новые, цена от 4000. <br />
              Очки новые, цена 990 и 3950 рублей.
              <br /> Перчатки новые 950 рублей и 2950.
              <br /> Комплектом скидка. При покупке комплекта: отправка + чехол
              для транспортировки в подарок.
              <br /> Есть другие доски, крепления, ботинки, чехлы, лыжи, шлемы,
              очки в наличии и на заказ.
              <br /> Прокат 1000 рублей сутки: боты + крепы + доска. <br />{" "}
              #Blagboard #Благборд #благборд #БлагБорд
            </div>
            <div className="container-second-avito-2gis">
              <a
                className="busket-main-second"
                href="https://www.avito.ru/user/63e00ea2e395c6d46d14503345e59c13/profile?id=1874125308&src=item&page_from=from_item_card_icon&iid=1874125308"
                target="_blank"
                rel="noreferrer"
              >
                Авито
              </a>
              <a
                className="busket-main-second"
                href="https://go.2gis.com/m3azq0"
                target="_blank"
                rel="noreferrer"
              >
                2GIS
              </a>
            </div>
          </div>
        </div>
      </div>
    );
  };
  
  export default AboutUs;