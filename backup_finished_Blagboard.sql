--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11
-- Dumped by pg_dump version 14.11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: basket_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basket_products (
    quantity integer DEFAULT 1,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    basket_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.basket_products OWNER TO postgres;

--
-- Name: baskets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.baskets (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.baskets OWNER TO postgres;

--
-- Name: baskets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.baskets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.baskets_id_seq OWNER TO postgres;

--
-- Name: baskets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.baskets_id_seq OWNED BY public.baskets.id;


--
-- Name: brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brands (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.brands OWNER TO postgres;

--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brands_id_seq OWNER TO postgres;

--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brands_id_seq OWNED BY public.brands.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    quantity integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    order_id integer
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_items_id_seq OWNER TO postgres;

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    amount integer NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    comment character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: product_props; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_props (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    product_id integer
);


ALTER TABLE public.product_props OWNER TO postgres;

--
-- Name: product_props_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_props_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_props_id_seq OWNER TO postgres;

--
-- Name: product_props_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_props_id_seq OWNED BY public.product_props.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    rating integer DEFAULT 0,
    image character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    category_id integer,
    brand_id integer,
    visits integer DEFAULT 0
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ratings (
    rate integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    product_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.ratings OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255),
    password character varying(255),
    role character varying(255) DEFAULT 'USER'::character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: baskets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets ALTER COLUMN id SET DEFAULT nextval('public.baskets_id_seq'::regclass);


--
-- Name: brands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands ALTER COLUMN id SET DEFAULT nextval('public.brands_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: product_props id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_props ALTER COLUMN id SET DEFAULT nextval('public.product_props_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: basket_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.basket_products (quantity, created_at, updated_at, basket_id, product_id) FROM stdin;
1	2024-05-26 18:25:09.55+09	2024-05-26 18:25:09.55+09	48	127
1	2024-05-26 18:25:11.786+09	2024-05-26 18:25:11.786+09	48	126
1	2024-05-26 18:26:50.865+09	2024-05-26 18:26:50.865+09	49	127
1	2024-05-26 18:28:41.218+09	2024-05-26 18:28:41.218+09	50	127
1	2024-05-26 18:29:55.257+09	2024-05-26 18:29:55.257+09	51	125
12	2024-05-27 03:13:46.804+09	2024-05-27 04:21:55.452+09	52	132
3	2024-05-27 04:06:08.464+09	2024-05-27 04:22:02.619+09	52	126
1	2024-05-27 04:22:04.255+09	2024-05-27 04:22:04.255+09	52	134
1	2024-05-27 04:22:05.512+09	2024-05-27 04:22:05.512+09	52	135
1	2024-05-27 04:21:53.658+09	2024-05-27 04:22:11.177+09	52	125
3	2024-07-03 15:49:10.331+09	2025-05-22 16:31:38.601+09	55	134
5	2024-07-03 15:49:09.709+09	2025-05-22 16:31:40.069+09	55	131
2	2024-05-27 04:03:47.725+09	2024-05-27 04:22:13.381+09	52	131
1	2025-05-22 17:31:19.458+09	2025-05-22 17:31:19.458+09	55	138
4	2025-05-22 17:31:10.948+09	2025-05-22 18:21:11.201+09	55	139
3	2024-06-19 13:51:32.531+09	2024-06-19 13:51:36.011+09	58	140
1	2025-05-22 18:21:13.936+09	2025-05-22 18:21:13.936+09	55	125
1	2024-05-27 05:00:34.903+09	2024-05-27 05:00:34.903+09	53	138
1	2024-05-27 05:00:37.435+09	2024-05-27 05:00:37.435+09	53	137
1	2024-05-27 05:00:38.502+09	2024-05-27 05:00:38.502+09	53	126
1	2024-05-27 06:07:39.456+09	2024-05-27 06:07:39.456+09	54	138
1	2024-05-27 06:07:43.053+09	2024-05-27 06:07:43.053+09	54	137
5	2024-06-24 11:08:42.361+09	2025-06-01 21:10:04.812+09	57	133
5	2024-06-24 11:08:44.786+09	2025-06-01 21:10:09.288+09	57	135
2	2024-06-24 11:08:43.635+09	2025-06-01 21:10:10.402+09	57	134
4	2024-06-24 11:08:22.602+09	2025-06-01 21:10:21.851+09	57	139
2	2025-06-01 21:10:13.633+09	2025-06-01 21:10:25.023+09	57	131
1	2024-07-03 15:49:45.617+09	2024-07-03 15:49:45.617+09	55	133
4	2025-12-07 17:33:38.619+09	2025-12-07 17:33:44.248+09	57	137
1	2025-12-07 17:33:45.735+09	2025-12-07 17:33:45.735+09	57	127
\.


--
-- Data for Name: baskets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.baskets (id, created_at, updated_at) FROM stdin;
1	2024-05-25 20:40:19.497+09	2024-05-25 20:40:19.497+09
2	2024-05-25 20:40:19.741+09	2024-05-25 20:40:19.741+09
3	2021-12-06 22:15:36.763+09	2021-12-06 22:15:36.763+09
4	2021-12-06 22:16:19.377+09	2021-12-06 22:16:19.377+09
5	2021-12-06 22:17:50.942+09	2021-12-06 22:17:50.942+09
6	2021-12-06 22:19:17.509+09	2021-12-06 22:19:17.509+09
7	2021-12-06 22:21:17.856+09	2021-12-06 22:21:17.856+09
8	2021-12-06 22:39:34.386+09	2021-12-06 22:39:34.386+09
9	2021-12-06 22:40:23.737+09	2021-12-06 22:40:23.737+09
10	2021-12-06 22:41:47.306+09	2021-12-06 22:41:47.306+09
11	2021-12-06 22:43:01.965+09	2021-12-06 22:43:01.965+09
12	2021-12-06 22:47:43.839+09	2021-12-06 22:47:43.839+09
13	2021-12-06 22:52:17.305+09	2021-12-06 22:52:17.305+09
14	2021-12-06 22:55:47.192+09	2021-12-06 22:55:47.192+09
15	2022-01-06 20:52:26.859+09	2022-01-06 20:52:26.859+09
16	2022-01-06 20:54:31.701+09	2022-01-06 20:54:31.701+09
17	2022-01-06 20:54:39.164+09	2022-01-06 20:54:39.164+09
18	2022-01-06 20:55:34.705+09	2022-01-06 20:55:34.705+09
19	2022-01-06 20:55:41.728+09	2022-01-06 20:55:41.728+09
20	2022-01-06 20:55:52.828+09	2022-01-06 20:55:52.828+09
21	2022-01-06 20:56:15.76+09	2022-01-06 20:56:15.76+09
22	2022-01-06 21:01:25.607+09	2022-01-06 21:01:25.607+09
23	2022-01-06 21:05:02.88+09	2022-01-06 21:05:02.88+09
24	2022-01-06 21:05:23.058+09	2022-01-06 21:05:23.058+09
25	2022-01-06 21:07:59.899+09	2022-01-06 21:07:59.899+09
26	2022-01-06 21:08:02.705+09	2022-01-06 21:08:02.705+09
27	2022-01-06 21:08:11.787+09	2022-01-06 21:08:11.787+09
28	2022-01-06 21:08:16.727+09	2022-01-06 21:08:16.727+09
29	2022-01-06 21:08:19.7+09	2022-01-06 21:08:19.7+09
30	2022-01-07 15:52:09.273+09	2022-01-07 15:52:09.273+09
31	2022-01-07 18:04:17.392+09	2022-01-07 18:04:17.392+09
32	2022-01-07 18:04:23.891+09	2022-01-07 18:04:23.891+09
33	2022-01-07 18:06:45.405+09	2022-01-07 18:06:45.405+09
34	2022-01-07 18:06:55.065+09	2022-01-07 18:06:55.065+09
35	2022-01-07 18:07:28.213+09	2022-01-07 18:07:28.213+09
36	2022-01-07 18:08:05.64+09	2022-01-07 18:08:05.64+09
37	2022-01-07 18:25:15.763+09	2022-01-07 18:25:15.763+09
38	2022-01-08 18:22:00.939+09	2022-01-08 18:22:00.939+09
39	2022-01-17 22:49:50.526+09	2022-01-17 22:49:50.526+09
40	2022-01-17 22:50:21.6+09	2022-01-17 22:50:21.6+09
41	2022-01-17 22:56:55.263+09	2022-01-17 22:56:55.263+09
42	2022-01-17 22:59:35.304+09	2022-01-17 22:59:35.304+09
43	2022-01-17 23:02:56.956+09	2022-01-17 23:02:56.956+09
44	2022-01-17 23:09:55.318+09	2022-01-17 23:09:55.318+09
45	2022-01-17 23:10:06.146+09	2022-01-17 23:10:06.146+09
46	2022-01-17 23:13:24.91+09	2022-01-17 23:13:24.91+09
47	2022-01-17 23:14:28.474+09	2022-01-17 23:14:28.474+09
48	2024-05-25 21:12:08.044+09	2024-05-25 21:12:08.044+09
49	2024-05-26 18:26:41.482+09	2024-05-26 18:26:41.482+09
50	2024-05-26 18:27:10.051+09	2024-05-26 18:27:10.051+09
51	2024-05-26 18:29:01.689+09	2024-05-26 18:29:01.689+09
52	2024-05-26 18:43:09.281+09	2024-05-26 18:43:09.281+09
53	2024-05-27 04:23:06.494+09	2024-05-27 04:23:06.494+09
54	2024-05-27 05:01:59.961+09	2024-05-27 05:01:59.961+09
55	2024-05-27 06:08:01.309+09	2024-05-27 06:08:01.309+09
56	2024-05-28 10:26:57.113+09	2024-05-28 10:26:57.113+09
57	2024-05-30 16:19:40.431+09	2024-05-30 16:19:40.431+09
58	2024-06-19 13:07:27.545+09	2024-06-19 13:07:27.545+09
\.


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brands (id, name, created_at, updated_at) FROM stdin;
24	Очки	2024-05-26 16:14:11.787+09	2024-05-26 16:14:11.787+09
25	Перчатки	2024-05-26 16:26:11.393+09	2024-05-26 16:26:11.393+09
26	Расходники	2024-05-26 16:26:43.904+09	2024-05-26 16:26:43.904+09
27	Ботинки	2024-05-26 16:26:59.004+09	2024-05-26 16:26:59.004+09
28	Шлемы	2024-05-26 16:27:03.538+09	2024-05-26 16:27:03.538+09
29	Чехлы	2024-05-26 16:27:54.564+09	2024-05-26 16:27:54.564+09
30	Сноуборды	2024-05-26 16:28:02.521+09	2024-05-26 16:28:02.521+09
31	Сапборды	2024-05-26 17:31:00.356+09	2024-05-26 17:31:00.356+09
33	Лонгборды	2024-05-27 04:35:40.551+09	2024-05-27 04:35:40.551+09
34	Вейкборды	2024-05-27 04:35:48.708+09	2024-05-27 04:35:48.708+09
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, created_at, updated_at) FROM stdin;
23	Сноубординг	2024-05-26 16:14:37.164+09	2024-05-26 16:14:37.164+09
24	Вейкбординг	2024-05-26 16:14:45.463+09	2024-05-26 16:14:45.463+09
25	Сапбординг	2024-05-26 16:14:52.546+09	2024-05-26 16:14:52.546+09
26	Лонгбординг	2024-05-26 16:16:09.567+09	2024-05-26 16:16:09.567+09
31	Лыжи	2024-05-28 12:29:19.722+09	2024-05-28 12:29:19.722+09
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (id, name, price, quantity, created_at, updated_at, order_id) FROM stdin;
24	Лонгборд Qix	15000	1	2024-05-28 12:09:14.298+09	2024-05-28 12:09:14.298+09	10
25	Перчатки Salomon	5000	1	2024-05-28 12:09:14.307+09	2024-05-28 12:09:14.307+09	10
26	Перчатки Roxy	3000	4	2024-05-28 12:32:35.56+09	2024-05-28 12:32:35.56+09	11
27	Очки Julbo	8000	4	2024-05-28 12:32:35.569+09	2024-05-28 12:32:35.569+09	11
28	Лонгборд Asta	15000	4	2024-05-28 12:32:35.572+09	2024-05-28 12:32:35.572+09	11
29	Лонгборд Qix	15000	5	2024-05-28 12:32:35.575+09	2024-05-28 12:32:35.575+09	11
30	Веqкборд Vue	35000	5	2024-05-28 12:32:35.578+09	2024-05-28 12:32:35.578+09	11
31	Вейкборд Delong	40000	4	2024-05-28 12:32:35.581+09	2024-05-28 12:32:35.581+09	11
33	Очки Julbo	8000	2	2024-06-20 09:56:29.518+09	2024-06-20 09:56:29.518+09	13
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, name, email, phone, address, amount, status, comment, created_at, updated_at, user_id) FROM stdin;
10	Влад Кривега	admin@mail.ru	79638143903	аываыва	20000	0	ауаы	2024-05-28 12:09:14.224+09	2024-05-28 12:09:14.224+09	4
11	Влад Кривега	admin@mail.ru	7954343223	Ленина 40	514000	0	Упаковать	2024-05-28 12:32:35.518+09	2024-05-28 12:32:35.518+09	4
13	Влад Кривега	admin@mail.ru	79638143903	fghjfgd	16000	0	fdvdfgvdf	2024-06-20 09:56:29.451+09	2024-06-20 09:56:29.451+09	4
\.


--
-- Data for Name: product_props; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_props (id, name, value, created_at, updated_at, product_id) FROM stdin;
183	Длина 	160см	2024-05-27 15:30:53.694+09	2024-05-27 15:30:53.694+09	133
184	Длина	100см	2024-05-28 12:30:47.011+09	2024-05-28 12:30:47.011+09	139
185	Ширина 	40см	2024-05-28 12:30:47.029+09	2024-05-28 12:30:47.029+09	139
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, price, rating, image, created_at, updated_at, category_id, brand_id, visits) FROM stdin;
126	Перчатки Salomon	5000	0	872fd28c-a7be-43c8-a5ae-73616313af87.jpeg	2024-05-26 17:37:28.631+09	2024-06-24 11:12:52.514+09	23	25	0
125	Перчатки Roxy	3000	0	89410624-735b-46ba-8e4f-2dc365b383da.jpeg	2024-05-26 17:36:44.687+09	2024-07-03 02:28:07.842+09	23	25	0
127	Очки Julbo	8000	0	54900230-7e67-46e9-83e0-022c09de5880.jpeg	2024-05-26 17:39:09.513+09	2024-07-03 02:27:54.727+09	23	24	0
131	Сапборд Eva	25900	0	d219e38c-653b-47da-9594-ebcc07b3f9e6.webp	2024-05-26 17:41:09.552+09	2025-06-03 12:31:18.628+09	25	31	0
132	Сапборд Low	28000	0	934e533c-0cb9-4291-8cdd-036b46326233.webp	2024-05-26 17:41:45.584+09	2024-08-05 18:08:44.868+09	25	31	0
137	Лонгборд Qix	15000	0	c7442271-e9f0-428b-9f1f-092031f791c2.jpeg	2024-05-27 04:36:41.712+09	2025-05-22 16:39:36.083+09	26	33	0
138	Лонгборд Asta	15000	0	95392da5-105b-4200-897a-14c8fefdb93a.jpeg	2024-05-27 04:37:20.322+09	2025-06-03 02:44:34.349+09	26	33	0
139	Веqкборд Vue	35000	0	32fe0fdd-6697-4c3f-905f-12b175620197.jpeg	2024-05-28 12:30:46.613+09	2025-06-03 02:43:29.803+09	24	34	0
140	Вейкборд Delong	40000	0	5f7f1394-eb25-4492-bf73-bd14f732311d.jpeg	2024-05-28 12:31:21.52+09	2025-06-03 02:43:41.238+09	24	34	0
133	Сноуборд Salomon	50000	0	68df3cb2-f5c6-40ef-b997-df3a8c8a2238.jpeg	2024-05-26 17:43:16.504+09	2025-06-03 12:45:48.918+09	23	30	1
134	Сноуборд Capita	30000	0	548691c8-e027-4d6c-8fa8-95f66a919f33.jpeg	2024-05-26 17:43:45.116+09	2025-06-03 12:46:09.296+09	23	30	2
135	Сноуборд Roxy	40000	0	63fe7601-730e-489a-ab4c-abed25914910.jpeg	2024-05-26 17:44:05.516+09	2025-06-03 12:46:11.813+09	23	30	3
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ratings (rate, created_at, updated_at, product_id, user_id) FROM stdin;
5	2024-06-20 07:17:53.637+09	2024-06-20 07:17:53.637+09	135	3
4	2024-06-20 07:18:04.537+09	2024-06-20 07:18:04.537+09	133	3
3	2024-06-20 09:55:21.522+09	2024-06-20 09:55:21.522+09	134	4
2	2024-06-20 09:55:32.033+09	2024-06-20 09:55:32.033+09	140	4
4	2024-06-20 09:58:27.463+09	2024-06-20 09:58:27.463+09	140	7
3	2024-06-20 10:02:21.887+09	2024-06-20 10:02:21.887+09	139	7
4	2024-07-02 16:58:02.858+09	2024-07-02 16:58:02.858+09	134	14
3	2024-07-03 01:49:53.284+09	2024-07-03 01:49:53.284+09	135	4
1	2024-07-03 01:56:13.9+09	2024-07-03 01:56:13.9+09	131	4
2	2024-07-03 01:56:34.18+09	2024-07-03 01:56:34.18+09	133	4
5	2025-06-01 21:08:58.731+09	2025-06-01 21:08:58.731+09	139	15
5	2025-06-03 12:31:23.759+09	2025-06-03 12:31:23.759+09	131	15
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, role, created_at, updated_at) FROM stdin;
3	user@mail.ru	$2b$05$33KYYLYkDqkqlwru0eHev.Wp9t47/176gW0OCdwIndgagn7QU6Lde	USER	2021-12-25 19:56:40.236+09	2021-12-25 19:56:40.236+09
4	admin@mail.ru	$2b$05$3i6B3E6ns0zqXgZsSNDHc.K0W3mnss6lJ0C46P2uaZXb3q2iwhsX6	ADMIN	2021-12-29 19:10:01.557+09	2021-12-29 19:10:01.557+09
6	user2@mail.ru	$2b$05$yWp3WEcYdJB7/DjmycrbBeeQ0hsG6klGQx5BRHDw80eE9KCEZijxq	USER	2021-12-29 19:22:52.966+09	2021-12-29 19:22:52.966+09
5	admin2@mail.ru	$2b$05$o9l/.S2YTcox/yo1/9zlNebDbTkUnz.F83N4rA24HZSLQVYREUtFu	ADMIN	2021-12-29 19:11:01.522+09	2021-12-29 19:11:01.522+09
7	vlad@mail.ru	$2b$05$.B/H20PZH89jOSayH0rJROqVaMT2V9srTQyuAqS8DrsnFJf8kxCRm	USER	2024-05-25 21:09:04.972+09	2024-05-25 21:09:04.972+09
8	vlad1@mail.ru	$2b$05$tbUptSX3hx2v42uAVac3XOlgFAw4SPY3ZD/xL3tkPWZoxtqS/HSKy	USER	2024-05-27 05:59:20.695+09	2024-05-27 05:59:20.695+09
9	vlad2@mail.ru	$2b$05$SJwqBf7cVJV7wvPxu7vwtuBAPEagPzNpCBjW4s4pojfjta3I3kmR.	USER	2024-05-28 03:18:23.528+09	2024-05-28 03:18:23.528+09
10	vlad3@mail.ru	$2b$05$RwvYYucqg7z18Sh0Kc/g.OfrXpMxJKsNMKdGz5U4ORCzqw3tr9MZC	USER	2024-05-28 12:28:13.923+09	2024-05-28 12:28:13.923+09
11	user843948@mail.ru	$2b$05$4wCZb5uvB8FyubLrrJz1ZusE8OfVIYzXJpVmIDIJfkdeQJtUb42N6	USER	2024-06-20 07:11:20.815+09	2024-06-20 07:11:20.815+09
12	vlad6@mail.ru	$2b$05$cDGebEBN92kK.P5Phz0hb.ScW9T8hlNfRMlygUo7nvfDARyHwwFBu	USER	2024-06-20 09:53:18.835+09	2024-06-20 09:53:18.835+09
13	qwqeqweq	$2b$05$7L0y2hlY5TSLad5qz/vELu.TMymUc75Lea/8EnanF9j0P2WDa1yO2	USER	2024-07-02 16:46:22.541+09	2024-07-02 16:46:22.541+09
14	32424	$2b$05$2ta1i6ehay6HudNUJ0Yeqe2oNOEYgvvQ3iMLWNcDRqyfgb5s9dphO	USER	2024-07-02 16:46:51.277+09	2024-07-02 16:46:51.277+09
15	vlad0	$2b$05$1xn4wtbS1PYNGTVW2jNDFeXupsH76agfqOib6sFzdGCkgdED/074e	USER	2025-06-01 21:08:46.284+09	2025-06-01 21:08:46.284+09
\.


--
-- Name: baskets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.baskets_id_seq', 58, true);


--
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brands_id_seq', 34, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 31, true);


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_id_seq', 33, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 13, true);


--
-- Name: product_props_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_props_id_seq', 185, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 140, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 15, true);


--
-- Name: basket_products basket_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_products
    ADD CONSTRAINT basket_products_pkey PRIMARY KEY (basket_id, product_id);


--
-- Name: baskets baskets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT baskets_pkey PRIMARY KEY (id);


--
-- Name: brands brands_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_name_key UNIQUE (name);


--
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: product_props product_props_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_props
    ADD CONSTRAINT product_props_pkey PRIMARY KEY (id);


--
-- Name: products products_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_name_key UNIQUE (name);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (product_id, user_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: basket_products basket_products_basket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_products
    ADD CONSTRAINT basket_products_basket_id_fkey FOREIGN KEY (basket_id) REFERENCES public.baskets(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: basket_products basket_products_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_products
    ADD CONSTRAINT basket_products_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: product_props product_props_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_props
    ADD CONSTRAINT product_props_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: products products_brand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brands(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ratings ratings_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ratings ratings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

