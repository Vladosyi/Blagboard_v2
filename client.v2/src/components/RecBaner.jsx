import React, { useContext, useEffect } from "react";
import RecItem from "./RecItem";
import { fetchRecommendation } from "../http/catalogAPI";
import { AppContext } from "./AppContext";
import { observer } from "mobx-react-lite";

const RecBaner = observer(() => {
  const { recommendation } = useContext(AppContext);

  useEffect(() => {
    fetchRecommendation().then((data) => (recommendation.products = data));
  }, []);


  return (
    <div style={{textAlign: 'center', fontSize: '25px', margin: '20px 20px 0 20px'}}> Вам может понравится:
    <div style={{display: "flex", gap: '20px'}} className='rec-block'>
      {recommendation.products.map((item, id) => (
        <RecItem item={item} key={id} />
      ))}
    </div>
    </div>
  );
});

export default RecBaner;
