import React from "react";
import "../style/Support.css";

const Support = () => {
  return (
    <div className="support-container-main">
      <div className="support-container">
        <div className="support-container-second">
          <div className="suppot-text">ПОДДЕРЖКА</div>
          <div className="suppot-text-second">
            <div>
              <span className="support-email-span">Email: </span>
              
            </div>
            <div>
              <span className="support-email-span">
                Номер телефона магазина:
              </span>{" "}
              +7 914 556-59-89, +7 962 285-59-89
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Support;
