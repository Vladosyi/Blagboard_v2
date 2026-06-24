# python/predict_collaborative.py

import sys
import json
from surprise import dump

# Принимаем ID пользователя из командной строки
if len(sys.argv) < 2:
    print(json.dumps([]))
    sys.exit(1)

user_id = int(sys.argv[1])
limit = int(sys.argv[2]) if len(sys.argv) > 2 else 5
# python/predict_collaborative.py

import sys
import json
from surprise import dump

# Принимаем ID пользователя из командной строки
if len(sys.argv) < 2:
    print(json.dumps([]))
    sys.exit(1)

user_id = int(sys.argv[1])
limit = int(sys.argv[2]) if len(sys.argv) > 2 else 5

try:
    # Загружаем обученную модель
    _, loaded_model = dump.load('./python/collaborative_model.pkl')

    # Получаем список всех товаров (из БД, если нужно)
    # В реальности вы можете получить это из БД
    # Пока что просто список ID товаров, которые есть в ratings
    import pandas as pd
    from sqlalchemy import create_engine

    engine = create_engine('postgresql://postgres:12345@localhost/blagboard_test')
    query = 'SELECT DISTINCT product_id FROM ratings'
    df = pd.read_sql(query, engine)
    all_product_ids = df['product_id'].tolist()

    # Предсказываем рейтинги для всех товаров
    predictions = []
    for product_id in all_product_ids:
        pred = loaded_model.predict(uid=user_id, iid=product_id)
        predictions.append({
            'product_id': product_id,
            'estimated_rating': pred.est
        })

    # Сортируем по предсказанному рейтингу и возвращаем top-N
    top_predictions = sorted(predictions, key=lambda x: x['estimated_rating'], reverse=True)[:limit]
    top_product_ids = [p['product_id'] for p in top_predictions]

    print(json.dumps(top_product_ids))

except Exception as e:
    print(json.dumps([]))
try:
    # Загружаем обученную модель
    _, loaded_model = dump.load('./python/collaborative_model.pkl')

    # Получаем список всех товаров (из БД, если нужно)
    # В реальности вы можете получить это из БД
    # Пока что просто список ID товаров, которые есть в ratings
    import pandas as pd
    from sqlalchemy import create_engine

    engine = create_engine('postgresql://postgres:12345@localhost/blagboard_test')
    query = 'SELECT DISTINCT product_id FROM ratings'
    df = pd.read_sql(query, engine)
    all_product_ids = df['product_id'].tolist()

    # Предсказываем рейтинги для всех товаров
    predictions = []
    for product_id in all_product_ids:
        pred = loaded_model.predict(uid=user_id, iid=product_id)
        predictions.append({
            'product_id': product_id,
            'estimated_rating': pred.est
        })

    # Сортируем по предсказанному рейтингу и возвращаем top-N
    top_predictions = sorted(predictions, key=lambda x: x['estimated_rating'], reverse=True)[:limit]
    top_product_ids = [p['product_id'] for p in top_predictions]

    print(json.dumps(top_product_ids))

except Exception as e:
    print(json.dumps([]))