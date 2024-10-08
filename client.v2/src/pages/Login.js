import { AppContext } from "../components/AppContext.js";
import { useContext, useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import { Container, Card, Form, Button } from "react-bootstrap";
import { login } from "../http/userAPI.js";
import { observer } from "mobx-react-lite";
import { FaEye, FaEyeSlash } from "react-icons/fa";
import "../style/Login.css"

const Login = observer(() => {
  const { user } = useContext(AppContext);
  const navigate = useNavigate();
  const [showPassword, setShowPassword] = useState(false);

  // если пользователь авторизован — ему здесь делать нечего
  useEffect(() => {
    if (user.isAdmin) navigate("/admin", { replace: true });
    if (user.isAuth) navigate("/user", { replace: true });
  }, [navigate, user.isAdmin, user.isAuth]);

  const handleSubmit = async (event) => {
    event.preventDefault();
    const email = event.target.email.value.trim();
    const password = event.target.password.value.trim();
    const data = await login(email, password);
    if (data) {
      user.login(data);
      if (user.isAdmin) navigate("/admin");
      if (user.isAuth) navigate("/user");
    }
  };

  return (
    <Container className="d-flex justify-content-center">
      <Card style={{ width: "50%" }} className="p-2 mt-5 bg-light">
        <h3 className="m-auto">Авторизация</h3>
        <Form className="d-flex flex-column login__form-container" onSubmit={handleSubmit}>
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
            className="login__show-password-btn"
            onClick={() => setShowPassword(!showPassword)}
          >
            {showPassword ? <FaEyeSlash /> : <FaEye />}
          </button>
          <div className="d-flex justify-content-between mt-3 pl-3 pr-3">
            <Button type="submit">Войти</Button>
            <p>
              Нет аккаунта?
              <Link to="/signup">Зарегистрирутесь!</Link>
            </p>
          </div>
        </Form>
      </Card>
    </Container>
  );
});

export default Login;
