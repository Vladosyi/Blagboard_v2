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
-- Name: basket_devices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basket_devices (
    id integer NOT NULL,
    "deviceId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "basketId" integer
);


ALTER TABLE public.basket_devices OWNER TO postgres;

--
-- Name: basket_devices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.basket_devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.basket_devices_id_seq OWNER TO postgres;

--
-- Name: basket_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.basket_devices_id_seq OWNED BY public.basket_devices.id;


--
-- Name: baskets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.baskets (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer
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
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
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
-- Name: device_infos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.device_infos (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deviceId" integer
);


ALTER TABLE public.device_infos OWNER TO postgres;

--
-- Name: device_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.device_infos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_infos_id_seq OWNER TO postgres;

--
-- Name: device_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.device_infos_id_seq OWNED BY public.device_infos.id;


--
-- Name: devices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.devices (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    rating integer DEFAULT 0,
    img character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "typeId" integer,
    "brandId" integer,
    visits integer DEFAULT 0
);


ALTER TABLE public.devices OWNER TO postgres;

--
-- Name: devices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.devices_id_seq OWNER TO postgres;

--
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.devices_id_seq OWNED BY public.devices.id;


--
-- Name: order_devices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_devices (
    id integer NOT NULL,
    "deviceId" integer NOT NULL,
    "orderId" integer NOT NULL,
    count integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.order_devices OWNER TO postgres;

--
-- Name: order_devices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_devices_id_seq OWNER TO postgres;

--
-- Name: order_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_devices_id_seq OWNED BY public.order_devices.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    complete boolean DEFAULT false,
    mobile character varying(25) NOT NULL,
    "userId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
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
-- Name: ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ratings (
    id integer NOT NULL,
    rate integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer,
    "deviceId" integer
);


ALTER TABLE public.ratings OWNER TO postgres;

--
-- Name: ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ratings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ratings_id_seq OWNER TO postgres;

--
-- Name: ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;


--
-- Name: session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.session (
    sid character varying(255) NOT NULL,
    sess json NOT NULL,
    expire timestamp with time zone NOT NULL
);


ALTER TABLE public.session OWNER TO postgres;

--
-- Name: type_brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_brands (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "typeId" integer,
    "brandId" integer
);


ALTER TABLE public.type_brands OWNER TO postgres;

--
-- Name: type_brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_brands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_brands_id_seq OWNER TO postgres;

--
-- Name: type_brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_brands_id_seq OWNED BY public.type_brands.id;


--
-- Name: types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.types (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.types OWNER TO postgres;

--
-- Name: types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.types_id_seq OWNER TO postgres;

--
-- Name: types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.types_id_seq OWNED BY public.types.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255),
    password character varying(255),
    role character varying(255) DEFAULT 'User'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
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
-- Name: basket_devices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_devices ALTER COLUMN id SET DEFAULT nextval('public.basket_devices_id_seq'::regclass);


--
-- Name: baskets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets ALTER COLUMN id SET DEFAULT nextval('public.baskets_id_seq'::regclass);


--
-- Name: brands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands ALTER COLUMN id SET DEFAULT nextval('public.brands_id_seq'::regclass);


--
-- Name: device_infos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_infos ALTER COLUMN id SET DEFAULT nextval('public.device_infos_id_seq'::regclass);


--
-- Name: devices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices ALTER COLUMN id SET DEFAULT nextval('public.devices_id_seq'::regclass);


--
-- Name: order_devices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_devices ALTER COLUMN id SET DEFAULT nextval('public.order_devices_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: ratings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);


--
-- Name: type_brands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_brands ALTER COLUMN id SET DEFAULT nextval('public.type_brands_id_seq'::regclass);


--
-- Name: types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types ALTER COLUMN id SET DEFAULT nextval('public.types_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: basket_devices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.basket_devices (id, "deviceId", "createdAt", "updatedAt", "basketId") FROM stdin;
1	7	2024-05-24 21:52:55.501+09	2024-05-24 21:52:55.501+09	3
2	6	2024-05-24 21:52:56.853+09	2024-05-24 21:52:56.853+09	3
3	5	2024-05-24 21:52:57.765+09	2024-05-24 21:52:57.765+09	3
\.


--
-- Data for Name: baskets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.baskets (id, "createdAt", "updatedAt", "userId") FROM stdin;
1	2024-03-16 19:51:46.005+09	2024-03-16 19:51:46.005+09	1
2	2024-03-17 17:56:56.186+09	2024-03-17 17:56:56.186+09	2
3	2024-03-17 19:41:34.349+09	2024-03-17 19:41:34.349+09	3
4	2024-03-18 12:09:00.881+09	2024-03-18 12:09:00.881+09	4
5	2024-05-17 17:32:13+09	2024-05-17 17:32:13+09	5
6	2024-05-17 19:05:47.879+09	2024-05-17 19:05:47.879+09	6
7	2024-05-18 01:01:30.512+09	2024-05-18 01:01:30.512+09	7
8	2024-05-21 18:18:31.662+09	2024-05-21 18:18:31.662+09	8
9	2024-05-21 18:18:44.337+09	2024-05-21 18:18:44.337+09	9
10	2024-05-24 17:41:18.887+09	2024-05-24 17:41:18.887+09	10
11	2024-05-24 17:41:44.186+09	2024-05-24 17:41:44.186+09	11
12	2024-05-24 17:41:47.957+09	2024-05-24 17:41:47.957+09	12
13	2024-05-24 17:42:04.816+09	2024-05-24 17:42:04.816+09	13
14	2024-05-24 17:42:37.769+09	2024-05-24 17:42:37.769+09	14
15	2024-05-24 17:42:41.408+09	2024-05-24 17:42:41.408+09	15
16	2024-05-24 17:42:48.557+09	2024-05-24 17:42:48.557+09	16
17	2024-05-24 17:42:52.333+09	2024-05-24 17:42:52.333+09	17
18	2024-05-24 18:55:44.891+09	2024-05-24 18:55:44.891+09	18
19	2024-05-24 22:39:55.856+09	2024-05-24 22:39:55.856+09	19
\.


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brands (id, name, "createdAt", "updatedAt") FROM stdin;
6	Крепления	2024-03-18 05:23:31.859+09	2024-03-18 05:23:31.859+09
7	Ботинки	2024-03-18 05:23:40.699+09	2024-03-18 05:23:40.699+09
8	Шлемы	2024-03-18 05:23:47.78+09	2024-03-18 05:23:47.78+09
9	Чехлы	2024-03-18 05:23:57.477+09	2024-03-18 05:23:57.477+09
10	Перчатки	2024-03-18 05:25:01.351+09	2024-03-18 05:25:01.351+09
11	Сноуборды	2024-03-18 05:25:21.242+09	2024-03-18 05:25:21.242+09
12	Очки	2024-03-18 05:25:32.715+09	2024-03-18 05:25:32.715+09
13	Защита	2024-03-18 05:25:45.401+09	2024-03-18 05:25:45.401+09
14	Балаклавы	2024-03-18 05:25:54.354+09	2024-03-18 05:25:54.354+09
15	Расходники	2024-03-18 05:26:08.115+09	2024-03-18 05:26:08.115+09
\.


--
-- Data for Name: device_infos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.device_infos (id, title, description, "createdAt", "updatedAt", "deviceId") FROM stdin;
1	Производитель 	Salamon	2024-03-18 04:11:37.933+09	2024-03-18 04:11:37.933+09	\N
2	rating	5	2024-03-18 06:18:41.891+09	2024-03-18 06:18:41.891+09	\N
\.


--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId", visits) FROM stdin;
6	Сноуборд Roxy	35000	0	04403acc-b735-4071-939d-fbda8a65bf42.jpg	2024-03-18 05:27:35.147+09	2024-03-18 05:27:35.147+09	13	11	0
7	Сноуборд Capita	35000	0	37c1ad8d-2717-4bd8-84cd-5b73224675f7.jpg	2024-03-18 05:28:11.595+09	2024-03-18 05:28:11.595+09	13	11	0
8	Перчатки Roxy	3000	0	894715f3-fcc9-4fe3-a7c0-230cadd82ae1.jpg	2024-03-18 05:30:00.611+09	2024-03-18 05:30:00.611+09	13	10	0
9	Перчатки Salamon	3000	0	6d932d5b-ca6f-43be-839d-001dcbab4267.jpg	2024-03-18 05:30:20.596+09	2024-03-18 05:30:20.596+09	13	10	0
10	Крепления K2	15000	0	2fe19341-2cb7-4cdc-9d5f-9e5d1c245619.jpg	2024-03-18 05:31:28.945+09	2024-03-18 05:31:28.945+09	13	6	0
12	Перчатки Burton	2000	0	d8f2af32-116f-4b4a-8007-ba13ec3e2029.jpg	2024-03-18 05:42:36.181+09	2024-03-18 05:42:36.181+09	13	10	0
13	Крепления Burton	20000	0	11a4e4b5-0ac7-4e17-bd64-765c10c7ed34.jpg	2024-03-18 05:43:23.184+09	2024-03-18 05:43:23.184+09	13	6	0
19	Балаклава Burton	2000	0	2a47b7d8-5837-458b-bfb4-164079ba5bf3.jpg	2024-03-18 05:44:54.03+09	2024-03-18 05:44:54.03+09	13	14	0
20	Балаклава Roxy	2000	0	e992d9b6-1861-4b24-abc9-24c39f68cdb0.jpg	2024-03-18 05:45:16.083+09	2024-03-18 05:45:16.083+09	13	14	0
21	Балаклава Salamon	999	0	43a9d2dd-3013-4ab4-92f3-66989bbbd42c.jpg	2024-03-18 05:45:37.905+09	2024-03-18 05:45:37.905+09	13	14	0
26	Очки Salamon	6000	0	b0642b50-f64f-41f4-b8e3-6ce56164f71a.jpg	2024-03-18 05:47:27.679+09	2024-03-18 05:47:27.679+09	13	12	0
29	Очки Burton	6000	0	5afb1cea-aabb-4b69-ad72-587849201461.jpg	2024-03-18 05:48:10.52+09	2024-03-18 05:48:10.52+09	13	12	0
30	Очки Coppoz	4000	0	e771dad6-b732-4e1e-9295-5d06d09d6de4.jpg	2024-03-18 05:48:39.885+09	2024-03-18 05:48:39.885+09	13	12	0
32	Очки Burto	5000	0	068ef1bd-3d8f-4c5a-b71c-5b2573610e3b.jpg	2024-03-18 05:49:01.652+09	2024-03-18 05:49:01.652+09	13	12	0
34	Шлем Salamon	9000	0	83d26304-7286-4795-89a8-66c596cc11be.jpg	2024-03-18 06:22:06.311+09	2024-03-18 06:22:06.311+09	13	8	0
5	Сноуборд Salamon	40000	0	fb3bb190-853a-41dc-bd15-32c72fe9f54e.jpg	2024-03-18 05:27:06.41+09	2024-05-25 18:55:39.597+09	13	11	1
\.


--
-- Data for Name: order_devices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_devices (id, "deviceId", "orderId", count, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, complete, mobile, "userId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ratings (id, rate, "createdAt", "updatedAt", "userId", "deviceId") FROM stdin;
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.session (sid, sess, expire) FROM stdin;
WWP9M0gpdYfbnojtdcED0l1gMFXIOjXW	{"cookie":{"originalMaxAge":2592000000,"expires":"2024-06-23T10:17:23.880Z","httpOnly":true,"path":"/"},"basket":[{"deviceId":4},{"deviceId":44}]}	2024-06-23 19:17:24+09
bR2YH3k_IRgWsNshZ1UgOGTHmTvX7nEf	{"cookie":{"originalMaxAge":2592000000,"expires":"2024-06-23T12:04:59.890Z","httpOnly":true,"path":"/"},"basket":[{}]}	2024-06-23 21:05:00+09
-sQ_LKizRbTJepww-LUiQ4UTYW1HPmUK	{"cookie":{"originalMaxAge":2592000000,"expires":"2024-06-23T12:05:01.739Z","httpOnly":true,"path":"/"},"basket":[{}]}	2024-06-23 21:05:02+09
idDiYTI2IlamChv-LJwFkI_477tTh6CS	{"cookie":{"originalMaxAge":2592000000,"expires":"2024-06-23T12:05:03.233Z","httpOnly":true,"path":"/"},"basket":[{}]}	2024-06-23 21:05:04+09
nHPluVTfLQZ8kumzk22M-TJRw6iJJTz_	{"cookie":{"originalMaxAge":2592000000,"expires":"2024-06-23T12:05:04.983Z","httpOnly":true,"path":"/"},"basket":[{}]}	2024-06-23 21:05:05+09
\.


--
-- Data for Name: type_brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_brands (id, "createdAt", "updatedAt", "typeId", "brandId") FROM stdin;
\.


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.types (id, name, "createdAt", "updatedAt") FROM stdin;
13	Сноубординг	2024-03-18 04:47:13.638+09	2024-03-18 04:47:13.638+09
14	Вейкбординг	2024-03-18 05:22:26.451+09	2024-03-18 05:22:26.451+09
15	Сапбординг	2024-03-18 05:22:39.872+09	2024-03-18 05:22:39.872+09
16	Лонгбординг	2024-03-18 05:22:54.389+09	2024-03-18 05:22:54.389+09
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, role, "createdAt", "updatedAt") FROM stdin;
1	user@mail.ru	$2b$05$yqbHxFkShY2OvW0oIg3Qz.8W6jxrJStB13yeTrs3S8iiWL8gxF9HW	USER	2024-03-16 19:51:45.975+09	2024-03-16 19:51:45.975+09
2	usertest@mail.ru	$2b$05$XCKBVIGOlZUG77Je250PTOEGHBjqfDFbh1.BCILAsoDAHZx91CUb.	USER	2024-03-17 17:56:56.156+09	2024-03-17 17:56:56.156+09
3	admin@mail.ru	$2b$05$u4zbHTH1ZSMH40LvYDp50OCMoV/sIuyukcLDF7Dn5GKNHLhXBerJW	ADMIN	2024-03-17 19:41:34.322+09	2024-03-17 19:41:34.322+09
4	user1@mail.ru	$2b$05$sP7mnlOoKHDswo4cf2XMh.KRIhDuoSXRNSB.BLzZM7O7IZ3A7AY9S	USER	2024-03-18 12:09:00.857+09	2024-03-18 12:09:00.857+09
5	123@mail.ru	$2b$05$m64uvv53xAcvov9QwZMo3.amjGr/7LY8kufKkaUdYmUBGYJ38rOni	USER	2024-05-17 17:32:12.958+09	2024-05-17 17:32:12.958+09
6	3213	$2b$05$FmX4I0okXP8mocDiuuyj3.YednNeIVNWWDGodcVDnVMMNJkupRQeu	USER	2024-05-17 19:05:47.853+09	2024-05-17 19:05:47.853+09
7	123	$2b$05$TDD7KBXiEzo5FjQjTDblN.BBxlvBzNBdpqAJ69oNrBOWyS/IC9pii	USER	2024-05-18 01:01:30.47+09	2024-05-18 01:01:30.47+09
8	1231	$2b$05$sZqFulf41BVM6nw3.ObgB.Jo.VOCmi.i.7jpVOF7gzVguyv7X8VEG	USER	2024-05-21 18:18:31.628+09	2024-05-21 18:18:31.628+09
9	34424	$2b$05$kH/iDQWZkg34Rc3ySt6zd.lNuBVWjpw5cZYuPceC0BuxJ5GchH3qy	USER	2024-05-21 18:18:44.311+09	2024-05-21 18:18:44.311+09
10	vlad1@mail.ru	$2b$05$KTE5aUWhIZqcpXHRTFFteewX3j9QySWUJc3/pMZcmZ38BDww8HJlK	User	2024-05-24 17:41:18.84+09	2024-05-24 17:41:18.84+09
11	vlad2@mail.ru	$2b$05$/7GwQntXcsRv/JNKYb1AZ.uBFvLL8bbi75ixhYIwNHIrZtkOOvQyq	User	2024-05-24 17:41:44.179+09	2024-05-24 17:41:44.179+09
12	vlad3@mail.ru	$2b$05$p8G0i2v6Q9ezjHB7.HyjyeZ.lZ1b1qn/fFCuFWYS7q6RqcB9NC9f.	User	2024-05-24 17:41:47.95+09	2024-05-24 17:41:47.95+09
13	vlad4@mail.ru	$2b$05$UI4ANzUClYuYSjSmmnhbwODiM5iEZGNppZmjx73SqMZ7InUdb18mC	User	2024-05-24 17:42:04.811+09	2024-05-24 17:42:04.811+09
14	vlad5@mail.ru	$2b$05$.GWlmhKTN7ydkkyHC3nPreha2Rf/RthtjayDuKUleEMvjG8uBQjuy	User	2024-05-24 17:42:37.754+09	2024-05-24 17:42:37.754+09
15	vlad6@mail.ru	$2b$05$6dz9Fdk2Xwawk3nrPJImvOYnnGinznpjcsZqgPO/ibrqsQQx/tM.O	User	2024-05-24 17:42:41.401+09	2024-05-24 17:42:41.401+09
16	vlad7@mail.ru	$2b$05$Zten6H2qiW8CdxkJT3XyaeN0UlbWQ2igPaFkvZuklpkW9HGx7VSW6	User	2024-05-24 17:42:48.553+09	2024-05-24 17:42:48.553+09
17	vlad8@mail.ru	$2b$05$uCMru9IYeheSyX5imLOPWeerk3J5CqQaRmxYg/a9Ul4CweqTTS/3u	User	2024-05-24 17:42:52.317+09	2024-05-24 17:42:52.317+09
18	vlad9@mail.ru	$2b$05$FqpMqO1PZtk4TEu4tsEO/uT.pwYzexiwXn22BFOUT9aLuAdFtT1iK	User	2024-05-24 18:55:44.828+09	2024-05-24 18:55:44.828+09
19	432423	$2b$05$jurxyjl6qvUPD/8.tqX/tuWVbX7ZfgsLsLPv5X4vTwCtDx5uIe5b2	USER	2024-05-24 22:39:55.829+09	2024-05-24 22:39:55.829+09
\.


--
-- Name: basket_devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.basket_devices_id_seq', 3, true);


--
-- Name: baskets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.baskets_id_seq', 19, true);


--
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brands_id_seq', 15, true);


--
-- Name: device_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.device_infos_id_seq', 2, true);


--
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.devices_id_seq', 34, true);


--
-- Name: order_devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_devices_id_seq', 1, false);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ratings_id_seq', 1, false);


--
-- Name: type_brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_brands_id_seq', 1, false);


--
-- Name: types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.types_id_seq', 16, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 19, true);


--
-- Name: basket_devices basket_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_devices
    ADD CONSTRAINT basket_devices_pkey PRIMARY KEY (id);


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
-- Name: device_infos device_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_infos
    ADD CONSTRAINT device_infos_pkey PRIMARY KEY (id);


--
-- Name: devices devices_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_name_key UNIQUE (name);


--
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- Name: order_devices order_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_devices
    ADD CONSTRAINT order_devices_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (sid);


--
-- Name: type_brands type_brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_brands
    ADD CONSTRAINT type_brands_pkey PRIMARY KEY (id);


--
-- Name: type_brands type_brands_typeId_brandId_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_brands
    ADD CONSTRAINT "type_brands_typeId_brandId_key" UNIQUE ("typeId", "brandId");


--
-- Name: types types_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_name_key UNIQUE (name);


--
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


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
-- Name: IDX_session_expire; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_session_expire" ON public.session USING btree (expire);


--
-- Name: basket_devices basket_devices_basketId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_devices
    ADD CONSTRAINT "basket_devices_basketId_fkey" FOREIGN KEY ("basketId") REFERENCES public.baskets(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: basket_devices basket_devices_deviceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_devices
    ADD CONSTRAINT "basket_devices_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES public.devices(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: baskets baskets_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT "baskets_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: device_infos device_infos_deviceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_infos
    ADD CONSTRAINT "device_infos_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES public.devices(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: devices devices_brandId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT "devices_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES public.brands(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: devices devices_typeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT "devices_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES public.types(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: order_devices order_devices_orderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_devices
    ADD CONSTRAINT "order_devices_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: orders orders_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "orders_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ratings ratings_deviceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT "ratings_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES public.devices(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ratings ratings_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT "ratings_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: type_brands type_brands_brandId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_brands
    ADD CONSTRAINT "type_brands_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES public.brands(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: type_brands type_brands_typeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_brands
    ADD CONSTRAINT "type_brands_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES public.types(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

