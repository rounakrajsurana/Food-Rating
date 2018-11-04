--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)
-- Dumped by pg_dump version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: portfolio_value(); Type: FUNCTION; Schema: public; Owner: st120546
--

CREATE FUNCTION public.portfolio_value() RETURNS numeric
    LANGUAGE plpgsql
    AS $$
DECLARE
c1 CURSOR FOR SELECT * FROM my_stocks NATURAL LEFT OUTER JOIN stock_prices;
total_val NUMERIC DEFAULT 0;
stk_val NUMERIC DEFAULT 0;
stk RECORD;
BEGIN
OPEN c1;
LOOP
FETCH c1 INTO stk;
IF stk IS NOT NULL THEN
IF stk.price>0 THEN
stk_val := (stk.n_shares * stk.price);
total_val := total_val + stk_val;
ELSE
stk_val := 0;
END IF;
RAISE NOTICE 'Value of: % = %', stk.symbol,stk_val;
END IF;
EXIT WHEN NOT FOUND;
END LOOP;
CLOSE c1;
RETURN total_val;
END;
$$;


ALTER FUNCTION public.portfolio_value() OWNER TO st120546;

--
-- Name: trade_cal(character varying); Type: FUNCTION; Schema: public; Owner: st120546
--

CREATE FUNCTION public.trade_cal(in_str character varying) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
DECLARE
out_str NUMERIC DEFAULT 0;
stk_cal NUMERIC DEFAULT 0;
BEGIN
out_str :=0;
FOR i IN 1..LENGTH(in_str) LOOP
stk_cal := ASCII(SUBSTR(in_str,i,1));
out_str := out_str + stk_cal;
END LOOP;
RETURN out_str;
END;
$$;


ALTER FUNCTION public.trade_cal(in_str character varying) OWNER TO st120546;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: st120546
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO st120546;

--
-- Name: assignments; Type: TABLE; Schema: public; Owner: st120546
--

CREATE TABLE public.assignments (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.assignments OWNER TO st120546;

--
-- Name: assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: st120546
--

CREATE SEQUENCE public.assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assignments_id_seq OWNER TO st120546;

--
-- Name: assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st120546
--

ALTER SEQUENCE public.assignments_id_seq OWNED BY public.assignments.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: st120546
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO st120546;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: st120546
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO st120546;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st120546
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: dishes; Type: TABLE; Schema: public; Owner: st120546
--

CREATE TABLE public.dishes (
    id bigint NOT NULL,
    name character varying,
    "desc" character varying,
    picture character varying,
    category_id bigint,
    stall_id bigint,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.dishes OWNER TO st120546;

--
-- Name: dishes_id_seq; Type: SEQUENCE; Schema: public; Owner: st120546
--

CREATE SEQUENCE public.dishes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dishes_id_seq OWNER TO st120546;

--
-- Name: dishes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st120546
--

ALTER SEQUENCE public.dishes_id_seq OWNED BY public.dishes.id;


--
-- Name: my_stocks; Type: TABLE; Schema: public; Owner: st120546
--

CREATE TABLE public.my_stocks (
    symbol character varying(20) NOT NULL,
    n_shares integer NOT NULL,
    date_acquired date NOT NULL
);


ALTER TABLE public.my_stocks OWNER TO st120546;

--
-- Name: newly_acquired_stocks; Type: TABLE; Schema: public; Owner: st120546
--

CREATE TABLE public.newly_acquired_stocks (
    symbol character varying(20) NOT NULL,
    n_shares integer NOT NULL,
    date_acquired date NOT NULL
);


ALTER TABLE public.newly_acquired_stocks OWNER TO st120546;

--
-- Name: problems; Type: TABLE; Schema: public; Owner: st120546
--

CREATE TABLE public.problems (
    id bigint NOT NULL,
    pid integer,
    problemset_id bigint,
    pname character varying,
    url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.problems OWNER TO st120546;

--
-- Name: problems_id_seq; Type: SEQUENCE; Schema: public; Owner: st120546
--

CREATE SEQUENCE public.problems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.problems_id_seq OWNER TO st120546;

--
-- Name: problems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st120546
--

ALTER SEQUENCE public.problems_id_seq OWNED BY public.problems.id;


--
-- Name: problemsets; Type: TABLE; Schema: public; Owner: st120546
--

CREATE TABLE public.problemsets (
    id bigint NOT NULL,
    psid integer,
    psname character varying,
    date_assign date,
    date_due date,
    url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.problemsets OWNER TO st120546;

--
-- Name: problemsets_id_seq; Type: SEQUENCE; Schema: public; Owner: st120546
--

CREATE SEQUENCE public.problemsets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.problemsets_id_seq OWNER TO st120546;

--
-- Name: problemsets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st120546
--

ALTER SEQUENCE public.problemsets_id_seq OWNED BY public.problemsets.id;


--
-- Name: quotations; Type: TABLE; Schema: public; Owner: st120546
--

CREATE TABLE public.quotations (
    id bigint NOT NULL,
    author_name character varying,
    category character varying,
    quote text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.quotations OWNER TO st120546;

--
-- Name: quotations_id_seq; Type: SEQUENCE; Schema: public; Owner: st120546
--

CREATE SEQUENCE public.quotations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quotations_id_seq OWNER TO st120546;

--
-- Name: quotations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st120546
--

ALTER SEQUENCE public.quotations_id_seq OWNED BY public.quotations.id;


--
-- Name: ratings; Type: TABLE; Schema: public; Owner: st120546
--

CREATE TABLE public.ratings (
    id bigint NOT NULL,
    rate integer,
    comment character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    dish_id integer
);


ALTER TABLE public.ratings OWNER TO st120546;

--
-- Name: ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: st120546
--

CREATE SEQUENCE public.ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ratings_id_seq OWNER TO st120546;

--
-- Name: ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st120546
--

ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: st120546
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO st120546;

--
-- Name: solutions; Type: TABLE; Schema: public; Owner: st120546
--

CREATE TABLE public.solutions (
    id bigint NOT NULL,
    sid integer,
    problem_id bigint,
    "desc" text,
    url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.solutions OWNER TO st120546;

--
-- Name: solutions_id_seq; Type: SEQUENCE; Schema: public; Owner: st120546
--

CREATE SEQUENCE public.solutions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solutions_id_seq OWNER TO st120546;

--
-- Name: solutions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st120546
--

ALTER SEQUENCE public.solutions_id_seq OWNED BY public.solutions.id;


--
-- Name: stalls; Type: TABLE; Schema: public; Owner: st120546
--

CREATE TABLE public.stalls (
    id bigint NOT NULL,
    name character varying,
    "desc" character varying,
    picture character varying,
    latlog character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    owner integer
);


ALTER TABLE public.stalls OWNER TO st120546;

--
-- Name: stalls_id_seq; Type: SEQUENCE; Schema: public; Owner: st120546
--

CREATE SEQUENCE public.stalls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stalls_id_seq OWNER TO st120546;

--
-- Name: stalls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st120546
--

ALTER SEQUENCE public.stalls_id_seq OWNED BY public.stalls.id;


--
-- Name: stock_prices; Type: TABLE; Schema: public; Owner: st120546
--

CREATE TABLE public.stock_prices (
    symbol character varying(20) NOT NULL,
    quote_date date NOT NULL,
    price integer NOT NULL
);


ALTER TABLE public.stock_prices OWNER TO st120546;

--
-- Name: stocks_i_like; Type: VIEW; Schema: public; Owner: st120546
--

CREATE VIEW public.stocks_i_like AS
 SELECT my_stocks.symbol,
    sum(my_stocks.n_shares) AS total_shares_held,
    max(my_stocks.date_acquired) AS last_acquired,
    stock_prices.price,
    (sum(my_stocks.n_shares) * stock_prices.price) AS total_value_held
   FROM (public.my_stocks
     LEFT JOIN public.stock_prices USING (symbol))
  GROUP BY my_stocks.symbol, stock_prices.price
 HAVING (count(my_stocks.symbol) > 1);


ALTER TABLE public.stocks_i_like OWNER TO st120546;

--
-- Name: users; Type: TABLE; Schema: public; Owner: st120546
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    fullname character varying,
    contactno character varying,
    admin boolean,
    stall boolean,
    active boolean
);


ALTER TABLE public.users OWNER TO st120546;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: st120546
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO st120546;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st120546
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: views; Type: TABLE; Schema: public; Owner: st120546
--

CREATE TABLE public.views (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.views OWNER TO st120546;

--
-- Name: views_id_seq; Type: SEQUENCE; Schema: public; Owner: st120546
--

CREATE SEQUENCE public.views_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.views_id_seq OWNER TO st120546;

--
-- Name: views_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st120546
--

ALTER SEQUENCE public.views_id_seq OWNED BY public.views.id;


--
-- Name: assignments id; Type: DEFAULT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.assignments ALTER COLUMN id SET DEFAULT nextval('public.assignments_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: dishes id; Type: DEFAULT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.dishes ALTER COLUMN id SET DEFAULT nextval('public.dishes_id_seq'::regclass);


--
-- Name: problems id; Type: DEFAULT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.problems ALTER COLUMN id SET DEFAULT nextval('public.problems_id_seq'::regclass);


--
-- Name: problemsets id; Type: DEFAULT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.problemsets ALTER COLUMN id SET DEFAULT nextval('public.problemsets_id_seq'::regclass);


--
-- Name: quotations id; Type: DEFAULT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.quotations ALTER COLUMN id SET DEFAULT nextval('public.quotations_id_seq'::regclass);


--
-- Name: ratings id; Type: DEFAULT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);


--
-- Name: solutions id; Type: DEFAULT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.solutions ALTER COLUMN id SET DEFAULT nextval('public.solutions_id_seq'::regclass);


--
-- Name: stalls id; Type: DEFAULT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.stalls ALTER COLUMN id SET DEFAULT nextval('public.stalls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: views id; Type: DEFAULT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.views ALTER COLUMN id SET DEFAULT nextval('public.views_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: st120546
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2018-08-30 21:56:04.983585	2018-08-30 21:56:04.983585
\.


--
-- Data for Name: assignments; Type: TABLE DATA; Schema: public; Owner: st120546
--

COPY public.assignments (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: st120546
--

COPY public.categories (id, name, user_id, created_at, updated_at) FROM stdin;
2	Salads	1	2018-10-22 18:17:44.222183	2018-10-22 18:17:44.222183
3	Vegans	2	2018-11-04 02:18:40.095713	2018-11-04 02:28:52.04567
5	Sweets	2	2018-11-04 04:36:48.687717	2018-11-04 04:36:48.687717
1	Noodles	1	2018-10-22 18:17:01.957137	2018-11-04 11:52:26.670568
\.


--
-- Data for Name: dishes; Type: TABLE DATA; Schema: public; Owner: st120546
--

COPY public.dishes (id, name, "desc", picture, category_id, stall_id, user_id, created_at, updated_at) FROM stdin;
1	Salad 1	AAA Salad 1	salad1.jpg	2	1	2	2018-11-04 14:46:34.684679	2018-11-04 14:46:34.684679
2	Vegan 1	BBBB Vegan 1	vegan1.jpg	3	1	2	2018-11-04 15:49:24.692576	2018-11-04 15:49:24.692576
\.


--
-- Data for Name: my_stocks; Type: TABLE DATA; Schema: public; Owner: st120546
--

COPY public.my_stocks (symbol, n_shares, date_acquired) FROM stdin;
AMAT	5000	2018-06-09
ALXN	6000	2018-07-09
FDC	7000	2018-08-09
STZ	8000	2018-09-09
OC	9000	2018-10-09
SDIVX	1000	2018-11-09
AMAT	5000	2018-09-14
ALXN	6000	2018-09-14
STZ	8000	2018-09-14
\.


--
-- Data for Name: newly_acquired_stocks; Type: TABLE DATA; Schema: public; Owner: st120546
--

COPY public.newly_acquired_stocks (symbol, n_shares, date_acquired) FROM stdin;
FDC	7000	2018-08-09
STZ	8000	2018-09-09
OC	9000	2018-10-09
\.


--
-- Data for Name: problems; Type: TABLE DATA; Schema: public; Owner: st120546
--

COPY public.problems (id, pid, problemset_id, pname, url, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: problemsets; Type: TABLE DATA; Schema: public; Owner: st120546
--

COPY public.problemsets (id, psid, psname, date_assign, date_due, url, created_at, updated_at) FROM stdin;
1	1	Basics	2018-08-24	2018-08-31		2018-08-30 22:53:11.165588	2018-08-30 22:53:11.165588
\.


--
-- Data for Name: quotations; Type: TABLE DATA; Schema: public; Owner: st120546
--

COPY public.quotations (id, author_name, category, quote, created_at, updated_at) FROM stdin;
1	an	cat	qqq	2018-09-25 19:36:02.51949	2018-09-25 19:36:02.51949
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: st120546
--

COPY public.ratings (id, rate, comment, created_at, updated_at, user_id, dish_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: st120546
--

COPY public.schema_migrations (version) FROM stdin;
20180830215322
20180830215615
20180830222446
20180829192007
20180910081221
20181022143606
20181022165141
20181022170914
20181022172330
20181022172532
20181022211004
20181022211142
20181022211223
20181023034606
20181023035247
20181024174401
20181101111139
20181101111211
20181104061347
\.


--
-- Data for Name: solutions; Type: TABLE DATA; Schema: public; Owner: st120546
--

COPY public.solutions (id, sid, problem_id, "desc", url, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: stalls; Type: TABLE DATA; Schema: public; Owner: st120546
--

COPY public.stalls (id, name, "desc", picture, latlog, user_id, created_at, updated_at, owner) FROM stdin;
2	Stall 2	222 Stall 2	stall2.jpg	(22,22)	2	2018-11-04 07:52:56.612306	2018-11-04 14:49:25.716225	4
1	Stall1	Desc11	stall1.jpg	(11,11)	3	2018-11-01 14:10:04.198519	2018-11-04 12:29:36.080368	3
\.


--
-- Data for Name: stock_prices; Type: TABLE DATA; Schema: public; Owner: st120546
--

COPY public.stock_prices (symbol, quote_date, price) FROM stdin;
AMAT	2018-09-14	291
ALXN	2018-09-14	307
FDC	2018-09-14	205
STZ	2018-09-14	257
OC	2018-09-14	146
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: st120546
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, fullname, contactno, admin, stall, active) FROM stdin;
1	ae@gmail.com	$2a$11$V3u7vkVgKjNt2FuWPItBeObsW/yRWLgb2kpZIOEV4U5jjB3dxWb2u	\N	\N	\N	2018-10-22 17:53:54.872409	2018-10-22 17:53:54.872409	\N	\N	\N	\N	t
4	ae2@ait.asia	$2a$11$nqyKyGmK8BL0toyhVwXiv.jo9sox4mO03ryUCKavFzK14LzDFcAYu	\N	\N	\N	2018-11-04 17:11:01.246345	2018-11-04 17:11:01.246345	\N	\N	\N	t	t
3	stall@gmail.com	$2a$11$xSrjV7iQA3lctp81RJvh1OcFhWOLpWJE2KpYQqMSPOFTkNREve3Sm	\N	\N	\N	2018-10-23 07:31:51.620538	2018-10-23 07:31:51.620538	\N	\N	\N	t	f
2	admin@gmail.com	$2a$11$G4TM8IlDrYddM6aQrN3KkeTnilq7MxQJh8IqFPd/FYc/GK5gsnvBe	\N	\N	\N	2018-10-23 04:03:02.91378	2018-11-04 01:33:49.859857	\N	\N	t	\N	t
\.


--
-- Data for Name: views; Type: TABLE DATA; Schema: public; Owner: st120546
--

COPY public.views (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at) FROM stdin;
\.


--
-- Name: assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st120546
--

SELECT pg_catalog.setval('public.assignments_id_seq', 1, false);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st120546
--

SELECT pg_catalog.setval('public.categories_id_seq', 7, true);


--
-- Name: dishes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st120546
--

SELECT pg_catalog.setval('public.dishes_id_seq', 2, true);


--
-- Name: problems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st120546
--

SELECT pg_catalog.setval('public.problems_id_seq', 1, false);


--
-- Name: problemsets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st120546
--

SELECT pg_catalog.setval('public.problemsets_id_seq', 1, true);


--
-- Name: quotations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st120546
--

SELECT pg_catalog.setval('public.quotations_id_seq', 1, true);


--
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st120546
--

SELECT pg_catalog.setval('public.ratings_id_seq', 1, false);


--
-- Name: solutions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st120546
--

SELECT pg_catalog.setval('public.solutions_id_seq', 1, false);


--
-- Name: stalls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st120546
--

SELECT pg_catalog.setval('public.stalls_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st120546
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: views_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st120546
--

SELECT pg_catalog.setval('public.views_id_seq', 1, false);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: assignments assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: dishes dishes_pkey; Type: CONSTRAINT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_pkey PRIMARY KEY (id);


--
-- Name: problems problems_pkey; Type: CONSTRAINT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.problems
    ADD CONSTRAINT problems_pkey PRIMARY KEY (id);


--
-- Name: problemsets problemsets_pkey; Type: CONSTRAINT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.problemsets
    ADD CONSTRAINT problemsets_pkey PRIMARY KEY (id);


--
-- Name: quotations quotations_pkey; Type: CONSTRAINT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT quotations_pkey PRIMARY KEY (id);


--
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: solutions solutions_pkey; Type: CONSTRAINT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.solutions
    ADD CONSTRAINT solutions_pkey PRIMARY KEY (id);


--
-- Name: stalls stalls_pkey; Type: CONSTRAINT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.stalls
    ADD CONSTRAINT stalls_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: views views_pkey; Type: CONSTRAINT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.views
    ADD CONSTRAINT views_pkey PRIMARY KEY (id);


--
-- Name: index_categories_on_user_id; Type: INDEX; Schema: public; Owner: st120546
--

CREATE INDEX index_categories_on_user_id ON public.categories USING btree (user_id);


--
-- Name: index_dishes_on_category_id; Type: INDEX; Schema: public; Owner: st120546
--

CREATE INDEX index_dishes_on_category_id ON public.dishes USING btree (category_id);


--
-- Name: index_dishes_on_stall_id; Type: INDEX; Schema: public; Owner: st120546
--

CREATE INDEX index_dishes_on_stall_id ON public.dishes USING btree (stall_id);


--
-- Name: index_dishes_on_user_id; Type: INDEX; Schema: public; Owner: st120546
--

CREATE INDEX index_dishes_on_user_id ON public.dishes USING btree (user_id);


--
-- Name: index_problems_on_problemset_id; Type: INDEX; Schema: public; Owner: st120546
--

CREATE INDEX index_problems_on_problemset_id ON public.problems USING btree (problemset_id);


--
-- Name: index_solutions_on_problem_id; Type: INDEX; Schema: public; Owner: st120546
--

CREATE INDEX index_solutions_on_problem_id ON public.solutions USING btree (problem_id);


--
-- Name: index_stalls_on_user_id; Type: INDEX; Schema: public; Owner: st120546
--

CREATE INDEX index_stalls_on_user_id ON public.stalls USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: st120546
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: st120546
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_views_on_email; Type: INDEX; Schema: public; Owner: st120546
--

CREATE UNIQUE INDEX index_views_on_email ON public.views USING btree (email);


--
-- Name: index_views_on_reset_password_token; Type: INDEX; Schema: public; Owner: st120546
--

CREATE UNIQUE INDEX index_views_on_reset_password_token ON public.views USING btree (reset_password_token);


--
-- Name: dishes fk_rails_07f79d0f12; Type: FK CONSTRAINT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT fk_rails_07f79d0f12 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: dishes fk_rails_22c30b8d84; Type: FK CONSTRAINT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT fk_rails_22c30b8d84 FOREIGN KEY (stall_id) REFERENCES public.stalls(id);


--
-- Name: dishes fk_rails_9511618633; Type: FK CONSTRAINT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT fk_rails_9511618633 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: categories fk_rails_b8e2f7adfc; Type: FK CONSTRAINT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT fk_rails_b8e2f7adfc FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: solutions fk_rails_b967ba8f91; Type: FK CONSTRAINT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.solutions
    ADD CONSTRAINT fk_rails_b967ba8f91 FOREIGN KEY (problem_id) REFERENCES public.problems(id);


--
-- Name: stalls fk_rails_d02899bd7a; Type: FK CONSTRAINT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.stalls
    ADD CONSTRAINT fk_rails_d02899bd7a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: problems fk_rails_fc038dece8; Type: FK CONSTRAINT; Schema: public; Owner: st120546
--

ALTER TABLE ONLY public.problems
    ADD CONSTRAINT fk_rails_fc038dece8 FOREIGN KEY (problemset_id) REFERENCES public.problemsets(id);


--
-- PostgreSQL database dump complete
--

