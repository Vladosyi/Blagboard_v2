import { AppContext } from "../components/AppContext.js";
import { useContext, useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import { Container, Row, Card, Form, Button } from "react-bootstrap";
import { signup } from "../http/userAPI.js";
import { observer } from "mobx-react-lite";
import "../style/SignUp.css";
import { FaEye, FaEyeSlash } from "react-icons/fa";

const Signup = observer(() => {
  const { user } = useContext(AppContext);
  const navigate = useNavigate();
  const [isCheck, setIsCheck] = useState(false);
  const [showPassword, setShowPassword] = useState(false);

  // если пользователь авторизован — ему здесь делать нечего
  useEffect(() => {
    if (user.isAdmin) navigate("/admin", { replace: true });
    if (user.isAuth) navigate("/user", { replace: true });
  }, [user.isAdmin, user.isAuth, navigate]); //?????????

  const handleSubmit = async (event) => {
    event.preventDefault();
    const email = event.target.email.value.trim();
    const password = event.target.password.value.trim();
    const data = await signup(email, password);
    if (data) {
      user.login(data);
      if (user.isAdmin) navigate("/admin");
      if (user.isAuth) navigate("/user");
    }
  };
  

  return (
    <Container className="d-flex justify-content-center">
      <Card style={{ width: "50%" }} className="p-2 mt-5 bg-light">
        <h3 className="m-auto">Регистрация</h3>
        <Form className="d-flex flex-column signup__form-container" onSubmit={handleSubmit}>
          <Form.Control
            name="email"
            className="mt-3"
            placeholder="Введите ваш email..."
          />
          <Form.Control
            name="password"
            type={showPassword ? "text" : "password"}
            className="mt-3"
            placeholder="Введите ваш пароль..."
          />
          <button 
            type="button"
            className="signup__show-password-btn"
            onClick={() => setShowPassword(!showPassword)}
          >
            {showPassword ? <FaEyeSlash /> : <FaEye />}
          </button>
       
          <div
            style={{
              display: "flex",
              gap: "10px",
              alignItems: "center",
              justifyContent: "center",
              marginTop: "5px"
            }}
          >
            <input
              type="checkbox"
              checked={isCheck}
              onChange={() => setIsCheck(!isCheck)}
            ></input>
            <label>
              Я согласен на обработку
              <Link to="/confident"> персональных данных</Link>
            </label>
          </div>

          <Row className="d-flex justify-content-between mt-3 pl-3 pr-3">
            <Button type="submit" disabled={!isCheck}>
              Регистрация
            </Button>
            <p>
              Уже есть аккаунт?
              <Link to="/login">Войдите!</Link>
            </p>
          </Row>
        </Form>
      </Card>
    </Container>
  );
});

export default Signup;
