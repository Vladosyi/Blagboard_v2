# python/train_collaborative_model.py

import pandas as pd
from surprise import Dataset, Reader, SVD, dump
from sqlalchemy import create_engine

# 🔍 Шаг 1: Подключаемся к тестовой БД
print("🔍 Подключаюсь к БД...")
engine = create_engine('postgresql://postgres:12345@localhost/blagboard_test')
print("✅ Подключение к БД успешно")

# 🔍 Шаг 2: Загружаем рейтинги
print("\n🔍 Загружаю рейтинги из таблицы 'ratings'...")
query = 'SELECT user_id, product_id, rate FROM ratings'
df = pd.read_sql(query, engine)

# 🔍 Проверка: что мы получили
print(f"📊 Загружено {len(df)} записей")
print("📋 Примеры данных:")
print(df.head(10))  # Показываем первые 10 строк

if df.empty:
    print("❌ Таблица 'ratings' пуста, проверьте, что в ней есть данные")
    exit()

# 🔍 Проверка: есть ли нужные колонки
expected_columns = {'user_id', 'product_id', 'rate'}
if not expected_columns.issubset(set(df.columns)):
    print(f"❌ Ожидаемые колонки: {expected_columns}, получены: {set(df.columns)}")
    exit()

print("✅ Данные загружены корректно")

# 🔍 Шаг 3: Подготовим данные для Surprise
print("\n🔍 Подготовка данных для библиотеки Surprise...")
reader = Reader(rating_scale=(1, 5))
data = Dataset.load_from_df(df[['user_id', 'product_id', 'rate']], reader)
print("✅ Данные подготовлены")

# 🔍 Шаг 4: Обучаем модель SVD
print("\n🔍 Обучаю модель SVD...")
model = SVD()
trainset = data.build_full_trainset()
model.fit(trainset)
print("✅ Модель обучена")

# 🔍 Шаг 5: Сохраняем модель
print("\n🔍 Сохраняю модель в файл...")
dump.dump('./python/collaborative_model.pkl', model)
print('✅ Модель SVD обучена и сохранена в ./python/collaborative_model.pkl')

# 🔍 Шаг 6: Пример предсказания (для проверки)
print("\n🔍 Пример предсказания: пользователь 3, товар 135")
pred = model.predict(uid=3, iid=135)
print(f"   Ожидаемый рейтинг: {pred.est:.2f} (реальный: 5.0)")