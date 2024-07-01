import {
  Container,
  Row,
  Col,
  Button,
  Image,
  Spinner,
  Table,
} from "react-bootstrap";
import { useEffect, useState, useContext } from "react";
import { fetchOneProduct, fetchProdRating } from "../http/catalogAPI.js";
import { useParams } from "react-router-dom";
import { append } from "../http/basketAPI.js";
import { AppContext } from "../components/AppContext.js";
import { createRate } from "../http/catalogAPI.js";

const Product = () => {
  const { id } = useParams();
  const { basket } = useContext(AppContext);
  const [product, setProduct] = useState(null);
  const [rating, setRating] = useState({});
  const [rate, setRate] = useState();

  useEffect(() => {
    fetchOneProduct(id).then((data) => setProduct(data));
    fetchProdRating(id).then((data) => setRating(data));
  }, [id]);

  const handleClick = (productId) => {
    append(productId).then((data) => {
      basket.products = data.products;
    });
  };

  const handleAddRating = async (productId, rate) => {
         await createRate(productId, rate);
        // setRating(data)
        // setRate(data.rate);
        fetchProdRating(id).then((data) => setRating(data))
  };
  

  if (!product) {
    return <Spinner animation="border" />;
  }

  return (
    <Container>
      <Row className="mt-3 mb-3">
        <Col lg={4}>
          {product.image ? (
            <Image
              width={300}
              height={300}
              src={process.env.REACT_APP_IMG_URL + product.image}
            />
          ) : (
            <Image
              width={300}
              height={300}
              src="http://via.placeholder.com/300"
            />
          )}
        </Col>
        <Col lg={8}>
          <h1>{product.name}</h1>
          <h3>{product.price}.00 руб.</h3>
          <p>Бренд: {product.brand.name}</p>
          <p>Категория: {product.category.name}</p>
          <div>
            
                Рейтинг: {rating.rating}, голосов {rating.votes}
             
            
          </div>
          <Button onClick={() => handleClick(product.id)}>
            Добавить в корзину
          </Button>
            <select
              id="rating"
              name="rating"
              value={rate}
              onChange={(e) => setRate(e.target.value)}
              required
            >
              <option value="">Рейтинг</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
            </select>



            <button type="button" onClick={() => handleAddRating(product.id, rate)}>Submit</button>
         
        </Col>
      </Row>
      {!!product.props.length && (
        <Row>
          <Col>
            <h3>Характеристики</h3>
            <Table bordered hover size="sm">
              <tbody>
                {product.props.map((item) => (
                  <tr key={item.id}>
                    <td>{item.name}</td>
                    <td>{item.value}</td>
                  </tr>
                ))}
              </tbody>
            </Table>
          </Col>
        </Row>
      )}
    </Container>
  );
};

export default Product;
