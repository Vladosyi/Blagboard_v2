// services/generateTestData.js

// Используем реальные категории и бренды из ваших данных
const categories = [
  { id: 12, name: "Лыжи" },
  { id: 13, name: "Ботинки" },
  { id: 14, name: "Шлемы" },
  { id: 15, name: "Перчатки" },
  { id: 16, name: "Очки" },
  { id: 23, name: "Товары" }, // из ваших данных
];

const brands = [
  { id: 21, name: "Salomon" },
  { id: 22, name: "Atomic" },
  { id: 23, name: "Fischer" },
  { id: 24, name: "Julbo" },
  { id: 25, name: "Roxy" },
];

const possibleProps = [
  { name: "Длина", value: () => `${Math.floor(Math.random() * 30) + 140}см` },
  { name: "Ширина", value: () => `${Math.floor(Math.random() * 20) + 20}см` },
  {
    name: "Пол",
    value: () => ["Мужской", "Женский"][Math.floor(Math.random() * 2)],
  },
  {
    name: "Уровень",
    value: () =>
      ["Новичок", "Любитель", "Продвинутый"][Math.floor(Math.random() * 3)],
  },
  { name: "Размер", value: () => `${Math.floor(Math.random() * 5) + 36}` },
  {
    name: "Цвет",
    value: () =>
      ["Чёрный", "Белый", "Синий", "Красный"][Math.floor(Math.random() * 4)],
  },
];

export function generateUsers(count) {
  return Array.from({ length: count }, (_, i) => ({
    id: i + 1,
    email: `user${i}@mail.ru`,
    password: "123456", // Обычный пароль
    role: "USER",
  }));
}

export function generateProducts(count) {
  return Array.from({ length: count }, (_, i) => ({
    id: i + 1,
    name: `Товар ${i}`,
    price: Math.floor(Math.random() * 10000) + 1000,
    rating: 0,
    image: `image${i}.jpg`,
    category_id: categories[Math.floor(Math.random() * categories.length)].id,
    brand_id: brands[Math.floor(Math.random() * brands.length)].id,
    visits: Math.floor(Math.random() * 100),
  }));
}

export function generateProductProps(products) {
  const props = [];
  products.forEach((p) => {
    const numProps = Math.floor(Math.random() * 3) + 2; // 2-4 свойства
    const selectedProps = [...possibleProps]
      .sort(() => 0.5 - Math.random())
      .slice(0, numProps);
    selectedProps.forEach((prop, idx) => {
      props.push({
        id: `${p.id * 10 + idx}`,
        name: prop.name,
        value: prop.value(),
        product_id: p.id,
      });
    });
  });
  return props;
}

export function generateRatings(users, products, count = 2000) {
  const ratings = [];
  for (let i = 0; i < count; i++) {
    ratings.push({
      rate: Math.floor(Math.random() * 5) + 1,
      user_id: users[Math.floor(Math.random() * users.length)].id,
      product_id: products[Math.floor(Math.random() * products.length)].id,
    });
  }
  return ratings;
}

export function generateOrderItems(users, products, count = 800) {
  const items = [];
  for (let i = 0; i < count; i++) {
    items.push({
      name: `Товар ${Math.floor(Math.random() * products.length)}`,
      price: products[Math.floor(Math.random() * products.length)].price,
      quantity: Math.floor(Math.random() * 5) + 1,
      order_id: Math.floor(Math.random() * 500) + 1,
      product_id: products[Math.floor(Math.random() * products.length)].id,
    });
  }
  return items;
}
