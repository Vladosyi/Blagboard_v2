print("Python работает!")
print(f"Версия Python: 3.x")

# Простой пример - рекомендации
import json
recommendations = [
    {"product_id": 1, "name": "Товар 1", "score": 0.95},
    {"product_id": 2, "name": "Товар 2", "score": 0.87}
]
print(json.dumps(recommendations))