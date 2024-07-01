

Создаем базу данных с помощью утилиты `psql`

```
/path/to/postgre/bin/psql -U postgres
Пароль: qwerty

postgres=# CREATE DATABASE online_store;

postgres=# \q
```

Имя БД и логин-пароль прописывам в `server/.env`

```
DB_HOST=localhost
DB_NAME=online_store
DB_USER=postgres
DB_PASS=qwerty
DB_PORT=5432
```

Чтобы запустить сервер, переходим в папку `/server`, устанавливаем пакеты
```
cd /path/to/shop/server
npm install

Запускаем сервер

npm run start-dev
```

Чтобы запустить клиент, переходим в папку `/client`, устанавливаем пакеты

```
cd /path/to/shop/client
npm install

Запускаем клиент

npm start
```

#### Примечания

Таблицы базы данных будут созданы при первом запуске приложения, но они будут пустыми. Можно импортировать базу данных из файла `database.sql`, в которой уже есть категории, бренды, товары, пользователи и т.д.


```
/path/to/postgre/bin/psql -U postgres online_store < /path/to/shop/database.sql
Пароль: qwerty
```

---

Дамп базы данных `database.sql` был создан с помощью утилиты `pg_dump` на заключительном этапе разработки магазина

```
/path/to/postgre/bin/pg_dump -U postgres online_store > /path/to/shop/database.sql
Пароль: qwerty

---

Дамп базы данных содержит несколько пользователей, как обычных, так и с правами администратора

* Пользователь `user@mail.ru`, пароль `qwerty`
* Пользователь `admin@mail.ru`, пароль `qwerty`

