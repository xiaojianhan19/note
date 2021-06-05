--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12
-- Dumped by pg_dump version 10.12

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

ALTER TABLE ONLY public.collection_parent_bean_tags DROP CONSTRAINT fkpm79wpr25nh2y3njnskjo41hh;
ALTER TABLE ONLY public.category DROP CONSTRAINT fkge26ktd35v1ef6000re6hshgy;
ALTER TABLE ONLY public.event_item DROP CONSTRAINT fkclk0pp6p3qr3mtwvk06nu2dwk;
ALTER TABLE ONLY public.collection_item DROP CONSTRAINT fkcbdeyw4hsxw60iw7cfh6krix7;
ALTER TABLE ONLY public.category_item DROP CONSTRAINT fkc55uc5tlmjwpxnmji5onqubxy;
ALTER TABLE ONLY public.person_item DROP CONSTRAINT fk864sl4h1avqb8aem17sgxssqg;
ALTER TABLE ONLY public.person DROP CONSTRAINT person_pkey;
ALTER TABLE ONLY public.person_item DROP CONSTRAINT person_item_pkey;
ALTER TABLE ONLY public.event DROP CONSTRAINT event_pkey;
ALTER TABLE ONLY public.event_item DROP CONSTRAINT event_item_pkey;
ALTER TABLE ONLY public.diary DROP CONSTRAINT diary_pkey;
ALTER TABLE ONLY public.collection DROP CONSTRAINT collection_pkey;
ALTER TABLE ONLY public.collection_item DROP CONSTRAINT collection_item_pkey;
ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
ALTER TABLE ONLY public.category_item DROP CONSTRAINT category_item_pkey;
SELECT pg_catalog.lo_unlink('24903');
SELECT pg_catalog.lo_unlink('24902');
SELECT pg_catalog.lo_unlink('24901');
SELECT pg_catalog.lo_unlink('24900');
DROP SEQUENCE public.pesron_item_id_seq;
DROP TABLE public.person_item;
DROP SEQUENCE public.person_id_seq;
DROP TABLE public.person;
DROP SEQUENCE public.event_item_id_seq;
DROP TABLE public.event_item;
DROP SEQUENCE public.event_id_seq;
DROP TABLE public.event;
DROP TABLE public.diary;
DROP TABLE public.collection_parent_bean_tags;
DROP SEQUENCE public.collection_item_id_seq;
DROP TABLE public.collection_item;
DROP SEQUENCE public.collection_id_seq;
DROP TABLE public.collection;
DROP SEQUENCE public.category_item_id_seq;
DROP TABLE public.category_item;
DROP SEQUENCE public.category_id_seq;
DROP TABLE public.category;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: category; Type: TABLE; Schema: public; Owner: xiao
--

CREATE TABLE public.category (
    id integer NOT NULL,
    end_date character varying(255),
    input_date character varying(255),
    name character varying(255),
    start_date character varying(255),
    item_id integer
);


ALTER TABLE public.category OWNER TO xiao;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: xiao
--

CREATE SEQUENCE public.category_id_seq
    START WITH 40000001
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO xiao;

--
-- Name: category_item; Type: TABLE; Schema: public; Owner: xiao
--

CREATE TABLE public.category_item (
    id integer NOT NULL,
    name character varying(255),
    root integer NOT NULL,
    parent_id integer
);


ALTER TABLE public.category_item OWNER TO xiao;

--
-- Name: category_item_id_seq; Type: SEQUENCE; Schema: public; Owner: xiao
--

CREATE SEQUENCE public.category_item_id_seq
    START WITH 41000001
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_item_id_seq OWNER TO xiao;

--
-- Name: collection; Type: TABLE; Schema: public; Owner: xiao
--

CREATE TABLE public.collection (
    id integer NOT NULL,
    level integer NOT NULL,
    category character varying(255),
    input_date character varying(255),
    memo text,
    name character varying(255),
    name2 character varying(255),
    name3 character varying(255),
    release_date character varying(255),
    status character varying(255)
);


ALTER TABLE public.collection OWNER TO xiao;

--
-- Name: collection_id_seq; Type: SEQUENCE; Schema: public; Owner: xiao
--

CREATE SEQUENCE public.collection_id_seq
    START WITH 30000001
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collection_id_seq OWNER TO xiao;

--
-- Name: collection_item; Type: TABLE; Schema: public; Owner: xiao
--

CREATE TABLE public.collection_item (
    id integer NOT NULL,
    index integer NOT NULL,
    input_date character varying(255),
    memo text,
    name character varying(255),
    name2 character varying(255),
    name3 character varying(255),
    type character varying(255),
    update_date character varying(255),
    parent_id integer
);


ALTER TABLE public.collection_item OWNER TO xiao;

--
-- Name: collection_item_id_seq; Type: SEQUENCE; Schema: public; Owner: xiao
--

CREATE SEQUENCE public.collection_item_id_seq
    START WITH 31000001
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collection_item_id_seq OWNER TO xiao;

--
-- Name: collection_parent_bean_tags; Type: TABLE; Schema: public; Owner: xiao
--

CREATE TABLE public.collection_parent_bean_tags (
    collection_parent_bean_id integer NOT NULL,
    tag character varying(255)
);


ALTER TABLE public.collection_parent_bean_tags OWNER TO xiao;

--
-- Name: diary; Type: TABLE; Schema: public; Owner: xiao
--

CREATE TABLE public.diary (
    date character varying(255) NOT NULL,
    length integer NOT NULL,
    memo text
);


ALTER TABLE public.diary OWNER TO xiao;

--
-- Name: event; Type: TABLE; Schema: public; Owner: xiao
--

CREATE TABLE public.event (
    id integer NOT NULL,
    category character varying(255),
    name character varying(255),
    sorted character varying(255),
    status character varying(255)
);


ALTER TABLE public.event OWNER TO xiao;

--
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: xiao
--

CREATE SEQUENCE public.event_id_seq
    START WITH 10000001
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_id_seq OWNER TO xiao;

--
-- Name: event_item; Type: TABLE; Schema: public; Owner: xiao
--

CREATE TABLE public.event_item (
    id integer NOT NULL,
    date character varying(255),
    memo character varying(255),
    "time" double precision NOT NULL,
    parent_id integer
);


ALTER TABLE public.event_item OWNER TO xiao;

--
-- Name: event_item_id_seq; Type: SEQUENCE; Schema: public; Owner: xiao
--

CREATE SEQUENCE public.event_item_id_seq
    START WITH 11000001
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_item_id_seq OWNER TO xiao;

--
-- Name: person; Type: TABLE; Schema: public; Owner: xiao
--

CREATE TABLE public.person (
    id integer NOT NULL,
    address character varying(255),
    category character varying(255),
    input_date character varying(255),
    memo text,
    name character varying(255),
    name2 character varying(255),
    name3 character varying(255),
    status character varying(255)
);


ALTER TABLE public.person OWNER TO xiao;

--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: xiao
--

CREATE SEQUENCE public.person_id_seq
    START WITH 20000001
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO xiao;

--
-- Name: person_item; Type: TABLE; Schema: public; Owner: xiao
--

CREATE TABLE public.person_item (
    id integer NOT NULL,
    date character varying(255),
    memo character varying(255),
    "time" double precision NOT NULL,
    parent_id integer
);


ALTER TABLE public.person_item OWNER TO xiao;

--
-- Name: pesron_item_id_seq; Type: SEQUENCE; Schema: public; Owner: xiao
--

CREATE SEQUENCE public.pesron_item_id_seq
    START WITH 21000001
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pesron_item_id_seq OWNER TO xiao;

--
-- Name: 24900; Type: BLOB; Schema: -; Owner: xiao
--

SELECT pg_catalog.lo_create('24900');


ALTER LARGE OBJECT 24900 OWNER TO xiao;

--
-- Name: 24901; Type: BLOB; Schema: -; Owner: xiao
--

SELECT pg_catalog.lo_create('24901');


ALTER LARGE OBJECT 24901 OWNER TO xiao;

--
-- Name: 24902; Type: BLOB; Schema: -; Owner: xiao
--

SELECT pg_catalog.lo_create('24902');


ALTER LARGE OBJECT 24902 OWNER TO xiao;

--
-- Name: 24903; Type: BLOB; Schema: -; Owner: xiao
--

SELECT pg_catalog.lo_create('24903');


ALTER LARGE OBJECT 24903 OWNER TO xiao;

--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: xiao
--

COPY public.category (id, end_date, input_date, name, start_date, item_id) FROM stdin;
40000002	2019-01-10	2019-01-01	Event	2019-01-01	41000023
40000003	2019-02-01	2019-01-10	Event	2019-01-10	41000043
40000004	2019-02-10	2019-02-01	Event	2019-02-01	41000065
40000005	2019-03-01	2019-02-10	Event	2019-02-10	41000086
40000009	9999-12-31	2019-10-21	Fantasy	2019-10-21	41000193
40000006	2019-11-10	2019-03-01	Event	2019-03-01	41000109
40000011	9999-12-31	2019-11-10	Event	2019-11-10	41000235
40000010	2020-07-26	2019-10-26	Collection	2019-10-26	41000200
40000012	9999-12-30	2020-07-26	Collection	2020-07-26	41000259
40000013	9999-12-31	2020-08-09	Achievement	1900-01-01	41000269
40000008	2019-10-26	2019-10-20	Collection	1900-01-01	41000169
40000001	2019-01-01	2000-01-01	Event	1900-01-01	41000001
40000007	2019-01-01	2019-10-17	Person	1900-01-01	41000132
40000015	9999-12-31	2021-05-25	Person	2019-01-01	41000336
\.


--
-- Data for Name: category_item; Type: TABLE DATA; Schema: public; Owner: xiao
--

COPY public.category_item (id, name, root, parent_id) FROM stdin;
41000001	Total	41000001	\N
41000002	Work	41000001	41000001
41000003	Job	41000001	41000002
41000004	Social	41000001	41000002
41000005	Life	41000001	41000001
41000006	Live	41000001	41000005
41000007	Communicate	41000001	41000005
41000008	Learn	41000001	41000001
41000009	Note	41000001	41000008
41000010	Language	41000001	41000008
41000011	Discipline	41000001	41000008
41000012	Exercise	41000001	41000008
41000013	Dream	41000001	41000001
41000014	Project	41000001	41000013
41000015	Journey	41000001	41000013
41000016	Fantasy	41000001	41000013
41000017	Play	41000001	41000001
41000018	Animation	41000001	41000017
41000019	Book	41000001	41000017
41000020	Game	41000001	41000017
41000021	Movie	41000001	41000017
41000022	Erotism	41000001	41000017
41000023	total	41000023	\N
41000024	work	41000023	41000023
41000025	business	41000023	41000024
41000026	Note	41000023	41000024
41000027	note	41000023	41000024
41000028	project	41000023	41000024
41000029	language	41000023	41000024
41000030	fantasy	41000023	41000024
41000031	life	41000023	41000023
41000032	live	41000023	41000031
41000033	sleep	41000023	41000031
41000034	communication	41000023	41000031
41000035	discipline	41000023	41000031
41000036	exercise	41000023	41000031
41000037	play	41000023	41000023
41000038	book	41000023	41000037
41000039	animation	41000023	41000037
41000040	game	41000023	41000037
41000041	ero	41000023	41000037
41000042	other	41000023	41000037
41000043	Total	41000043	\N
41000044	Live	41000043	41000043
41000045	Work	41000043	41000044
41000046	Sleep	41000043	41000044
41000047	Meal	41000043	41000044
41000048	Clean	41000043	41000044
41000049	Other	41000043	41000044
41000050	Health	41000043	41000043
41000051	Communication	41000043	41000050
41000052	Discipline	41000043	41000050
41000053	Exercise	41000043	41000050
41000054	Erotism	41000043	41000050
41000055	Learn	41000043	41000043
41000056	Project	41000043	41000055
41000057	Language	41000043	41000055
41000058	Fantasy	41000043	41000055
41000059	Note	41000043	41000055
41000060	Play	41000043	41000043
41000061	Animation	41000043	41000060
41000062	Book	41000043	41000060
41000063	Game	41000043	41000060
41000064	Movie	41000043	41000060
41000065	Total	41000065	\N
41000066	Live	41000065	41000065
41000067	Work	41000065	41000066
41000068	Communication	41000065	41000066
41000069	Sleep	41000065	41000066
41000070	Meal	41000065	41000066
41000071	Clean	41000065	41000066
41000072	Other	41000065	41000066
41000073	Learn	41000065	41000065
41000074	Project	41000065	41000073
41000075	Language	41000065	41000073
41000076	Fantasy	41000065	41000073
41000077	Note	41000065	41000073
41000078	Discipline	41000065	41000073
41000079	Exercise	41000065	41000073
41000080	Play	41000065	41000065
41000081	Animation	41000065	41000080
41000082	Book	41000065	41000080
41000083	Game	41000065	41000080
41000084	Movie	41000065	41000080
41000085	Erotism	41000065	41000080
41000086	Total	41000086	\N
41000087	Work	41000086	41000086
41000088	Programmer	41000086	41000087
41000089	TSSummit	41000086	41000088
41000090	Social	41000086	41000087
41000091	Life	41000086	41000086
41000092	Live	41000086	41000091
41000093	Communicate	41000086	41000091
41000094	Account	41000086	41000091
41000095	Exercise	41000086	41000091
41000096	Chore	41000086	41000091
41000097	Learn	41000086	41000086
41000098	Project	41000086	41000097
41000099	Fantasy	41000086	41000097
41000100	Note	41000086	41000097
41000101	Language	41000086	41000097
41000102	Discipline	41000086	41000097
41000103	Play	41000086	41000086
41000104	Animation	41000086	41000103
41000105	Book	41000086	41000103
41000106	Game	41000086	41000103
41000107	Movie	41000086	41000103
41000108	Erotism	41000086	41000103
41000109	Total	41000109	\N
41000110	Work	41000109	41000109
41000111	Programmer	41000109	41000110
41000112	TSSummit	41000109	41000111
41000113	Neso	41000109	41000111
41000114	Social	41000109	41000110
41000115	Life	41000109	41000109
41000116	Live	41000109	41000115
41000117	Account	41000109	41000115
41000118	Communicate	41000109	41000115
41000119	Exercise	41000109	41000115
41000120	Learn	41000109	41000109
41000121	Project	41000109	41000120
41000122	Language	41000109	41000120
41000123	Fantasy	41000109	41000120
41000124	Note	41000109	41000120
41000125	Discipline	41000109	41000120
41000126	Play	41000109	41000109
41000127	Animation	41000109	41000126
41000128	Book	41000109	41000126
41000129	Game	41000109	41000126
41000130	Movie	41000109	41000126
41000131	Erotism	41000109	41000126
41000132	Human	41000132	\N
41000133	Circle	41000132	41000132
41000134	Relative	41000132	41000133
41000135	Family	41000132	41000134
41000137	MontherSide	41000132	41000134
41000138	Friend	41000132	41000133
41000139	Classmate	41000132	41000138
41000140	小学	41000132	41000139
41000141	初中	41000132	41000139
41000142	高中	41000132	41000139
41000143	大学	41000132	41000139
41000144	Colleague	41000132	41000138
41000145	NEC	41000132	41000144
41000146	思辨	41000132	41000144
41000147	环保局	41000132	41000144
41000148	Elife	41000132	41000144
41000149	Neso	41000132	41000144
41000151	Rest	41000132	41000138
41000152	武术馆	41000132	41000151
41000153	广电局	41000132	41000151
41000155	早起会	41000132	41000151
41000156	青年部	41000132	41000155
41000157	高岛平会场	41000132	41000155
41000158	本部	41000132	41000155
41000150	SJI	41000132	41000148
41000159	西千叶会场	41000132	41000155
41000160	其他会场	41000132	41000155
41000161	心理学	41000132	41000151
41000162	Stranger	41000132	41000133
41000163	永川	41000132	41000162
41000164	重庆	41000132	41000162
41000165	北京	41000132	41000162
41000166	东京	41000132	41000162
41000167	Collection	41000132	41000132
41000168	Fantasy	41000132	41000132
41000169	Collection	41000169	\N
41000170	Animation	41000169	41000169
41000171	少女校园	41000169	41000170
41000172	异能灵侦	41000169	41000170
41000173	竞技冒险	41000169	41000170
41000174	战争异界	41000169	41000170
41000175	Book	41000169	41000169
41000176	Novel	41000169	41000175
41000177	Light	41000169	41000175
41000178	Classic	41000169	41000175
41000179	Education	41000169	41000175
41000180	Other	41000169	41000175
41000181	Game	41000169	41000169
41000182	RPG	41000169	41000181
41000183	ACT	41000169	41000181
41000184	SLG	41000169	41000181
41000185	RTS	41000169	41000181
41000186	Online	41000169	41000181
41000187	Movie	41000169	41000169
41000188	Chinese	41000169	41000187
41000189	American	41000169	41000187
41000190	Japanese	41000169	41000187
41000191	Varitety	41000169	41000187
41000192	Music	41000169	41000169
41000193	Fantasy	41000193	\N
41000194	城市恋曲	41000193	41000193
41000195	旅者之歌	41000193	41000193
41000196	魔法旋律	41000193	41000193
41000197	宇宙音符	41000193	41000193
41000198	新篇	41000193	41000193
41000199	联想	41000193	41000193
41000200	Collection	41000200	\N
41000201	Animation	41000200	41000200
41000202	少女校园	41000200	41000201
41000203	异能灵侦	41000200	41000201
41000204	竞技冒险	41000200	41000201
41000205	战争异界	41000200	41000201
41000206	Book	41000200	41000200
41000207	Novel	41000200	41000206
41000208	Light	41000200	41000206
41000209	Classic	41000200	41000206
41000210	Education	41000200	41000206
41000211	Other	41000200	41000206
41000212	Game	41000200	41000200
41000213	RPG	41000200	41000212
41000214	ACT	41000200	41000212
41000215	SLG	41000200	41000212
41000216	RTS	41000200	41000212
41000217	Online	41000200	41000212
41000218	Movie	41000200	41000200
41000219	Chinese	41000200	41000218
41000220	American	41000200	41000218
41000221	Japanese	41000200	41000218
41000222	Varitety	41000200	41000218
41000223	Music	41000200	41000200
41000224	Japanese	41000200	41000223
41000225	Chinese	41000200	41000223
41000226	English	41000200	41000223
41000227	Melody	41000200	41000223
41000228	Fantasy	41000200	41000200
41000229	城市恋曲	41000200	41000228
41000230	旅者之歌	41000200	41000228
41000231	魔法旋律	41000200	41000228
41000232	宇宙音符	41000200	41000228
41000233	新篇	41000200	41000228
41000234	联想	41000200	41000228
41000235	Total	41000235	\N
41000236	Work	41000235	41000235
41000237	Programmer	41000235	41000236
41000238	TSSummit	41000235	41000237
41000239	Neso	41000235	41000237
41000240	Social	41000235	41000236
41000241	Life	41000235	41000235
41000242	Live	41000235	41000241
41000243	Account	41000235	41000241
41000244	Communicate	41000235	41000241
41000245	Learn	41000235	41000235
41000246	Project	41000235	41000245
41000247	Language	41000235	41000245
41000248	Fantasy	41000235	41000245
41000249	Note	41000235	41000245
41000250	Discipline	41000235	41000245
41000251	Exercise	41000235	41000245
41000252	Play	41000235	41000235
41000253	Animation	41000235	41000252
41000254	Book	41000235	41000252
41000255	Game	41000235	41000252
41000256	Movie	41000235	41000252
41000257	Erotism	41000235	41000252
41000258	Leisure	41000235	41000252
41000259	Collection	41000259	\N
41000260	Animation	41000259	41000259
41000261	Book	41000259	41000259
41000262	Game	41000259	41000259
41000263	Movie	41000259	41000259
41000264	Discipline	41000259	41000259
41000265	Fantasy	41000259	41000259
41000266	Project	41000259	41000259
41000267	Unsorted	41000132	41000132
41000268	Unsorted	41000259	41000259
41000269	Achievement	0	\N
41000270	Project	41000269	41000269
41000271	Language	41000269	41000269
41000272	Fantasy	41000269	41000269
41000273	Note	41000269	41000269
41000274	Discipline	41000269	41000269
41000275	Exercise	41000269	41000269
41000276	Communicate	41000269	41000269
41000277	Unsorted	41000269	41000269
41000278	TSSummit	41000269	41000270
41000280	Neso	41000269	41000270
41000154	天行者	41000132	41000143
41000281	新日铁	41000132	41000149
41000289	Relative	41000288	41000288
41000290	Classmate	41000288	41000288
41000291	Colleague	41000288	41000288
41000292	Rest	41000288	41000288
41000293	Stranger	41000288	41000288
41000297	小学	41000288	41000290
41000298	初中	41000288	41000290
41000299	高中	41000288	41000290
41000300	大学	41000288	41000290
41000301	NEC	41000288	41000291
41000302	思辨	41000288	41000291
41000303	环保局	41000288	41000291
41000304	Elife	41000288	41000291
41000305	Neso	41000288	41000291
41000306	武术馆	41000288	41000292
41000307	广电局	41000288	41000292
41000308	早起会	41000288	41000292
41000309	永川	41000288	41000293
41000310	重庆	41000288	41000293
41000311	北京	41000288	41000293
41000312	东京	41000288	41000293
41000313	网络	41000288	41000293
41000295	Family	41000288	41000289
41000314	二爷家	41000288	41000294
41000288	Circle	41000336	41000336
41000282	旅者之歌	41000269	41000272
41000283	城市恋曲	41000269	41000272
41000284	宇宙音符	41000269	41000272
41000285	魔法旋律	41000269	41000272
41000286	新篇	41000269	41000272
41000287	联想	41000269	41000272
41000322	二孃家	41000288	41000296
41000323	三孃家	41000288	41000296
41000324	四孃家	41000288	41000296
41000325	大舅家	41000288	41000296
41000326	幺舅家	41000288	41000296
41000327	八孃家	41000288	41000296
41000328	天行者	41000288	41000300
41000329	SJI	41000288	41000304
41000330	新日铁	41000288	41000305
41000331	青年部	41000288	41000308
41000332	高岛平会场	41000288	41000308
41000333	本部	41000288	41000308
41000334	西千叶会场	41000288	41000308
41000335	其他会场	41000288	41000308
41000136	MatherSide	41000132	41000134
41000294	父系	41000288	41000289
41000296	母系	41000288	41000289
41000315	三娘家	41000288	41000294
41000316	五爷家	41000288	41000294
41000317	幺幺家	41000288	41000294
41000318	大公家	41000288	41000294
41000319	三公家	41000288	41000294
41000320	五公家	41000288	41000294
41000321	幺公家	41000288	41000294
41000336	Person	0	\N
41000337	History	41000336	41000336
41000338	Collection	41000336	41000336
41000339	Fantasy	41000336	41000336
41000340	行动	41000269	41000272
41000341	勇者传说	41000269	41000272
\.


--
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: xiao
--

COPY public.collection (id, level, category, input_date, memo, name, name2, name3, release_date, status) FROM stdin;
30000001	7	Animation	2003-07-05	对我来说，最有代表性的校园恋爱。	初音岛	D.C.	D.C.～ダ・カーポ～	2003-07-05	Complete
30000002	6	Animation	2005-10-03	校园恋爱经典02	ToHeart2	ToHeart2	ToHeart2	2005-10-03	Complete
30000003	7	Animation	1993-10-16	童年的回忆，上大学了看着更激动。	灌篮高手	SLUM DUNK	スラムダンク	1993-10-16	Complete
30000004	5	Animation	1983-10-13	居然比灌篮高手早10年	足球小将	Captain Tsubasa	キャプテン翼	1983-10-13	Complete
30000005	5	Animation	1986-02-26		龙珠	DRAGON BALL	ドラゴンボール	1986-02-26	Complete
30000006	4	Animation	1986-10-11		圣斗士星矢	Saint Seiya	聖闘士星矢	1986-10-11	GiveUp
30000007	5	Animation	1996-01-01		浪客剑心		るろうに剣心	1996-01-01	Complete
30000008	4	Animation	1992-10-10		幽游白书			1992-10-10	Complete
30000009	2	Animation	1989-04-15		乱马1/2			1989-04-15	GiveUp
30000010	4	Animation	1996-04-06		钢铁神兵			1996-04-06	Complete
30000011	4	Animation	1993-04-09		剑勇传说	九龙珠	城市风云儿	1993-04-09	Finished
30000012	2	Animation	0001-01-01		烈火之炎			0001-01-01	GiveUp
30000013	2	Animation	0001-01-01		hunter x hunter	hunter x hunter	hunter x hunter	0001-01-01	Miss
30000014	4	Animation	1999-03-07	童年回忆啊,片头曲也是最有代表性的燃曲	数码宝贝			1999-03-07	Complete
30000015	4	Animation	0001-01-01		奥特曼			0001-01-01	Finished
30000016	4	Animation	0001-01-01		美少女战士			0001-01-01	Finished
30000017	4	Animation	0001-01-01		天使领域	机动天使	機動天使エンジェリックレイヤー	0001-01-01	Complete
30000018	3	Animation	0001-01-01		四驱兄弟			0001-01-01	Finished
30000019	3	Animation	0001-01-01	冲向地平线,就记得这句话	四驱小子			0001-01-01	Finished
30000020	7	Animation	2003-01-01	最喜欢的作品之一啊,虽然似乎没人气.	宇宙的星路			2003-01-01	Complete
30000021	4	Animation	1998-04-18		头文字D	Initial D: First Stage		1998-04-18	Complete
30000022	4	Animation	0001-01-01		网球王子			0001-01-01	Finished
30000023	4	Animation	0001-01-01		棒球英豪			0001-01-01	GiveUp
30000024	3	Animation	0001-01-01		武器种族传说			0001-01-01	Miss
30000025	2	Animation	0001-01-01		史上最强弟子兼一			0001-01-01	Finished
30000026	1	Animation	0001-01-01		植木的法则			0001-01-01	Finished
30000027	4	Animation	2011-01-09		恶魔奶爸	beelzebub	べるぜバブ	2011-01-09	Finished
30000028	1	Animation	0001-01-01		一骑当千			0001-01-01	Finished
30000029	2	Animation	0001-01-01		刀语			0001-01-01	Finished
30000030	2	Animation	0001-01-01		虫奉行			0001-01-01	Finished
30000031	7	Animation	1996-01-08		名侦探柯南	Detective Conan	名探偵コナン	1996-01-08	Complete
30000032	2	Animation	0001-01-01		城市猎人			0001-01-01	GiveUp
30000033	3	Animation	0001-01-01		怪盗圣少女			0001-01-01	Finished
30000034	4	Animation	0001-01-01		天使怪盗			0001-01-01	Complete
30000035	5	Animation	2008-04-12		二十面相少女		二十面相の娘	2008-04-12	Complete
30000036	4	Animation	0001-01-01		死亡笔记			0001-01-01	Finished
30000037	7	Animation	2006-01-06	06年开始,到19年,火遍全球,算是多人构筑世界的经典吧.	Fate/stay night	Fate/stay night	Fate/stay night	2006-01-06	Complete
30000038	4	Animation	2006-12-29		Fate/Zero	Fate/Zero	Fate/Zero	2006-12-29	Complete
30000039	5	Animation	2017-07-01		Fate/Apocrypha	Fate/Apocrypha	Fate/Apocrypha	2017-07-01	Complete
30000040	5	Animation	2019-07-06	君主·埃尔梅罗二世事件簿 -魔眼收集列车 Grace note-	埃尔梅罗二世事件簿	魔眼收集列车 Grace note-		2019-07-06	Complete
30000041	4	Animation	0001-01-01		月姬			0001-01-01	Complete
30000042	4	Animation	0001-01-01		空之境界			0001-01-01	Finished
30000043	4	Animation	0001-01-01		魔卡少女樱			0001-01-01	GiveUp
30000044	4	Animation	0001-01-01		魔法少女奈叶			0001-01-01	Complete
30000045	4	Animation	2003-10-04		钢之炼金术师			2003-10-04	Complete
30000046	4	Animation	2004-09-30		舞-HIME			2004-09-30	Complete
30000047	3	Animation	2005-10-06		舞-乙HIME			2005-10-06	Complete
30000048	4	Animation	2005-10-05		灼眼的夏娜			2005-10-05	Complete
30000049	4	Animation	2007-04-06		黑之契约者			2007-04-06	Complete
30000050	5	Animation	0001-01-01	可惜作者挂了,永远成为过去了啊.	风之圣痕			0001-01-01	Complete
30000051	5	Animation	2008-10-01		魔法禁书目录			2008-10-01	Complete
30000052	5	Animation	2009-10-02		科学的超电磁炮	とある科学の超電磁砲		2009-10-02	Complete
30000053	4	Animation	2013-10-04		噬血狂袭		ストライク・ザ・ブラッド	2013-10-04	Complete
30000054	6	Animation	2006-10-03	有生之年啊	驱魔少年	D.Gray-man		2006-10-03	Complete
30000055	5	Animation	2009-04-02		潘多拉之心	Pandora Hearts		2009-04-02	Complete
30000056	4	Animation	2004-04-10		无头骑士异闻录	デュラララ!!		2004-04-10	Complete
30000057	3	Animation	0001-01-01		心灵侦探八云			0001-01-01	Complete
30000058	5	Animation	2006-10-03		奇幻贵公子			2006-10-03	Complete
30000059	5	Animation	2011-09-28		神的记事本			2011-09-28	Complete
30000060	6	Animation	2012-04-22		冰菓			2012-04-22	Complete
30000061	6	Animation	2005-10-23		虫师	Mushishi	蟲師	2005-10-23	Complete
30000062	4	Animation	2010-07-05		滑头鬼之孙		ぬらりひょんの孫	2010-07-05	Complete
30000063	2	Animation	0001-01-01		结界师			0001-01-01	GiveUp
30000064	4	Animation	0001-01-01		化物语			0001-01-01	Miss
30000065	2	Animation	0001-01-01		全部成为F			0001-01-01	Finished
30000066	4	Animation	2008-04-07		吸血鬼骑士	Vampire Knight	ヴァンパイア骑士	2008-04-07	Complete
30000067	1	Animation	0001-01-01		魔法使借贷公司			0001-01-01	Finished
30000068	2	Animation	0001-01-01		蔷薇少女			0001-01-01	Finished
30000069	3	Animation	0001-01-01		死后文			0001-01-01	Finished
30000070	1	Animation	0001-01-01		妖精的旋律			0001-01-01	Finished
30000071	3	Animation	0001-01-01		红			0001-01-01	Finished
30000072	3	Animation	0001-01-01		Another			0001-01-01	Finished
30000073	6	Animation	2010-02-22		绝园的暴风雨			2010-02-22	Complete
30000074	4	Animation	2013-10-02		境界的彼方			2013-10-02	Complete
30000075	4	Animation	2014-04-08		漆黑的子弹			2014-04-08	Complete
30000076	2	Animation	0001-01-01		极黑的布伦希尔德			0001-01-01	Finished
30000077	4	Animation	2014-07-06		斩赤红之瞳		アカメが斬る！	2014-07-06	Finished
30000078	4	Animation	2014-10-05		七大罪	The Seven Deadly Sins	七つの大罪	2014-10-05	Finished
30000079	3	Animation	2015-07-04		六花的勇者			2015-07-04	Finished
30000080	4	Animation	2015-04-04		终结的炽天使			2015-04-04	Finished
30000081	2	Animation	2014-07-14		精灵使的剑舞			2014-07-14	Finished
30000082	4	Animation	2006-07-02		零之使魔			2006-07-02	Finished
30000083	2	Animation	2011-04-15		绯弹的亚里亚			2011-04-15	GiveUp
30000084	2	Animation	2009-10-06		11eyes -罪与罚与赎的少女			2009-10-06	GiveUp
30000085	1	Animation	0001-01-01		神曲奏界			0001-01-01	GiveUp
30000086	2	Animation	0001-01-01		罪恶王冠			0001-01-01	GiveUp
30000087	3	Animation	2012-10-04		K			2012-10-04	Finished
30000088	4	Animation	2010-07-01	想看后续，只有找小说了。	传说的勇者的传说			2010-07-01	Finished
30000089	3	Animation	0001-01-01		暗夜魔法使			0001-01-01	Finished
30000090	1	Animation	0001-01-01		浜虎			0001-01-01	GiveUp
30000091	3	Animation	0001-01-01		91Days			0001-01-01	Complete
30000092	2	Animation	0001-01-01		永生之酒			0001-01-01	Finished
30000093	1	Animation	2008-04-05	记不得剧情了	苍色骑士	Blassreiter		2008-04-05	Finished
30000094	4	Animation	2013-07-05	希望峰学园3	弹丸论破	弹丸论破		2013-07-05	Finished
30000095	3	Animation	0001-01-01		信蜂			0001-01-01	Finished
30000096	4	Animation	0001-01-01		RWBY	RWBY	RWBY	0001-01-01	Finished
30000097	3	Animation	2018-01-05		刀使的巫女		とじのみこ	2018-01-05	Finished
30000098	5	Animation	1996-10-01		机动战舰Nadesico			1996-10-01	Complete
30000099	5	Animation	1995-10-04		新世纪福音战士	NEON GENESIS EVANGELION	新世紀エヴァンゲリオン	1995-10-04	Complete
30000100	6	Animation	1995-04-07	新机动战记高达W	Gundam W			1995-04-07	Complete
30000101	5	Animation	1996-04-05	机动新世纪高达X	Gundam X			1996-04-05	Complete
30000102	2	Animation	0001-01-01		Gundam G			0001-01-01	Complete
30000103	7	Animation	2002-10-05	Gundam Seed，Gundam Seed Destiny,\n最喜欢的作品，却好像种类很单一。在回忆中趋于完美。	Gundam Seed	Gundam Seed	Gundam Seed	2002-10-05	Complete
30000104	4	Animation	1979-01-01		Gundam 0079			1979-01-01	Complete
30000105	2	Animation	2010-02-20	没看下去啊，从seed完结后。	Gundam Unicon			2010-02-20	GiveUp
30000106	1	Animation	0001-01-01		苍穹的法芙娜		苍穹のファフナー	0001-01-01	GiveUp
30000107	3	Animation	0001-01-01		银色的奥林西斯			0001-01-01	Finished
30000108	3	Animation	0001-01-01		英雄时代			0001-01-01	Finished
30000109	6	Animation	2006-04-03		传颂之物		うたわれるもの	2006-04-03	Finished
30000110	5	Animation	0001-01-01		提亚拉之泪	Tears to Tiara		0001-01-01	Finished
30000111	4	Animation	2006-10-05		叛逆的鲁鲁修			2006-10-05	Finished
30000112	3	Animation	2013-10-07		苍蓝钢铁的琶音			2013-10-07	Finished
30000113	4	Animation	2009-01-07		钢壳都市雷吉欧斯			2009-01-07	Finished
30000114	4	Animation	2009-04-04		战场女武神			2009-04-04	Finished
30000115	7	Book	0001-01-01		三国演义			0001-01-01	Finished
30000116	5	Book	0001-01-01		魔法学徒			0001-01-01	Finished
30000117	4	Book	0001-01-01		佣兵天下			0001-01-01	GiveUp
30000118	4	Book	0001-01-01		微酸学园			0001-01-01	Miss
30000119	4	Book	0001-01-01		光之子			0001-01-01	Finished
30000120	6	Book	0001-01-01		飞云星志			0001-01-01	Complete
30000121	4	Book	0001-01-01		小兵传奇			0001-01-01	Finished
30000122	1	Book	0001-01-01		星际破坏神			0001-01-01	Miss
30000123	6	Book	0001-01-01		飘渺之旅			0001-01-01	Miss
30000124	7	Book	0001-01-01		诛仙			0001-01-01	Complete
30000125	4	Book	0001-01-01		尘缘			0001-01-01	Finished
30000126	6	Book	0001-01-01		天醒之路			0001-01-01	Current
30000127	6	Book	0001-01-01		汉末卫公子			0001-01-01	Complete
30000128	6	Book	0001-01-01		民国投机者			0001-01-01	Complete
30000129	6	Book	0001-01-01		回到明朝当王爷			0001-01-01	Complete
30000130	5	Book	0001-01-01		步步生莲			0001-01-01	Complete
30000131	4	Book	0001-01-01		锦衣夜行			0001-01-01	Finished
30000132	5	Book	0001-01-01		夜天子			0001-01-01	Complete
30000133	4	Book	0001-01-01		醉枕江山			0001-01-01	Finished
30000134	7	Book	0001-01-01	最合我口味的yy小说，写了多少年了啊。	赘婿			0001-01-01	Current
30000135	3	Book	0001-01-01		霸宋西门庆			0001-01-01	GiveUp
30000136	5	Book	0001-01-01		唐砖			0001-01-01	GiveUp
30000137	3	Book	0001-01-01		农夫三国			0001-01-01	GiveUp
30000138	6	Book	0001-01-01	不知道为什么喜欢了，这个好尴尬。	多情剑客无情剑			0001-01-01	Finished
30000139	4	Book	0001-01-01		绝代双骄			0001-01-01	Finished
30000140	5	Book	0001-01-01		楚留香传奇			0001-01-01	Finished
30000141	4	Book	0001-01-01		陆小凤传奇			0001-01-01	Finished
30000142	3	Book	0001-01-01		名剑风流			0001-01-01	Finished
30000143	6	Book	0001-01-01	飞雪连天射白鹿，笑书神侠倚碧鸳	天龙八部			0001-01-01	Finished
30000144	3	Book	0001-01-01		连城诀			0001-01-01	Finished
30000145	4	Book	0001-01-01		射雕英雄传			0001-01-01	Finished
30000146	4	Book	0001-01-01		鹿鼎记			0001-01-01	Finished
30000147	4	Book	0001-01-01		笑傲江湖			0001-01-01	Finished
30000148	4	Book	0001-01-01		神雕侠侣			0001-01-01	GiveUp
30000149	3	Book	0001-01-01		侠客行			0001-01-01	Finished
30000150	4	Book	0001-01-01		倚天屠龙记			0001-01-01	GiveUp
30000151	5	Book	0001-01-01		四大名捕			0001-01-01	GiveUp
30000152	4	Book	0001-01-01		大唐双龙传			0001-01-01	GiveUp
30000153	4	Book	0001-01-01		寻秦记			0001-01-01	GiveUp
30000154	4	Book	0001-01-01	完全忘记了，当初第二喜欢的小说吧。	空速星痕			0001-01-01	Finished
30000155	4	Book	0001-01-01		天魔神谭			0001-01-01	GiveUp
30000156	4	Book	0001-01-01		至尊无赖			0001-01-01	Finished
30000157	3	Book	0001-01-01		斗徒			0001-01-01	Finished
30000158	4	Book	0001-01-01	太小白了，太长了，第二次决定放弃了，不过总是还在想着。	斗破苍穹			0001-01-01	GiveUp
30000159	1	Book	0001-01-01	一直没看，大哥介绍的	贼之法师			0001-01-01	GiveUp
30000160	4	Book	0001-01-01	貌似是第一部追完的小说。	永夜君王			0001-01-01	Finished
30000161	6	Animation	0001-01-01		四叶游戏			0001-01-01	Complete
30000163	1	Animation	2019-07-15		BEM			0001-01-01	GiveUp
30000164	1	Animation	2019-07-14		COP CRAFT			0001-01-01	GiveUp
30000165	1	Animation	2019-10-13		Fate Grand Order			0001-01-01	Finished
30000166	1	Animation	2019-10-01		Fate/Apocraphy			0001-01-01	Finished
30000167	1	Animation	2019-10-22		Fate：绝对魔兽战线			0001-01-01	GiveUp
30000168	1	Animation	2019-10-08		Kokoro Connect			0001-01-01	Finished
30000169	1	Animation	2019-04-28		MIX			0001-01-01	Finished
30000170	1	Animation	2020-01-09		Re：从零开始的异世界生活			0001-01-01	OnProcess
30000171	1	Animation	2019-09-29		mix			0001-01-01	Finished
30000172	1	Animation	2019-11-03		らき☆すた			0001-01-01	Completed
30000173	1	Animation	2020-04-14		プリコネ			0001-01-01	Finished
30000174	1	Animation	2019-04-13		一拳超人			0001-01-01	Finished
30000175	1	Animation	2020-05-22		八男？别闹了！			0001-01-01	Finished
30000176	1	Animation	2019-04-28		关于我转生变成史莱姆这档事			0001-01-01	Finished
30000177	1	Animation	2020-03-21		凉宫春日的忧郁			0001-01-01	Completed
30000178	1	Animation	2019-05-06		刀使巫女			0001-01-01	Finished
30000179	1	Animation	2019-11-04		初夏			0001-01-01	GiveUp
30000180	1	Animation	2020-01-06		南家三姐妹			0001-01-01	Completed
30000181	1	Animation	2019-07-14		君主·埃尔梅罗二世事件簿 魔眼收集列车 Grace not			0001-01-01	Finished
30000182	1	Animation	2019-07-14		在地下城寻求邂逅是否搞错了什么 第二季			0001-01-01	GiveUp
30000183	1	Animation	2020-01-05		夏目友人帐			0001-01-01	Finished
30000184	1	Animation	2019-10-16		天才麻将少女			0001-01-01	Finished
30000185	1	Animation	2019-03-31		宅男腐女恋爱真难			0001-01-01	Finished
30000186	1	Animation	2019-07-15		实况主的逃脱游戏			0001-01-01	GiveUp
30000187	1	Animation	2019-11-04		干物妹			0001-01-01	Finished
30000188	1	Animation	2019-09-01		平凡职业造就最强			0001-01-01	Finished
30000189	1	Animation	2020-08-07		弩级战队H×EROS			0001-01-01	OnProcess
30000190	1	Animation	2019-05-06		心跳回忆OL			0001-01-01	Finished
30000191	1	Animation	2020-01-09		怕痛的我，把防御力点满就对了			0001-01-01	GiveUp
30000192	1	Animation	2019-04-27		我们无法一起学习			0001-01-01	Finished
30000193	1	Animation	2019-10-15		我，不是说了能力要平均值吗！			0001-01-01	Finished
30000194	1	Animation	2020-01-19		无限系统树			0001-01-01	GiveUp
30000195	1	Animation	2020-06-23		暗杀教室			0001-01-01	Finished
30000196	1	Animation	2020-01-11		某科学的超电磁炮			0001-01-01	Finished
30000197	1	Animation	2020-05-31		某魔法的禁书目录			0001-01-01	OnProcess
30000198	1	Animation	2019-07-13		柯南			0001-01-01	Finished
30000199	1	Animation	2020-05-30		柯南剧场版			0001-01-01	Finished
30000200	1	Animation	2019-11-04		武装炼金			0001-01-01	GiveUp
30000201	1	Animation	2020-07-31		死神			0001-01-01	LookBack
30000202	1	Animation	2019-10-30		氷菓			0001-01-01	Completed
30000203	1	Animation	2019-04-07		海贼王			0001-01-01	Finished
30000204	1	Animation	2019-04-06		火影忍者			0001-01-01	Finished
30000205	1	Animation	2019-10-12		爱书的下克上：为了成为图书管理员不择手段！			0001-01-01	Finished
30000206	1	Animation	2020-03-14		猎龙飞船			0001-01-01	Finished
30000207	1	Animation	2019-12-19		皇帝圣印战记			0001-01-01	Finished
30000208	1	Animation	2019-09-15		碧蓝幻想			0001-01-01	Complete
30000209	1	Animation	2019-10-12		碧蓝航线			0001-01-01	GiveUp
30000210	1	Animation	2019-04-27		贤者之孙			0001-01-01	Finished
30000211	1	Animation	2019-10-12		超人高中生们即使在异世界也能从容生存！			0001-01-01	Finished
30000212	1	Animation	2020-06-13		路人女主			0001-01-01	Finished
30000213	1	Animation	2020-04-14		转生乙女破灭flag			0001-01-01	Finished
30000214	1	Animation	2019-10-12		这个勇者明明超强却过分谨慎			0001-01-01	Finished
30000215	1	Animation	2019-07-14		重来吧，魔王大人！			0001-01-01	GiveUp
30000216	1	Animation	2019-10-28		重装武器			0001-01-01	Completed
30000217	1	Animation	2019-04-27		钻石王牌			0001-01-01	Finished
30000218	1	Animation	2020-01-15		问题儿童来自异世界			0001-01-01	Completed
30000219	1	Animation	2019-10-27		食戟之灵			0001-01-01	Finished
30000220	1	Animation	2019-09-28		高达seed			0001-01-01	Finished
30000221	1	Animation	2019-11-04		魂链			0001-01-01	Finished
30000222	1	Animation	2019-11-10		魔弹之王与战姬			0001-01-01	Completed
30000223	1	Animation	2020-06-08		黑子的篮球			0001-01-01	Finished
30000224	1	Animation	2019-09-21		Classroom☆Crisis			0001-01-01	Finished
30000225	1	Animation	2019-04-27		盾之勇者成名录			0001-01-01	Finished
30000227	1	Book	2019-11-05		因为我是开武器店的大叔			0001-01-01	GiveUp
30000226	5	Book	2019-04-25		Fate/Apocrypha			0001-01-01	Finished
30000229	1	Book	2019-08-13		大宋北斗司			0001-01-01	Finished
30000232	1	Book	2020-06-14		我能看见状态栏			0001-01-01	OnProcess
30000233	1	Book	2020-06-02		抗战之重生雪豹周卫国			0001-01-01	GiveUp
30000234	1	Book	2020-07-26		欢迎来到实力至上主义的教室			0001-01-01	GiveUp
30000235	1	Book	2019-07-11		民国往事			0001-01-01	GiveUp
30000236	1	Book	2019-12-08		爱书的下克上			0001-01-01	Finished
30000237	1	Book	2019-12-19		皇帝圣印战记			0001-01-01	Finished
30000238	1	Book	2020-06-22		禁区之门-地狱黑客			0001-01-01	Finished
30000239	1	Book	2019-03-18		纵兵夺鼎			0001-01-01	Finished
30000240	1	Book	2019-12-06		美女班的男助教			0001-01-01	Completed
30000241	1	Book	2019-11-21		谁与争锋			0001-01-01	Finished
30000242	1	Book	2019-09-24		钢壳都市雷吉欧斯-小说			0001-01-01	Finished
30000243	1	Book	2020-01-16		问题儿童来自异世界			0001-01-01	Finished
30000244	1	Book	2020-02-22		骑士&魔法			0001-01-01	Finished
30000245	1	Book	2020-01-17		魔弹之王与战姬			0001-01-01	Finished
30000246	1	Book	2020-06-24		龙王的女婿			0001-01-01	GiveUp
30000247	1	Game	2019-04-16		DNF			0001-01-01	Finished
30000248	1	Game	2020-06-08		Dota			0001-01-01	Finished
30000249	1	Game	2020-04-03		Johnny Trigger			0001-01-01	Finished
30000250	1	Game	2019-05-07		PS4-高达			0001-01-01	Finished
30000251	1	Game	2020-03-18		ShadowVerse			0001-01-01	Finished
30000253	1	Game	2020-07-11		刺客信条			0001-01-01	GiveUp
30000254	1	Game	2019-04-16		卧龙吟			0001-01-01	Finished
30000255	1	Game	2019-04-06		大话西游			0001-01-01	Finished
30000256	1	Game	2020-05-30		宙斯			0001-01-01	Finished
30000257	1	Game	2019-06-15		巫师3			0001-01-01	Finished
30000258	1	Game	2020-05-18		徐老师来巡山			0001-01-01	Finished
30000259	1	Game	2019-06-19		怪物猎人：世界			0001-01-01	Finished
30000260	1	Game	2019-06-09		暗黑2			0001-01-01	Finished
30000261	1	Game	2020-04-12		曹操传Mode-岳飞传			0001-01-01	Finished
30000262	1	Game	2019-05-11		梦塔防自走棋			0001-01-01	Finished
30000263	1	Game	2020-01-21		炎龙骑士团2			0001-01-01	Finished
30000264	1	Game	2019-09-01		英雄无敌3			0001-01-01	OnProcess
30000265	1	Game	2019-04-27		英雄联盟			0001-01-01	OnProcess
30000266	1	Game	2019-06-15		轮回之剑			0001-01-01	Finished
30000267	1	Game	2020-04-15		魔兽世界			0001-01-01	Finished
30000268	1	Game	2019-07-11		魔兽争霸3			0001-01-01	OnProcess
30000269	1	Game	2019-06-08		黑暗之魂3.DarkSoulsIII			0001-01-01	Finished
30000270	1	Movie	2020-04-03		Harry Potter			0001-01-01	Finished
30000271	1	Movie	2019-05-28		众神之锤			0001-01-01	Finished
30000272	1	Movie	2020-05-29		前任攻略			0001-01-01	Finished
30000273	1	Movie	2019-04-24		剪刀手			0001-01-01	Finished
30000274	1	Movie	2019-04-14		功夫熊猫			0001-01-01	Finished
30000275	1	Movie	2019-04-24		加勒比海盗			0001-01-01	Finished
30000276	1	Movie	2020-05-02		半路夫妻			0001-01-01	Finished
30000277	1	Movie	2019-06-08		卡萨布兰卡.Casablanca			0001-01-01	Completed
30000278	1	Movie	2020-08-07		只要平凡			0001-01-01	Finished
30000279	1	Movie	2020-05-21		周星驰			0001-01-01	Finished
30000280	1	Movie	2019-12-31		哪吒之魔童降世			0001-01-01	Finished
30000281	1	Movie	2020-05-25		天下无诈			0001-01-01	Finished
30000282	1	Movie	2020-05-09		天地粮人			0001-01-01	Finished
30000283	1	Movie	2019-04-04		宝贝老板			0001-01-01	Finished
30000284	1	Movie	2019-05-26		小鬼当家			0001-01-01	Finished
30000285	1	Movie	2019-05-28		少年斯派维的奇异旅行			0001-01-01	Finished
30000286	1	Movie	2020-05-02		我是特种兵			0001-01-01	Finished
30000287	1	Movie	2020-08-02		我爱男保姆			0001-01-01	OnProcess
30000288	1	Movie	2020-05-21		我的团长我的团			0001-01-01	Finished
30000289	1	Movie	2019-06-02		换子疑云.Changeling			0001-01-01	Finished
30000290	1	Movie	2019-05-17		权力的游戏			0001-01-01	Finished
30000291	1	Movie	2019-06-03		楚门的世界.The.Truman.Show			0001-01-01	Finished
30000292	1	Movie	2020-04-28		流浪地球			0001-01-01	Finished
30000293	1	Movie	2019-04-25		海底总动员			0001-01-01	Finished
30000294	1	Movie	2020-05-11		海棠依旧			0001-01-01	Finished
30000295	1	Movie	2019-09-14		游戏动画			0001-01-01	Finished
30000296	1	Movie	2020-05-06		火蓝刀锋			0001-01-01	Finished
30000297	1	Movie	2020-05-29		爱情保卫战			0001-01-01	GiveUp
30000298	1	Movie	2020-05-31		牧马城市			0001-01-01	Finished
30000299	1	Movie	2019-06-08		狮子王.The.Lion.King.SP			0001-01-01	Completed
30000300	1	Movie	2019-06-07		王者少年.The.Kid.Who.Would.Be.King			0001-01-01	GiveUp
30000301	1	Movie	2019-05-28		盗梦空间			0001-01-01	Finished
30000302	1	Movie	2019-06-02		终结者			0001-01-01	Finished
30000303	1	Movie	2019-06-02		绝命毒师			0001-01-01	Finished
30000304	1	Movie	2019-05-27		老友记			0001-01-01	Finished
30000305	1	Movie	2019-06-08		这个杀手不太冷.Leon.The.Professional			0001-01-01	Finished
30000306	1	Movie	2019-04-24		金刚			0001-01-01	Finished
30000307	1	Movie	2019-06-08		闪灵.The.Shining			0001-01-01	Completed
30000308	1	Movie	2020-05-20		非正式会议			0001-01-01	Finished
30000309	1	Movie	2020-05-17		饥饿站台			0001-01-01	Finished
30000310	1	Movie	2019-04-25		黑客帝国			0001-01-01	Finished
30000312	1	Game	2019-03-18		プリコネ			0001-01-01	OnProcess
30000313	1	Game	2019-03-23		三国群英传7			0001-01-01	Finished
30000231	7	Book	2020-06-25		我有一个恐怖屋			0001-01-01	OnProcess
30000230	3	41	2019-10-22		怪盗圣少女			0001-01-01	Finished
30000311	3	Book	2019-07-14		平凡职业造就世界最强			0001-01-01	Finished
30000314	1	Game	2019-09-15		碧蓝幻想			0001-01-01	Finished
30000315	1	Game	2019-07-14		英雄联盟-云顶之弈			0001-01-01	OnProcess
30000252	1	Game	2019-07-02		Sword.Art.Online.Fatal.Bullet	Dissonance.of.the.Nexus		0001-01-01	Finished
30000316	1	Project	2019-10-09		AWS			0001-01-01	Finished
30000317	1	Project	2019-11-03		Angular			0001-01-01	GiveUp
30000318	1	Project	2019-06-19		C# Basic			0001-01-01	Finished
30000319	1	Project	2019-04-06		DNF服务器			0001-01-01	Finished
30000320	1	Project	2019-03-18		Diary.exe			0001-01-01	Finished
30000321	1	Project	2020-06-24		Excel			0001-01-01	Finished
30000322	1	Project	2019-06-12		GitHub			0001-01-01	Finished
30000323	1	Project	2019-08-13		LOLZiZouQi.exe			0001-01-01	Finished
30000324	1	Project	2019-10-09		Mac OS			0001-01-01	Finished
30000325	1	Project	2019-10-05		MyNote			0001-01-01	OnProcess
30000326	1	Project	2020-08-02		PHP			0001-01-01	OnProcess
30000327	1	Project	2019-06-05		Photoshop			0001-01-01	Finished
30000328	1	Project	2019-09-15		Unity3D教学视频			0001-01-01	Finished
30000329	1	Project	2019-10-30		VPN连接专网			0001-01-01	GiveUp
30000330	1	Project	2019-11-15		WlyParser.exe			0001-01-01	Finished
30000331	1	Project	2019-12-27		XAML			0001-01-01	Finished
30000332	1	Project	2019-10-27		swift编程			0001-01-01	Finished
30000333	1	Project	2019-05-02		卧龙吟服务器			0001-01-01	Finished
30000334	1	Project	2020-06-10		微信小程序-LiteStore			0001-01-01	GiveUp
30000335	1	Project	2019-10-09		阿里云日服			0001-01-01	Finished
30000336	1	TSSummit	2020-03-24		DLine本番障害			0001-01-01	Finished
30000337	1	TSSummit	2020-06-01		ETF对应			0001-01-01	Finished
30000338	1	TSSummit	2020-01-27		EUC帳票改修			0001-01-01	Finished
30000339	1	TSSummit	2019-10-23		Import_MarginCall.exe			0001-01-01	Finished
30000340	1	TSSummit	2019-03-19		NSReporter			0001-01-01	Finished
30000341	1	TSSummit	2020-06-30		NSReporter新对应			0001-01-01	OnProcess
30000342	1	TSSummit	2020-01-21		OIS対応			0001-01-01	Finished
30000343	1	TSSummit	2019-11-21		SVRS程序重构			0001-01-01	Finished
30000344	1	TSSummit	2019-10-09		SWIFT电文			0001-01-01	Finished
30000345	1	TSSummit	2020-05-12		VBA工数计算工具			0001-01-01	Finished
30000346	1	TSSummit	2020-02-26		会议，勤务			0001-01-01	OnProcess
30000347	1	TSSummit	2020-02-03		席替え			0001-01-01	Finished
30000348	1	TSSummit	2019-12-03		悬案调查			0001-01-01	Regular
30000349	1	TSSummit	2020-07-09		时价导入			0001-01-01	Finished
30000350	1	TSSummit	2019-11-22		服务器管理			0001-01-01	Finished
30000351	1	TSSummit	2020-01-31		為替取引補完対応			0001-01-01	Finished
30000352	1	TSSummit	2020-05-26		自动Assign			0001-01-01	Finished
30000353	1	TSSummit	2020-04-23		自動NoAssign対応			0001-01-01	Finished
30000354	1	TSSummit	2019-10-15		貸金IF			0001-01-01	Finished
30000355	1	TSSummit	2019-12-20		账票更新Fba工具开发			0001-01-01	Finished
30000356	1	TSSummit	2020-04-13		金融大学			0001-01-01	Finished
30000357	1	TSSummit	2019-10-24		障害对应			0001-01-01	Finished
30000358	1	TSSummit	2019-10-15		電文取込対応			0001-01-01	Finished
30000359	1	Neso	2020-01-17		DXOClient			0001-01-01	Finished
30000360	1	Neso	2020-08-01		EB債クーポン計算			0001-01-01	OnProcess
30000361	1	Neso	2019-12-06		neso忘年会			0001-01-01	Finished
30000362	1	Neso	2019-10-02		公司拿钥匙			0001-01-01	Finished
30000363	1	Neso	2019-11-12		年末调整			0001-01-01	Finished
30000364	1	Social	2020-02-07		新型冠状病毒			0001-01-01	Finished
30000365	1	Social	2020-05-24		这就是中国			0001-01-01	GiveUp
30000366	1	Social	2020-06-02		黑人抗议			0001-01-01	Finished
30000367	1	Language	2019-05-26		A Song of Ice and Fire			0001-01-01	Finished
30000368	1	Language	2019-03-26		Aesop's Fables			0001-01-01	Finished
30000369	1	Language	2019-03-19		Grimm's fairy tales			0001-01-01	Finished
30000370	1	Language	2019-03-11		Harry Potter			0001-01-01	Finished
30000371	1	Language	2019-03-13		KoKo English			0001-01-01	Finished
30000372	1	Language	2019-03-18		O.Henry			0001-01-01	Finished
30000373	1	Language	2019-06-06		TOEIC 800			0001-01-01	Finished
30000374	1	Language	2019-03-19		The Arabian Nights			0001-01-01	Finished
30000375	1	Language	2020-06-22		TikTok			0001-01-01	Finished
30000376	1	Language	2019-03-11		Toeic			0001-01-01	Finished
30000377	1	Language	2019-08-13		哈利波特			0001-01-01	Finished
30000378	1	Language	2019-09-25		喜马拉雅-英语听力			0001-01-01	Finished
30000379	1	Language	2019-06-11		极光单词			0001-01-01	Regular
30000383	1	Note	2020-01-24		东京塔			0001-01-01	Finished
30000384	1	Note	2019-06-28		台湾旅游			0001-01-01	Finished
30000385	1	Note	2019-04-29		旅行-看海			0001-01-01	Finished
30000386	1	Note	2019-11-15		梦记录			0001-01-01	OnProcess
30000387	1	Note	2020-06-03		翻看日记			0001-01-01	OnProcess
30000388	1	Note	2019-09-25		逛中华街			0001-01-01	Finished
30000389	1	Note	2019-05-18		野外炊事			0001-01-01	Finished
30000390	1	Discipline	2019-06-18		Harvard Open Course : Positive Psychology			0001-01-01	LookBack
30000391	1	Discipline	2020-07-24		The Science of Well-Being			0001-01-01	OnProcess
30000392	1	Discipline	2019-03-31		ユース会			0001-01-01	Finished
30000393	1	Discipline	2019-11-09		巡回早起会			0001-01-01	Finished
30000394	1	Discipline	2019-06-23		座談会			0001-01-01	Finished
30000395	1	Discipline	2019-03-19		早起会			0001-01-01	Regular
30000396	1	Discipline	2019-09-25		早起会-大会			0001-01-01	Finished
30000381	1	联想	2019-09-27		幻兽传说			0001-01-01	Finished
30000382	1	勇者传说	2019-09-18		幻想_勇者召唤			0001-01-01	Finished
30000397	1	Discipline	2019-06-22		早起会原稿			0001-01-01	Finished
30000398	1	Discipline	2019-05-12		练成会			0001-01-01	Finished
30000399	1	Discipline	2019-07-18		课题原稿			0001-01-01	Finished
30000400	1	Discipline	2019-05-18		錬成			0001-01-01	Finished
30000401	1	Discipline	2019-12-01		青年の集い			0001-01-01	Finished
30000402	1	Discipline	2020-04-19		青年部Skype			0001-01-01	Regular
30000403	1	Exercise	2020-01-19		健身房			0001-01-01	GiveUp
30000404	1	Exercise	2020-01-22		旗手行進			0001-01-01	OnProcess
30000405	1	Exercise	2019-09-07		爬富士山			0001-01-01	Finished
30000406	1	Exercise	2019-05-25		瘦身腰带			0001-01-01	Finished
30000407	1	Exercise	2019-08-13		负重步行			0001-01-01	Finished
30000408	1	Exercise	2019-09-14		跑步			0001-01-01	Finished
30000409	1	Exercise	2019-11-09		骑车逛街			0001-01-01	Finished
30000410	1	Game	2020-08-15		三国志战略版			0001-01-01	OnProcess
30000411	1	Game	2020-08-18		三国志11			0001-01-01	OnProcess
30000412	1	TSSummit	2020-09-14	有难度，不知道怎么改	NSReporter本体			0001-01-01	OnProcess
30000413	1	Exercise	2020-09-22		Anytime Fitness			0001-01-01	OnProcess
30000414	1	Game	2020-10-07	跟郭志男聊，跟大哥聊，然后就下下来玩了	金庸群侠传			0001-01-01	OnProcess
30000415	1	Animation	2020-10-08		记录的地平线			0001-01-01	LookBack
30000416	1	Animation	2020-10-10		Tari Tari			0001-01-01	Complete
30000417	7	New Pages	2020-10-11	\N	圣剑传说			2015-07-11	Finished
30000418	1	Animation	2020-10-11		魔王学院的不合格者			0001-01-01	OnProcess
30000419	1	Language	2020-10-12		The Dresden Files			0001-01-01	OnProcess
30000420	1	Animation	2020-11-03	果然还是经典故事有深度令人遐想，大部分经典都是无法复制的，现在的动漫多半都是剩下的越发挖掘简单欲望的作品，只有简单模式才能在商界生存，毕竟可以量产	奇诺之旅			0001-01-01	Complete
30000423	1	Book	2020-12-13	PeterPan， A story of little sister’s dream land.	FairyTale			0001-01-01	OnProcess
30000425	1	Game	2020-12-16	好久没玩了，为了找一下正常的游戏感觉，通了一回，手生	拳皇97			0001-01-01	Finished
30000426	1	Book	2020-12-23		游戏民国			0001-01-01	GiveUp
30000427	1	Book	2020-12-28		唐朝好舅子			0001-01-01	OnProcess
30000428	1	Animation	2021-01-03		异世界的圣机师物语			0001-01-01	OnProcess
30000429	1	Game	2021-01-14		大航海时代4			0001-01-01	OnProcess
30000430	1	Animation	2021-01-22		好比是最终迷宫前的少年到新手村生活一般的故事			0001-01-01	OnProcess
30000431	1	Animation	2021-01-23		弱势角色友崎君			0001-01-01	OnProcess
30000432	1	Animation	2021-01-23		半妖的夜叉姬			0001-01-01	OnProcess
30000433	1	Animation	2021-01-23		魔术士欧菲流浪之旅			0001-01-01	OnProcess
30000434	1	Animation	2021-01-23		转生成蜘蛛又怎样！			0001-01-01	OnProcess
30000435	1	Animation	2021-01-24		この素晴らしい世界に祝福を！			0001-01-01	OnProcess
30000436	1	Animation	2021-01-24		俺だけ入れる隠しダンジョン			0001-01-01	OnProcess
30000437	1	Animation	2021-01-24		裏世界ピクニック			0001-01-01	OnProcess
30000438	1	Animation	2021-01-24		Dog Days			0001-01-01	Finished
30000439	1	Animation	2021-01-24	这种黑暗题材我不喜欢	回復術士のやり直し			0001-01-01	OnProcess
30000440	1	Animation	2021-01-24		遙かなる時空の中で～八葉抄～			0001-01-01	GiveUp
30000441	1	Animation	2021-01-24		哥布林杀手			0001-01-01	Complete
30000442	1	Animation	2021-01-24		魔法科高中的劣等生			0001-01-01	OnProcess
30000443	1	Animation	2021-01-25		トリニティセブン			0001-01-01	OnProcess
30000444	1	Animation	2021-01-25		神様になった日			0001-01-01	OnProcess
30000445	1	Animation	2021-01-26		王之逆袭:意志的继承者			0001-01-01	OnProcess
30000446	1	Animation	2021-01-28		苍之骑士团			0001-01-01	OnProcess
30000447	1	Animation	2021-01-28		五等分の花嫁			0001-01-01	OnProcess
30000448	1	Animation	2021-01-28		彼女、お借りします			0001-01-01	OnProcess
30000449	1	Animation	2021-01-29		長門有希ちゃんの消失			0001-01-01	OnProcess
30000450	1	Animation	2021-01-29		竹剑少女			0001-01-01	Complete
30000451	1	Animation	2021-01-29		風夏			0001-01-01	GiveUp
30000452	1	Animation	2021-01-30		キミと僕の最後の戦場、あるいは世界が始まる聖戦			0001-01-01	OnProcess
30000453	1	Animation	2021-01-30		我的妹妹不可能那么可爱			0001-01-01	Complete
30000454	1	Animation	2021-01-30		星掠者			0001-01-01	OnProcess
30000455	1	Animation	2021-01-31		彼得·格里尔的贤者时间			0001-01-01	OnProcess
30000456	1	Animation	2021-01-31	好老的动漫了，太久没看过了	SHUFFLE!			0001-01-01	OnProcess
30000457	1	Animation	2021-01-31		樱花庄的宠物女孩			0001-01-01	OnProcess
30000458	1	Animation	2021-01-31		伪恋			0001-01-01	OnProcess
30000459	1	Animation	2021-02-01		无职转生			0001-01-01	OnProcess
30000460	1	Game	2021-02-03		Fate Grand Order			0001-01-01	OnProcess
30000461	1	Project	2021-02-09	Virtual Bytes	typeperf.exe			0001-01-01	Finished
30000462	1	TSSummit	2021-02-09		cNS_IF_OracleEBS_TRN.exe			0001-01-01	OnProcess
30000463	1	Animation	2021-02-09	好难受，这个剧真的很折磨人，主角果然还是很不喜欢的，太扭曲了，没有凛来纠正，根本看不下去。	Fate/stay night [Heaven's Feel]			0001-01-01	OnProcess
30000464	1	Animation	2021-02-09		异世界狂想曲			0001-01-01	Finished
30000465	1	Animation	2021-02-10		buddy complex			0001-01-01	Complete
30000466	1	Animation	2021-02-10		纯洁的玛利亚			0001-01-01	Complete
30000422	1	Book	2020-12-06		关于邻家的天使大人			0001-01-01	GiveUp
30000467	1	TSSummit	2021-02-10		cNS_IF_OracleEBS_Account.exe			0001-01-01	OnProcess
30000468	1	Animation	2021-02-10		政宗			0001-01-01	Complete
30000469	1	Animation	2021-02-10		Working			0001-01-01	Complete
30000470	1	Animation	2021-02-10		群居姐妹			0001-01-01	Complete
30000471	1	Animation	2021-02-12		GATE自衛隊			0001-01-01	Finished
30000472	1	Animation	2021-02-12		異世界チート魔術師			0001-01-01	OnProcess
30000473	1	Book	2021-02-12		无职转生			0001-01-01	OnProcess
30000474	1	Book	2021-02-13		转生成蜘蛛又怎样！			0001-01-01	OnProcess
30000475	1	Book	2021-02-28		真の仲間じゃないと勇者のパーティーを追い出された			0001-01-01	OnProcess
30000476	1	Animation	2021-03-02		中二病でも恋がしたい！			0001-01-01	OnProcess
30000477	1	Animation	2021-03-03		うちの娘の為ならば			0001-01-01	OnProcess
30000478	1	Animation	2021-03-03		銃皇無尽のファフニール			0001-01-01	OnProcess
30000479	1	Animation	2021-03-03		初音岛2			0001-01-01	Finished
30000480	1	Animation	2021-03-04		玉子市场			0001-01-01	Finished
30000481	1	Animation	2021-03-05		秒速5厘米			0001-01-01	Complete
30000482	1	Animation	2021-03-05		白色相簿2			0001-01-01	Complete
30000483	1	TSSummit	2021-03-08		LineCounter.ps1			0001-01-01	GiveUp
30000484	4	Animation	2021-03-10	\N	银河冒险战记	ヴァンドレッド 			Finished
30000485	1	Animation	2021-03-10		骑士&魔法			0001-01-01	Finished
30000486	1	Book	2021-03-10		修真聊天群			0001-01-01	OnProcess
30000487	1	Book	2021-03-10		神秘让我强大			0001-01-01	OnProcess
30000488	1	Animation	2021-03-11		ShadowVerse			0001-01-01	Finished
30000489	1	Book	2021-03-12		恶魔奶爸			0001-01-01	OnProcess
30000490	1	Animation	2021-03-16		魔法使いの嫁			0001-01-01	OnProcess
30000491	1	Animation	2021-03-17		ダンジョンに出会いを求めるのは間違っているだろうか			0001-01-01	OnProcess
30000492	1	Book	2021-03-21		某魔法的禁书目录			0001-01-01	OnProcess
30000493	1	Communicate	2021-03-22	大哥发过来的老照片，果然已经过了好长的时间啊，还有，那个家庭已经破碎了。	老照片			0001-01-01	OnProcess
30000494	1	Book	2021-03-24		町人Aは悪役令嬢をどうしても救いたい			0001-01-01	OnProcess
30000495	1	Animation	2021-03-25		エロマンガ先生			0001-01-01	Finished
30000496	1	Book	2021-03-26		ループ7回目の悪役令嬢			0001-01-01	OnProcess
30000497	1	Animation	2021-03-26		今日の５の２			0001-01-01	Finished
30000498	1	Animation	2021-03-26		はたらく魔王さま！			0001-01-01	OnProcess
30000499	1	Exercise	2021-03-27		鍋割山			0001-01-01	Finished
30000500	1	Animation	2021-03-28		異能バトルは日常系のなかで			0001-01-01	Finished
30000501	1	Book	2021-03-29		我的治愈系游戏			0001-01-01	Finished
30000502	1	Game	2021-03-29		金山游戏			0001-01-01	Finished
30000503	1	Animation	2021-04-02		刀剑神域			0001-01-01	Finished
30000504	1	Animation	2021-04-02		棺姫のチャイカ			0001-01-01	OnProcess
30000505	1	Animation	2021-04-03		神之塔			0001-01-01	OnProcess
30000506	1	Animation	2021-04-03		守护甜心			0001-01-01	GiveUp
30000507	1	Animation	2021-04-03		蒼の彼方のフォーリズム			0001-01-01	OnProcess
30000508	1	Book	2021-04-04		CheatingEngine			0001-01-01	Finished
30000509	1	Animation	2021-04-04		七星のスバル			0001-01-01	OnProcess
30000510	1	Animation	2021-04-04		蜂蜜与四叶草			0001-01-01	Complete
30000511	1	Animation	2021-04-04		エスカ&ロジーのアトリエ			0001-01-01	OnProcess
30000512	1	TSSummit	2021-04-05	这次才是真正的全面开始了解NSR机制，可是好像很难受，还没开始做事就难受，而随便把程序拷过去就能编译和使用，好像又不需要动了	NSML			0001-01-01	OnProcess
30000513	1	Animation	2021-04-05		無彩限のファントム・ワールド			0001-01-01	OnProcess
30000514	1	Animation	2021-04-05		罗德岛战记			0001-01-01	GiveUp
30000515	1	Animation	2021-04-06		魔法少女伊莉雅			0001-01-01	Finished
30000516	1	Animation	2021-04-08		クオリディア・コード			0001-01-01	OnProcess
30000517	1	Animation	2021-04-08		天使の3P！			0001-01-01	Finished
30000518	1	Animation	2021-04-08		灰与幻想的格林姆迦尔			0001-01-01	Finished
30000519	1	Book	2021-04-08		灰与幻想的格林姆迦尔			0001-01-01	OnProcess
30000520	1	Game	2021-04-10		CheatingEngine			0001-01-01	Finished
30000522	1	Animation	2021-04-15		異世界魔王と召喚少女の奴隷魔術			0001-01-01	OnProcess
30000523	1	Animation	2021-04-20		轻音少女			0001-01-01	OnProcess
30000525	1	Animation	2021-04-26		あかね色に染まる坂			0001-01-01	Finished
30000526	1	Note	2021-04-27	project note restart.	note			0001-01-01	OnProcess
30000527	1	Project	2021-04-28		note			0001-01-01	OnProcess
30000528	1	Animation	2021-04-30		あっちこっち			0001-01-01	Finished
30000529	4	Animation	2021-04-30	\N	あの日見た花の名前を僕達はまだ知らない。				Finished
30000531	1	Note	2021-05-01	海湾战争和改革开放	那兔			0001-01-01	OnProcess
30000530	3	Animation	2021-05-01		罗小黑战记			0001-01-01	Finished
30000524	2	Animation	2021-04-26		星舰领航员			0001-01-01	Finished
30000162	3	Animation	2019-10-12		Assasin’s Pride			0001-01-01	Finished
30000532	1	Animation	2021-05-02		吞噬星空			0001-01-01	OnProcess
30000533	1	Book	2021-05-02		我的贴身校花			0001-01-01	OnProcess
30000534	1	Animation	2021-05-02		口水三国			0001-01-01	Finished
30000535	1	Book	2021-05-04		万族之劫			0001-01-01	OnProcess
30000536	1	Book	2021-05-04		魔临			0001-01-01	OnProcess
30000537	1	Book	2021-05-07		大唐捉妖师			0001-01-01	OnProcess
30000228	6	Book	2019-04-27		埃尔梅罗二世事件簿			0001-01-01	Finished
30000421	3	Book	2020-11-28		超人高中生们即使在异世界也能从容生存！			0001-01-01	OnProcess
30000540	1	Animation	2021-05-11		我家大师兄脑子有坑			0001-01-01	OnProcess
30000541	1	Animation	2021-05-12		山河剑心			0001-01-01	OnProcess
30000542	1	Book	2021-05-13		我真的长生不老			0001-01-01	OnProcess
30000543	5	勇者传说	2021-05-26		勇者传说			0001-01-01	OnProcess
30000538	4	行动	2019-01-01	\N	梦记录			2019-01-01	Finished
30000539	1	丢弃	2021-05-09		梦记录			0001-01-01	Finished
30000380	1	勇者传说	2019-09-21		勇者召唤之风骑士			0001-01-01	Finished
30000544	1	Movie	2021-05-29		猫和老鼠			0001-01-01	Finished
30000545	1	Animation	2021-05-29		龍ヶ嬢七々々の埋蔵金			0001-01-01	OnProcess
30000546	4	行动	2021-05-29		幻想			0001-01-01	OnProcess
30000547	7	旅者之歌	2021-05-30	录入	旅者之歌			0001-01-01	OnProcess
30000521	7	城市恋曲	2021-04-11		城市恋曲	The Love Song of City		0001-01-01	OnProcess
30000550	5	旅者之歌	2021-05-30		旅者之歌战记：圣战诗篇			0001-01-01	OnProcess
30000548	5	旅者之歌	2021-05-30		旅者之歌前传：冥月之心			0001-01-01	OnProcess
30000549	5	旅者之歌	2021-05-30		旅者之歌后记：双龙之戒			0001-01-01	OnProcess
30000424	6	新篇	2020-12-13	他被日本俘虏后，反手击溃整个中国防线，给自己学生们的信息，是从不会说出口的，你们所有人加起来都打不过我一个人。	民国参谋			0001-01-01	Finished
30000551	5	宇宙音符	2021-05-30		宇宙音符			0001-01-01	Finished
30000552	6	魔法旋律	2021-05-30		魔法旋律			0001-01-01	OnProcess
30000553	1	魔法旋律	2021-05-30		圣杯——暗与影的徘徊			0001-01-01	Finished
30000554	1	魔法旋律	2021-05-31		圣杯——纷乱的旋律			0001-01-01	OnProcess
\.


--
-- Data for Name: collection_item; Type: TABLE DATA; Schema: public; Owner: xiao
--

COPY public.collection_item (id, index, input_date, memo, name, name2, name3, type, update_date, parent_id) FROM stdin;
31000001	1	2019-10-20	最も好きなキャラの一人。優しい、切ない。	白川小鳥	白川小鳥	白川小鳥	Character	2019-10-20	30000001
31000002	2	2019-10-20	隠れる恋。	鹭泽美咲	Sagisawa Misaki	さぎさわ みさき	Character	2019-10-20	30000001
31000003	1	2019-10-23	红颜知己	草壁優季	佐藤利奈		Character	2019-10-23	30000002
31000004	1	2019-10-23	或许是我想成为，但永远也成不了的形象。	流川枫	绿川光		Character	2019-10-23	30000003
31000005	0	2019-10-26		音山光太	Otoyama Kouta	音山光太	Character	2019-10-26	30000020
31000006	0	2019-10-26		邦枝葵	Kunieda Aoi		Character	2019-10-26	30000027
31000007	0	2019-10-26		灰原哀	Haibara Ai		Character	2019-10-26	30000031
31000008	0	2019-10-26		美甘千津子	Chizuko Mikamo	美甘千津子	Character	2019-10-26	30000035
31000009	0	2019-10-26		遠坂凛	Tousaka Rin	远坂凛	Character	2019-10-26	30000037
31000010	1	2019-10-26		Saber	アルトリア・ペンドラゴン	阿尔托莉雅·潘德拉贡	Character	2019-10-26	30000037
31000011	0	2019-10-26		韦伯·维尔维特	ウェイバー・ベルベット	ロード・エルメロイⅡ世	Character	2019-10-26	30000038
31000012	0	2019-10-26		考列斯·弗尔维吉			Character	2019-10-26	30000039
31000013	0	2019-10-26		\n八神和麻			Character	2019-10-26	30000050
31000014	0	2019-10-26		御坂美琴		御坂美琴	Character	2019-10-26	30000052
31000015	0	2019-10-27	滝川茜/月島若葉	滝川茜			Character	2019-10-27	30000161
31000016	0	2020-08-09	故事情节挺好的	里见莲太郎			Character	2020-08-09	30000075
31000017	0	2020-08-09	CV: 茅原实里	长门有希			Character	2020-08-09	30000177
31000018	0	2020-08-09	背负痛苦的人，走的路才叫人生。	张小凡			Character	2020-08-09	30000124
31000019	0	2020-08-09	基本算是心那一系的角色，或者其实更应该是莲吧	陆雪琪			Character	2020-08-09	30000124
31000020	0	2020-08-09	笑面恐惧	奥兹·贝萨流斯			Character	2020-08-09	30000055
31000022	0	2021-01-15	大航海时代4威力加强版原产物一共20种，除了鲨鱼幼苗可bai以多次获取外，其他19种只能用一次，一次游戏中没机会得到第二个。持有原产物时你进入特定港口的交易所，交易所老板会问你索要原产物，同意给他后该港口就会出现特定的商品（注意有发展度的要求，符合发展度标准后才会出现特定商品）。\r\n\r\n1.鲨鱼幼苗。最特殊的原产物，特定船员在主舰队，杀死鲨鱼后取得，唯一可以多次取得的原产物,最多可在4个城市均产生特产品（前面出现的是城市，括号里面是出现的产品和发展度要求）。\r\n\r\n伊斯坦堡（鱼子酱，4500）、泉州（鱼翅，2000）、泗水（鱼翅，500）、马纳多（鱼翅，1000）\r\n\r\n\r\n只有一个城市能产生特产品的原产物有3种：\r\n\r\n2.中医宝典。杭州（冬虫夏草，3600）\r\n\r\n3.肉桂树。贝鲁特（肉桂，1900）\r\n\r\n4.可可果。圣乔治（可可，1900）\r\n\r\n\r\n有两个城市能产生特产品的原产物有3种（只能选择其中一个城市使用原产物）：\r\n\r\n5.甜椒果。特鲁西优（甜椒，550）、蒙巴萨（甜椒，700）\r\n\r\n6.炼金术书。卢安达（白金，200）、索法拉（白金，2100） \r\n\r\n7.玻璃的制作词典。莫三比克（玻璃，1200）、长崎（玻璃，3000）\r\n\r\n\r\n有三个城市能产生特产品的原产物有4种（只能选择其中一个城市使用原产物）：\r\n\r\n8.南瓜种子。汉堡（南瓜，3200）、澳门（南瓜，3000）、雷利史塔特（南瓜，3000）\r\n\r\n*雷利史塔特是丽璐剧情里才能建设的新港口，其他6位主角没有这个港口\r\n\r\n9.茶树。摩加迪休（茶，1000）、加尔各答（茶，2000）、阿布哈兹（茶，1500）\r\n\r\n*阿布哈兹是赫德拉姆剧情里才能建设的新港口，其他6位主角没有这个港口\r\n\r\n10.珍珠贝。泉州（珍珠，2800）、大阪（珍珠，3000）、马拉开波（珍珠，800）\r\n\r\n11.山竹果种子。麻六甲（山竹果，3000）、文莱（山竹果，500）、汉杰鲁马辰（山竹果，500）\r\n\r\n\r\n有四个城市能产生特产品的原产物有5种（只能选择其中一个城市使用原产物）：\r\n\r\n12.番茄苗。雅典（蕃茄，2000）、克里特（蕃茄，1600）、拉古扎（蕃茄，1500）、拉斯帕马斯（蕃茄，500）\r\n\r\n13.蜜蜂窝。塞尔维亚（蜂蜜，4500）、马赛（蜂蜜，2500）、阿布哈兹（蜡，3500）、班加西（蜂蜜，2000）\r\n\r\n*阿布哈兹是赫德拉姆剧情里才能建设的新港口，其他6位主角没有这个港口。\r\n\r\n*班加西是蒂雅剧情里才能建设的新港口，其他6位主角没有这个港口。\r\n\r\n14.胡椒粒。亚力山卓（胡椒，4000）、文莱（胡椒，500）、马尼拉（胡椒，200）、安勃那（胡椒，2400）\r\n\r\n15.丁香粒。伊斯坦堡（丁香，5000）、文莱（丁香，500）、马尼拉（丁香，200）、德尔纳特（丁香，2600）\r\n\r\n16.蚕。热那亚（丝绸，3800）、澳门（丝绸，2400）、大阪（丝绸，2500）、淡水（丝绸，3000）\r\n\r\n*淡水是李华梅和蒂雅剧情里才能建设的新港口，其他5位主角没有这个港口。\r\n\r\n\r\n有六个城市能产生特产品的原产物有1种（只能选择其中一个城市使用原产物）：\r\n\r\n17.香蕉树。绿角（香蕉，250）、开普敦（香蕉，150）、那霸（香蕉，1250）、圣约翰（香蕉，600）、波多韦罗（香蕉，100）、淡水（香蕉，500）\r\n\r\n*淡水是李华梅和蒂雅剧情里才能建设的新港口，其他5位主角没有这个港口。\r\n\r\n\r\n有七个城市能产生特产品的原产物有2种（只能选择其中一个城市使用原产物）：\r\n\r\n18.烟草苗。克里特（烟草，1600）、塞普勒斯（烟草，1200）、拉古扎（烟草，1500）、贝鲁特（烟草，1900）、索法拉（烟草，2100）、朋沙科拉（烟草，3000）、阿布哈兹（烟草，2500）\r\n\r\n*朋沙科拉是拉斐尔剧情里才有的港口，其他6位主角没有这个港口。\r\n\r\n*阿布哈兹是赫德拉姆剧情里才能建设的新港口，其他6位主角没有这个港口。\r\n\r\n19.织布机。布利斯特（毛织品，1500）、瓦伦西亚（毛织品，1600）、热那亚（丝织品，4000）、的黎波里（棉织品，1600）、突尼斯（麻织品，2000）、淡水（棉织品，2500）、雷利史塔特（丝织品，4000）\r\n\r\n*淡水是李华梅和蒂雅剧情里才能建设的新港口，其他5位主角没有这个港口。\r\n\r\n*雷利史塔特是丽璐剧情里才能建设的新港口，其他6位主角没有这个港口。\r\n\r\n\r\n有九个城市能产生特产品的原产物有1种（只能选择其中一个城市使用原产物）：\r\n\r\n20.咖啡树。圣乔治（咖啡，1900）、卢安达（咖啡，300）、巴邻旁（咖啡，2200）、哈瓦那（咖啡，800）、圣约翰（咖啡，500）、牙买加（咖啡，500）、马拉开波（咖啡，500）伯南布哥（咖啡，150）、阿镇（咖啡，1000）	原产物				2021-01-15	30000429
31000023	0	2021-03-02		銀古			Character	2021-03-02	30000061
31000024	1	2021-03-02		淡幽			Character	2021-03-02	30000061
31000030	0	2021-05-26	多人一起穿越，班长带领大部队开阔领地，成为一方势力，边境伯爵。一些人脱队干起自己的事业，主角则是个游商，给大部队筹措物资。\r\n作为一个有战斗加护的商人，遇到黑吃黑什么的还是能应付的，但是面对各国军队的威胁，大部分时候还是没有什么办法。\r\n几次遇险后，同学中盗贼（忍者）职业的女生开始帮助他，探索情报和充当护卫。\r\n两个人就在各种或和平或危险的地域旅行，偶尔也管一管见到的不平事。反正作为第二人生，他们没有必须履行的责任，轻松愉快的活下去就行。\r\n然而随着时间流逝，长期缺乏交流的主角与团长之间产生了大的隔阂。因为背后力量的强大，他在各国备受尊重，而事情在开阔团里传开后，有人也开始嫉妒起来。\r\n在一次去某国采购未回之前，团长没有征询主角的意见就又组织了一队人去访问还未有交流的国度。主角回来的第一件事就是组织人去营救先走的一团，在这个世界生活了好几年后他仍然没有去走访的国家，当然是因为那里过于危险。\r\n主角等人带着准备好礼物与介绍信紧赶慢赶地来到这个国家，就发现先走的一行人已经被打伤打残关进了监牢。其中一个机灵些的躲过了追捕与主角等人汇合，告知了他们的遭遇。\r\n主角等人随后找到能够交流的人，然后通过生死竞技场的拼杀，救下了原本要作为斗士上场和奴隶发卖的同伴。随后又是一场艰难地逃亡，总算在主角与忍者女孩以自身为饵的情况下掩护其他人撤离了。\r\n同时两人也被对他们有兴趣的帝国贵族所捕获。\r\n随后的遭遇就真的是走向相悖的极端了，主角作为帝国贵族的客卿开始活跃，然而又必须对各种看不惯的事情闭上眼睛，只能说在自己力所能及的范围内帮助一下无力的孩子们。\r\n而团长经过那次失败，更急于挽回名誉，不顾女友副官的劝阻向高等魔族领地出手了。经过一番激战，作为勇者的团长总算击杀了魔族。收获战果的团长正式被王国封为边境伯爵，然而因为魔族领主的死以及他勇者之名的传开，一行人找到了最强敌人的袭击。魔王及其手下突袭了开阔团的营地，团长让副官带着女孩子们撤离，然后奋起迎战，却被魔王彻底击败。最后在生死的逼迫下向魔王投降，被带到了魔族领地。\r\n而魔王本想一并收服逃掉的女眷以及主角一行，却不料在潜入帝国都城时被主角发现，主角在精心埋伏却仍然挡不住魔王后立刻逃走了，临走只是的对话让魔王也为之惊讶，承认这个重新被赋予了勇者称号的人会是自己最大的对手。\r\n就这样一起被传送过来的全班30人，大致分成了四块。独自离队下落不明的5人，结伴成为冒险者去旅行的4人，主角2人加上逃过来的女孩6人。团长带领下投降魔王的13人。	勇者队伍的行商			Paragraph	2021-05-26	30000543
31000021	101	2020-10-11	    “啊，不要！”\r\n    悲鸣传自森林深处，那是离开团队试图独自一人穿越试炼之森回到初始村庄的女玩家小小铃铛发出的。\r\n    眼前的怪物，包围她的十数只哥布林并非不可战胜的，但是此时精神被恐惧所占据的铃铛已经完全无法动弹，更不用说对抗眼前比平时击杀的怪物强数倍的敌人了。看着自己的血条由安全的黄色转到从未看到过的红色时，恐惧更加倍增，不由自主的发出悲鸣。以前所有的对游戏的一点自信被击得粉碎，自己最终还是会在一事无成的情况下结束人生吗。\r\n    小小铃铛的恐惧是理所当然的，因为在这个叫做《崛起》的虚拟实境网络游戏中，游戏角色的死亡意味着现实世界中的一个生命的结束，他们是被关在这个游戏中的五千人的幸存者。其中的大部分人都或多或少感觉到了，或许会有大半的人会在游戏通关之前因为各种原因死去吧。而铃铛或许也将成为其中的一员了。\r\n    然而，向铃铛挥下的狼牙棒被剑光斩断，一个迅捷的身影挡在了铃铛面前。铃铛从未见过拥有如此神速的剑士，然而更让她惊讶的是，剑士守护在她身前一步不动，仅靠突刺的剑风和斩击的剑气就将眼前的十数只哥布林化作了数码碎片。\r\n    剑士转过头来时，铃铛还没能反应过来，以为她被吓傻了的剑士只好伸出手来。\r\n    “总之，先离开这里吧，快天黑了。”\r\n    剑士左手牵着铃铛，右手握剑随手清理了挡道的野怪。然而铃铛却从如此强大的剑士的手上感觉到一丝颤抖，连一向迟钝的铃铛都立刻明白了眼前的男孩不太会和女孩子相处。剑士或许怕她又感到害怕，所以不敢放开手，而现在的铃铛也有些不愿意主动放开，眼前的剑士大概是被关在游戏半年以来，给一直带着恐惧活着的她最大安心感的人。即便他的肩膀并不很宽，模样甚至稍显俊俏。\r\n\r\n    两人走出试炼之森拐上回安可村的大道时，天已经黑了，于是就扎好帐篷准备露营了。在篝火堆边，两人的对话才真正开始。\r\n    “谢谢你，救了我。我叫小小铃铛，叫我铃铛就好了。”\r\n    “恩，我叫孤星，孤星点点。”\r\n    孤星只是简单的回应了一下，就找不到话说了。\r\n    “真的很谢谢你，孤星大哥，如果没有你在，我恐怕早就⋯⋯”\r\n    现在想来也还很后怕，毕竟事关本人的性命。\r\n    “恩，其实你冷静一点，就算打不过也是能逃掉的。”\r\n    “呃，实在抱歉。当时已经吓得慌了手脚，以前也是这么笨手笨脚，本以为在游戏里还好些，没想到还是那么不中用。”\r\n    “这也是没办法的事，毕竟这个游戏太危险了。不过以后记得别一个人穿越试炼之森，这个区域比较特别，是根据队伍中等级最低的队员刷怪的，所以跟着高等级玩家或低等级玩家一起走都很安全，相反一个人走特别危险。”\r\n    “是吗，我都不知道。”\r\n    “⋯⋯⋯⋯”\r\n    孤星沉默了半响，还是补充道。\r\n    “进出试炼之森的牌子上都注明着的，以后做事记得看说明。很多说明都是前边开荒成员留下的宝贵经验。”\r\n    “我知道了，孤星大哥。”\r\n    “你怎么会一个人在试炼之森里走？”\r\n    “嗯⋯⋯之前加入的公会会长性格不好，一气之下在打怪途中就离开了。原本还因为终于说出了自己的想法而沾沾自喜来着，没想却差点害死自己了，果然不该做自己不习惯的事吗？”\r\n    说到这里，铃铛突然想到，眼前同样只有十几岁的少年孤星，大概也是个不会跟人相处的人。如果他不做救人、照顾人这种不习惯的事，那么自己或许就不在这里了吧。\r\n    \r\n    帐篷也有保护人睡眠的作用，玩家的一般手段是无法摧毁的，其他人进入时也会对睡眠中的人发出警示。此时睡下的孤星正想着今天救下的少女的事情，对方却已经钻进了他的帐篷。\r\n    孤星还是一身简单的剑士装备，铃铛却已经换了一身轻柔的睡衣，抱着枕头，带着些羞涩的她一反往常的大胆请求睡在才认识一天的男孩子旁边。经历过一番生死，或许人总有些改变吧。\r\n    孤星看着铃铛羞涩的脸和睡衣领口露出的锁骨，原本一直没有表情的脸上也显出些红潮，不由自主的移开了视线。然而他或许是比铃铛更不会拒绝人的类型吧，不希望才经历生死的少女心中的不安扩大，向旁边让开了一个身位。\r\n    这个夜晚，是铃铛来到这个世界半年以来最轻松的一个晚上，孤星是个很好的听众，听着她聊起来到这个死亡游戏后的不安，所遇到的各种各样的人，想要改变的自己的弱点，甚至是很多人都不愿意提及的现实世界的种种。笨手笨脚又不懂拒绝的性格、格外照顾自己的大富豪家的表姐、对游戏的小小的自信和父母的不理解。\r\n    铃铛都不知道自己是什么时候睡着的，孤星大概睡得比自己更晚，却又在第二天将她唤醒。铃铛抬头睁开眼时，就看到侧过身来轻声唤着自己的孤星，两人的鼻尖几乎碰到一起了。被吓醒过来的铃铛，大叫一声冲出了帐篷。在自己的帐篷里整理的铃铛知道，睡觉的时候孤星没有动弹，反倒是自己差点靠到他的怀里去了。又想到昨晚的种种，一直到整理完出帐篷时，铃铛脸上的红潮也完全没有褪去。\r\n    \r\n    “我们这是去哪里啊，孤星大哥？”\r\n    “你昨天不是说不想再回以前的公会了吗，带你去我认识的公会看看吧。”\r\n    “哦。”\r\n    铃铛的声音里，稍微有些遗憾。察觉到了的孤星摸了摸头，不好意思的说。\r\n    “对不起，我实在不太会照顾人，而且为了早点通关这个游戏，也需要出入一些危险的地方，不能带着你去的。”\r\n    “不是的，孤星大哥又没有错，我只是，只是，你说的那个公会会收我这样不怎么厉害的人吗？”\r\n    不知道说什么的铃铛只好转换话题。\r\n    “放心吧，都是些很有意思也很好心的人。而且大部分公会都有些后援人员的，你的等级又不低，当主力也是可能的。”\r\n    两人穿过安可村的前段，走过在进入这个游戏的初战中被焚毁的街道，来到了发展得最快最好的公会聚集区。孤星和铃铛在一个稍带点汉族古典风格的建筑前停下，门正开着，突然从里边传出一个愤怒的声音。\r\n    “你先给我滚出去！”\r\n    然后是一个身影直飞出来，砸扁在对面相似建筑的门上。\r\n    铃铛被这场景吓了一跳，正奇怪到底什么人有这样的怪力，对方已经走出来了。那是一位\r\n让人惊艳的女子，丰满的身材、带着野性的装束以及奇特的猫耳和尾巴，让铃铛立刻想起进入游戏前收集过的资料，原本敏捷极高、力量偏弱的猫人族中极少会出现的拥有怪力的狮王般的存在。\r\n    “花姐。”\r\n    孤星无视了刚才飞出来的男子，自然的上前打招呼。\r\n    “哦，小星啊，难得见你在村里出现。怎么，又有事要姐姐帮忙啊？”\r\n    被叫做花姐的女子笑呵呵的回应，跟刚才怒气冲冲走出来的时候判若两人。她的眼神扫过旁边的铃铛，一副了然于胸的模样。\r\n    “嗯，这个，这个女孩没地方去了，我想你们公会会不会想招人什么的？如果不行我就去找别人。”\r\n    被一脸笑意的花姐看着的孤星好不容易憋出两句话来，一旁的铃铛的直觉告诉她，或许孤星不擅长跟异性相处就是拜这位大姐所赐。\r\n    “小星救下来的人姐姐我哪次没有收下的？到现在还说这么见外的话，你可真是⋯⋯”\r\n    “啊，凌哥又做什么让花姐生气了？”\r\n    预感到又要被长时间说教的孤星赶紧转换话题。\r\n    “他呀，好不容易有一天休息不用去打怪练级，他又到我面前唠叨个没完，说的话还，还那么肉麻，实在受不了了。”\r\n    “凌哥也是真心喜欢花姐嘛，我长这么大还是第一次见到这么主动这么直白的人呢。”\r\n    “那也得顾及下别人的感受啊，唉，他要有连云或者你一成的细心，就不会这么粘人了。算了，凌风，过来。”\r\n    花姐向前喊了一声，原本在自家门前做被砸扁状的凌风立即回复过来，转瞬间就到了花姐身前，正准备开口花花时被花姐眼睛一瞪，立即恢复正经，转头向孤星和铃铛看过来。\r\n    “你好，我叫繁花似锦，是“花都”公会的会长，欢迎你加入我们公会。这个是对面公会，‘风云’公会的会长凌风，性格虽然有点儿问题，人还算不坏。”\r\n    “花姐您好，我叫小小铃铛，您叫我铃铛就行了。请多关照。”\r\n    铃铛跟看起来挺强势也挺可靠的繁花似锦说话有些紧张，花姐宽慰她。\r\n    “不用那么紧张，同是天涯沦落人，在这个死亡游戏里相遇也是缘分，大家互相帮助着共度难关吧。”\r\n    “哇，孤星你又捡到一位漂亮的小女孩啊，为什么你总有这样的好运啊。一会儿记得告诉我地方，我也去试试⋯⋯啊⋯⋯”\r\n    说胡话的人又一次遭了毒手。\r\n    孤星在将铃铛带进花都以后，很快就离开了。明明走的时候还说会回来看她的，心情失落的铃铛却没能等到他的来访，再次相遇，已经是一个月后的事情了。\r\n\r\n\r\n\t------------\r\n\r\n\r\n    铃铛没有等到孤星，却从花都和风云两个公会的同伴那里获得了关心、帮助和挑战未来的勇气、经验。原本等级就不比一线玩家低多少的她在花姐的带领下进入了最前线的战场。\r\n    《崛起》这个游戏所讲述的是被神秘力量庇佑的安可村人奋起反抗帝国压迫最终创建新的时代的故事。进入游戏的五千玩家全是安可村人，故事的第一章就是帝国肃清部队袭击安可村，将村庄几乎焚毁殆尽的情节。\r\n    然而，当游戏设计者同时也是虚拟实境网络技术开发者的林煜突然发表死亡游戏的宣言，将五千玩家困在了游戏当中无法退出时，整个世界就完全不一样了。原本带着挑战故事，体验游戏而来的玩家们，一开始就直面生死，必须在与肃清部队的争斗中生存下来。而且必须真的完成战胜帝国的目标，才能回到原本的世界中去。\r\n    原本抱着等待外界援救想法而足不出村的玩家们，也在近半年的时间里认清了现状，如同林煜所说的一样，从外破解游戏无法指望，因为一旦失误就会直接葬送这五千人的性命。\r\n    更有甚者，即便不出村，玩家也会遇到危险。在第二章节目标“攻陷附近的贵族城镇银赫镇”达成之前，银赫镇会每个月派遣一只讨伐队攻击安可村，并且讨伐队会越来越强。经过了三个月的适应和磨合之后，玩家们终于达成一致意见，由大规模公会“希望”和“狂战士”牵头和指挥，攻陷了银赫镇。\r\n    而如今，在第六个月末，玩家们终于触发了第三章节的最终任务，“扫清银赫镇周围的帝国势力，巩固防线，以应对帝国的全力镇压。”\r\n    这个任务的难点在于，所需要攻略的地点有三处，原本集中所有精锐进行的攻略战行不通了，必须有三个足够威望的公会带领着分别击败三个势力。狂战士公会带领精英们强攻银赫镇前唯一的军事防御费雷要塞，强攻虽然需要人数，但考虑到不能有伤亡，只好全部派遣精英。希望公会则带领大量人手剿灭在各村、各镇以及矿场、林地间巡逻或流窜的帝国武装，虽然敌人大多不算强大，但统筹和指挥需要更高的威望和指挥能力，整个游戏里，或许也只有希望公会的会长亚里斯最有资格。\r\n    而风云和花都两个公会的联合体作为剩下的公会中最有能力和责任心的一个团体，独立接下了第三个讨伐任务，对血红骑士团的讨伐。铃铛，作为拥有出色辅助能力和少量输出的精灵使，也参与到了这个任务中来。\r\n    血红骑士团是银赫镇附近帝国一直未启用的一支力量，隶属教皇的断罪者。虽然现今的教会和帝国统帅都不愿启用这股会引起腥风血雨的力量，但作为起义军的玩家方也不敢任由这股敌对势力留存在自己背后。\r\n\r\n    “风之加护！”\r\n    铃铛给前卫的繁花似锦施加上加速的魔法，繁花原本就拥有怪力的双拳变得更加迅捷有力。即便是等级相对较高的血红骑士团的卫兵也能够一拳轰飞或者一击致命。\r\n    “土灵再生！”\r\n    繁花在前方开路的同时，铃铛又给旁边负责招架敌人攻击的盾战士附加了土系的魔法，增强恢复能力。看着自己这边顺利的进展，铃铛脸上露出轻松的笑意。\r\n    由于前期详细的侦查，己方已经对血红骑士团驻地的兵力分布了如指掌了。所以这次的作战计划有些大胆，己方从血红骑士团的东西两扇大门同时杀入，争取在敌方集合兵力重整旗鼓之前击溃他们。铃铛所在的东路由繁花和凌风带领，西路则由风云的副会长，比凌大哥看起来可靠得多的连云带领。原本还有些担心战力不足的铃铛，在看到平时和蔼可亲的公会同伴们矫健的身姿和强大的战力后，也轻松了下来。在中间提着双剑准备策应突变的凌风更是无聊的吹着口哨。\r\n    既然自己这边都那么轻松，西路想必更不用担心了。毕竟连云大哥是铃铛看到过的最厉害的人，不过，或许孤星也有那么厉害的，虽然肯定比不上连云大哥从小锻炼的武技，但在游戏里，孤星应该能跟连云大哥比个高下吧。\r\n    想到孤星，铃铛的心情又有些波动了，说好了回来看她的那个人，已经一个月没有消息了。一时疏忽没加好友，结果根本联系不上，即便去问花姐和凌哥，也是一样。\r\n    \r\n    两个队伍没出任何意外的在血红骑士团的正厅前汇合了，在两波人相互招呼和打趣的时候，铃铛却注意到，三位会长的表情有些严峻。铃铛不由自主的凑过去听了他们的对话。\r\n    “你们不觉得这次的血盟骑士团的防御有些奇怪吗？”\r\n    凌风难得正经的提出问题。\r\n    “看来你也感觉到了。繁花呢？”\r\n    连云接口。\r\n    “恩，这次的电脑太过“老实”了吧。毕竟是章节最终任务，照以前的经验看，不应该任由我们随意进攻的，但这一次血红骑士团的兵力完全没做调动的让我们歼灭了。电脑智能应该不止这种程度的，而且还有一点，我总感觉这次的讨伐任务，高等级NPC太少了一点。”\r\n    繁花思考了一会儿说出了自己的感受。\r\n    “恩，难得繁花能说出这么冷静的分析。”\r\n    “就是啊，平时总是靠蛮力解决问题，难得理性一回。”\r\n    “你又找打是不是？”\r\n    “总之，看来答案就在这个大厅里吧。最大可能，或许精英都集中到了里边了。现在的问题就是，我们再侦查一遍再决定打不打呢，还是直接进去挑战。”\r\n    “Boss骑士团长的战斗能力只能靠实战来确认，但是如果旁边精英太多，挑战Boss就太危险了。这次还是先做好撤退的准备吧。”\r\n    一向开朗得过头的凌风在这种时候倒比较保守。\r\n    “那也不见得，总之先进去看看再说吧，从头再来守卫之类的小兵又会刷新一大堆，而且也浪费时间了。”\r\n    繁花比较倾向打一打。\r\n    “总之，进去看看吧。”\r\n    \r\n    大门打开，大厅中出乎意料的冷清。两个门卫，两个血骑士，以及坐在正中间似笑非笑的一个骑士团长。血红骑士团团长弗朗西斯，一身红中嵌黑的骑士袍服，二十左右的模样，一头红发格外醒目，一柄十字剑就靠放在他座位旁边。\r\n    “什么人胆敢闯入吾等断罪者的大殿！”\r\n    NPC血骑士说着预设的语言冲了过来，仅仅四人就攻向了铃铛他们，而在后边的骑士团长还稳坐着，看戏一般看着自己的小弟的送死冲锋。\r\n    繁花和连云一人接下一个血骑士，在铃铛的辅助魔法加完之前就已经逼得对方节节后退了。两个门卫早早的被击杀，在退回骑士团长身边前，两个血骑士也已经死亡。在连云首先逼近骑士团长弗朗西斯的时候，对方仍然带着那似笑非笑的眼神。\r\n    “恭喜诸位来到我等断罪者的营地，虽然看来我那些不成器的手下们没有招待好诸位，部下们的不称职就只好由我来善后了。来吧，说说你们想要什么吧？”\r\n    说着，站起来的弗朗西斯单手握住他的佩剑。这个NPC显然跟那些重复刷新的小怪有很大区别，即便连云所见过的前两章的boss也没有如他一般个性鲜明。犹豫之后，连云回答。\r\n    “我们想向你要求的东西只有一样，你的人头。”\r\n    “嚯嚯，我这颗头可不值钱，相反的，你的人头在帝国可是有明码标价的喔，斗士连云。”\r\n    “我们这些小人物哪入得了帝国的法眼，堂堂断罪者一支的领袖，不会想去赚那点儿赏金吧。”\r\n    连云的语气更加慎重，身体也已绷紧，他用眼神示意凌风等人退后，自己却打定主意要试一试这个独特boss的深浅。一般人形boss的血量和破坏力都较弱，实力强劲的个人也能与其周旋一二。\r\n    “我虽然不在乎那点儿赏金，但是却对安可村这些有胆识又有纪律的反贼的首领们挺有兴趣的，总而言之，既然你也这么想，先过过招吧。”\r\n    话音刚落，弗朗西斯的突刺已经到了连云身前，动作之迅速，完全不是连云从前所遇敌人可比的。矮身、侧头、抬手，用拳套挡开十字剑的突刺，连云立刻冲向对手腹心进行反击。连云轰出的右拳被对方下撤的剑背挡住，于是顺势改拳为爪扣住了对方握剑的手。\r\n    “缴械！”\r\n    弗朗西斯的十字剑向上空飞起，本以为得手的连云却被更加迅捷的一拳打飞了出去。连云在空中转了两圈才受身着地，抬头看时，弗朗西斯已经重新抓住了飞起的十字剑，正微笑着看他。\r\n    “喂，云，干嘛这么冲动。”\r\n    凌风赶紧凑了过来。\r\n    “我想探探他的实力。”\r\n    “那也不用这么近身吧，虽然格斗家擅长近身战，但人家好歹也是boss啊，以伤换伤十个你都干不过他。”\r\n    “恩，是我错了。总之，先让格斗经验少的人后退些，这个人的战斗能力太强。”\r\n    说完连云又向前走了一步，重新跟弗朗西斯对峙。 \r\n    凌风本想上前夹攻，不过连云坚持一战，他也只有尊重对方，先去下达指示了，同时向繁花示意。繁花会意的点点头，稍微靠前了一点，以便随时帮上连云。其他的战士也都握紧了手中的武器，随时准备上前。\r\n    “这回换你出招了，斗士。”\r\n     弗朗西斯说出话后，剑尖向前一指，准备招架连云的攻击。\r\n     连云深吸一口气，在心中演算了一遍动作，脚尖一踏向弗朗西斯冲去。技能“突进”给与了连云速度，技能“强化”给与了他力量，技能“变向”让弗朗西斯的招架落空，正当拳头要击中弗朗西斯时，弗朗西斯空着的左手又一次快速回转，接下了这一拳。在弗朗西斯正要笑着反击的时候，看来已经力尽的连云却发出了经过一次转职的他现在所习得的最强招式。\r\n    “烈焰击！”\r\n    出乎意料的攻击将防御没到位的弗朗西斯的右手的骑士袍烧坏，而更让他意外的是连云扭转身体竟然没有僵直的又发动了波涛般的掌击。\r\n    “连云掌！”\r\n    连续十三掌打出，即便身为boss的弗朗西斯也被打得直后退到自己的石座前。受伤的弗朗西斯却满是笑意，眼中只有依然保持架势的连云。\r\n    “哈哈，果然如此。你们这些头领果然都有些本事，刚才的掌法不是系统默认技能吧，却居然能给我这么大的伤害。”\r\n    “家传武学。”\r\n    “好，好。我决定了，我要把你留在这里！”\r\n    这一次的弗朗西斯动真格了，单手挥动十字剑，斩击快而狠，刺击精准，攻得连云几乎没有还手之力。就在弗朗西斯的剑要斩伤连云时，两柄交错的剑挡下了他的斩击。\r\n    “他可是我家重要的二当家，不会让给你的！”\r\n    手持双剑的凌风快速抢攻，然而没有连云那样强格斗能力的他的剑击，被弗朗西斯轻描淡写的化解了。其他人也赶紧上来帮忙，只是除了连云，没有人能在迅捷如风的弗朗西斯身上留下伤痕。相反，很多人都被他快捷的反击所伤。\r\n    后方的魔法师和牧师队伍也开始行动，铃铛的辅助魔法也给前方的战士一一加持上了。原本由于弗朗西斯独特的出场而中断的boss攻略战重新开始。然而，铃铛他们马上发现了这次攻略的难度。\r\n    弗朗西斯的剑术众人还能应对，连云等武者的格挡、几个重战士的硬抗，不会让他将谁重伤。然而当他们打掉高魔抗的弗朗西斯大概六分之一血量的时候，弗朗西斯突然退后一步，右手握剑使出格挡技能，左手前伸，开始了吟唱。\r\n    “主啊，请让这些罪人知晓神威。”\r\n    弗朗西斯的左手突然放出耀眼的圣光。\r\n    “不好！所有人闭眼，前排全部后退一步！”\r\n    连云赶紧叫道，然而已经晚了，所有人都被圣光所照耀，进入了“目眩”状态，原本保持的阵型立刻混乱，前排战士更受到了血红骑士团长无情的攻击。\r\n    弗朗西斯在敌人从目眩状态恢复之前，向左右各发了一个斩击，多名战士受伤。所幸他的目标还只是连云，在逼开两边战士之后，又急攻向连云。连云所受目眩状态较小，斗士职业的异常状态抗性也高，依靠着稍微能感觉到的光影效果和自己的战斗本能，持续躲避着弗朗西斯的攻击。\r\n    就在其他人也渐渐恢复视觉，牧师们正想全力恢复伤者的时候，弗朗西斯的吟唱又一次响起。\r\n    “主啊，请让这些罪人知晓圣灵。”\r\n    众人头上再度显现圣光，当大家以为又是光系攻击时，凌风却惊讶的大叫。\r\n    “不是吧，天国之门！还让不让人活了！”\r\n    众人这才敢抬头，只见空中放行的一块圣光中出现了两个身影，圣灵之影。圣灵那可是堪比天使的存在了。才二十几级的众人，哪有挑战天使的能力！\r\n    \r\n    眼见大殿上空显现的天国之门，众人的心一下子沉到了谷底。\r\n    “不要慌张，那只是圣灵的影子，能力应该不会太强，重组两个小队拖住它们，别被他们切入后排，魔法师和射手优先解决掉它们。”\r\n    全场最冷静的连云一边与弗朗西斯周旋，一边发出指示，激战中的他反而第一个看到了天国之门中出现的敌人。凌风和繁花则立刻开始组织拦截圣灵之影。\r\n    还好圣灵之影果然不具备太强的攻击能力，圣光的目眩效果虽然烦人但对有所防备的众人影响不大，然而超强的魔法抗性和几乎完美的物理抗性却让没有与其对战过的风云、花都两个公会的精英们头痛不已。磨了好半天才将两个圣灵解决的众人回头看弗朗西斯时，才发现，对方的生命值竟然恢复了不少。\r\n    战斗时间并不算长，但将弗朗西斯的生命值磨到三分之一时，连耐力最强的连云都颇有些吃力了，只是如今的他们已经有些进退不得了。在暴风雨般的狂攻中，弗朗西斯还犹有余力的说着话。\r\n    “你们想跑也不是没办法，只要退出这个大殿我就不会追了，不过在这之前，我有信心留下包括斗士在内的五条性命。我知道你们一向都是共同进退的，所以还是安下心来想办法打倒我吧。”\r\n    弗朗西斯那像劝说又像自语的话语刺激着连云的心，连云知道他说的是实情，这个boss完全不是现阶段一个精英团队能够战胜的，即便将现存的最强战力全部集中起来，如果没有默契的配合，恐怕也是无法战胜他的。\r\n    就像印证他的想法似的，弗朗西斯又开始了吟唱。\r\n    “主啊，请让这些罪人明辨是非。” \r\n    然后就是几乎让凌风等人抽搐的特效，全场伤害无效，连后援的回血技能也没有效果。没有治疗，战线根本无法维持，连云当机立断的喊道。\r\n    “全员后撤，我来断后！”\r\n    然而仅有防御技能的连云也没有办法完全避开弗朗西斯的攻击，连续的几次刺击让他的血量低于了30%，陷入了危险状态。\r\n    这还不够，伤害无效还未解除，弗朗西斯的第四次吟唱又开始了。\r\n    “主啊，请让这些罪人们明晰真理。”\r\n    群体减速和持续掉血将众人打下了深渊，连云再也无法躲开弗朗西斯的攻击，被其一拳打翻在地。危急关头凌风抢过同伴的盾牌帮连云挡下了一剑，然而不善用盾的他手上的盾牌很快被挑飞。仿佛看着死人一般，弗朗西斯毫无慈悲的刺下手中的剑，繁花往这边飞扑，连云也挣扎欲起，凌风却只是静静的看着剑尖越来越近。\r\n    “不要!”\r\n    铃铛的叫声中，谁都没有注意到的一个身影从殿外飞速赶来。铃铛虽然看到了，却知道不管他有多快的速度，都无法挡下刺向凌大哥的那一剑。\r\n    然而，赶来的他却创造了这个奇迹，飞速前进中的身影左手向前，急声念道。\r\n    “定！”\r\n    弗朗西斯的剑没能刺下去，就那样停顿了一秒。当他反应过来时，也并没有顺手解决凌风，而是抽身后退，戒备着疾冲过来的剑士。\r\n    “你又来了，剑士！看来你也是个不见黄河心不死的人呢，还想再败一次倒也无妨，不过这回我可不会给你逃脱的机会了！”\r\n    “这回没有那么多小弟给你当后盾，我看你的小命也快到头了。”\r\n    与弗朗西斯对拼一剑后停下的孤星，少有的反唇相讥，铃铛看到他的眼神比以前任何时候都凌厉。不过在回过头来看铃铛时，孤星的眼神却又是那么温和。\r\n    “铃铛，还有花姐，先带凌哥他们退到殿外去吧，这里先交给我应付。”\r\n    “孤星，这个人不是那么好对付的，而且⋯⋯”\r\n    连云正想说些什么，孤星已经打断了他。\r\n    “不用担心，我已经有过一次经验了。击杀他的把握虽然没有，要拖住他还是不难的。”\r\n    “哦，那我倒要看看你能保下几条性命！”\r\n    听到这边对话的弗朗西斯立即行动，向旁边没了盾的盾战士攻了过去，即便是皮糙肉厚的战士，恐怕也扛不住他针对要害的一剑。\r\n    同样单手持剑的孤星以不逊于他的速度迎了上去，挡开十字剑，然后是针对弗朗西斯的一阵猛攻。三连刺、二段斩，挡开这些基本攻击后想要追赶逃向殿门的众人的弗朗西斯忽然停了下来。原本以为孤星那完全以压制对方为目的的猛攻，并不会带来多少损伤，但是突然的危机意识还是让弗朗西斯停下来格挡。此后他才发现，并非所有攻击都没有威胁，眼前这个男人，竟然有利用他分心二用，想去追敌的心理，偷袭他的心脏。\r\n    所有人形boss都有相同的弱点，头颅和心脏。即便是普通的刺击，如果能够一剑穿心，也是会对boss造成极大伤害的。弗朗西斯也似乎想通了，面对如此的强敌，又何必去在乎其他蝼蚁的死活呢。就在不顾自己损伤全力抢攻的孤星和回头与他对决的弗朗西斯开始全力战斗的时候，其他人已经在繁花的带领下退到大殿门口关注两人的战况。想要上前帮忙的铃铛被繁花紧紧的拉住了，虽然她也心情焦急，想上前帮忙，但为了不给孤星增加更多的负担，现在的她们只能紧张的注视战局的发展。\r\n    这是一场众人前所未见的死斗，孤星与弗兰西斯的身形相互交错，剑击之声不断。\r\n    “十字斩！”\r\n    “龙牙突！”\r\n    弗朗西斯大声念着血之圣骑士的技能名，向孤星发起攻击。而孤星则以更低沉的声音、更准确的突刺技能反击。\r\n    “龙破斩！”\r\n    “审判之剑！”\r\n    孤星的表情严峻，而弗朗西斯也不再有微笑。孤星以所持技能的无缝连接对抗弗朗西斯技能的强大破坏力，而在双方都不使用技能的单纯剑斗中，孤星甚至以自创的剑术更胜一筹。然而真正的考验才刚开始，当弗朗西斯的血量降到一半时，第五次吟唱开始了。\r\n    “主啊，请让你的仆人执掌威光。”\r\n    弗朗西斯抬手向天，他的上方一个巨大的圣光体正在凝聚，那恐怕是一个大规模破坏性魔法。靠在殿边的众人立刻紧张了起来，这次是直接的攻击魔法了，魔法师们赶紧释放出防御结界。铃铛也赶紧呼唤孤星闪避。\r\n    然而孤星并没有闪避，只见他也如同弗兰西斯般将左手伸向天空的圣光体，急叱。\r\n    “破！”\r\n    还未完成的大范围破坏性魔法“威光”就被他的一声“破”所引爆，产生强烈的气流席卷了整个大殿。\r\n    “狂妄之徒，竟敢破坏神迹！”\r\n    气流刚平息，弗朗西斯就气急败坏的攻向孤星，孤星则小心翼翼的招架。\r\n    交手几招之后，弗朗西斯再次吟唱。\r\n    “主啊，请让你的仆人执掌光雨！”\r\n    周围突然出现无数的圣光弹，那已经不是几个十几个光明教士所能召唤的圣光弹数量了。飘飞盘旋的圣光弹随着弗朗西斯的手指汇聚，然后一齐向孤星袭来。\r\n    “啊！”\r\n     铃铛忍不住惊叫，这么多的光弹袭击，即便身法再好也无法躲开，即便血量再厚恐怕也撑不住的。\r\n    孤星却仍有办法，依然是左手做施法状，孤星念道。\r\n    “无光之盾！”\r\n    孤星被一个暗系力量的光罩所包裹，圣光弹连续不断的打在光罩上，却一个不漏的被吸收了。慢慢蓄积的圣光力量最终将暗系的光罩填满引爆了，却最终没有对孤星造成太大伤害。\r\n    破解了弗朗西斯的两次吟唱，孤星又疾风般攻了过去。繁花等人本准备上前帮忙，却被孤星用眼神制止了。要一边保护着队友一边战斗，对他来说恐怕更加困难。\r\n    一招龙牙突打过去，在弗朗西斯格挡僵直而自己的技能僵直未到的瞬间，孤星又接上了下一个技能，旋风斩！狠狠的击中弗朗西斯后孤星赶紧旋转开去，等待双倍的技能僵直和躲避弗朗西斯的反击。\r\n    多重招式让孤星经常能击伤弗朗西斯，但长时间的僵直也让他很难完全避开反击。以伤换伤的战斗始终是对孤星不利的，毕竟弗朗西斯是boss，在他打掉弗朗西斯中间三分之一血量的时候，自己的生命值也已经降下危险线好一段了。最重要的是，孤星早就知道，而其他人才发现的一个问题，弗朗西斯第三次吟唱之后，回复魔法和道具都已经失去效用了。\r\n    弗朗西斯的第七次吟唱。\r\n    “主啊，请赐予此等愚者以绝望。”\r\n    比上次更加可怕的虚弱，想要来援的繁花等人都几乎难以动弹了。然而孤星以绝对的冷静应对着危机，虽然被弗朗西斯的连续刺击所伤，但所有针对要害的攻击都被他勉强的避开了。\r\n    虚弱时间刚到，下一次吟唱又开始了。\r\n    “主啊，请赐予此等愚者以死亡。”\r\n    比刚才圣光弹还要密集的血色匹练布满大殿，这已经不是光明神的神力，而是作为断罪者的血红骑士们所斩杀的冤魂的怨念汇聚而成的恐怖魔力。在这不详魔法出现的瞬间，刚恢复一点儿体力的连云就赶紧拉着繁花和铃铛往殿外冲去。\r\n    “所有人赶快出殿！”\r\n    “但是孤星还在⋯⋯”\r\n    铃铛挣脱连云的手想返身去看孤星，却又被凌风抱着向外冲去。殿内的孤星没有动作，只是静静的看着血色的匹练在身周流转。\r\n    在铃铛还来不及呼唤孤星的时候，所有的血色匹练已经加速流转，其中不少都冲向了他。在接触前一瞬间，孤星才低声念出自己的魔法。\r\n    “爆！”\r\n    孤星所在之处被血色匹练袭击，产生了一连串的爆炸。而剩下的血色匹练也撞向大殿各处，引起各处的爆炸和腐蚀，原本宏伟的殿堂变得完全不成样子。在一阵此起彼伏的爆炸过后，只剩下弗朗西斯的狂笑。\r\n    “哈哈，这回你离殿门可够远的，想逃也逃不掉了吧！哈哈！”\r\n    听着那狂笑，连云在义愤中颤抖、凌风咬牙切齿，繁花悲伤的捂住嘴唇，而铃铛，则傻在那里还没能认清事实。\r\n    “啊！”\r\n    笑声没能持续太久，接着的却又是弗朗西斯的一声惨叫，他惶然的看着自背后洞穿自己的长剑，一脸的不可置信。\r\n    “你到底？你怎么会没事？”\r\n    “最初的爆炸是我自己引发的，然后我就已经不在原来的地方了。我知道你这个魔法的范围很广，杀伤力也很大。但是毕竟有一个地方你不会攻击，那就是你自己所站的地方。我明白你想知道我是怎么到你身后的，很简单，在与你战斗的时候我在你背后做上了标记，而你一定知道有一种需要标记的瞬间移动魔法，它刚好有使得被施术者察觉不到背后异常的特效。”\r\n    “死神之影！可是并非刺客而且等级还低的你，哪可能学到这么高级的魔法？”\r\n    “单纯的剑士怎么会使用魔法？”\r\n    “那你到底⋯⋯”\r\n    “我使用的其实是这个。”\r\n    说着，孤星打开物品菜单，取出了一个卷轴。\r\n    “呵，原来如此。果然是准备周全呢。”\r\n    “毕竟曾经败给过你一次。”\r\n    “哼，你没有败给我。如果在同一⋯⋯线上，你不会败给我。”\r\n    弗朗西斯强撑最后的意识说道。\r\n    “你，的确厉害，或许⋯⋯真有可能战胜⋯⋯那个人呢。”\r\n\r\n    铃铛第一个奋不顾身的冲进毁坏殆尽的大殿内，然后就看到了站在弗朗西斯尸身旁边的孤星。她不顾一切的冲过去抱住了孤星，激动得全身颤抖。孤星也因为劫后余生的喜悦，轻轻的回抱着她。    \r\n    陆续进来的连云、繁花等人断断续续的聊着这个艰难的任务，以及整个《崛起》的剧情，心情都有些沉重。最后还是最开朗的凌风活跃起气氛，要在这里开庆功会，大吃大喝大闹一番。\r\n    “也就这种时候有些作用。”\r\n    繁花似锦看着又开始欢笑的公会，轻笑着感叹。\r\n    而此时的凌风、铃铛甚至连云则在对孤星进行“严刑逼供”。\r\n    “你到底怎么使用魔法的，明明是个没转职的剑士，不用吟唱咒语，竟然就能施展瞬间移动那一级别的魔法？”\r\n    “我都说过了，是用的魔法卷轴。”\r\n    “骗人，使用魔法卷轴不是需要把卷轴拿出来，双手展开，然后念咒语使用的吗？哪有你刚才那样轻松啊？”\r\n    “有个任务可以获得快速施法技能，所有咒语都可以精简。还有个任务获得意念施展技能，可以像快捷栏一样靠意念使用预设的几个物品。”\r\n    “哦，这么好的技能你咋不早说。任务在哪，我也去学一个。”\r\n    “其实这些技能也不算太好吧，还占技能位，如果不是这次的情况，我都不太想学的。关键收集卷轴太花钱了，为了凑齐这次任务需要的卷轴，我不仅把存款花光了，还向别人借了不少钱呢。凌哥，这次任务的酬金可得分我一份啊，就算卖出剩下的几张卷轴，我也暂时还不上借款。”\r\n    “剩下的卷轴你要不用了，卖给我好了，我出高价。”\r\n    “你用的是双剑，学这技能买些卷轴又有什么用呢？”\r\n    “有什么用？小星你这都不知道，果然是身在福中不知福啊。来，云，你告诉他这些技能有什么用。”\r\n    孤星回头看向一旁的连云，只看一向严肃认真的他突然坏坏的笑道。\r\n    “最大的作用就是，帅啊！”\r\n    孤星差点绝倒，而一旁的铃铛居然也赞同两个大男人的言论。懒懒的靠在孤星身边，铃铛回想起漫天血色中沉着冷静的孤星的身影，轻声的嘟囔。\r\n    “真的很帅嘛。”\r\n    \r\n\r\n\r\n\r\n\r\n	圣剑传说I：剑士之路 第一章  独行剑士.txt				2021-04-29	30000417
31000025	0	2021-05-08	学校开运动会，一个学生因为搞怪被失败，然后被班长女孩勒令回家拿东西收拾现场，另外的几个同学也跟着他回去了。然后他家里原来是一个鬼屋，进去的人从地下室拿器具的时候，被吸血鬼、僵尸、憎恶、飞机（外星人飞碟）等各种东西袭击，一路往外逃。终于逃出来跑回学校，结果他们闹出的动静把运动会给炸穿了，好多人错愕不已，然后愤怒的掀起另一部抗议和搞怪的风暴，另一边的一个女生公寓也被炸穿，里边也是一群奋起抗议的搞怪群体。整个社区都是搞事不嫌大的搞怪人士，外界一般敬而远之的整蛊社区。	整蛊社区			Paragraph	2021-05-08	30000538
31000026	0	2021-05-08						2021-05-08	30000226
31000027	0	2021-05-09	专注武道的少年，专注棋艺的少年。成为龙神后，两人曾厮杀过一盘，特别快，特别惨烈。\r\n而为了治病儿游历天下后，再一次有机会挑战棋艺少年时，他走得很快。而追着他的人完全不知道他的这一面，总以为他要死不活、温吞如水。只有一个同行者催促，要是走慢了说不定琪都下完了。\r\n而棋艺少年也因为瓶颈的原因停滞不前，在名楼中与名宿对战，落于下风。因为龙神少年的到来，他愕然发问，龙神少年只是问，之后有时间吗，我等。仅仅是他的出现，就让棋艺少年心理充满力量、重新振作起来。\r\n随后两人的棋战，龙神少年不欺负对方已经用脑过度，两人以下慢棋用蛮力的方式拼斗，以大山名川为棋盘，以自己的力量画棋子，惊心动魄。	龙神少年			Paragraph	2021-05-09	30000538
31000028	0	2021-05-26	一行人假期结束返校，乘坐着校车前往山中的封闭式学校，三人团体在聊天，另外三人各自无言，其中一个朴实认真的学生意外的带着一袋子游戏。沉默寡言的老师意外发疯，混混一般的司机回头朝他吼叫，然后车子就冲出了山道护栏，为了拯救这一行人，在这辆车上的神将他们带到了自己管理的世界。	穿越原因-车祸被救				2021-05-26	30000380
31000029	0	2021-05-26	转生到异世界，作为王子以及未来的勇者，原本倒是备受期待，生活也有些拘谨。然而王国突变，被帝国侵略，皇宫的乱局中国王等要人被杀，其他熟人失散。靠着自己隐藏的实力拼死突出重围，然后过上了一路逃亡的生活。帝国的追兵时不时的侵扰，让主角也没办法在一个地方安定下来，欠缺常识和生活的拮据也让他接触了各种工作，总算体力很好，大部分时候还是能吃饱饭。\r\n直到来到世界边缘的不法地带，混迹在这片魔兽横行的地域时，他的生活才算渐渐稳定下来，成为冒险者讨伐魔兽，渐渐闯出一些名声，也在一些战斗中结识了还算谈得来的伙伴，虽然仍然因为他到处流动而没能与其他人组队，但这样的生活主角倒是蛮喜欢的。抛开本该去努力复国的王子责任，以及本应前往讨伐魔王的勇者身份，他还是喜欢作为一个冒险者，在这一片奇幻的世界中寻找自己的浪漫。\r\n后来在生死考验中成为真正伙伴的有狗耳女孩，魔族少女，也都是失去一切无处可去的孩子，基本是被主角收留而且有能在他身边活下去的战斗力。\r\n多次击败各个种族的强者，名声和实力都大幅增强的主角无意间称为了人族与其他种族交流的代表人，甚至有多个魔族群体尊他为主。虽然没有什么复仇的想法，却自然而然的拥有了强大的势力，而后反而是引来的帝国的觊觎。曾经颠覆他的王国，追杀他的敌人，倒是都在这场战斗守卫战中被他击杀。	逃亡勇者			Paragraph	2021-05-26	30000543
31000063	3	2021-05-27	三男一女的四个人穿越当冒险者，第一件学会的就是封印能力值，把自己调整到这个世界的正常的新手水平。\r\n性格武者活跃气氛、喜欢冒险，魔法师负责后勤、制定策略，还有一个刺客平时懒散却善于查漏补缺，女生是牧师，虽然性格并不算外向还是努力作为外联窗口与各种势力交涉。没有人选择剑士，因为大家都知道剑士、勇者是唯一的主角。大家还是平等相处最好，也不需要队长了。\r\n从正统的新手村开始，打史莱姆、哥布林、狼群虎豹等野兽开始。以旁人惊讶的速度提升实力和小队等级。当然也遇到了一些危险，比如被兽群冲散，魔族军来掠夺，但总算都合力度过了难关。\r\n\r\n章节：\r\n0.异界冒险者\r\n1.第一关：消灭史莱姆（牧师的练级）\r\n2.第二关：哥布林巢穴（杀敌的觉悟）\r\n3.第三关：荒野狼群（小队的羁绊）\r\n4.第四关：闹鬼金矿（亡者的思念）\r\n5.第五关：魔族掠夺者（守护民众）\r\n6.第六关：圣光之城（转职和新技能）\r\n7.魔族战场（征兵与运输小队）\r\n8.魔兽将军（死亡与觉悟，解放封印）\r\n9.逃亡之路（魔族精英、人族教会）\r\n10.反击和自由（击退追击者，前往魔境）\r\n11.探索魔境\r\n12.\r\n\r\n\r\n\r\n结果每一关都是对女生的考验，所以其实真正的主角以及勇者、其实是四人中的牧师女生。\r\n三个男主也各有各的烦恼。\r\n作为军师的魔法师有交流障碍，只有女主比较特殊，因为她对于他来说更像人偶或者AI。\r\n活泼男孩则想找能分享冒险和快乐的伙伴，但其实没有找到很合适的对象。\r\n负责善后的则是他们的组长，虽然有乐于助人的风评，但很多时候是性格使然放不下无力者，却也并不是喜欢帮助任何人的。\r\n女主也确实是一个能够分享，没有太多主见，类似于人偶一样的人物，因为她原本就是这样被塑造的，原本是要作为大人物玩偶的，却因为世事变革而获得了自由。\r\n\r\n转生原因：四个人是一个公司一个部门的同事，在参加完项目成功庆祝会后回家时出了车祸，深受重伤的四人中只有女生听到了救他们的人的话，对他们的不幸表示遗憾，随便就把他们转生到自己的世界，希望他们在有能力的时候顺便矫正一下这个世界。只是女主一直不想承担这个责任，才没有告诉其他三人。\r\n\r\n\r\n\r\n\r\n\r\n	没有主角的冒险者小队			Paragraph	2021-05-28	30000543
31000085	1800	2021-05-30	目录：\r\n1.死灵君主\r\n2.恶魔的保护者\r\n3.寻宝之旅\r\n4.战火无情（小镇）\r\n5.龙的财宝\r\n6.故人\r\n7.危险的实验\r\n8.扭曲的人性\r\n9.冷血无情\r\n10.血之仪失败\r\n11.三神器的预言\r\n12.狙击者\r\n13.分道扬镳	第十八卷 与恶魔同行			Paragraph	2021-05-30	30000547
31000086	1900	2021-05-30	目录：\r\n1.神器的呼声\r\n2.北行\r\n3.极地之城\r\n4.再见火神\r\n5.生死相拼\r\n6.烈焰焚天\r\n7.世界冰冻器\r\n8.火神封印\r\n9.北方大陆\r\n10.战神之铠\r\n11.天使军团\r\n12.不死战神\r\n13.两位天使长\r\n14.战神的弱点\r\n15.强抢符文战甲\r\n16.最后的神器	第十九卷 北行出关			Paragraph	2021-05-30	30000547
31000064	0	2021-05-29	海贼一行人呆着公主及女仆航海旅行，去了许多地方。强者有强者的冒险，然而留守船只的乔巴害怕，弱小三人组仍在，弱小的乔巴他们想要演绎强者冒险，就只能自己想象，所以弱小的幻想强大的天真伙伴也是必须的。乔巴，乌索普，三人组还不够，所以女仆也算上了吧。\r\n（海贼）而后来到一处世界尽头的山谷，索隆不经意的练剑制造了超出想象的破坏力，与路飞的最大破环力相当。而后经过一番调查，发现全球变暖的原因是地震，地壳运动频繁，或许会成为世界危机。女仆在山谷的基地下船，被公主命令调查原因。而后向以前的同学写去求助的信息，许多人都说不愿意来这样偏僻的地方，然而女仆也曾是校园里的一大明星，真正的拥护者们还是不计得失陆续来到这个世界尽头为她效力。	星球温室危机			Paragraph	2021-05-29	30000538
31000065	0	2021-05-28	回家过年，五爷家受到很多酒。去到望景台听他们聊天，结果遇到老汉。一起走出去聊天，他问我是否准备回来了，中国现在的状况也比我想象的容易生活，我反驳，才发现老汉身上的伤，手缠着绷带，说是做了一个罗肯手术减轻痛楚。	落肯手术			Paragraph	2021-05-29	30000538
31000066	0	2021-05-29	经常把测试谎言的珠子拿在人前晃悠而惹人讨厌，毕竟大部分人都不喜欢被人测来测去。但是大家不知道的是，其实他（她）本身就拥有完全超过测谎宝石的真实之眼，仿佛诅咒一般无法屏蔽的身边所有人的真实和谎言都会涌进她的脑海，即便闭上眼睛，不去看也仍然是那样。然而又因为害怕孤独而下不了决心一个人远离人群生活，所以才那样碍眼的提醒大家不要在自己面前撒谎。	真实之眼			Paragraph	2021-05-29	30000546
31000080	1300	2021-05-30	目录：\r\n1.\r\n2.\r\n3.\r\n4.相遇\r\n5.\r\n6.\r\n7.追杀与逃亡\r\n8.水神之殿\r\n9.神威\r\n10.绝对的力量\r\n11.圣水中的零星之火\r\n12.弑神	第十三卷 弑神			Paragraph	2021-05-30	30000547
31000067	4	2021-05-30	一个班的学生死亡后转生，这是个群雄争霸的异世界，因为神的游戏，这个世界将要迎来终结，而他们的任务就是带领各自的种族在这场乱战中存活下来。攻击是最好的防御，所以在加入了这一批生力军后，战争越发的激烈了。\r\n转生以灵魂融合的方式成为了各个种族10岁左右的少年少女，因此也有了各自的优势。能够理解现状的人立刻进入了角色，开始指挥自己的族群发展，而无法接受现实的人也被迫寻求存活的方法。\r\n转生者及特色：\r\n\r\n1人族：王公贵族、地下社会、冒险者三个团体，以及零散的不愿战斗的生产系人员，共计10人\r\n王子：\r\n01第四王子，软弱可欺的老好人，但又能够确实地照顾到身边的伙伴。认真负责最适合做主角，然而又始终有一些游离于这个战争世界之外的感情无法对他人诉说。有着身为勇者的兄长和天才的妹妹，周围的强大使得他看起来并不突出，当然也不会自满。虽然他没有注意过，其实前世也是一样的，因为周围的人很优秀，自己更显得平凡，然而平凡也想活出自己的精彩。\r\n他家里四人，爸爸常年在外，大哥十分优秀，偶尔也被爸爸带去工作，类似与考古发现。他则宅在家里玩游戏，各种游戏都挺简单的，偶尔也会摆弄爸爸弄回来的各种奇怪物件。所以对于遗迹物品、文字比较敏感，在新世界的探索中也偶尔派上用场。妈妈照顾人无微不至，但是只和他两人在家，有时候甚至开玩笑的以为自己或许是排解妈妈孤独的玩具。\r\n\r\n02公爵千金，转生不久就相遇的同伴，拥有相同的前世记忆所以自然而然变得亲近，虽然前世两人并没有多少交集。转生是以灵魂相近能够融合为前提的，所以她前世也是性格强势的大小姐。只是前世的关注点都在自己的未来，这一次却更多的关心身边伙伴的事情了。\r\n\r\n帝国\r\n03帝国太子：天生自傲的性格，让他树敌众多，与王子在学院冲突，而后生死厮杀。王子以自残来了断了这段纠纷，劝说他，末日将近，反正都是死，与其与自己意气之争中死掉，不如为了敬仰他的帝国子民而战死。随后两人再未相见，在人魔大战中给王子传递过情报。\r\n04教廷圣女：外表温和而内里偏激，前世与今生的宗教信仰完全一致，导致她的宗教狂热更上一层。而主角背负了禁忌技能，在学院中的冲突时她选择了帮助太子。而后也回到了教廷主持与魔族的战斗。前世或许本来有些喜欢王子，可惜两人的理念相差太远，所以她选择了放弃。\r\n05太子副手\r\n\r\n其他:（地下、生产系）\r\n06盗贼工会幕后\r\n07宝石商人（女）\r\n08药师（女）\r\n\r\n2其他正义方种族：精灵、矮人、学院，总计5人\r\n11精灵射手（女）：活泼好动，喜欢自然，像男孩子一样整天出去打闹惹事。\r\n12精灵长老：经常被人说少年老成的男孩，思虑清晰做事稳重，只是也像老人一样呆板、顽固。所以与长老的灵魂融合了，在精灵族内地位很高，虽然也还不是领导者。\r\n13矮人铁匠：作为王之子，却不关心政治，喜欢锻造东西，大多时候不问世事，但非常护短，总得来说最后还是走到不得不领导族群的矮人王位上。\r\n14学院研究员：穿越之后热心于探究魔法真谛，就像以前的探究自然现象一样，为人邋遢，缺乏生活能力，但其实帮助其他人很多人找到了疑难问题的解决办法。是个虽然完全自我中心，而且做事不经大脑的疯狂科学家，与主角也有很大冲突，但总的来说，对于世界是利大于弊。\r\n15学院教师（女）：希望成为教师的元同学，现在变成了众多同学的老师，装模做样的样子非常可爱，还带着天然的笨拙属性，总是搞砸事情要学生们来收拾烂摊子。\r\n\r\n\r\n3魔族：魔兽（哥布林、狼人）、恶魔（魔王、副官）、亡灵（吸血鬼）、8人\r\n16哥布林将军：哥布林三人组老大，几个兄弟在拓展生活区域的战斗中死亡，所以他必须连那两人的份一起，竭尽全力的活下去。\r\n17哥布林（死）\r\n18哥布林（死）\r\n19狼人战士：族群被灭，单独一人走上复仇之路\r\n20吸血鬼公主：\r\n21魔王：\r\n22魔王副手：\r\n\r\n4中立：龙族、神殿，2人\r\n24龙女：天不怕地不怕的族长次女，喜欢挑起纷争看别人打架，因为自己实力实在太强所以很少出手，难以找到合适的对手，如果有机会，即便是作为邪恶的龙王，也想要与能够匹敌自己的勇者一战。\r\n25神使（女）：全身包裹神使袍服，看不到长相也听不出声音的神之使者，没有像其他转生者通报过姓名。\r\n\r\n\r\n0.新星（天现异象，各族出现强大的转生者，以及他们的唯一主线任务：直到最终审判来之前，存活下去）\r\n1.王子和公爵千金\r\n2.绑架和地下社会\r\n3.魔法学院\r\n\r\n4.冒险之旅\r\n5.魔族崛起\r\n6.战争爆发\r\n7.天平倾倒\r\n8.逃亡汇聚\r\n9.反击决战\r\n10.最终审判\r\n\r\n一个主题是主角成为勇者打倒恶龙和魔王，这样大众化的故事，却其实大家都说不出看过故事的名字来。大众化的东西，并没有想象中那么到处都是。主角也是这样，虽然其他人或许觉得这个世界就像是虚假的故事，但生活在其中烦恼着的人们，真的用一句虚假的就可以概括吗。\r\n\r\n\r\n	异界争霸			Paragraph	2021-05-30	30000543
31000068	101	2021-05-30	目录：\r\n0.心心相印\r\n1.破落佣兵团\r\n2.挑战者\r\n3.悬赏佣兵\r\n4.危险旅程\r\n5.怪异的同行\r\n6.超长旅程\r\n7.简单任务\r\n8.神秘的雇主\r\n9.危险任务\r\n10.弱者的耻辱\r\n11.马不停蹄\r\n12.不可能任务\r\n13.桐之岭\r\n14.凤凰火焰(战斗本能觉醒)\r\n15.最后的血煞\r\n16.黑暗中的杀手\r\n17.火焰之心\r\n18.勇气与决心\r\n19.冰之魂\r\n\r\n    山林间，身形瘦弱的萧吃完了一整头老虎、满足地躺在草地上，在没有任何人的地方，自言自语般说着话。在过去的十几年里，这或许是他唯一像个平静、悠然的普通人的时间。从出生时似乎就心灵相通的女孩泠的声音清楚地传进他的心里，即便两人完全的天各一方。自从十二岁时在泠的帮助下压住了体内那个怪物，再加上收养自己的佣兵团的一些变故，萧就决定离开佣兵团，上了这座与魔兽山脉有所关联的后山，过起了山野小子的生活。其实他这五年以来一直都处于被各种魔兽追杀的状态，但不知为何他感觉自己很习惯这种生死难料的生活。最初的两年完全无法打猎，经常饿肚子和仓皇逃命，但如今已经找到生活技巧，不太容易被大型魔兽盯上了。不过他也并非是完全住在山上，断断续续地也会回佣兵团做些杂物，为本就不太乐观的佣兵团减轻负担。\r\n    跑下山去时，却正好看见大小姐云姗姗，她正在和两个小时候与萧同样被佣兵团收养，却时常欺负他的师兄云驰、云骁吵架。他赶快跑过去拦住想动手的两人，但是不巧的是身体里的怪物正好发作，身体极度难受而且行动困难，来不及抵抗的他被两人狠狠地打了一顿。大小姐扶着满身是伤的他回家，一边还教训他打不过别乱来，他如果不还手对方就不会打得那么重了。大小姐大概是这个佣兵团里最关心他的了，毕竟从小到大一直都被当做大小姐的跟班使唤着。即便在他十二岁那年选择离开佣兵团之后，云姗姗也从没将他当过外人。而萧自己也觉得，守护这个从狼群里把他捡回来并且教会他人伦的佣兵团，是他的一份责任。毕竟佣兵团名为“龙骑士”，可惜真正拥有龙的老团长早已去世，收养萧的团长夫妇虽然努力维持，但也因为实力太差，难免没落。更雪上加霜的是，团长夫妇在一次任务中双双牺牲，如今是大少爷云天曜在靠一股执念坚持着这个已然落魄的佣兵团。\r\n    刚回到佣兵团就发现出事了，居然有人来砸场子。萧和大小姐躲在后边看着，那是个比普通人大了几乎一倍的身材魁梧的大汉，拿着一把沉重无比的精铁大斧。这人似乎是无聊到处晃的时候，看到这边师傅教弟子们训练的时候，自己犯了错居然蛮横的责怪弟子，一时兴起要把这师傅给轰走。然后全佣兵团的人就都聚了过来，那个一向口齿伶俐的师傅已经被对面看似鲁莽没头脑的大汉讥讽得面红耳赤，恼羞成怒，要大打出手了。结果当然拼不过人家，被一巴掌拍飞了。毫无脸面的师傅一气之下走了。云少爷也就是现在的团长劝都劝不住。之后就是整个佣兵团与大汉的对峙，毕竟连最有实力的师傅都完全不是对手，其他人也没有敢上前动手的。\r\n    倒是大汉那方，若有兴致地观察起这些畏畏缩缩的学徒，挑出了两个来搭手。云少爷能清楚地知道对方的深不可测和并无恶意，让被选中的云杰、云宇上前过招，用枪的云杰和用剑的云宇被空手对敌的大汉耍得团团转。就在曾帮过萧（他在云家的名字叫云霜）多次的云宇要受伤时，萧随手拿了把剑冲了上去。萧的速度极快，他的突袭让大汉在意外和警觉中无意识地举斧反击，一击将萧打趴在地上。落地的萧迅速翻滚起身，再次攻了过去，剑势虽然凌厉，但完全威胁不了对方。举重若轻般躲过萧的连击，大汉收起斧子直面萧刺来的一剑，一声大喝直接再次将他震趴，直接晕了过去。实力差距毕竟太大。\r\n    大汉要试试他的伸手，让云少爷给他把剑。萧屏气凝神，做好架势上前，在这个没落的佣兵团里已经很快的他还是完全碰不到人家，所有真假动作都被看穿了，然后最后的全力一击被人家轻松打飞回来，力量也相差太多。头上鲜血横流的萧看起来有些凶狠，与平日里众人看到的怯弱无比的样子判若两人。还要再上的萧这一次，被人家躲过了攻击，然后在上方巨吼出生，那冲击力直接将他狠狠地压向地面。第一次知道，原来气势居然能造成这么强大的破坏力，萧就这样直接昏了过去。\r\n    醒来时大小姐在照顾他，整个院子里静悄悄的，相比以前更冷清了。听大小姐说起昏迷时的情况，大汉带走了佣兵团的招牌。临走时，大汉说会把招牌好好保管的，毕竟有个值得期待的小子或许有机会来取。大汉还曾看向云少爷，说他年纪轻轻的装深沉，不像自己长辈反倒像某个不靠谱的枪兵。“一直躲在这个本就破败的城市的破败的角落里，怎么可能变强。”于是云天曜追问他，怎么才能变强，大汉则留了一句话，“如果有死的觉悟的话，就上战场去吧。那里，才是佣兵生存的世界。”可是，如今大陆各国局势都很稳定，又哪有什么战场来给他们历练。\r\n    接下来的几天，佣兵团的晚了四年的崩溃开始了，所有武师和大部分弟子们前前后后的走了。面对这辛苦几年最后一朝消散的打击，云少爷守在爷爷和父母的灵位前，死了一般。（他们家有些东方背景，这个佣兵团是其爷爷在成为龙骑士后开办的）大小姐每天都去劝他，但是总没有效果。毕竟自从师傅和师娘在某个委托中牺牲后，当时还不到十三岁的云少爷就一肩扛起了这个佣兵团。为了不让大家离心，为了守住家业，他耗费了多少心力，别人已经无从得知了。\r\n    最后剩下的，只有六人了。云少爷、大小姐，大师兄云杰和与萧比较亲近的云宇，以及平时几乎什么事都不管、总是一身黑衣冷漠得很难相处的中年人里德斯。大概只有萧能够跟他说两句话，因为两人都是很安静的人。而且大概也只有萧知道他有些力量，以前有次一个弟子接触黑魔法失控的事，是被他解决的。那次事情云少爷叫他不要外传，不过真正猜到解决这事的是里德斯的只有萧。而实际上，那次的黑魔法其实也跟云少爷家传的魔法有些关联。\r\n    \r\n    三天后，云少爷终于出来，正要聚集剩下的人宣布佣兵团的解散时。一个人影突然出现在房檐上，那是个虚无而强势的身影，让云都免不了心升恐惧，明明看不见对方的眼睛，却似乎完全被人家看穿了。对方是来发布委托的，仿佛知道了云的情况，“如果想要重振你这个佣兵团，而且有赌上性命的觉悟的话，我这里正有一个大委托，要拜托所有能够创造奇迹的“三角地带”的佣兵们。明天晚上，后山顶上，在那之前做出决定就行。”\r\n    接下这个委托，云很快做出决定。然而只有几人的佣兵团，特别是妹妹的安排则开始让他头疼了。原本要一个人去闯运气的想法被众人否定，妹妹坚持要跟着他，萧也认为云想将妹妹托付给自己、独自去拼命的想法是错误的，另外大师兄云杰和云宇也执意要跟着。唯有冷漠的里德斯坚决反对接受委托，但是又不说明原因，让已经有些生气的云十分反感，不想跟上来的就走好了。\r\n    大家收拾着行装准备启程的晚上。萧和里德斯则在月光下慢慢聊着，里德斯说这趟旅程几乎没有生还的可能，对方根本没有用得上他们这些人的地方，除了当做诱饵或者障眼法。萧则说那里德斯叔叔都不能保护好云少爷吗，里德斯则苦笑，那里的人可都是比我更厉害的，我不过是个逃兵啊。最终感叹着，终于还是又走回来了那个世界的里德斯，仿佛认命了一般笑了出来。而另一方面，萧则更有一种感觉，这次的出行，恐怕会彻底改变作为山野小子的他的生活。不过为了报答云家夫妇的养育之恩，他并不后悔这次选择。他唯一的担忧是，不知出了这片地方，与泠的心灵联系是否还能延续。\r\n    艰难的爬上山顶，那里已经有十数个佣兵团在等着了。粗略听了听，他们被许以了各种不同的条件，看来这个委托人对这些佣兵都有过不少调查。山顶的佣兵们看着这个六个人的小队伍，而且还全是些孩子，多数都忍不住透出讥笑的神情。不过这边的人，尤其是云和萧毕竟是久经这些眼神的，还是能镇定自若。然而其中一个最嚣张的中年人得寸进尺不仅直接讽刺云天，还想要调戏云姗，弄得忍无可忍的云天和萧一起动手，然而两人的实力虽然让对方有些吃惊，但是回过神来的中年人在他的一个同伴帮助下，还是将他们打伤了，后边的云杰和云宇护在云姗身前，还想动手，只是却更加不是对手。最后还是另一个佣兵团的女首领来打断了这边的闹剧，不想给委托人一个不好的印象。中年人毕竟还是忌惮这个女子，收了手。然而这个女人显然也并非看得起他们，云天艰难的站起来，道谢，却又被她打倒，然后再一次站了起来，这份坚韧倒是令女子有些惊讶。\r\n    委托人的到来让大家的注意力从这个小佣兵团上转开了。委托人给了大家委托内容，这是一个参与到光暗争霸大势中的事件，委托人给众人的信息虽然详细，但其实只是一个表象。其中只有里德斯能看出来，可是却又不能明言。\r\n    第一个相对简单（对云他们来说也是挑战）的委托，云天和女子的佣兵团殿后，他的大局观起了一定作用，也让对方对他重视起来。两个人在一起聊天，云天难得很自然的说起了自己的经历，小时候没太刻苦，父母突然的过世，十三岁抗下整个佣兵团时的艰难。而境遇相似的女子也难得的与团员以外的男人聊得起来。两边的属下都在好奇两人到底在说什么。然后听到那边女子惊讶，“你们居然见过斧圣！”云天这才知道曾经踢馆的大汉是佣兵榜上排名第一的绰号“狂怒之王”的人，又有人称之为“斧圣”，那是世间也仅有几人的超越了人类极限的存在。而事实上那大汉所看中的却是那个看来傻乎乎的云霜（萧）。\r\n    一路上委托人与众人的接触中，一直都保持着神秘感。似乎只有萧能跟他说几句，因为萧对任何人都是一副很有礼貌的样子，话也少，如果没事可以一直在旁边站半天不说话而不会自觉尴尬。最主要的，虽然很少有人能看出来，萧在隐性的气势上不比委托人一行低，所以才更显得是有礼貌而非卑微。委托人在与萧的对话中多次提起云天，似乎对他比较感兴趣。旅行之中，大师兄云杰还通过云宇来试探萧对云姗的看法，暗恋大小姐很久的他早先一直将萧当做竞争对手，但事实上，萧更多的是对大小姐的尊敬和感谢，而对大师兄云杰也并不讨厌，在多年之前，萧就曾为云杰制造过机会了。\r\n    路途超乎他们想象，艰难爬上桐之岭的众人所要做的，居然是捕杀一只凤凰，这跟开始听说的委托完全不是一个档次的了。传说中的神兽，哪里是这些三流实力的佣兵能够杀死。然而现在已经上了贼船，众人已经没有选择了。这岭上的凤凰是一只与众不同的神兽，在它强横的实力和无尽的火焰面前，佣兵们毫无办法，被追杀得四处逃散。然而同时，感受到危险的凤凰却也往山岭中遁去。\r\n    天空中其实已经有另一些人在与凤凰大战了。全部都一身黑衣，看不到面孔和身形。然而萧却能看出似乎与里德斯有相似之处。这个暗影部队运用强大的群体阵法将凤凰困得脱身不得，黑暗力量的腐蚀则让它痛苦不堪。费劲全力从阵法中脱出身来的凤凰已经全身是伤，想要遁逃，却又遇上了先前那对弱小的佣兵。凤凰将愤怒完全发泄在他们身上，却没想到自己的伤势因为愤怒和这次发泄变得更重了，看到胜机的佣兵们自各处追杀凤凰。很多被其在山岭间杀死，然而终于在凤凰筋疲力尽时，云天等人追上了它。只是，现在的凤凰仍旧不是他们能应付的，险象环生的几回攻防后。里德斯为了救被愤怒的凤凰瞄准的萧和云姗等人，用了独特的黑魔法牺牲自己挡下了一次凤凰的攻击。里德斯趁着最后一点气息，艰难的讲起云天的父母维持佣兵团的辛苦，以及希望云天、云姗别被这个佣兵团所束缚，不能持久就另谋出路的想法。最后云天还是没有答应放弃做佣兵，但是却笑了，说自己一定会做出一番事业的。里德斯最后感叹，云天，跟他爷爷一样固执。这种固执中有魅力，却也让人多很多烦恼。\r\n    最后，凤凰死在那个黑魔法中，身体被切成无数碎片，其中最重要的心脏落向山谷。被云姗一箭钉在了岩石上。萧过去捡回了战利品，然而那心脏仿佛火烧一般炙烤这他的双手。萧记起里德斯的牺牲，宁愿废掉双手也要牢牢抓住这份战利品。\r\n    然而，在回程的路上，最嚣张的那队佣兵竟然要抢他们手中的凤凰心脏。对方似乎也受到了较大的打击，看起来随时有可能暴起杀人的神情。权衡之后，云天最终让步。而在远处看到的女子也径直离开而没有插手，她对部下说，“对他们来说，会是很好的一次刺激。放心，那不是个傻瓜，不会那么冲动的。”\r\n    萧依言将心脏交给对方的人，结果接下那人的手直接给烧伤、融化了。正要动手的对方被从后方出来的委托人制止了，委托人交了一块特殊的布料给萧，让他把心脏包了起来。\r\n    众人辛苦的一天结束，然而云天却没有休息，站在一个悬崖边上。这许多天来的耻辱、自己的弱小，让他终于下定了决心。变强或者死，如今身处险地的他们，真的没有半分的余地可言了。\r\n    云天找到萧，让他帮忙回忆以前在魔法学院学过的课程。原本已经锻炼斗气数年的云天，要放弃能够大成的斗气，而选择可以速成的魔法了。同样心里非常不甘心的萧，也选择了赌上性命去尝试变强，即便没有云天那样清晰的认识，他也知道自己这群人处在了怎样一个危险境地。以前接触到任何魔法能量都痛苦不堪的他，自己开始学习操纵魔法了。而另一方面，长期被凤凰之心的火焰侵蚀，他一直压抑的自身的冰魔法属性为了与火焰对抗，也在渐渐觉醒。\r\n    云天学风，萧学冰。两个人都在拼命变强了，而看着他们如此投入，云杰和云宇也对练了起来。相对于云天的超强悟性，萧对冰魔法的掌握总是无法涨进。每次施法都钻心蚀骨般的疼痛，所能召唤的冰元素还是少得可怜。然而，就在最后一次对练中，云天告诉他，如果不能掌握冰魔法，现在的他已经完全不是自己对手。如果再不能进一步，可是会被自己杀死的。这一次云天果然下手狠辣，如果萧反应慢些，真的会被杀掉。重伤之下难以躲避的萧潜在的斗争意志爆发，拼尽最后一份力量施展魔法，然后，双手所指处，一片大得离谱的冰柱群爆炸般出现。若非在暗处旁观的委托人出手阻拦，云天已经被冰柱刺穿了。萧的体内，仿佛有一块冰的碎片在灵魂深处显现。现在的他还不知道的是，这可是修行到魔导士级别的魔法师们才会达到的境界。只是要压制体内那强大的怪物的力量，他的精神力已经完全超出了人类的水准。而又由于死亡的胁迫，才让他在如此弱小的时候就锻炼出了魔法魂晶——冰之魂。\r\n\r\n	第一卷 悬赏佣兵			Paragraph	2021-05-30	30000547
31000069	200	2021-05-30	目录：\r\n1.一雪前耻\r\n2.设计\r\n3.魔兽山脉\r\n5.神秘女子（圣女）\r\n4.处处危机(可插入一些故事，与一些人物见个面)\r\n5.嘶吼\r\n8.姐姐\r\n9.杀戮之心\r\n10.云纱\r\n11.愤怒还是悲伤\r\n\r\n.再会\r\n\r\n\r\n\r\n    魔兽山脉中行走的这个队伍，这个夜晚，委托人正和其随从看着对面两人的对练。委托人在对随从感叹。\r\n    “三个月来，每星期提升半级，就算放在我们大本营的训练场上，也可算得上神速了。而他们则仅仅靠自己的力量就达到了这样的速度。”\r\n    “其中一个本身就不是普通人，这提升只是晚来了太久。但另一个，却是真正的天才，十年一遇的天才。”\r\n    委托人的随从认为他把这两个小鬼夸得太过，毕竟再有潜力，没能成为实力也是白搭。\r\n    “我这可并非乱夸。真要比起来，小萧那是和‘降临之子’有相似境遇的人。这些被选中的人，不可能不强。然而另一个云天，单从天分和头脑上比较，大概是更胜他们一筹的人。只可惜过去的十几年来，他们所处的环境毕竟太低端。再有天分，没有合适的境遇，也是难有成长。不过这两人的心性都非同一般，三五年之内大概就会声名鹊起了。当然，前提是要从我们的行动中活下来。”\r\n    虽然从一开始就处于利用所有佣兵的立场，但委托人还是很自然的和敢与他说话的萧、以及之后大着胆子请教的云天相处。委托人教授了他们两人不少知识，关于大路上的几大势力，个人能力的等级划分，以及两人魔法和武技学习中的一些技巧。委托人首先在两人眼中，这位委托人的知识和实力已经超越了深不可测，达到了无所不知、无所不能。\r\n    \r\n    当那队嚣张的佣兵再来找茬时，云杰和云宇已经能够挡住他们了。而云天和萧则已经不将对方看做对手了。仅仅是，以实力压服这波欺软怕硬的人，将以前受的耻辱还回去而已。\r\n    而那几个人受了这份耻辱，恶毒的想利用委托人一方除掉他们。几个人故意设计让看来比较老实的萧脱离队伍，在魔兽山脉中迷了路。他们也知道委托人在任务开始后就不会允许有人脱队，妄图暴露他们这次秘密行动的佣兵及其同伴都得死。然而委托人虽然知道了情况，却既没有阻止他们的行为，也没有将云天等人怎么样。云天则告诉急切想要找回萧的云姗等人，跟着这只队伍走，死的可能性不比徘徊于魔兽山脉中低，既然委托人没有追究，那就让萧自己另谋出路吧。本来担负佣兵团重建的任务，就不是他以及云杰、云宇这些兄弟的责任。\r\n    \r\n\r\n    脱离队伍在魔兽山脉徘徊的萧，遇上了好几只打不过的魔兽。有一次遇到一个来魔兽山脉中历练的武者，看他只是运转斗气就将魔兽吓跑，给萧留下了很深刻的印象。为了追上队伍，萧没有跟武者同路，而是选择了更危险的通往山脉深处的道路。\r\n    前几次都险险逃过追杀，但是总有逃不掉的时候，被打得重伤的他，神情恍惚间，忽然有种剧烈的不甘心，露出的神情冷酷肃杀，畏惧的魔兽大声吼叫，而他也毫不示弱同样低声的嘶吼，然后，原本能轻松杀死他的魔兽居然逃跑了。\r\n    这件事以后，他就开始学习吼叫，要是单凭气势就能误导这些智商低下的魔兽让他们知难而退，那么他也就有了穿越魔兽山脉跟队伍会合的机会了。\r\n    然而总有智商并不那么低下的中级魔兽，不相信他的虚张声势，于是萧只好又开始逃命。饶了好多圈，仍旧甩不开这头力量强横、脑袋还好使的中级魔兽。最后还是被一个女子救了下来。\r\n    这个稍微年长些的女子易玲，在他受伤的期间，无微不至的照顾他，让从来没被人照顾过的萧有些不习惯或者说害羞。第一次这么近距离的感受到亲情，萧渐渐将她当做亲姐姐一般对待了。\r\n    而易玲更看出了他身体中一种杀戮的本性，多次提醒杀伐太重容易堕落，劝导他尽力克制，不做无谓的杀生。她的话语和关心对他起了很重要的引导作用。甚至或许是他杀戮不断的人生中的一道心灵壁垒，使他不至于整个人的灵魂都堕入深渊，再不能重见光明了。\r\n    两个人从魔兽山脉的中间地带进入了一个与世隔绝的城堡。那是姐姐的出生地，她的家族，但是由于长年的隔绝于世，其中的人已经从各个方面变得怪异诡谲了。在这诡异之中，悲剧连连，萧的心理被这样的混乱不断冲击，在直面那些人残杀无辜人众时，心理混乱的他终于使得寄宿于体内的怪物有机可乘，陷入了一定程度的暴走中。\r\n\r\n    最终变成了那么悲剧的结局，姐姐易玲牺牲性命发动镇魂大法，才能一时将萧暴走的力量镇压住，让他恢复了神智。姐姐将她的武器冰魄云纱化形回玉片，留给他当做镇魂醒神之用。而那座城堡，也因为他体内的力量的暴乱化作了废墟。萧终于没有杀那些已经精神崩溃的恶人，这是他姐姐的请求，她宁愿不追究他们的恶行，也不想让本就可能杀伐随身的萧多添一分堕落的危险。\r\n    一个人走出来，面对连绵的魔兽山脉，无所是从的他，只能前行，往最深处。如果能横穿过去，就去追上云天他们，如果不行，就干脆死在这些魔兽手中吧。\r\n    在一个山坡，原本想从三只对峙的魔兽下边偷溜过去的他，被发现之后，只好凭气势搏上一搏，然而他不知道的是，面前被他的气势压倒的，可都是连魔兽山脉中也并不常见的高等魔兽。\r\n    远处一辆精致的马车上，看到了这一幕的女子，有些意外的观察了一下他，随后还派了随从送给他一件可以隐藏气息的绿色披肩。在他疑惑时，那个女子的声音直接传到了他的耳中，非常柔和婉转的声音，告诉他，看他天生奇才，在这魔兽弥漫的森林中死了未免可惜，送他件隐藏身形的披肩，让他尽快穿过山脉，离开这满布危险的地域。\r\n    那温和的声音让他想起了那与自己心灵相通的双生子，正当他想问时，那辆马车却已经远去了。\r\n    \r\n    有了这件披肩，他仿佛隐身了一般，基本不用惊动魔兽，就穿过了最危险的魔兽山脉最中心也最危险的地段。再加上独自穿越山脉前半段的经验和能力（气势发散，霸气的雏形），萧终于在快走出魔兽山脉的地方追到了云天他们的队伍。大家都惊讶于他能够一个人穿越魔兽山脉，而当他说出披肩的由来时，委托人倒是笑了。看来这个小家伙注定有登上人类顶峰的运气了，连素不相识的人都会帮助于他。而他当然知道这披肩原本的主人。\r\n\r\n\r\n\r\n\r\n\r\n	第二卷 魔兽山脉			Paragraph	2021-05-30	30000547
31000070	300	2021-05-30	目录：\r\n\r\n2.暗之君\r\n3.鬼封阁\r\n4.镇魂之玉\r\n5.幽冥鬼手\r\n6.幽魂之瞳\r\n7.神魔眼\r\n\r\n\r\n10.暮光小镇\r\n11.优雅剑士\r\n12.风魔之谷\r\n13.虚空之链\r\n14.剑皇\r\n15.风魔之心\r\n16.烈火之仪\r\n17.烈焰焚天\r\n\r\n\r\n    委托人的实力深不可测，云天一直比较警惕着他，其他人也并没有多事的去接近他。倒是萧，能够很正常的跟他交谈，在这群人中间，似乎是跟他说话最多的人。委托人有时也顺便教导他一些战斗技巧、魔法能力、或者给他灌输些世界格局、力量强弱的知识。\r\n    云天后来才知道，眼前这个人就是光明与黑暗两大阵营中最强的名人之一，暗之君。自己的戒备根本是无意义的，人家的力量完全不是自己所能够想象的。想通以后，他也就无所谓跟萧一样向他取取经了，而委托人显然对他也很有兴趣，不介意帮他们增长一点实力和见识。也算是观察一下这一代年轻人的潜力。\r\n    \r\n    他们的下一个任务是，从鬼封阁中找出镇魂之玉。他们当然不知道，这是冥皇的住所。而冥皇本人还正在其中。当他们进入鬼封阁时，冥皇已经被暗之君布置的暗影死士打成了重伤。然而，想要捡便宜的佣兵们，果然还是不够资格，即便已经重伤垂死，冥皇毕竟还是十阶顶级的人物，不是这些不入流的小人物可以杀死的。被他的幽冥鬼手撕裂的不少，而被他的幽魂之瞳摄住心魄，像人偶一般控制住自相残杀的更多。在几个佣兵团的联合拖延时间的对策下，冥皇终于还是忍不住吐血了，他知道外面有黑暗方的军队守卫着，想要让这些不怕死蝼蚁来消耗甚至杀死自己，所以在没有找到逃出生天的办法之前，他也不能贸然杀掉他们。\r\n    就在他以为自己要被这些蝼蚁绵死时，他却突然发现了萧，以及他体内那庞大无匹的力量，仿佛又看到了一线生机。如果让这个小子体内的力量暴走，或许能够吸引住守在外边的暗影死士的注意力，让他有机会逃遁。\r\n    强撑着最后一份力气击散几个佣兵团的连击，抓到了萧这边的队长云天，诱使萧追进了鬼封阁众多的阁层中。\r\n    想要诱使内宿了强大神力的人类暴走，毕竟不能直接破开封印将力量唤醒，因为若是太直接，或许那力量会直接让人爆体而亡。所以冥皇想要诱使萧恐惧和愤怒，将云天内心黑暗面的意识展露出来，又用语言挑逗他，这样都没能成功，冥皇只好用幽魂之瞳直接控制他。然而他万万没想到的是，在自己的魔瞳引导下，对方的双瞳也发生了诡异的变化。对方的灵魂力量不仅没有被击溃，反而因为自己的诱导，无意中形成了一种诡异的构成，原本一棕一碧的双眼，棕色越来越深沉，碧色越来越光亮，竟然是一种奇异的瞳术，仿佛传说中的神魔之眼。\r\n    而造成这种结果的，是萧的正面承受并试图掌握体内那股神秘力量的决心。从前，光是抵挡它都已经是竭尽全力，跟来来不及想其他，然而在委托人的指导下，渐渐懂得了力量的掌握，而又经过了上次的力量解放和压制，萧心底有了一些自信，不是能够压倒它的自信，而是有能力选择“解脱”的自信。即便掌握那股力量的行动失败了，也有办法自爆让它跟着陪葬。那股力量绝对不是他的同伴，它给他的感觉，除了危险，就是绝望。而这一次，不知道是它退缩了，还是他真的成长了，竟然短时间内控制住了它露出来的一小部分。也就有了神魔眼的形成。\r\n    而另一个原本掌握在冥皇手中的小棋子，云天，也不知用了什么神秘的咒法，竟然爆发出了远超他们原本实力的力量。在两个突然强化的敌人面前，冥皇终于有些不知所措了，最终他也因为自己的混乱而丢掉了性命，连临死想要拉他们垫背的招数也被躲过，灵魂碎裂成为这鬼封阁中又一个孤魂野鬼。\r\n    其他几波佣兵再这个鬼封阁中搜刮了一番。而云天早已精疲力竭，晕倒在地。萧似乎更惨，全身痉挛，痛苦不堪地翻滚，全身多处冒出血来，甚至连都不能失去意识。当然他自己也知道，无论如何不能失去意识，要不然体内那股巨大力量就会凌驾于自己之上。\r\n    在这时那两个讨人厌的佣兵团又大摇大摆出现了，想要趁机杀掉他们。云杰、云宇两人也在战斗中受伤不轻，而那边却有几个完全没有战斗过的。\r\n    对方两个团长压制住云杰云宇云姗，其他几个就想先杀掉动弹不了的云天和萧。然而其中一个人刀被痛苦不堪的萧抓住了，几乎无法自控的萧直接抓碎了那把刀，而拿刀的人则像中邪了一般发出一声非人的惨叫，到底昏死过去。在其他人被震慑的时间里，曾救过云天他们的女团长过来拦下了两个图谋不轨的家伙。上次救他们是看着这几个无知少年不顺眼，这次却是要感谢打倒了强敌。前后，她都不仅感叹，这是多大的差距啊。原本以为天真得可怕，肯定会早死的不知小子，不知何时，已经不比自己弱多少了。\r\n\r\n\r\n    低调的行军后，再次穿过魔兽山脉，来到了铁血帝国的领域。在名叫暮光镇的小镇上。\r\n    在暮光小镇四周，几乎都是危险地域。西边是魔兽山脉，东北是   ，而东南他们要去的方向，则是众多山峰山谷、森林莽原交替重叠的气候怪异的未名地带。在名目上要穿越这一区域，走直线到铁血帝国的中心城市去，所以向暮光小镇上的剑士公会分所要求了一位向导。而他们实际的目标则是，火焰之山。\r\n    然而委托人在看到那个平和年轻的剑士向导时，倒委实吃了一惊。这个无聊的剑皇，怎么会碰巧在这个地方出现呢。不过仅仅是他一人，还是无法破坏举整个黑暗阵营之力筹划的计划。\r\n\r\n    年轻人很快跟各个佣兵团的成员混熟了。他不像云天他们以前遇到的帝国剑士那样，高傲不逊，不把他们这些出卖力量和性命生活的佣兵瞧在眼里。相反，听他说，他似乎原本就有几个佣兵朋友，所以对佣兵这种职业比较有好感。（这些人当然不知道他的那几个朋友到底是什么级别的）\r\n    而原本就很会跟人交流的云天渐渐发现他的不同寻常之处，而云姗则完全没看出来，还在跟他讨论，真正的剑豪要像女团长他们那边那个酷酷的长发剑士那样，哪像他，全副装备都像个见习生，还带着个旧护额。而布莱特还真的跟她讨论得有趣。直到他打掉突然袭来的龙骑士的长矛，这边几人才知道他深藏不露。\r\n    从龙骑士口中听说，这附近频繁出现旅行者失踪事件，已经发展到让帝国军来调查的地步，然而附近因为地形复杂，只好封锁区域，一个地区一个地区的搜查。所以龙骑士们想要阻止他们进入这个地域。\r\n    委托人显然想要快些将自己的计划执行，率领众人进入了这片隐藏着未知危险的区域。\r\n    而阴差阳错之下，想要急行军躲开危险的他们，竟然反而比调查这事件的帝国军更快找到了幕后黑手的根据地，风魔之谷。被困在其中的众人不少陷入了恐慌，然而委托人并没有做什么动作，因为他知道面前就有一个可以应对这种情况的人，剑皇布莱特。\r\n    而事实上布莱特自己则是跟这件事关联紧密的人。他的爱人伊丽娜，在前段时间为了与自己的命运做个了结而离开他独自去了虚空神的神殿，无所事事又忧心忡忡的他才跑回剑士公会做了个小向导。\r\n    然而世事似乎就是这么偶然，伊丽娜被觊觎她力量已久的风魔神抓住了，囚禁于风的牢笼中，想要用她体内虚空神的力量做实验，妄图通过某种方法突破魔神的极限达到主神的境界。而做个向导的布莱特，却因为同行者被虏，而追到了这里，而有了救下自己爱人的机会。\r\n    委托人用自己的力量将其他人保护下来，只留下布莱特与风魔神对峙。他提醒身边的云天和萧，注意布莱特的这场战斗，这或许是他们第一次接触到，这个世界的顶级力量。面前的这两个，一个本就是真正的魔神，另一个也是超越了人类界限，获得了神一般力量，立于人的顶峰的存在。\r\n    这场战斗的确惊天动地，风声呼啸、剑气纵横，整个山谷似乎都要被夷为平地一般。原本以为自己十一阶中等的实力，可以稳稳压制住这个十一阶低等的人类的风魔神，却渐渐被对方压制了。他不知道的是，布莱特拥有的特质是遇强则强，而他的攻势变得更加凌厉的原因则是，他不能再让任何人伤害自己心爱的女子了。\r\n    风魔神做梦也没有想到自己竟会被同阶的敌人彻底打败，而更让他想不到的是，就在他肉体被毁正想凭依到伊丽娜的身体中去时，一直没有动作的暗之君却动了，黑暗魔法对灵魂的伤害不容小觑。风魔神的魂晶硬生生被切成了数块，其中有两块甚至没能飘散掉，被布莱特和暗之君拦了下来。\r\n    然而伊丽娜的魂魄被风魔神的实验所伤，几乎要破体而出，在布莱特也无能为力的最后关头，还是萧忽然想到了自己拿着的镇魂之玉，在委托人没来得及阻止之前，就发动镇魂之玉将伊丽娜的魂魄安定回了身体之中，镇魂之玉也化作幽光融入了她的体内。\r\n    \r\n    失去了镇魂之玉，委托人的计划显然受到了致命的打击。黑暗方的军队就跟随在他们前后，佣兵众人明显的不安起来，一些人推脱是萧他们的责任，另一些也已经想要逃走了。委托人镇住了不满的下属，与萧约定了一个解决办法，如果他能够做成这件事，那么黑暗方不会会让他们所有人安然回归，如果不成，那么这些佣兵就只有被灭口了。即便是已经拥有神一般力量的布莱特，显然也不是他所率领的军队的对手。\r\n    毕竟是自己理亏，萧没有答应布莱特全力救他一个人离开的计划，决心帮助暗之君完成他们降神仪式，在火焰之山中，以火焰之心为媒介，发动火之禁咒，以无限的火焰力量，召唤在前几届诸神之战中被杀死的火神再度降临世间。\r\n    在这之前，暗之君还帮助云天和萧，将风魔神的魂晶吸收熔炼为了他们自己的力量。获得了这股新力量的萧，还是难以抵挡这降神仪式的火焰威力，最近一直守着火焰之心提高了些火焰抗力，风吹散一些火焰，冰系魔法抵挡一些火焰，胸前的冰魄云纱的玉片挡了一次火焰，但是还不够。最终不知是幸运还是别的什么守护，让他终于完成了降神仪式，然而自己却在最后火神复苏的大爆炸中被炸飞出去，在漫天火焰之中，谁都没能看到他飞出去的方向。\r\n\r\n\r\n\r\n\r\n\r\n\r\n    \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n	第三卷 烈焰复苏			Paragraph	2021-05-30	30000547
31000071	0	2021-05-30	目录：\r\n1.生命之谷的仙女\r\n2.梦幻般的安逸\r\n3.曾经的誓言\r\n4.惬意的旅程\r\n5.火之精\r\n6.(插入故事)生命的奇迹\r\n\r\n8.回家\r\n9.久等之人\r\n10.魔法学徒\r\n\r\n11.枪神(云的)\r\n12.拜师\r\n    \r\n    首先映入萧那朦胧双眼的，是窗外灿烂的夕阳，当他想用手去阻挡光线的时候，才感觉到自己迟钝的神经传来的痛楚。确认自己在神炎的焚烧中幸存后，他勉力起身走出了这间素雅的木屋。而后，行走在这个充满生命气息的山谷中，在一汪清泉边遇上了救他的人，一头粉色长发、眉目如画、自称雅儿的女子。（血妃雅）\r\n    正在沐浴的雅儿很自然地与萧说话、问起他的伤势。而后雅儿又带着他在谷中散步，告诉他在这宁静山谷中生活的种种生命。身处于这份宁静祥和之中，连体内那怪物似乎也稍微平静下来，十几年来一直持续的痛苦忽然消散，感觉不适应的萧不禁有些无奈地苦笑出来。\r\n    雅儿仿佛是这个山谷中的圣女一般，被这里的所有生物所眷恋。她也对所有生命都抱以善意，帮助每个来到木屋前的动物解决困难。而因为雅儿对萧的无微不至的照顾，她身边的那条白色小狗对他有些敌意。而萧则隐约感觉到，这条名为小白的狗儿似乎有些来头。\r\n    在山谷中休养了一个月，就在萧感觉自己已经迷恋上了这个地方和身边的女子时，他还是决定辞行了。毕竟他在召唤火神的仪式之前曾答应过云天，只要自己活着，一定会回到佣兵团去见他。雅儿对萧突然的辞行有些慌张，出言挽留也被他拒绝了，慌乱之间碰到了右臂上的绷带，触动了伤口，那是雅儿为了驱散盘旋在萧身上的神炎而被烧伤的。愧疚的萧感觉到自己很难当面拒绝她了，只答应了一定会回来看她，就自顾自跑回屋中。\r\n    思考和烦恼了一夜的萧第二天见到的是完全恢复了活力的雅儿，在这个山谷中生活了二十年的她最后决定跟萧一起出去“见见世面”。临走前与常年相处的生物们告别，雅儿特意到她养父母的墓前祭拜，还特意让萧郑重地给自己的养父母磕了三个头。\r\n    \r\n    与雅儿一起的旅程很惬意，萧往常的迷路特性不再起作用，也不会莫名其妙地卷入其他人的争斗之中。因为雅儿的善解人意，一路上遇见的都是十分友好的人，即便在铁血帝国的一个村落中遇上兵灾，也被萧和雅儿轻松制止了。\r\n    （这段应该还可以插入一些故事、或与某些人相遇，但还没想过）\r\n    （进行了火神复苏的仪式、被神炎焚身而幸存后，萧的体内也留下了纯火的精华，与冰之魂相似，都是魔导士一级才有可能达到的境界，让他即便在与体内怪物的倾轧中，也能够使用火系魔法了）\r\n    （与寻找他的布莱特两人相遇）\r\n    \r\n    当萧和雅儿穿过半个铁血帝国，最终回到自由都市、来到虽仍破败却已有些起色的佣兵团前时，首先看到的是一个长发雪白的少年的背影。那是个明明初次相见却似乎似曾相识的名为光的少年，带着温和的笑容看向两人，说他已经在此等候多时了。\r\n    闻声从佣兵团中出来的云姗姗很快欢呼出声，然后又立刻回身去通知云天、云杰他们，小萧回来了。出门来的云天对白发少年十分尊重，云宇悄悄告诉他，这少年是八年前将身为龙骑士的老团长的遗体送回来的人，据说当时才八岁的小男孩的力量已经深不可测了。对此给以证明的是同行的剑皇布莱特,在十年前他还只是铁血帝国的一个小队指挥官时，曾被才六岁的少年救过。\r\n    萧还惊讶于白发少年的实力时，雅儿却已经与对方愉快地聊起来了。更让萧意外的是，在面对被称为人类最强的布莱特时都表现得温文尔雅的雅儿，居然在向这个自称光的温和沉静的少年撒娇。仔细想想，本身有些野性的萧倒也发现，这少年大概真的拥有光明的属性，可能是所有生命、包括萧自己仰慕的存在。而与生命魔法息息相关的雅儿就更能与他亲近了。\r\n    光也随口透露了一些有关萧的宿命的问题，以及萧所适合的成长方法。光给萧传达的最主要的三句话是，“你的人生源于磨难”，“最快的方法是从敌人身上学习”，以及“狭路相逢，勇者胜”。而在提到锻炼方法时，云天也不由自主的插入了对话，如今的他也十分渴望变强，特别是经历了那段旅程，遇到了太多超脱规则之外的强大存在。光的建议是，有十足天分却走了远路的他还是找个正统的老师更好，而布莱特则随后推荐他去找自己过去的同伴试一试。虽然布莱特并没有说那人是谁，但云天也知道必定是一个与剑皇、斧圣等人相当的高手，毅然决定独自踏上了拜师的旅程。\r\n    \r\n    光因为雅儿的请求决定在这个佣兵团多呆段时间，萧则陪着布莱特、伊丽娜故地重游，在自由都市里各处拜访。让他有些意外的是，伊丽娜竟然也是佣兵战魂榜上排名第七的厉害人物，是佣兵行业衰弱前的一代人的代表之一。就在双方偶尔分散的时候，萧遇上了都市里的流氓和警备队串联刁难一个流浪少女，在萧插手前一个年龄更小的大概十二岁的男孩出面击败了他们，却又引来了更高层的守备队伍。\r\n    少年精准地操作着十分稀薄和脆弱的魔法箭与守备队长缠斗，几乎每次出手都埋下诸多伏笔，让名誉在外的守备队长的攻击多次失败，奈何少年所能动用的魔力实在少得不可思议，始终无法把握住胜机。这场延长的战斗倒是让同样以元素使的方法战斗的萧学到了不少东西，经常独自作战的他们不能像其他魔法师那样停下来平心静气的念咒施法，只能在运动中快速吟唱、甚至时常需要幻化出刀剑上前拼斗。\r\n    旁边的警备队员看准时机插手，使得少年陷入危机之中，已经对少年很有认同感的萧不由自主的就上前帮助他，与曾经号称整个自由都市的噩梦的高级警备队“”打成了平手。面子上过不去的警备队正想用些手段，闻声赶来的布莱特先一步阻止了他们。少年没再理这些素质低下的敌人，只顾着去查看所救的女孩的伤势，而布莱特倒是认识这少年，在将少年、少女带回佣兵团后，随口就道出了他的真实身份，魔法帝国的小皇帝，也是曾与布莱特等人一起冒险的同伴。\r\n    由于前任魔法皇帝去世得早，魔法帝国一直由六位大魔导师在执政，而众人眼前的少年则是最正统的皇位继承人，他的大姐以及其他几个姐姐虽然都能被尊为女皇，却只能是傀儡，魔法帝国的子民唯一效忠的对象只能是魔法皇帝。不过最近几位大魔导师出现了分歧，主军的两位察觉到世界格局的变化，想让小皇帝早日继位，而主政的两位则希望更久的考察他的领导能力。对于才十二岁的少年来说，这些都有些太过沉重，出身皇家、小皇帝的爷爷辈的那位大魔导师则帮助烦不胜烦的小皇帝逃出宫去，让他去旅途中历练。当然，为了给力量已经达到顶尖的他增加难度，大魔导师爷爷设下了断绝魔力的封印，即便是作为当今最强魔法师的小皇帝也只能偷出一丁点儿魔力。\r\n    小皇帝和他所救的流浪女孩在佣兵团呆了一段时间，他与萧相互切磋更是给了萧很大的提升，控制魔法的精度提高，冰与火两系魔法的并用也成功了。\r\n    \r\n    另一方面，云天历经艰辛终于找到了处于迷阵之中的隐居者的家门。前方是一片刀枪剑戟的林子，每一把剑、每一杆枪都十分精致，显示出其所有者的个性，或正或斜地插在黄土地上的剑戟仿佛是一座座的坟墓，让人心情压抑，却又不免对这里的主人心生敬畏。这如林的兵器就显示着他所战胜的、同时也被他认同的敌人的数量。\r\n    云天在报上姓名以及布莱特的推荐之后，在门前等了三天才终于见到了隐居者。虽然无法确认，但云天大致猜到了对方的身份，与剑皇、斧圣等人一起创造了神话的英雄之一，枪神。然而枪神在见到他之后就明确地告诉他，为了暂时强大的魔法力量而放弃了修炼十数年的斗气的他，根本无法成为强者。\r\n    受此打击的云天在枪神的门前又呆了三天，而后终于离开。一个月后，就在枪神也为此叹息时，云天却又再次回来了。此次的他只做了一件事，演示了一番他这一个月的成果，在保持蕴含风魔神魔力的同时刺出了蕴含斗气的一枪，虽然斗气微弱。斗气与魔力并用，这是前辈们无数次尝试却无数次失败、自毁后被列为禁忌修炼方法。然而云天却凭借自己的天分，自行领悟了这种方法。\r\n    枪神此次不再那么决然了，但仍只是说了一句，斗气弱得不成样子。此次云天就在枪剑之林中修炼了一个月，以绝大的毅力和无畏强行提升了斗气，成功的让斗气提升到比放弃之前更高的层次，成功打破了前人的禁忌。亲眼见证了云天的决心，枪神问起他为了变强的理由，最后终于决定手下他这个徒弟了。（之所以在得知引荐人是布莱特后仍不想收天赋极佳的云天为徒，是因为他曾收的那对天赋绝佳的双胞胎让他失望了）	第四卷 命运的邂逅			Paragraph	2021-05-30	30000547
31000072	500	2021-05-30	目录：\r\n1.寻宝之旅\r\n2.公主、骑士与被诬陷的小丑 \r\n3.神之音乐团\r\n4.灵魂秘术\r\n5.体内的地狱\r\n6.勇者武斗会\r\n7.灵魂神殿\r\n8.死亡的试炼\r\n9.高尚与卑劣\r\n10.绝望与厮杀\r\n11.魂殿的出口\r\n12.被诅咒的命运\r\n13.神魔眼对金银妖瞳 \r\n14.解封 \r\n15.神级的厮杀\r\n16.最后的生还者\r\n\r\n\r\n    布莱特夫妇东行、小皇帝和他所救的女孩北去，萧却也随后踏上了莫名其妙地旅程。原因是与他一起住到后山的雅儿养了许多珍奇的植物，一开始还茁壮成长，但之后突然开始凋零了。据雅儿所说，要救活这些奇珍需要几件特别的东西做养分，其中甚至有一件与萧拿到过的镇魂之玉相似的宝物。努力维持这些花草的雅儿抽不开身，萧就理所当然的站出来担当下了寻宝的重任，即便他知道自己是个路痴。\r\n    \r\n    （旅行路线还不是很清楚，大致方向是先向西横穿魔法帝国，再向南进入荣耀帝国，自由都市在大陆西北端）\r\n    \r\n    萧的旅程充满灾难。虽然雅儿做足了功课，给他记下了所需的大部分东西的地理位置，但他还是收集得十分艰难。寻找花草时，不是在林中迷路，就是遇上大型魔兽抢夺，亦或者没仔细观察，采摘时才发现四周全是毒草和陷阱。在进城治伤和买雅儿所需的药品时，也被魔法师讹诈，身无分文只好找地方打工。打工的地方偏偏是魔法帝国二公主的个人城堡，原本因为小皇帝的关系对魔法帝国皇家比较尊敬的萧却偏偏撞见了公主与骑士偷情的画面。而后被指摘为采花贼被帝国军队追捕，唯一庆幸的是在躲进城堡仓库的时候找到了几样没买到的药品。而这次，也是萧被各方势力追捕的开始，第一个传扬出去的恶名则是“好色”。\r\n    一路采药一路“逃亡”，直到脱离边境才真的摆脱了魔法帝国军队的追捕，其间萧一直与军队、佣兵团、赏金猎人等团体战斗，在森林之中也尽是遇到魔兽群，锻炼出了个人与集团战斗的方法。不过连萧都有些想不通，听说魔法帝国的公主、女皇都没有实权，自己却为什么会被帝国军队追击三个月之久。其实他所不知道的是，这一路上的追击战中，他的罪名已经不断累积，早已不是轻薄公主这么一条罪行可以相比的了。\r\n    在刚踏入魔法帝国、荣耀帝国和神圣骑士联合之间的混乱三角区域时，萧就意外地认识了一个自称“神之音”的乐团。这是群自由奔放的人，他们所谓的神与光明教会完全不同，在这个世界中纯属异类，倒是让萧有些羡慕。（此乐团是“旅者之歌”这首歌的作曲者）只是，与乐团同行才几天，就遇上了敌人。那是个仅仅因为看不惯他们的自由和快乐就紧追不舍、想要赶尽杀绝的狂人，而唯有乐团团长知道一些原因。那人是十二主神之一的灵魂之神仆从，以折磨和禁锢灵魂为乐的几似邪神的灵魂之神及其仆从，是崇尚自由、追寻快乐的自己等人的天敌。\r\n    与敌人的战斗断断续续，即便多次击退对方的偷袭，萧与团长等人却始终没有击败对方的办法，毕竟每次来袭击的都是那人的灵识。众人商量最终决定设下陷阱引对方本体前来，而作为诱饵的是实力虽不算最强但危机意识最好的萧。在成功引出那个看来疯疯癫癫的敌人后，萧与其激战了半天，直到被对方封印，埋伏在外围的乐团的人才逐渐从对方反设计的咒法中醒转，一个接一个上前战斗。然而看似疯癫实则很理智的对方先是击败了最弱的两人，在被另一人重伤后竟发动秘术强占了对方的身体。下一个赶回的人被调换到同伴身体中的敌人所伤，团长最终赶来时虽被同伴提醒，却也找不到办法击杀拥有转魂秘术和同伴身体、能力的敌人，最终身体也被占据。\r\n    萧总算突破封印出来，操纵团长身体的敌人想要偷袭他却被实力相对弱些的萧反伤。萧不管实力的差距和乐团中人防范转魂术的提醒，只是一味用最强的攻击威慑敌人，终于让原本想靠团长的力量击败萧的敌人发动了转魂术。然后就，在乐团中人绝望的时候，敌人莫名其妙地消失了。他们所不知道的是，萧的灵魂深处由于他自己与那股巨大邪恶的力量的互相倾轧，犹如炼狱一般，在其周围形成了一圈各种渺小力量混杂的圈子，任何想要进入的力量都得先冲破这个小圈。至今也只有被萧本人的力量所牵引的冰之魂、以及火神最纯正的神炎突破了进来。区区一个灵魂之神的仆从的灵魂，在刚闯入外层小圈之时就已经被炼化了。话虽如此，由于需要压制体内的怪物，无法发挥本身强大灵魂力量的萧，也只有诱导对方使用转魂术自取灭亡，才有赢的希望。\r\n    \r\n    在敌人身上找到了雅儿所需要的最重要的一件宝物“定魂珠”的信息后，萧终于与乐团告别，又踏上了去参加“勇者武斗会”的路。定魂珠是这个大会的奖品之一。在到达会场前萧遇到了一个性情开朗的青年卡尔，自称魔术师的他是个精通骗术的人，在他解说下才知道大会参赛是两人一组的。正好两人都没有同伴，稍微切磋之后决定结伴同行。参加大会的人多种多样，报名处更有人对其他参赛者冷嘲热讽。\r\n    卡尔开玩笑说让萧要在气势上压倒他们，结果萧真的在众人面前运气，模仿曾经在魔兽山脉遇到的年轻武者压服魔兽那样，全力释放自己的气息（以前大多都是无意识中释放）。只是他本就没有控制气息的能力，自己的气对周围的人类完全无效，被众人当做了笑柄。不过在另一边会场的，带着大型魔兽来参赛的一群驯兽师惊讶的发现所有魔兽突然畏惧地趴在地上不能动弹了，任凭驯兽师们怎么鞭打都没用。领头的驯兽师意识到了危险，果断带着队伍放弃比赛离开了，任由其他参赛者人讥讽和嘲笑。而萧更不知道的是，自魔兽山脉旅行以来，经历和成长了许多的他首次释放自己的气息，更是惊动了四面八方、甚至整个大陆灵魂感知能力强的人。就在不少人感叹新星升起的时候，这些高人们却不知道，这颗新星还在参加他们都完全不知道的低端得不能再低端的武斗会。\r\n    虽然有些异兆让举办者和维护者警惕，武斗会还是如期进行，毕竟举办者急需聘请战士去援救自己的国家。与萧搭档的青年性格跳脱的同时实力比“正常发挥”的萧还强半分，所以前锋由萧当了。在萧很轻松地击败了两个敌人突破了第一轮时，却也在观战时发现了不少强力的参赛者。有个浑身死气的冷酷少年“鬼”，有个玩世不恭而深藏不露的青年“夜”，有个斗气强横却有些痴呆的矮人老战士及其孙子。卡尔提醒萧他们使用的都是化名，萧因为想不出名字，直接用上了云家夫妇曾给他起的名字，云霜。参赛者中也有几个自视甚高、萧却完全感受不到其强大的纨绔子弟。第二轮的敌人虽有几分实力却还是被萧和卡尔分别打倒，卡尔其实是技痒难耐才在萧还未败的情况下就换下了他。\r\n    第三轮的敌人是最初就让萧感觉有些奇特的少女，身上缠着不少绷带的少女以格斗术见长，不过萧的深层意识总感觉对方身上隐藏着些什么。面对身手敏捷、速度奇快的少女，萧也放弃了难以维持的幻化魔法与其近身格斗，灵魂深处（三世前的灵魂，在鬼封阁一战中就开始觉醒）那份对战斗的渴望和执着被激发，战斗异常激烈。终究还是灵魂更强的萧占据了上风，而为救姐姐而战的女孩死不认输、终于渐渐失去理智，在竞技场上烟尘四起时解开了化形，露出了蛇身女妖的本体，一双石化之眼向萧怒视。然而让她惊讶的是，萧完全没有石化的迹象，神魔眼被她的魔力触发，光与暗交织的双眼比她的蛇眼更显诡异。女孩望着第一双能与自己正面对视的眼睛，一时间竟然看呆了。\r\n    察觉到竞技场上异样魔力的武斗会维持者、在混乱三角带被尊为贤者的魔法师突入烟雾之中，很快发现了散发着邪恶气息的女妖。意识到事态严峻的贤者立刻使用结界封杀女妖，面对真正强者的狙杀，即便拥有异样魔力的女孩也毫无还手之力。最后却是维持着神魔眼的萧感受到了女孩的彷徨和绝望，以及她的痛苦身世（由于萧的强大灵魂力量，潜意识中就能发挥一些读心术，越是精神脆弱的人的思维越容易被他感知到，这也是他渐渐学会帮助他人的起因），奋不顾身地冲入封界中将她救了出来。萧再次激起一阵烟雾，在其飘散之前与贤者交涉、让他放过这个女孩。贤者无法忽视战斗当事人的请求，但又不能放任这个随时会酿成灾难的女妖，只答应了暂时不杀她。\r\n    然而也就在这时，整个竞技场开始了天崩地裂般的震动。在贤者的指挥下众人总算集中在一处站稳，然而天地异变还在进行，众人的周围发生空间变动，一座巨大的城堡显现、同时将所有人包裹在了其中。大部分人从未见过这样的场景，而唯有贤者和其中一个带着孙子的矮人老战士听说过此情景。“灵魂神殿”，有人将十二主神之一的灵魂之神的独特空间召唤到了此地。\r\n    灵魂神殿是一个由无数个相互串联的小宫殿组成的迷宫，一旦误入其中就很少有能出来的。即便是见多识广的贤者也对其了解不多，只好带领着大家一起寻找出路。一路上击退了不少恶灵，走过了无数看来有些特别的大殿，却完全没有头绪。不知日月的寻路让众人既疲惫更惊慌，此时矮人战士想起了朋友曾透露过的事情，灵魂神殿的各个神殿之间的连接是随机的，所有人一起走怎么都无法逃脱。贤者也说这灵魂神殿中有特殊含义的大殿总共只有七个。而这时武斗会上表现杰出的青年“夜”则说出了他想到的逃脱方法，每个大殿留一个人看守，将所有七个大殿全部占满后，出口自然会显现。\r\n    首先决定留下的是贤者，他是所有人中最有能力看守一个神殿的。然而这其实也是牺牲的表率，为了让剩下的人走出神殿，留下来看守的人与自愿选择死亡没有分别。而贤者的徒弟兼助手的年轻魔法师本来被贤者拜托带领众人，却在第二个大殿就主动留了下来。第三个大殿是已经活够了的老矮人战士留下看守，他最后将自己的孙子托付给了萧和卡尔，他看得出来，这个群体中真正会为他人着想的只有他们二人。最有威望的三人全部留下了，剩下的二十来人谁也不想作留下等死的笨蛋，在萧和小矮人想要站出来的时候也被作为同伴的卡尔给提前拉住了。无计可施的众人中又是夜站出来建议抽签，小矮人和卡尔都抽到了靠后的签，有些人则大呼小叫地不认同这签号。萧和夜的签号最后公布，一向运气极差的萧本能的以为自己是抽到了第一号留守的签，让他意外的却是夜烧毁了最后两支签，很郁闷地走到大殿之中坐下了。\r\n    众人留下了夜向下一殿前进，原本很不满自己被抽中的人在其他人的威胁下只能独自留下。随后的两人也自觉留了下来，七座大殿应该被占满了。然而众人前行走到的又是一座似曾相识的大殿，难以接受的众人展开了激烈的争吵，失去了能领导众人的贤者等人、队伍开始有了分崩离析的迹象。在萧和同伴、小矮人的劝说下，众人还是决定前行。从贤者所停留的神殿开始数，第九座大殿了，然而这里仍然不是出口。难以忍受这数天恐慌的人开始崩溃了，指责他人和诅咒命运的他们终于引发了冲突。崩溃了的这部分人被另一部分顺位较差蓄谋已久的人引导着攻击萧等几人，战斗一触即发，所有人战在了一起。在比赛之前与萧结怨的几人趁他不备时发动偷袭，不知为何灵魂力量一直在弱化的萧在后方一人的偷袭下轻易昏倒。最后还是他曾救的蛇身女妖的女孩挺身为他挡了那夺命一剑，女孩最后关头显出真身，将前方的两人一起石化了，自己却也丧命于对方剑下。此时才发觉萧的异常的卡尔和小矮人赶过来保护他，混战结束后活着的就只剩下萧这边的三人以及那个冷酷的鬼族少年了，萧却还昏迷不醒。\r\n    剩下的三人商量办法，鬼族少年冷漠地说继续抽签的顺序留人，然后原地坐下不再动弹了，其他人死光后，他就是最先留下的了。卡尔只好背起萧与小矮人一起前进，下一关留下的则是纯真善良的小矮人。然而即使到最后，扛着萧的卡尔发现眼前的却还是迷宫，已经无法可想的他，也只能麻木地照着之前的办法行动——牺牲自己让萧去闯下一关。他知道萧不会丢下他不管，在萧苏醒以前在大殿正中找到了自我封印的机关，确保在自己还活着的时候“占据”了这座神殿。\r\n    苏醒的萧误以为卡尔已经死在了结界之中，其他同行的人也都消失了。不知为何，他潜意识中知道了众人自相残杀的结果，内心更加脆弱、明显感觉到自己无法压制体内的怪物了。恍若行尸般向前走的萧却最终走出了灵魂神殿，而站在神殿之外等待他的人也让他十分意外，竟是众人之中最先提出抽签决定生死的青年夜。他先是假惺惺地祝贺萧突破了尊神（灵魂之神）所设的迷宫，而后又讲起了他们之所以连续多次留人“镇殿”却走不出迷宫的原因：留守在第四殿的夜本人当然在众人离开之后就立刻离开了位置，而第五殿那个“机灵”的人也在估摸着其他人突破了两殿后自行离开寻找出路了，第七殿的一人也与之相似，正在迷宫之中乱窜、甚至都无法再到达核心的七个大殿。所以真正执行了“镇守”神殿任务的就是第六殿的那个已经绝望的武斗会参赛者，以及自愿牺牲的贤者师徒、矮人祖孙、鬼族少年和卡尔，总共七人，所以最后的幸存者萧才得以走出灵魂神殿。萧冷声向他问起解救众人的办法，夜略带遗憾地告诉他，他们已经没救了。在灵魂神殿那不断吞噬灵魂力量的结界中，他们绝撑不过三天。毕竟连灵魂力量超乎想象的萧都在不知不觉间被吞噬了力量、变得虚弱不堪，实力只在中下的那些人只会更惨，大概在不久之后他们的灵魂就会被抽离身体、成为恶灵永远徘徊在这座迷阵之中吧。\r\n    萧用更冷冽的声音质问夜为什么要这样对待他们，夜则只是无聊地说道，原因全在你身上，这场戏本就是为你而演的。萧对他的话感到莫名其妙，夜则直接说出了他的目的，他的目标与曾经在鬼封阁中所遇的冥皇相似，都是萧体内的那个强大灵魂。作为灵魂之神的“侍者”（每位主神都有的代言人，不知道该怎么称呼，类似于“使者”“守护者”“守护骑士”“代行者”），夜对于灵魂的研究相当深，而且他自己体内也同样有一只“怪物”，所以当他从已经疯掉的尊神的仆从那里获得了萧的信息，就迫不及待地想要来与他交手试试。想要收取那个“怪物”，前提当然是让作为宿主的萧的精神崩溃，然后才能解放出那只不知名的怪物。\r\n    萧勉强汇聚魔力攻击青年，虽然在濒临崩溃的边缘还能发挥力量的萧让对方有些吃惊，但战斗力不在一个层次的青年根本无意去躲开他的攻击，能够随意转换实体为魂体的他，以如今的萧的魔法根本伤不到其分毫。在接连被对方重伤三次之后，萧虽然仍勉强站立，却再无法维持清醒的意识了。取而代之的，是在冷笑中夺得了多年来梦寐以求的身体的怪物。直到此刻，留存最后一点意识的萧才终于正视体内这个怪物般强大的存在，然后他才发现，这个灵魂虽然庞大而奇特，却与人相似。萧还隐约感觉到，自己体内的还只是“他”的一小部分，若要形容，大概应该是以战斗为乐、如剑般锋利的战魂。萧本身那强大的灵魂力量就是在与这股力量的倾轧中成长起来的，受它影响，萧即便表面性情平和、内里却也暗藏无尽锋芒。\r\n    抢占了萧的身体的战魂向眼前的夜发动狂攻，夜那化魂的能力对它无效，本就身为魂魄的战魂只是稍微扭曲了空间就将正要化为无形无质的灵魂的青年给抓了回来。而即便之后青年在反击中打退战魂、再次化魂成功，战魂也双手撕开了灵识与物质的边界，强行追击过去。面对穷追不舍的战魂，原本胸有成竹的青年被打得节节后退，没想到能被凡人压制住的战魂竟然会这么强。在两次被战魂重伤后，青年也解开了自己体内那神兽的封印，放出灵魂之神的“守护者”来与战魂相拼。两大神级力量对抗，即便还处于灵魂神殿的作用范围，也还是引起了小范围的天地异兆。\r\n    激烈的争斗，让夜既满足也有些恐惧。一直以来，因为被封印在体内的“怪物”的关系，他的精神几乎就没有正常过。虽然以玩世不恭的态度蒙混了过去，但他内心深处一直有着对那只神兽的恐惧和厌憎。这份怨天尤人的心态直到此刻他才能看清，之所以执着于将萧逼疯，或许更多的是同类之间憎恶和攀比吧。然而，真实情况却有些不同，他自己是被当做守护神兽的容器而培养至今的，而据他推测，萧应该是被战魂直接侵入体内，却依靠他自己的意志压制至今的。最后还是战魂比守护神兽更胜一筹，然而夜的意志还清醒，在他真正认识到自己的“小气”和“软弱”之后，竟然做出了一项帮助萧的决定。“就让你在这份无尽的折磨中继续挣扎吧。”留下这句话，夜抢回身体的控制权，抓住躲闪不及的战魂，强行引爆了自己和守护神兽的灵魂。\r\n    灵识界中神级力量的爆炸，虽然没引起大的物理变动，却也让不少灵魂感知能力强的高人心惊胆战，害怕人界因此崩坏。只是随着灵魂神殿之争的结束，神殿重回虚无，这些人也查不出个所以然来了。\r\n    \r\n    \r\n    \r\n    \r\n    \r\n    \r\n    \r\n    \r\n    \r\n    \r\n    \r\n    	第五卷 灵魂的试炼			Paragraph	2021-05-30	30000547
31000073	600	2021-05-30	目录：\r\n1.漫无目的的流浪\r\n2.无邪的少女\r\n3.吸血鬼之家\r\n4.破灭的命运\r\n5.孩子们的梦境守护者\r\n6.骗局\r\n7.怒火\r\n8.杀神\r\n9.合作\r\n10.王国\r\n\r\n\r\n    醒过来的萧发现自己正躺在一片无人的荒野之中，全身重伤得无法动弹，然而灵魂深处却相对平稳、舒适。饿得难受的他无法起身觅食，同时也就得不到补充体力的办法，陷入了眼睁睁饿死的窘境。正在无计可施时，一只秃鹰以为他死了，飞下来啄食他的身体，被他奋起最后一点力气抓住了。难以动弹的他想要像往常一样运用火系魔法将鹰烤熟，却在一瞬间直接将其烧成了灰烬。在第二只鹰也同样被烧成灰后，萧才知道自己完全无法掌握魔法的力度了，最终只能生吃抓到的鹰。\r\n    就在原地休养数日之后，终于有些力气的萧开始找寻道路，开始新的流浪。曾经收集到的药品什么的早在与夜的战斗中烧毁，萧也无意再次去收集了。正想要努力往自由都市的方向赶路，但身无分文、衣衫破烂的他始终需要先找个村庄落脚。\r\n    \r\n    （这中间还可以插些其他故事，但没构思好。）\r\n    \r\n    萧在山野间行走时偶然遇上了一个无邪的小女孩，被她带回了她所住的村庄。这个村庄透露着诡异，其中的居民对小女孩很亲切，对外来者的萧则表面和善、暗中警惕。本着不去探究他人秘密的心态，萧在这里住了几天。在他终于决定离开时，因为心中的警惕，恰巧就在这一晚里发现了住民们的秘密。萧看到其中一个丈夫躲着众人在让实在无法忍耐吸血冲动的妻子吸血。而这场景被村长发现，两人被其他村民们包围了，似乎要遵循村规被惩罚了。原本想悄然离开的萧也被夜视能力极强的村名们发现，只好走了出来。\r\n    被外来人知道了村子的秘密，村长却并没有显得太过的愤怒或慌张。他带着萧以及那对夫妇到自己家中，顺带着讲起了村中的事情。原来这些人并非一开始就是吸血鬼，而是因为一场灾难，被纯正血系的吸血鬼所“污染”，才染上了“嗜血”的特性。他们并未完全变成血族，至少并不怎么害怕阳光。只是数十年来这“嗜血”的特性越来越强烈，时至今日已经有不少人忍耐不住了。而且村里极难有小孩出生，婴孩的血族特性更为明显。所以当村长捡回天真无邪的小女孩时，村民们都像对待自己孩子般疼爱她。在村长的领导下，村民们达成了共识，至死都与这令人痛恨的血族特征抗争，所有忍耐不住的人都或者自杀、或者被逐出村子，当然还有所有人都不能伤害如同大家的女儿、孙女般的小女孩。\r\n    萧虽然相信了村长的话，但毕竟对小女孩生活在这个人群中的情况有些担心，决定多留两天以确定村民们真的不会伤害她。然而也就是这两天，在他确认村民们的善意的同时，村子却遭受了光明教会的“肃清”。遭受光明魔法的打击，村民们忍耐多时的血族凶性被激发，双方在村庄中展开激战。而萧，因为村长的拒绝和本身的外来者身份，难以出手帮助失去理智、彻底被吸血冲动支配的村民，只是在最初受村长之托将小女孩提前带走了。\r\n    当萧实在想知道结果而独自返回时，村庄已经成为一片废墟，连尸体都已烧成灰烬。虽然村长曾说他们早已有这样的觉悟，萧还是忍不住感到一阵悲凉，同时也对一直自我宣扬为正义的光明教会产生了一丝厌恶，他们的正义太过彻底。\r\n    带着小女孩在混乱三角地带偏北的这片区域行走，本想早些赶回自由都市的萧再次迷路，最后还是在小女孩的带领下，来到了一片奇异的宁静山谷。现身迎接萧和小女孩的是一个看来成熟稳重的青年常风，他带着两人走进谷中的山庄，那里住着许多小孩，全是附近一片失去父母的孤儿。无家可归、难以生存的孩子在这一片迷路时，就会被常风领回山庄居住，直到他们能够自食其力。实际年龄比萧年长近十多岁的常风是这个“小孩子的世界”的守护者。\r\n    萧感觉这景象似曾相识，自己回忆才发现，这是已逝的姐姐易玲曾说过得景象，她曾经就在这个山庄中照顾着许多孩子，最后却因为不知名的敌人的破坏，山庄被毁，孩子们也被掠走了。当萧说出此事时，原本常带微笑的常风也突然面色大变，因为他发现萧身上竟有易玲那片刻不离身的云纱玉片。勉强将小女孩交给山庄中照顾孩子们的女孩琪琪后，常风立刻将萧带到了无人之处，逼问他易玲的下落。\r\n    得知常风就是姐姐易玲的旧识，萧感到无言以对，毕竟易玲几乎可说是被萧所杀的。因萧的无言而陷入暴怒的常风大打出手，力量强得让已经因为体内怪物的虚弱而接连突破了多个境界的萧都感到毫无还手之力，这是萧所面对过的任何强敌都难以企及的绝对力量（友方的布莱特、光等人除外）。常风几乎打得萧遍体鳞伤，但毕竟没有痛下杀手，看着萧胸前那片云纱，他大致也能猜到，易玲即便是因萧而死，却并没有怪他的意思。只是常风的遗愿，却再没有实现的机会了。\r\n    萧在山谷中养伤几天，确认小女孩愿意与其他孩子一起生活后，正准备离开时，却不想自己的“灾厄”宿命又给这个宁静的山谷带来了厄运。\r\n    虽说山谷异常隐蔽，除了无家可归的孩童外几乎到达不了“入口”，但山谷本身在这片不法地带却是十分有名的。许多人都觊觎着这样一个神奇地域、以及常风那神一般的绝对力量。这次又有人入侵了这个山谷，在使用了极其特殊的隐藏魔法避开了常风后，敌人装作行商骗着年幼的孩子们走出了山谷，到了常风的力量范围之外。\r\n    萧带来的小女孩和另一批孩子也被另一伙神秘人给指引去了另一个方向。萧赶紧追出山谷，却被对方的迷阵所困，出阵后就刚好遇见城主府的人追杀孩子们，地上一片血迹。被常风打怕了的敌人一出手就是大范围魔法，孩子们连尸首都没有留下。\r\n    而另一边，常风也循着琪琪的踪迹追出了山谷，然后遇上了过去与琪琪是玩伴如今已成为纨绔的少年，少年千方百计要把琪琪从常风这里拐走，而且越来越不择手段。常风自然要出手再教训他一次，然而毕竟是在谷外，早有准备的少年以及手下用秘法将常风制住了。而后少年更是要以消灭神魔的手段消灭常风，却被挣脱束缚的琪琪以身犯险破坏了。而后常风也并没有能够活下来，毕竟支撑着他活到现在的，也只是来源于琪琪的个人的信仰。因为意料之外的情况而恐慌的少年准备逃跑，却正好遇到了一脸杀气冲来救人的萧。一股萧所不知道的情绪充斥着他的头脑，不顾一切地追杀对方。然而这个少年身上宝物太多，既有防御的护符，也有救命的神器，最后还是让他用空间移动的魔法卷轴逃跑了。不过萧全力解放灵魂力量的话，神识所能探查的范围之光超乎寻常，很快就找到了对方的所在。\r\n\r\n    一路追杀少年直到统领整个三不管地带的城主府，七位城主正好齐聚与此商议要事。其中一位城主率先出手，然而本以为可以是轻松解决的他遭到萧的无畏地反击，打成了平手。作为少年父亲的其中一位城主本想拉下老脸来求个情，然而从出生以来第一次认知到“愤怒”的萧，心中只有一个念头，血债血偿。更因为对方是在这个广大地域权势无比的王者，长期压迫他人的存在，萧的认知就更简单明了，杀。\r\n    小喽喽在愤怒得不知道留手的萧面前不堪一击，城主府所在的整座山都被他的火焰中烧毁。身为王者的七个领主只能自己出手了，而萧，毫无惧色，甚至可以说，抛开一切束缚而暂时爆发的他，本就不是什么人类的王者可以阻止的存在。\r\n    以一敌七，以弱战强，他选择了最简单粗暴的战斗方式，长枪突刺。幻化出的火焰冰枪，以有敌无我的气势冲向最普通的敌人，天地变色之中，一击必杀。而后是突然撤离，格挡躲避其他几个敌人之后，再次举枪冲杀，突破敌方最强者的守护，击杀第二个领主。接着是第三人、第四人。先后在互攻中被砍伤手臂，切开胸膛，然而仍然杀气腾腾，第五人已经同样一枪贯穿了他，但却没来得及破坏萧的心脏，第六人也是最年长最强的一人，却也在这少年人无知无惧的一枪中被贯穿。最后一人，在萧再次提枪时，已然吓破了胆，疯狂逃窜。然而其实抛开束缚全力发挥的他，已然走到了尽头，加上全身的伤势，萧的身体、其实几乎已经站着死去了。\r\n\r\n    逃跑的领主也被神秘人拦下抓住了，这伙人正是先前故意引着山谷与领主府争斗的元凶。一直反抗着领主府的统治，妄图在三不管地带建立新势力的组织。只是连他们也没有想到，仅仅是想要一个契机而挑动的纷争，居然直接把火烧到了城主府，而且，仅凭萧一人之力，竟然屠灭了统治这个地域上百年的七大领主。\r\n    组织的首领喜出望外，并且立刻命人回收了萧的尸体，准备用移魂大法获取这具躯体。然后是光明正大的举旗攻伐，趁着突然失去七大领主的意外，占据了大片地域，为建国打下了基础。然而就在前途一片光明的时候，移魂大法却出现了意外，转移到萧身体里的首领的意识完全失去踪迹，取而代之的是复活过来的战魂。因为死亡萧的灵魂暂时陷入沉寂，而那战魂的力量却失去了压制却慢慢开始复苏。所以身体复苏时，首先掌控身体的却是战魂。首领的儿子，也是想出“借势”谋划的少年，在即将被战魂格杀的瞬间，突然脱口而出，说山谷里的孩子们还活着。因为这一句话而回神的萧，再次压制住了战魂，追问于他。原来山谷外那一片血迹是少年布的局，偷梁换柱一般把本来要被城主府的人杀害的孩子们都救下了。其中，也包括萧带去的小女孩。\r\n\r\n    在这个组织里养伤的时候，陆续与其中的人接触，特别是作为少主的少年，萧也渐渐理解了他们的理念。至少，在这个三不管地带建立起国家，确实能够让人民的生活稍微稳定一些，做得过且过的佣兵和赏金猎人的人，也会少一些吧。\r\n    然而事情也并不顺利，这个地带同样拥有极大力量的另一个组织的来袭，打乱了他们的计划。而萧，则顺其自然的帮他们挡住了来敌。同样年轻的两个战士已经拥有与萧相当的身手了，其上还有四大护法，再上还有两大主教，以及最终Boss的神秘剑士。萧也知道以自己的力量难以应对，只能竭尽全力，多争取一些时间。只是，对方神秘剑士的出手，差之毫厘就将他斩于剑下，即便他也动用全部魔力，引发了天地异能相助。然而对方不知为何却又主动退却了，或许是因为萧的存在，也或许是知道这边已经充分反应过来，有反击之力了。\r\n    然而双方的下一次对面则是在王者墓中，作为那位王者的后裔，少主探寻旧墓希望能找到建国的线索。然而在与敌方大打一场之后，反而只有萧一个人进入了墓地深处，见到了王者的魂灵。王者问萧，有没有兴趣称王，萧几乎没想过就拒绝了，相比起他来，少主更是个深思熟虑、面面俱到的人，更适合当王。而王者只能苦笑，相对于王，他的这个后人更适合当个辅佐者。\r\n\r\n    从墓中出来，再次击退了神秘剑士。少主他们的建国所需的东西也凑齐了。在约定一定将这个国家治理好之后，少主与萧，各自走上了不同的道路。\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n    \r\n    \r\n    \r\n    \r\n    	第六卷 孤独的流浪				2021-05-30	30000547
31000074	700	2021-05-30	目录：\r\n1.\r\n2.小小佣兵团\r\n3.镇团之宝\r\n4.\r\n5.独自寻来的雅儿\r\n6.医老\r\n7.东方之行\r\n8.陌生的熟悉感\r\n9.猴脸和尚\r\n10.轩辕神剑\r\n11.解封与认主\r\n12.返程\r\n13.迷途\r\n14.亡故的骑士\r\n15.血色城堡\r\n16.生命之神\r\n17.雅儿的过去	第七卷 血色的城堡			Paragraph	2021-05-30	30000547
31000075	800	2021-05-30	目录：\r\n1.风魔之枪\r\n2.远行归来\r\n3.曾经的龙骑士	第八卷 流浪的佣兵团			Paragraph	2021-05-30	30000547
31000076	900	2021-05-30	目录：\r\n1.龙谷之行\r\n2.神龙一族\r\n3.七彩亚龙\r\n4.亚龙骑士\r\n5.世界之树\r\n6.被选择的人类\r\n7.大地之心\r\n8.圣殿(众神之言)\r\n9.神秘的内殿八厅\r\n10.光的独语	第九卷 龙谷、圣殿与世界之树			Paragraph	2021-05-30	30000547
31000077	1000	2021-05-30	目录：\r\n1.返程的阻碍\r\n2.光明大教堂\r\n3.睿智的长者\r\n4.传授\r\n5.施加封印\r\n6.偷袭者\r\n7.神剑\r\n8.神之殇\r\n9.躁动的世界\r\n	第十卷 神之殇			Paragraph	2021-05-30	30000547
31000078	1100	2021-05-30	目录：\r\n1.与光同行\r\n2.生死百态\r\n3.剑与心\r\n4.远古结界\r\n5.冥月之境\r\n6.守护者传说\r\n7.诸神之战\r\n8.世界之巅\r\n9.末日浩劫\r\n目录：\r\n1.混乱与无措\r\n2.阴谋和阳谋\r\n3.危机还是胜机\r\n4.矛盾激化\r\n5.争斗不息\r\n6.大战再起\r\n7.神秘的呼唤\r\n8.守望者之威\r\n\r\n\r\n\r\n\r\n	第十一卷 末日浩劫			Paragraph	2021-05-30	30000547
31000079	1200	2021-05-30	目录：\r\n1.无尽的追杀者\r\n2.雪狼之乡\r\n3.猎物与猎人\r\n4.魔族圣地\r\n5.诡异的少年\r\n6.长老\r\n7.侵入者\r\n8.逃离与失散\r\n9.迷失之林\r\n10.导航者\r\n11.不可饶恕的贪婪者\r\n12.仁君\r\n13.生命与信念\r\n14.十字将军\r\n15.血魔一族\r\n16.雷神骑士\r\n17.惨败\r\n18.天雷地火\r\n19.最后的胜利者\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n	第十二卷 争锋			Paragraph	2021-05-30	30000547
31000081	1400	2021-05-30	目录：\r\n1.名动天下\r\n2.杀身之祸\r\n3.通缉令与光明骑士团\r\n3.黑暗的阻击\r\n4.火神之威\r\n5.前途多难的逃亡\r\n6.零星的离队者\r\n7.埋伏\r\n8.舍命的断后\r\n9.焚心之炎\r\n10.光明方的杀手\r\n11.枪圣的追杀\r\n12.生命女神的奇迹\r\n	第十四卷 生死相隔			Paragraph	2021-05-30	30000547
31000082	1500	2021-05-30	目录：\r\n1.死里逃生\r\n2.茫然\r\n3.扭曲的世界\r\n4.荒漠\r\n5.神秘组织（可以与守望者相关）\r\n6.大荒漠食尸\r\n8.复仇天使\r\n9.破碎的温室\r\n10.破坏神之矛\r\n\r\n夙愿之神的代行者	第十五卷 守护之心			Paragraph	2021-05-30	30000547
31000084	1700	2021-05-30	目录：\r\n1.大邪神的邀请\r\n2.不可能任务\r\n3.奇迹创造者\r\n4.剑仙灵修\r\n5.萧的身世\r\n6.火神知难\r\n7.造化玉牒\r\n8.魔君之女\r\n9.降临之子\r\n10.三战\r\n11.内殿（光明、混乱、憧憬、痛苦、竞技、轮回、迷惘）\r\n12.试炼之厅\r\n13.誓言	第十七卷 试炼之厅			Paragraph	2021-05-30	30000547
31000087	2000	2021-05-30	目录：\r\n1.南方的神器\r\n2.雷神风圣\r\n3.东征军团\r\n4.后援部队\r\n5.乱流之海\r\n6.海怪的奇袭\r\n7.霸者之气\r\n8.抵达\r\n9.密林深处的呼声\r\n10.黑色闪电\r\n11.圣城\r\n12.熟悉的陌生人	第二十卷 东征之路			Paragraph	2021-05-30	30000547
31000088	2100	2021-05-30	目录：\r\n1.破落的旅店\r\n2.同是天涯沦落人\r\n3.前世的缘分\r\n4.平静的日子\r\n5.曾经的誓言\r\n6.挑衅者\r\n7.灵魂之神\r\n8.混沌之力\r\n9.灭神\r\n10.被诅咒的圣剑\r\n11.回归	第二十一卷 今世前缘			Paragraph	2021-05-30	30000547
31000089	2200	2021-05-30	目录：\r\n1.平步过洋\r\n2.不自量力的挑战者\r\n2.霸者归来\r\n3.喧嚣的世界\r\n4.形势逆转的魔法帝国\r\n5.混乱不堪的铁血帝国\r\n6.左右为难的荣耀帝国\r\n7.疯狂的死灵军团\r\n8.光与暗的联手\r\n9.不可计数的阻击者	第二十二卷 霸者归来			Paragraph	2021-05-30	30000547
31000090	2300	2021-05-30	目录：\r\n1.沸腾的世界\r\n2.过早的阻击\r\n3.障眼法\r\n4.同时响起的战斗号角\r\n5.龙战于野\r\n6.世界之树\r\n7.神魔齐聚\r\n8.众神竞技场\r\n9.诸神的挑战者\r\n10.毁灭者的阻挡\r\n11.加百列的能力\r\n12.大地之神\r\n13.最后的助力\r\n14.赎罪镇魂曲\r\n15.天神之仪\r\n16.尾声（最后的挑战者）\r\n17.尾声（神灭律）\r\n18.尾声（萧之城、等待的人）\r\n\r\n\r\n\r\n    这或许是众多防线中最薄弱的一面吧，萧看着面前的人山人海。\r\n    四方大陆的各色人等齐聚，原本嘈杂不堪的山头，因为萧的出现，瞬间变得悄无声息了，齐刷刷的望过来的目光中，有愤怒、有冷漠、有畏惧，却居然没有从前的萧最常遇到的嘲笑。毕竟是需要聚齐全世界力量阻挡的人物，已经没有任何人敢于嘲笑他了。\r\n    众人居然默契的等着他先开口。\r\n    “我想你们也没有可说的吧。”萧挥剑，“不想死就把路让开。”强横的霸气释放出去，气息像爆风一样向四面八方冲击出去，现在他每一次释放霸气，几乎都会传遍整个世界。\r\n    即便早已得到提醒，满山遍野的人也还是瞬间倒了大半，其他人也同样不好过，几乎都是摇晃几下才能站稳。每个首次感受到这样强得离谱的气势，都不免震慑不已。然后其中曾经体验过的人最先做出了反应，拔出武器，冲向了萧。而另外极少数几乎没有收到霸气影响的真正的强者，则站在原地想要先观察这个向全世界挑战的疯狂的敌人。\r\n    最先冲上来的是有过死仇的西大陆的几波人，凡是被魔剑的紫色剑气沾到的人全都化作了飞灰。\r\n    北大陆的高手相对要强不少，几人的攻击阵型运用得很巧妙，萧原本还想稍微适应一下魔剑的运用的，却被逼得不得不释放霸气了。然而更令他意外的是，就在他释放完霸气的一瞬间，一柄锋利的武士刀从他喉头擦过，差一点被人取去了脑袋。忍者，持着妖刀村正的忍皇，如果萧还算个人的话，这一到已经要了他的命。只可惜，妖刀的侵蚀性还比不上萧所持的诅咒圣剑，而他也早已经不是依靠身体维持生命的普通人。萧重新审视了已经显形的忍者，妖刀对魔剑，被限制住大部分能力的萧，和十阶中的非常特殊的忍皇，又是一场杀手间的对战，不容半点松懈，一个细微的错误就将导致的战斗，比的毕竟是战斗能力，更是韧性和厮杀的直觉。\r\n    东方的剑阵比之前边的攻击阵法又更强了，无论如何都摆脱不开追击的飞剑，又攻击不到九个阵眼上的仙术士的萧左支右绌。好不容易找到机会出手，却总被阵法边缘的较弱的仙术士用性命挡下。而就在这样危险的时候，体内的某些东西却在觉醒，更是让他分散了注意力。被一个年轻气盛的仙术士的飞剑洞穿了符文铠甲和胸腹。就在这时，被封印的曾经三世的记忆完全苏醒，萧吟唱御剑诀强行抢过了正向他刺来的飞剑的控制权。第一世在地狱般世界中的无限的杀戮，第二世引导死亡，洞悉冥界真理的灵魂引路人，第三世知晓世界，体验人情人性的修仙者，以及现世，挑战命运、引导世界的他自己。\r\n    东方的两个强到离谱的散仙一副挺亲热的向萧搭话，却反被萧利用了，遭到以为他们是萧帮手的阻击部队的拼死阻挡，反倒让已经满身是伤，摇摇欲坠的萧跑掉了。\r\n    追击断断续续，萧变换着路线，终于在一条路口，遇到了早已决定不与之一战的“熟人”，刺客璇。\r\n    “为什么要挑起这样一场十死无生的战争，你。。不能跟我。。。”\r\n    “的确走错一步就会死。”萧难得的轻笑了，“不过即便成功了，我也还是会死的。”\r\n    “那为什么。。”\r\n    “因为这么做，至少，”他说，“我能把绫姐还给你。”\r\n    “你走吧。这里我帮你挡下。”她背过了身去。\r\n    “接着。”一件小东西被抛了过来，她自然而然的伸手接住，打开一看，却是他一直当做护身符般保存着的那块蓝玉。“似乎是打开 家的宝藏的钥匙，不过对你我来说，是绫姐的遗物。”\r\n    \r\n\r\n\r\n    世界树下，独自一人面对两位大天使和死神的萧的面前，突然又出现的了大邪神眷族的三魔神。突然而强横的一次袭击，被运用了“九天十地”的冥月心挡了下来，甚至以偏神级的实力反伤了三位主神。九天十地的天罗地网笼罩住所有敌人，原本想牺牲性命争取时间的心却被他拦住了，“这不是需要牺牲你去完成的事情。”\r\n    二对六，绝对的不利，但是两个人都没有一丝胆怯。一个已经坦然接受死亡，另一个原本就没有成长到会恐惧的程度。\r\n    短短的几招交手，萧自己就已经险象环生了，反倒是背后的冥月心，同样面对三位主神，还能正面牵制住，果然不愧是专为克制邪神族而存在的战斗种族，冥月一族的剑使。\r\n    这次帮萧挡下大天使们攻击的是斧圣和枪神，剑皇布莱特似乎是被早想挑战他的几位剑圣前辈给拦住了。小皇帝，东方的灵修，南大陆的穆林先知还有冥月幽也先后聚集，诸神的挑战者集齐，给了萧向世界最高层挑战的势力。\r\n    冥月一族最后的两人面对死敌的邪神眷族，萧特别嘱咐灵修注意对方中力量最特别的死神。然后，众神竞技场（竞技场），发动。\r\n    除了中心的竞技场地外完全白色虚无的世界中，双方的对峙渐渐清晰起来。\r\n    枪神和斧圣对两位大天使，灵修将死神拉到另一个独立的竞技场中，心以冥月一族的身份面对作为宿敌的三魔神，冥月幽则为自己仍被拉入这个空间而庆幸。小皇帝掌握着萧给他的竞技场的核，还有面对众多高阶天使、死神仆从、邪神眷族，还得注意着别被几个主神的大范围神力波及。\r\n    冥月幽对创造之神，幽用上了冥月一族最后的武器，先祖之魂。用咒印召唤出过去的冥月一族最强的战士，七使中的六位（心完全继承了剑使之位），以音律和傀儡打击对方。而创造之神则即兴发挥的制造了一个巨型怪物，以巨大的破坏力和强横的肉体与六使对抗。\r\n    冥月心对战神、炼狱之神，幽剑、绝剑、灭剑、幻剑、天剑、。六式剑法变换万千，即便是战神与炼狱之神夹攻，也暂时拿她没有办法。\r\n    \r\n    斧圣主攻，枪神主防，面对两位大天使长。两人的独自作战毕竟不如对方，但是配合则就不同了。即便受了不轻的伤，也还是能够坚持下去。小皇帝在一边辅助，同时也对付着众多高阶天使。\r\n    灵修对死神，完全是他的法术表演。、三昧真火、诛仙阵、捆仙索、蚩尤血脉、盘古血脉。以一人之力布下诛仙阵，虽然打得死神遍体鳞伤，但是没能消弱其根本，而强行布阵的灵修自己反而受了不轻的伤。危急关头用已经破损的捆仙索救了自己一命。然后，被逼到绝境的灵修，体内的蚩尤血脉苏醒。死神的气息被强横的凶神蚩尤完全压制，正是小偷遇上强盗，完全的克星。一向自大无比的死神从心底里产生了恐惧。\r\n    不过，随着战斗进行，死神还是发现，对方的气息虽然强横，但是力量完全不足，毕竟是以人类的身体降神，而且还是被压抑很久的神灵，毕竟太过虚弱。无法对他造成致命的打击。从恐惧中恢复过来的死神破掉了灵修的降神术，似乎已经伸手就能捏死他的死神没有想到的是。对方已经找到了，能够毁灭他的方法。盘古的血脉苏醒，然后是，独自解开竞技场，借助于和盘古同源的世界之树的无限的生命力量，化作万丈光芒击向死亡之神。灵修与世界之树的同步率，瞬间超了萧几倍。弄得联盟方完全搞不清楚情况了，对方的主角难道并不是萧。\r\n    \r\n\r\n    从竞技场出来，刚要进入世界之树的萧的头顶，飞来的亚龙，正是碧血之风。云看来有所损伤，也是一个先绕过远路的人。\r\n    “去看了一眼曾经的梦想。”云有些惆怅的说，“确认自己超越了梦想，却似乎并不是件很开心的事。”他已经以一人之力击退了大陆最强的飞行军团，天空骑士团。\r\n    “恩。”萧的声音也很平静，“我也南大陆找到了曾经的梦想，不过最后还是走到了这里。有时真的不知道，自己是否真的在掌握自己的命运了。”\r\n    而在两人进入世界树之后，姗姗来迟的布莱特，则替他们挡下了，后方陆续向世界树集中的敌人。面对如山如海般的强敌布莱特遇强则强的特性发挥得淋漓尽致，王者之气缠绕，他棕色的头发金光闪耀，随着斗气向上飘动。（简直像超级赛亚人）作为这世间不世出的强者之一，他同萧一样有挑战世界的资格，此时虽只是做了一个拖延时间的配角，却也是后世所称颂的英雄。\r\n\r\n\r\n    在开门之前，萧又遇到了理所当然会出现在这里的劲敌，继承了“毁灭者”称号的他。因为和魔剑的对抗，完全发挥不出本身实力的萧，对上他完全没有胜算。所以，云正要代替他与之对抗，然而完全守住通道的他并不给萧独自前行的机会。而且，更重要的是，云还完全不是他的对手。仅仅过了几招，萧就已经量到了两人间实力的差距。而有些着急的云，更是被对方故意露出的破绽吸引，受了重伤。\r\n    果然还是需要萧来面对了，毕竟他才是继承了“守护者”意志的人。没有机会，如果是正常对战。其关键只在于一点，萧如果减弱自己的灵魂力量，解放魔剑，也就是让魔剑控制自己，就有机会。但是，如果这么做，身体被魔剑占据，就没有来这里的意义了。或者，萧也就成了他的同路人了。\r\n    最后，萧还是解放了魔剑。拥有主神级力量的诅咒圣剑，其战斗能力果然不同寻常。已经达到人类巅峰，面对任何神明都无需畏惧的毁灭者，也还是跟不上它的战斗速度。萧的瞬移被运用得淋漓尽致。一剑对碰，巧妙地力量运用，逼退了他，然后瞬移至背后，在对方回剑斩到身体的瞬间才第二次瞬移，又是背后。在对方用能量盾准备硬抗他的一剑时，又一次的瞬移，这次将对方的能量全引向这方，然后，最后的瞬移，在出手以前就已经让对方因为反转能量受了内伤。一剑刺去，胜负已定。\r\n    然而真正重要的还是，被魔剑占据了身体，萧似乎是已经放弃了。不过令他意外的是，萧的痛苦的加剧，然后，居然，萧的意识居然又回来了。原来魔剑不懂得已经破损不堪的萧的身体的维持方法，毕竟他都是完全靠精神力量在操控着身体的各种生理机能以维持生命。由于不能及时维持生命，无法可想的魔剑只好主动退出，又将控制权交还给了萧。    \r\n    “你赢了。不过你想守护的东西，和我所要毁灭的东西，其实有太多牵连的。”\r\n    “等我这件事过后，你会发现需要毁灭的存在会少很多的。”萧轻笑，现在的他，总是那么平静自然。\r\n\r\n    这样使用魔剑其实只能有一次，萧本想以此对付最难缠的敌人的，可惜，已经没有办法了。\r\n    如果说众多的敌人中，萧最没有自信战胜的，大概就是他没见过的剩下的最后三个主神之一的加百列了。毕竟对付素未蒙面的大地之神他有一半的把握，同样神秘的冥神则应该不会是他的敌人。\r\n    就在打开世界之树中心地区的大门的瞬间，毫无征兆的强大灵魂力量侵袭而来，从来没有在灵魂较量上被人压倒的萧的意志和思想，竟然在那一瞬间完全被暴露在了别人面前。加百列，果然是主神中最接近智慧之神的存在。\r\n\r\n    看到萧真实想法的大地之神当然不再阻拦他，然而后边想要阻止他的光暗同盟仍在赶来。\r\n    萧的仪式，诅咒三圣器的仪式，开始。萧和世界之树的契合度和同步率渐渐升高。\r\n    \r\n    降临之子等人赶到时，第一个阻碍居然会是大地之神。不过，他们显然也早预想过大地之神这个不可测因素了。暗之君的黑暗圣剑先发，然后是更强力的降临之子挥舞光明圣剑的一击，身为主神的大地之神也不敢随意接下那么强烈的攻势，藏身进入了世界之树中。然而联盟对付他真正的杀手锏却是后方的十七位修道士，齐聚的大型吟唱，居然是借助世界之树的力量来封印能够在世界之树中任意穿梭的大地之神。十七位与大地之神的同步率超过三十的人物共同的祈祷，直接在世界之树内创造了封印结界，将大地之神困在了很小的一块范围内。\r\n    \r\n    刚刚封印住大地之神的联盟众人因为突然而来的一条巨鞭的横扫，自然地全员跳起闪避。然而就在这一瞬间，被萧拉入了另一个空间，混乱星域。流星、陨石群，光是面对这残酷的环境就已经让十阶的光明骑士们苦不堪言，更别说，其中还有那个，最擅长乱战的萧。而令降临之子疑心的是，面前的萧的眼睛，那是已经很久没有见过的，神魔眼，还有那完全没有人性的冷酷表情，完全不像他所认识的萧了。\r\n    而世界之树的大厅中，萧其实还在进行着仪式，将降临之子等人拖进混乱星域的，是一直潜藏在他体内的守望者的分身。不过，后边还有一个人并没有被他的分身拖住，被称为枪圣和神鹫骑士的他，没有理由的比其他人晚了半分，却正好起到了意想不到的作用。要对付他，萧就只能停下仪式，而其实，仪式没能达成的他，也没有战胜对方的能力的。这种时候，刚才一直被萧强迫休息在一旁云站了出来，带着强劲异常的战意和斗气。正好，同是枪神的徒弟，枪圣正是云必须面对的对手了。亚龙则正好对战神鹫。\r\n    牺牲性命的魔法，带来的并不是力量，而是强大的战意，云居然在短时间内压制住了真实实力比自己强很多的枪圣。\r\n    众神竞技场第二段战斗。幽的六使，心的凶剑，灵修的蚩尤血脉，布莱特的王者之气，穆林先知的心灵之牢。枪神斧圣的配合，小皇帝的禁咒魔法。\r\n\r\n\r\n    被云的话语刺激的枪圣，终于在自尊心的刺激下，找回了状态，渐渐占了上风。终于，无法躲闪的一枪刺向云的心脏。然而这一枪却突然在云的胸前停住了。云随枪圣的目光看去，却是萧凌空虚抓抓住了他的枪。就在这时，混乱星域的核心破解，降临之子、暗之君和圣女三人，在破空回来的一瞬间占据了萧的左、右、后三方，剑尖直抵萧的要害。此时的萧手还抓着枪，并未能握住唯一希望的魔剑。生死一线，绝望的场面。\r\n\r\n    众神竞技场中，各人的战斗渐渐分出明显。幽还是敌不过主神级的对手，渐渐落于下风，而在危机关头救下他的，是独立解开竞技场的心。虽然毫发无伤，但是她的气息也乱了。战神这样最强一级的主神显然也给了她相当大的压力。布莱特受了重伤，然而却越战越勇，气势上已经压过了炼狱之神。灵修解开竞技场，灭了死神。枪神和斧圣渐渐不支，小皇帝在心的提醒下解开了竞技场。\r\n    \r\n\r\n    但是他还是那么平静，或许稍显严肃。手并没有动，只是转身，对背后的圣女说，“退下。”\r\n    圣女想要说的话很多，然而与萧那平静而坚决的眼神一碰，她叹了口气，最终还是退了下来。\r\n    然后是降临之子和暗之君，两个与萧同样独特，而且更适合引导世界的人物。\r\n    一段对话。然而触发战斗的却是，两柄主神级的圣剑的恐惧，而它们所恐惧的，则是萧面前的那把，同源的另一柄圣剑。两柄圣剑恐惧中放出主神级完全的神威，然而这样强大的冲击，却完全震慑不住魔剑，虽然其气势相对小得多，却非常诡异，实实在在压抑着两个同类。三股神威的碰撞，压抑的空间，在后方联盟众人喘不过气来甚至震昏的时候，霸气的冲击袭来，完全将其他三股气息冲得烟消云散了。即便本来还能撑得住的降临之子，也不免留下冷汗。\r\n    就在这时，仪式第一阶段，解封完成了。萧掌握住了短时间超越极限的战斗力，原本必死的局面稍稍改变了。现在，是运用这并不完全的力量，单挑世界最强的人类联盟了。\r\n    三剑相交，以一敌二。\r\n    然后，是几个十阶光明骑士的助阵，枪圣的加入。\r\n    枪圣的冲动差点让自己丢掉性命，被暗之君斥责，“别冲太前，那已经不是你一个人能够应付的人物了。”而他们前边，降临之子正以最高的警惕面对着萧。\r\n    随着战斗的进行，萧所能掌握的能量越来越多，渐渐的不再劣势，反倒开始压制降临之子等人了。\r\n    再然后，众神竞技场消失，更多大天使和魔神加入战斗。龙族退开，宙斯、雅典娜等北方神明袭来。一剑独立，挑战全世界。\r\n\r\n    魔剑的另一个名字，赎罪镇魂剑。镇魂曲的发动，标志着战斗的终结，剩下的，就是天神的仪式。世界的改变，命运的重塑，已经萧与这个世界的诀别。与冥神的对话，萧借助血屠之戒中的冥月一族的灵魂找到的通往冥界的通道。\r\n    镇魂曲中，萧单独与布莱特有过一段对话。教他摆脱了宿命，并拜托他，“如果你认为我所定的命运是错误的，就请你把它斩断吧。”\r\n    “恩，好吧。我会好好完成这个使命的。”\r\n    “这并不是使命，”萧轻笑，“应该算是好友最后的请求吧。”\r\n\r\n    将曾经的路再走了一遍，为过去的杀戮进行了补偿。给曾经的人们，留下最后的话语。\r\n    路上遇到皇女装束的，灵魂神殿的美杜莎、灵魂守御者，雷神骑士，十字军大剑士，暗之君的女儿。。。。。。罗德嘶吼着要他杀了自己，萧却只是回答，回到那个村子里去。\r\n    最后的一点时间，选择有两个，去探知一下自己从未知道的身世，还是回南大路去看她最后一眼。萧选择了后者，可惜两人还是错过了，果然是，有缘无分。\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n	第二十三卷 天神之仪			Paragraph	2021-05-30	30000547
31000083	1600	2021-05-30	目录：\r\n1.光的嘱托\r\n2.冥月之境\r\n3.幽城剑使\r\n4.守护之心\r\n5.云端之塔\r\n6.圣女的妒忌\r\n7.新的毁灭者\r\n8.魔法帝都\r\n9.恶魔的入侵\r\n10.杀戮公主\r\n11.撒旦的计划\r\n12.魔法平原的会战\r\n13.邪神现世\r\n\r\n\r\n\r\n\r\n    \r\n    邪神现世后，几乎在瞬间确立起自己的信仰，从无法侵入这个世界的外界之神，变成了被遍布这个世界的多种族多国家的生命所崇拜的存在。一旦确立信仰，在没有将其本体或者其信仰者彻底灭绝之前，都无法阻止作为神明的邪神对这个世界进行的腐蚀和改造。而它所携带的无法逆转的腐蚀，就是将这个世界也转变像他所支配的那个残酷炼狱。\r\n    作为魔法平原会战的双方领袖，米迦勒和路西法面对替换了撒旦而乱入的大邪神，表现了最高等级的尊重，毕竟邪神本就是与他们的创造者同级的世界创造者（支配者），是他们无法对抗也不能对其出手的存在。而邪神也几乎在同时宣布了自己的目的，分化出无数分身，给予了这片大陆上的人类以最严酷的考验。\r\n    正面对抗邪神本体的萧等人，受到邪神的精神冲击最大，几乎所有人都陷入了混乱和恍惚中。而萧本人也首次感受到了一种让身体颤抖、精神恍惚的情感，或许是因为身体里那从来都肆无忌惮的邪恶力量也首次因为别的存在而无力颤抖、甚而绝望，让萧真正意识到了，自己现在所拥有的的这种情感，就是恐惧。一直以来因为体内那邪恶力量的本源的强大，萧并没有真正意义上接受过来自更高位存在的赤裸裸的敌意，即便他一直都被教导说人外有人，天外有天，但只有在眼前这一个，他才能真正感受到，被强大力量威慑所带来的名为“恐惧”的情感。而事实上，他也因为这情感的强大支配力而完全无法动弹，处于任人宰割的状态，那或许并不是单纯靠意志力就能够对抗的存在，至少对萧来说是这样。\r\n    而破开这个无限扩散的恐惧之环的，是从天而降劈开大地的一剑。原本说有些私事要处理的冥月心赶到战场，毫不畏惧的向超越这个世界存在的支配者挥下手中的剑。作为生活在外域以抵御异界邪神入侵为己任的战斗种族冥月一族的剑使，大邪神正是她所要面对的宿敌之首。华丽的剑技和绝美的身影战斗在最前线，割裂了邪神侵袭周围人类意志的精神冲击。首先从恍惚中恢复意识的战场各方的长者虽然在第一时间参与了战斗，但是没有任何人是邪神的一合之敌，连与心并肩作战都办不到。而为她坚定的话语和战斗的身姿所倾倒的萧，终于抛开内心的恐惧，撇下甚至都无法再给他捣乱的体内的邪恶力量，重新站起来对抗邪神。只有这一刻他才发现，自己真正想成为的，就是挺身对抗邪恶的勇者。因为从来没有感受到恐惧，也就不可能产生勇气，所以只有这一刻，他才真正成为了自己宿命中应该成为的那个角色。而他自己所拥有的那狂暴的，一旦全力使用就会让自己消亡的庞大力量，也正是为了这一刻而存在的。\r\n    因为分身的侵袭而首当其冲的，当然就是近在咫尺的布莱特、小皇帝一行，即便是已经突破人类极限，接连创下弑神伟绩的他们几人，也被邪神分身逼得步步后退，形色狼狈。\r\n    光明教会之上，将天堂之门也遮蔽了的邪神分身，给予了不可一世的光明教会以沉重的打击，无数战士前赴后继的攻向它，却连最强的十二位光明圣骑士长都无法撼动邪神分身。\r\n    暗之谷中，收到黑暗一族长老牺牲生命获得的启示后，暗之君布下了天罗地网，等待着灾难的降临，然而精细到极致的战术，却被邪神分身以力破巧逐层击破，形势岌岌可危。\r\n    而在不为人知的偏远之地，还有两个邪神分身存在。一个为降临之子所击破，另一个则被死灵君王引进灵魂神殿，在击杀同样被困神殿中的无数黑暗方神魔后，最终消散。\r\n    其他邪神分身不过十数只，却给人族带来了几乎毁灭性的打击。原本总是为人类各方助战的神魔纷纷退避，因为衡量了天神现世的神威和人族灭亡的损害，在大邪神郑重声明了只对人族进行天罚之后，众神选择了抛弃人族。而人族，也因为这些直接和间接的打击，开始走向毁灭之路。\r\n    \r\n    为了对抗这场天灾，虚无缥缈的圣山突然降临人间，圣女召集所有可能汇集的人类力量来到魔法平原，所有人的全力以赴，战况还是不容乐观。然而所有人聚合在一起，总算是有了战胜试炼的希望。作为最强人类的降临之子挡下了大邪神本体的进攻，魔君和圣女联手进行空间的封印，所有的力量汇聚在一起，也只是困住了邪神本体一时，然而哪怕仅仅只是一个瞬间，也就是胜机。在大邪神面对众多人类拼死的封印术而嬉笑大意之时，原本被他封印到异空间的心突然出现。在一旁重伤观战得到萧感觉到，随着心的出现，世界瞬间失去了颜色，所有事物静止，唯有在天空之上静静咏念神言的心，作为这个静止而无色世界里唯一拥有神韵的存在，显得那么的光辉绚丽。在这刻，萧才意识到了，她所拥有的特性，既不是剑神的力量也不是美神的美色，已经不在这个世界的小光，留给她的特性，或许仅仅只有四个字能够表达，“绝世无双”。\r\n    冗长庄重的神言，仿佛不是这个世界的话语一般，而她手中的剑，也汇聚了几乎不容于这个世界的庞大力量，即使一直游刃有余的邪神，也被这股力量所震慑而失去了从容，面对疯狂反击的邪神所发出的攻击，她刺出了手中的剑，迎面而来的庞大力量被彻底击碎，神剑饱含着弑神的力量贯穿了邪神的本体。然而在最后时刻，邪神的反击更为疯狂，被剑压所震慑而无法动弹的他，最后竟撼动了这个世界，硬是将本来会贯穿他本体核心的剑的轨迹错开了。没有彻底灭杀邪神的剑锋刺穿了世界的空间障壁，在这个倾斜的世界上划出了一条巨大的裂缝，裂缝外是无尽翻腾的混沌乱流，乍看起来仿佛世界的末日。\r\n    因为没有彻底完成弑神之举，原本因该在那惊天一剑后瞬间消散的心勉强保持了原形，然而灵魂和肉体同时开始消散，虚无缥缈得仿佛下一刻就会不复存在一般。面对着同样肉体几乎死亡却还在嘲笑这边的邪神，心并没有沮丧，因为这边还有最后的希望，原本就是为了消灭侵入这个世界的邪神的，智慧之神所培养的最后希望，萧手中凝聚的蕴涵所有人类力量的箭，正以这个世界为弓，指向了身受重伤的邪神。\r\n    仍然那支蕴涵希望的箭并没有射中邪神，那无比纯粹的力量最终飞向了心，环绕着她开始修复她支离破碎的肉体和灵魂。就在心也因为吃惊而愣住的时候，萧本人取而代之的飞向了邪神。利用汇聚希望之箭所残留的力量残渣，放开束缚自身的一切枷锁全力挥动自己的力量，以自身的意志支配周围所有能够支配的能量，他选择了作为一个勇者，追逐正准备顺着空间裂缝逃往混沌乱流的邪神。没有人能在混沌乱流中存活，但也没有人能够否认他具备斩杀邪神的力量，那里，就是他所选择的勇者这条道路的终点，也是他所选择的葬身之所。\r\n\r\n\r\n\r\n\r\n	第十六卷 邪神现世			Paragraph	2021-05-30	30000547
31000091	201	2021-05-30	\r\n    被当做诱饵、弃子，独自在万军从中奋战，生死之间，竟会无法压抑自己的兴奋，像野兽一般狂嚎。而那嚎叫仿佛精神攻击般直接击碎了弱者的气势。这就是他最擅长的战斗，无所顾忌的破坏和狭路求生之争。\r\n\r\n \r\n\r\n    被前辈考较战斗能力，瞬间爆发出的杀气将对方给震懵了，强制停下动作的他反而受了伤，害得关心他的小姑娘担心。\r\n\r\n \r\n \r\n    重伤之下去抱赤身的美人，完全没有惊艳的感觉，身体颤抖，用力也不知轻重。\r\n\r\n\r\n\r\n\r\n\r\n\r\n    朋友的绝对信赖似乎也不是特别好的事情，在没有任何人带领和任何通信的情况下，全部条件都给他准备好了，挑战级差巨大深不可测的对手，不上也得上啊。\r\n\r\n\r\n    自然形成了气势的他，已经成为一个传说。然而，传说也总有被打破的时候，年轻的挑战者打破他的传说时，他的抉择是什么呢？\r\n\r\n\r\n    用人家自己创造的武器毁灭他无懈可击的防御，将所有力量集中在一次赌博上的事虽然他自己常干，却并非长策。既然功亏一篑，那么干脆就放开已经从取胜奇策变成包袱的武器，放手一搏。事实证明，对方的确早有防备，还好他将自己注入的一部分力量强制抽了出来，被逼到绝境的对手没有将这武器的全力发挥出来。\r\n\r\n\r\n\r\n\r\n\r\n\r\n    \r\n\r\n    危机和误解，是他生命中最常遇到的一部分。然而，真正站在他的领域内战斗过的人都知道，这样萧杀肃穆的一个人，根本不可能去干那些反间、偷袭的卑劣伎俩。然后，其实他偏偏就做过说起来很卑鄙的行为，在绝境下往往就通过别人所想不到的小伎俩反败为胜或者逃出生天。\r\n    \r\n\r\n    邪恶，他所一直背负的名。但是很多时候，以邪恶之名出发，是无法获得成果的，无论是成功还是正义。所以，邪恶并不是合适的名誉，只是在合适之时借用一下的特别的工具而已。\r\n\r\n\r\n\r\n    不退，即便硬抗敌人连续不断的攻击，也一步不退。并不是因为固执，只是这一点是唯一正对召唤者的地方，只有刚才在这个位置时才勉强看到对方藏进怪物体内，所以也只有站在这一点才有就会一击击杀内部的召唤者。\r\n\r\n\r\n\r\n\r\n\r\n    身受重伤被人拉着要撤出结界的他却硬要留下来。前边已经牺牲了好几人来阻挡复活的魔王，才有机会逃走。但是毕竟逃出结界并没有用，魔王自己设置的封印不可能困得住他。不过萧还是告诫他们，出去后将结界封印重新启动。\r\n    “但愿这封印足够强大。”因为重伤不能再战的他已经做好解放体内恶魔的觉悟了。然而，他却意外发现了魔王的异常，那竟似乎是自己这边想要保护的小村中的人，那个孩子。\r\n    虽然战胜或者说解除了魔王的武装，但是被封印在了这个地下结界中的萧倒是找不到出去的方法。\r\n    \r\n\r\n\r\n\r\n    女龙骑士。\r\n\r\n\r\n\r\n\r\n\r\n\r\n1.小小佣兵团\r\n    “别了。”\r\n    “走好。” \r\n\r\n\r\n\r\n\r\n\r\n\r\n2.佣兵法则\r\n    强者不一定胜，胜者才真的强。 \r\n    力量仅仅能决定在战斗中是否能活下来，其他还有很多事情不是单纯的力量能够左右的。但同时，也有很多事情通过战斗解决起来异常容易。\r\n   \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n3.先知、贤者\r\n    很久没有见到向你这么直白的年轻人了。相比起那些喜欢上勾心斗角的大人们，我倒更相信你这样的孩子才更有可能创造奇迹。\r\n\r\n\r\n\r\n\r\n\r\n\r\n4.女王\r\n    “要不您这次换上女装去见他？我相信小萧一定会很惊讶，说不定嘴巴张成O型何不拢了。”   \r\n    “恩，就小萧那傻傻的样子，估计也发现不了跟他朝夕相处的王上是女孩子这么‘理所当然’的事实。”\r\n    “你们两个唠叨完了没。谁说过我一定要去见他了？再说了，我从小就被家里当男孩养，哪有什么女孩子的衣服可穿的？”\r\n    “哦，这个问题很容易解决嘛。来人哪，让城里所有裁缝铺子最好的裁缝带上最好的材料，到城主府来给王上做新衣服，告诉他们，做得最好的有赏，档次最差的杀头，还有，敢逃跑的格杀勿论！”\r\n    “还有，把城里最会打扮的女人也找来。”\r\n    “你……你们两个闹够了没！我……我……”\r\n    “啊，您息怒，息怒。我们开个玩笑而已。”“说起来，怎么帮小萧我们可也没什么好办法。毕竟那小子竟然狂妄到与全世界为敌。”\r\n    “跟整个大陆所有强者为敌，还能怎么帮？能帮他挡下多少敌人算多少吧，大不了拼上了这条老命。我想那小子也不会埋怨我们无能了。”\r\n    “匹夫之勇！要都像你这么想，我们的势力再强大十倍对他也根本无济于事。”\r\n    “恩，听您这么说，看来王上是另有高招了？”\r\n\r\n\r\n\r\n\r\n\r\n	片段			Setting	2021-05-30	30000547
31000093	103	2021-05-30	大陆：\r\n西方大陆（魔幻）\r\n北方大陆（希腊神系）\r\n南方大陆（伊斯兰及其他众多神话）\r\n东方大陆（道与佛）\r\n龙神岛（世界之树与圣殿、龙族文明）\r\n\r\n国家与城市：\r\n\r\n光明公国：光明之城\r\n\r\n魔法帝国：\r\n古都亚特兰蒂斯\r\n帝都雷克萨\r\n极地之城\r\n红岩要塞（赤龙原本的领地）\r\n\r\n\r\n荣耀帝国：\r\n骑士之都\r\n天空之城\r\n\r\n\r\n\r\n铁血帝国：\r\n帝都\r\n\r\n\r\n圣骑士同盟：\r\n巨石圆阵（会盟地）\r\n\r\n\r\n三不管地带：\r\n自由都市\r\n\r\n\r\n几大危险地带：\r\n魔兽山脉：光明和铁血、魔法两帝国的边界线（大型军队难以度过）\r\n守望之间：自由都市向北，与北方大陆相通的唯一的一线天\r\n\r\n魔法森林：禁地，精灵的领域\r\n恶魔之山：黑暗势力聚散地\r\n\r\n帝都森林\r\n巨魔森林\r\n\r\n蛮荒沙漠\r\n死灵之渊\r\n黑龙穴\r\n\r\n远古森林\r\n\r\n\r\n\r\n	地形			Setting	2021-05-30	30000547
31000094	202	2021-05-30	故事库\t\t\t\t\t\r\n主线类\t对抗守望者\t智慧之神的设计\t旅者之歌\t弑神者\t\r\n\t雅-逆天改命\t泠-心心相印\t心-绝世无双\t汐-绝对善良\t莲-神隐之地\r\n\t云曜-佣兵\t剑皇-斩断宿命\t降临之子-迷茫\t罗德-黑暗\t\r\n分支剧情\t灵魂神殿\t雪狼之乡\t新王国\t精灵-温室\t神秘剑客\r\n\t战神之死\t\t\t\t\r\n\t魔族老少\t小小团\t常胜将军\t\t\r\n	线索			Setting	2021-05-30	30000547
31000095	104	2021-05-30	破落佣兵团： 1阶四星           \r\n简单任务：1阶五星（实战的熟悉感）\r\n危险任务：1阶六星\r\n凤凰岭：  1阶七星（忍受火焰炙烤）\r\n冰之魂：（云三个月每星期1星）2阶战技！冰觉醒但不稳定，3阶魔法！\r\n\r\n魔兽山脉：\r\n\r\n初展身手：2阶二星！3阶！\r\n神魔眼：  3阶战技！4阶魔法！\r\n \r\n风魔之谷：1！\r\n风魔之心：3阶十星\r\n\r\n火之精：4阶！\r\n惬意的旅程：1！\r\n魔法学徒：2！\r\n\r\n公主骑士与小丑：2！\r\n神之音乐团：2！\r\n灵魂秘术：1！\r\n勇者武斗会：3！\r\n    解封：*十一阶中级\r\n\r\n\r\n\r\n吸血鬼之家：八阶十星&\r\n\r\n合击术：八阶三星&\r\n\r\n杀神无名：八阶&\r\n\r\n游荡的死灵：#十阶\r\n\r\n合作：五阶十星&\r\n\r\n血战：六阶！\r\n\r\n小小佣兵团：3！\r\n\r\n医老：3！\r\n东方之行：3！\r\n轩辕神剑：~七阶十星  @六阶十星\r\n血色城堡：~八阶！    @七阶！\r\n\r\n\r\n流浪的佣兵团：6星!\r\n龙谷之行：4星\r\n大地之心：8阶！     （8阶高级）\r\n\r\n守望者之威：*超十二阶\r\n\r\n无尽的追杀者：#6阶\r\n雪狼之乡：8阶回复\r\n魔族圣地：（封印启动）9阶高级！ （10阶初）\r\n十字将军：9阶高级               \r\n雷神骑士：9阶顶级               （10阶初）\r\n天雷地火：*10阶中级\r\n\r\n生命女神：10阶！                （10阶中）\r\n\r\n诸神印与弑神：10阶1星           （毁）\r\n\r\n前途多难的逃亡：1！\r\n焚心之炎：2！\r\n破碎的温室：1！\r\n冥月之境：1！\r\n新的毁灭者：1！\r\n魔法平原：1！\r\n夙愿代行者：10阶顶级\r\n\r\n邪神现世：\r\n剑仙\r\n造化玉牒：\r\n\r\n\r\n试炼之厅：11阶顶级\r\n\r\n\r\n\r\n\r\n\r\n\r\n位阶标准：\r\n武斗系\r\n魔法系\r\n神职系\r\n军系\r\n\r\n\r\n\r\n\r\n\r\n\r\n	成长			Setting	2021-05-30	30000547
31000096	203	2021-05-30	1.女子\r\n跟他有关系的几个女孩似乎都有天生的魅惑能力。\r\n一只青蛇、一头妖狐，一个血族祭品，精灵的爱美天性，还有个有妖精血缘的天才型刺客，都有天生的魅惑能力。圣女则有更胜一筹的可以掌控心智的魅惑法术。\r\n冥月心的完美则更不用说。\r\n而美杜莎也带些诡异的感觉，而唯一一个假小子，穿回女装时，是否也会让人眼前一亮呢？\r\n\r\n    血族虽然身份尊贵，却一直过着囚犯一般的生活，所以他这个能够使唤、能对他发脾气的人其实是很特别的存在。而另一方面，在确认跟他的伙伴关系之后，关心和照顾他的时候，会显得过于文静了点儿。\r\n    刺客其实也有意外挺可爱的地方，一个人练习着对他用魅惑，结果正巧被撞见。\r\n\r\n\r\n\r\n\r\n\r\n2.同行者\r\n能够跟上他增长实力的速度的人倒是也有几个。\r\n流云、刺客、雷神骑士，这三个几乎完全和他一样快。其他的以后再想。\r\n\r\n\r\n\r\n\r\n\r\n3.特别的人\r\n    常胜将军，在以强击弱时从未失手其实也是一种能力。即便最擅长在劣势中反败为胜的他也对这位常胜将军没有办法。被进千军万马中间死战，进退不能，多方努力始终无法扭转局面。不过这却是他唯一一次被别人救了，常胜将军的运气或许不很好，从他手下逃过一劫的人都成了顶尖人物，他自己却还只是个九阶的强者。\r\n\r\n\r\n\r\n4.有些人的独特在于，因为之前过于的贬低、意识到他的强大时，因为差距的巨大和自身不愿意否定之前认知的惯性，冲击会过于强大，导致人的措手不及。\r\n    然而萧的强大在于，即便没有任何一点小瞧他的意思，但是最后还是会因为他的作为而不能理解。因为他本就不是参与到游戏中的角色，他是世界规则的破坏者。仅仅将他看做最强一级别的对手，这样的认知也是错的。即便他的实力其实还比不上最强，但是他就有破局的能力。\r\n\r\n\r\n\r\n5.截然不同却又似乎是正反两面的两人。\r\n    一个是无心的人偶，冰璃般的幻影，\r\n    一个是孤独的人狼，噩梦般的亡灵。\r\n    同样的虚幻，给人的感受却又是两个极端。\r\n    一个冰冷而绝色，一个凶煞而孤寂。\r\n	随想			Setting	2021-05-30	30000547
31000097	105	2021-05-30	人生之路的选择：\r\n\r\n山野小子：凡人，或许他曾有几次，可以选择缩在山间过自己平凡的生活，可惜，每次都因为有牵绊而走了出来。\r\n\r\n    佣兵：他靠战斗生活，所以适合当佣兵。但是所追求并不是佣金，而拿钱办事的工作很多时候违反他自己的原则，所以这工作也并不能长久。\r\n\r\n守护骑士：作为一名骑士，守护心中的女神。守护其信念，因为那就是目前的他赖以存在的信念。\r\n\r\n    英雄：若是被圣女眷顾，在她的引导下，必定是会走一条英雄之路的吧。可惜圣女本身有其缺陷，而他的人生，注定要做魔神。\r\n\r\n    王者：被前代之王承认，但是最终并没有从她的手上接下位。或许是因为一直看着她对王位的渴望，而并没有注意到其责任重压下的辛苦。更多的大概还是不合适，最终，他放弃了王之道。\r\n\r\n    游侠：与刺客同行的话，他将走上的就是游侠之路。\r\n    \r\n和平使者：与外族的交流，与他们共建和平的人。森林精灵本已承认了他这一身份。可惜，他还是选择的了再次上路，寻回昨天。   \r\n\r\n    隐士：最有可能的一个结局，是否选择这条路，他选择的是，完全顺其自然。\r\n\r\n    魔神：在被封印掉自身力量，无法对抗强敌，保护身后弱者的时候。他大概感觉，守护者的路，他已经走到头了。那么，接下来应该就是，毁灭者了吧。单纯以自己的意志，召唤、集结这个世界所有的怨念、遗憾、痛苦、渴望，担负起着无限的责任和力量，他将化身为魔神。诸神都做出了反应，不过显然组织不了他了，最后，似乎是被真心关心他的人阻止了。\r\n\r\n    天神：最后的道路上，他渐渐明白，昨天是不可能追回来的。而自己，无论如何，都将要走到人生尽头了。天神之仪，他终将退出这个宏大的世界，作为前驱，完成开拓命运的使命。\r\n\r\n\r\n他的人生大概分成几段，每一段都一个明显的界点。\r\n    佣兵，虽然不同于云，他也走过一段佣兵之路。最后，大概是因为想要保护，而放弃佣兵做了骑士。然而，骑士之路却也没能贯彻到底，最后被人完全废掉了力量，无力的骑士最后一次以死守护。爆发的，则是魔神的毁灭力量。\r\n \r\n\r\n能力：\r\n顶级：(降神)\r\n萧：特技无效，任何人都只能跟他比拼实力，战斗能力。即便是神，他也能将其从神位上拖下来逼其像凡人一般战斗。\r\n\r\n降临之子：（绝对防御）\r\n绝对自我的领域，不受任何外界干扰，能够发挥出人类所拥有的最强潜力。除非世界崩溃，否则任何神都无法将他排除。\r\n\r\n\r\n3.遇强则强（布莱特）\r\n\r\n\r\n\r\n4.战斗天性\r\n      拳王\r\n      雷神骑士\r\n      十字将军	选择			Setting	2021-05-30	30000547
31000098	106	2021-05-30	地域：\r\n一、圣殿八厅\r\n光明之厅（太阳）（中心）         \r\n混乱之厅（混乱星域）（边境）\r\n憧憬之厅（天堂）（上界）         \r\n痛苦之厅（地狱）（下界）     \r\n迷茫之厅（人间）（平界）         \r\n轮回之厅（冥界）（轮回）\r\n竞技之厅（竞技场）（斗兽场）     \r\n试炼之厅（秩序混沌交界）   \r\n\r\n二、种族\r\n诸神及眷族\r\n神：支配和维持自然定律的存在。\r\n代行者：辅助神贯彻此定律的使者。\r\n守护者：维护神的威严的使者。\r\n眷族：受到神的特别恩惠，完全信仰和受神支配的种族。\r\n\r\n\r\n人：\r\n守序与混乱\r\n正义与邪恶\r\n\r\n百族：\r\n兽族、兽人族\r\n矮人、地精、\r\n精灵、妖精族\r\n元素族\r\n\r\n\r\n龙族\r\n天使族\r\n恶魔族\r\n\r\n亡灵\r\n异族（美杜莎、九头怪）\r\n\r\n\r\n\r\n\r\n\r\n人物：\r\n一、神祗\r\n（西）\r\n十二主神：\r\n\r\n光明：神之天使米迦勒（光明战神、天国副君）\r\n      加百列\r\n            \r\n黑暗：堕落天使路西法（黑暗之神）\r\n      恶魔之王撒旦（魔神）\r\n            \r\n自然：火神、水神、风神、大地之神\r\n            \r\n中立：智慧之神、冥神、死神、灵魂之神\r\n\r\n（北）\r\n希腊：\r\n（南）\r\n伊斯兰：\r\n（东）\r\n道：三清四御五老君\r\n    \r\n佛：\r\n\r\n\r\n二、强者\r\n佣兵战魂榜：\r\n01.狂怒之王\r\n10.光圣者·伊丽娜\r\n\r\n中立：\r\n01.剑皇布莱特\r\n02.枪神\r\n03.魔法皇帝\r\n04.狂怒之王\r\n\r\n05.降临之子\r\n06.神鹫骑士\r\n07.天师圣女\r\n\r\n08.雷神骑士\r\n09.灵魂守御者：金银妖瞳、灵魂守护兽\r\n10.死灵君王罗德：魔戒·阳\r\n11.毁灭者、天罚者\r\n\r\n15.风魔神（伪）\r\n16.生命之神（伪）\r\n17.妖术师\r\n\r\n18.风圣集团\r\n19.冥月心\r\n20.冥月幽\r\n\r\n\r\n\r\n三、光明阵营\r\n01.光明教会\r\n教皇\r\n十二红衣大主教\r\n智慧神使\r\n02.护教骑士团：\r\n十二护教骑士长\r\n03.十字军\r\n十字大剑士\r\n04.圣魔兵团\r\n05.其他\r\n四大公爵军\r\n地方守备队\r\n城镇自卫队\r\n\r\n06.神圣骑士联盟\r\n神圣骑士团\r\n城镇自卫队\r\n\r\n07.魔法帝国\r\n魔法皇帝\r\n六大魔导师\r\n魔法军团\r\n精灵军团\r\n\r\n08.荣耀帝国\r\n皇家骑士团\r\n天空骑士团\r\n地龙骑士团\r\n边境抵抗组织\r\n\r\n四、黑暗阵营\r\n01.铁血帝国\r\n帝国正规军\r\n巨魔军团\r\n\r\n02.暗黑众议军\r\n暗影死士\r\n黑暗眷族\r\n恶魔契约者\r\n地狱恶魔\r\n亡灵巫师\r\n血族\r\n其他邪神信徒\r\n\r\n03.黑暗\r\n堕落天使\r\n黑暗眷族\r\n\r\n\r\n04.恶魔\r\n大恶魔\r\n地穴恶魔\r\n恶鬼\r\n地狱犬\r\n\r\n05.亡灵\r\n吸血鬼\r\n亡灵巫师\r\n死亡骑士\r\n\r\n\r\n\r\n五、中立阵营\r\n\r\n百族：\r\n01.丛林沼泽\r\n精灵、矮人、人马\r\n巨魔、狼头人、蜥蜴人\r\n02.雪原禁地\r\n雪狼\r\n03.荒野戈壁\r\n兽人、半兽人、食人魔\r\n雷鸟、独眼巨人\r\n猛犸、比蒙\r\n04.洞穴地底\r\n洞穴人、鹰身妖\r\n牛头人、\r\n远古恶魔\r\n05.龙族\r\n龙神（黄龙）\r\n黑龙之王、\r\n红龙、绿龙、紫龙\r\n亚龙\r\n下等龙族：\r\n巨龙\r\n飞龙\r\n地行龙\r\n\r\n\r\n06.野外、魔法生物\r\n熊人、\r\n树人、石人、\r\n石像鬼、\r\n\r\n07.传说生物\r\n美杜莎\r\n九头怪\r\n狼人\r\n	种族势力			Setting	2021-05-30	30000547
31000092	101	2021-05-30	象征：\r\n降临之子：正义\r\n星汐、行者：善良\r\n罗德：恐惧\r\n暗之君：支配\r\n萧：抗争、挣扎\r\n雷骑：坚毅\r\n\r\n布莱特：士兵\r\n\r\n武者\r\n\r\n\r\n剑士：萧\r\n别名：云霜\r\n称号：守望者之剑、守护者、生命之神神侍、守望之神\r\n魔法能力：\r\n    冰（雪狼）、风（风魔）、火（火神）、\r\n    雷（雷神骑士）、生命（血妃雅）、\r\n    土（圣殿）、水（水神）、光与暗（守望者）\r\n武道能力： \r\n    霸气（魔兽山脉、一连串生与死的考验、老师）\r\n    神魔眼、冰火两重天、绝对领域\r\n    绝对力量（试炼之厅）\r\n兵器：九仪天尊剑\r\n神器：隐逸斗篷\r\n      血屠之戒、符文战甲、诅咒圣剑\r\n宝物：冰魄云纱\r\n\r\n（云家）\r\n骑士：云天曜\r\n称号：亚龙骑士、风魔枪圣、佣兵\r\n坐骑：碧血之风（七彩亚龙）\r\n          \r\n射手：云姗姗\r\n枪士：云杰      \r\n剑士：云宇\r\n黑暗术士:里德斯\r\n\t\t\t\r\n（红颜）\r\n牧师：血妃雅\r\n神位：生命之神\r\n能力：光明神术、道术、生命之术\r\n宠物：小白（智慧之神守护兽）\r\n\r\n\r\n\r\n\r\n\r\n剑使：心\r\n氏族：冥月一族\r\n兵器：幻剑\r\n剑法：幽剑、绝剑（凶嚎)、灭剑\r\n      天剑：斩妖式、灭魔式、弑神式\r\n神级咒法：九天十地      \r\n（自创）倾城之恋、\r\n\r\n圣女：\r\n神器：圣剑未名\r\n能力：全知全能\r\n特长：侦知预言\r\n\r\n\r\n刺客：华莲\r\n代号：红莲（地狱）\r\n武器：劫焰（无痛楚的燃烧）\r\n特长：瞬步（速度的极限）\r\n\r\n\r\n血族：菲娜（月瑶）\r\n能力：血噬（吸取）、血融（补益）\r\n      \r\n\r\n精灵：特蕾茜（灵舞）\r\n能力：自然魔法、精灵武技\r\n特长：魔法控制、箭术\r\n职位：（魔法森林）精灵族族长\r\n\r\n\r\n（朋友）\r\n剑士：布莱特\r\n称号：剑皇\r\n神器：圣剑希鲁达\r\n斗气：王者之气\r\n\r\n魔法师：伊丽娜\r\n称号：光圣者、虚空神\r\n\r\n枪神\r\n\r\n狂战士：\r\n称号：狂怒之王、佣兵、斧圣\r\n\r\n魔法师：\r\n称号：魔法皇帝\r\n\r\n旁观者：光\r\n称号：守护者、天神\r\n\r\n召唤师：冥月幽\r\n氏族：冥月一族\r\n杀戮公主：\r\n\r\n剑仙：灵修\r\n仙术：三昧真火\r\n血咒：古神血脉\r\n法宝：诛仙四剑、捆仙索\r\n\r\n\r\n\r\n\r\n\r\n（对手）\r\n光明骑士：\r\n称号：降临之子\r\n能力：骑士剑术、光明魔法\r\n特长：绝对防御\r\n神器：圣剑-光明\r\n\r\n暗之君：\r\n\r\n\r\n\r\n\r\n魔法师：\r\n称号：灵魂守御者\r\n特殊能力：金银妖瞳\r\n宿魔：(灵魂之守护兽 )\r\n      \r\n死灵君王：罗德\r\n神器：魔戒·阳\r\n\r\n剑士：\r\n称号：毁灭者、天罚者\r\n\r\n剑寒\t"云家佣兵、神隐之地、\r\n生命之谷、灵魂试炼、\r\n冥月一族、守望者、\r\n血之诅咒、圣女之邀、\r\n今世前缘、天神仪式"\t依靠人类挣扎求存的能力拯救失去未来的世界\r\n\t\r\n主角们的故事\t\r\n天曜\t\t天才在痛苦中成长\r\n布莱特\t\t被使命所束缚的人在变幻的世界中寻求自身的意义，斩破宿命创造自己的未来\r\n亚历克斯\t\t在太过完美的人生中遭遇无法以常理判断的境遇，开始懂得迷茫和自由，以及真正的正义\r\n行者\t\t布善的行者，通过世世代代的努力给予世界活力和文明的传承\r\n灵修\t\t实验品突破牢笼，闯上天界，最终成为老君弟子\r\n光\t\t\r\n叶开\t\t\r\n\t\t\r\n罗德\t\t\r\n\r\n	人物称号			Setting	2021-05-30	30000547
31000100	2	2021-05-30	坐骑：碧血之风（七彩亚龙）	云天曜	佣兵	亚龙骑士、风魔枪圣	Character	2021-05-30	30000547
31000099	1	2021-05-30	居然没留任何人物描述。。。\r\n佣兵团团长夫妇旅行途中捡到的狼孩，被野兽哺育到5岁的他一开始并不适应佣兵团的生活，但团长夫妇锲而不舍的交流还是打动了他，而后在佣兵团剧变的时候，为了不拖累他们，不足10岁的他自己一个人进入魔兽山脉讨生活去了。\r\n故事的开端，是他回到佣兵团参加最后一次长途任务。\r\n背负着破灭的宿命，孕育着救世的希望，他所要追寻的，是自己的活着的意义，以及死亡之所。\r\n称号：守望者之剑、守护者、生命之神神侍、守望之神\r\n魔法能力：\r\n    冰（雪狼）、风（风魔）、火（火神）、\r\n    雷（雷神骑士）、生命（血妃雅）、\r\n    土（圣殿）、水（水神）、光与暗（守望者）\r\n武道能力： \r\n    霸气（魔兽山脉、一连串生与死的考验、老师）\r\n    神魔眼、冰火两重天、绝对领域\r\n    绝对力量（试炼之厅）\r\n兵器：九仪天尊剑\r\n神器：隐逸斗篷\r\n      血屠之戒、符文战甲、诅咒圣剑\r\n宝物：冰魄云纱	萧剑寒	山野少年	萧萧、云霜	Character	2021-05-30	30000547
31000101	3	2021-05-30	神位：生命之神\r\n能力：光明神术、道术、生命魔法\r\n宠物：小白（智慧之神守护兽）\r\n\r\n在生命之谷定居的女孩，救了萧而且愿意牺牲自己的生命力去治疗他的伤势。\r\n她的养父养母是不为东西方所容的一对异邦夫妇，在生命之谷寻找线索时发现而且善待了她，原型是一条青蛇的她为了报答她们，出去旅行并最终幻化出人形，成为了她们的养女。然而教她所为人化方法的老师，却是个心怀叵测的阴谋家。在唆使她作为向导找到生命之谷后，最终导致了生命之谷的大破坏以及养父母的身死。愧疚的她在这里赎罪了10年，直到他的到来。\r\n\r\n	血妃雅	牧师、道士	生命使者	Character	2021-05-30	30000547
31000102	4	2021-05-30	整个故事最先出现最后登场的女主角，因为前世的因缘而一直帮助主角的她，是最有能力约束于他却又最不想约束于他的人。在这样的心情之下，最终她还是选择了到他希望生活的地方去等待他的归来。	泠儿			Character	2021-05-30	30000547
31000103	5	2021-05-30	剑使：心\r\n特性：绝世无双\r\n氏族：冥月一族\r\n兵器：幻剑\r\n剑法：幽剑、绝剑（凶嚎)、灭剑\r\n      天剑：斩妖式、灭魔式、弑神式\r\n神级咒法：九天十地      \r\n（自创）倾城之恋、\r\n天神诀：弑神一剑	冥月心	剑使		Character	2021-05-30	30000547
31000149	100	2021-05-30	1.血族少女\t"徐幻\r\n血族少女：\r\n幽魂巫师：\r\n\r\n\r\n夜盗\r\n暗杀者"\t\t"    在城市暗影中爆发的黑夜种族间的战争，围绕着神秘的夜之王座，血族、狼人、月神信徒、幽魂巫师、夜盗、暗精灵，种种势力纷争不休，都在寻找打开夜之王座的钥匙，又在相互阻挠。然而，他们不知道的是，纷争，才是夜之王座降临的唯一方法。\r\n    碰巧被卷进这场战争的稍微有些神经质的少年，无论面对什么样的敌人，都总不忘了将自己的直觉直白的说出来，即便吓得双腿打颤，却就是住不了嘴。如果不是因为初次遇到的是少不经事的血族少女的话，或许他还没唠叨上几句就被人家随手砍了。\r\n    跻身在两大魔法世家宅院中间的小房子里，时不时会被两边的火拼吵醒，然后蒙头继续睡，在面对危险时的素质倒还不错。这大概是他在这个夜间争端不断地城市里存活下来的最大凭借吧。然而他神经质般的自言自语以及其他一些非人的缺陷，却让周围的人不能理解。\r\n    血族少女与其他人一样，为了得到“夜之王座”，在不断地寻找中，既借助又妨害势力较大的世家和各个黑夜种族势力。碰巧得知少年的房子在两大世家之间，便理所当然住进了这个仆人家里，还顺手打发他去探探邻居的情报，完全没考虑过，一无所有的穷小子跟他的邻居们根本半点关系都没有。"\t\t9.虚弱的始祖之血与魂的继承者，已经完全生活在普通人的世界里。然而，意外遭遇到的高等血族，却将这份原该继续沉睡下去的黑暗唤醒，幸还是不幸，在没有假设没有如果的时间界面里，没人说得清楚。\r\n2.白狼之影\t"大小姐：\r\n白狼：\r\n\r\n月神信徒\r\n狼人"\t\t    被丢进宅院一番折腾，他还真跟  家的主事的大小姐说上了话，却又是被当了生死难料的诱饵。两人一明一暗的追寻着大小姐小时候憧憬的白狼的身影，结果发现了月神信徒的秘密，破坏了月神信徒的黑暗祭祀，报了她母亲的仇，却没能救回狼人的性命。\t\t\r\n3.世家隐秘\t"少女家主：\r\n\r\n叛臣领袖：\r\n"\t\t    事件刚解决还没来得急闪人的猪脚，又被当做“大使”丢给另一世家。而原本听来简单的问题，却因为一个快包不住的秘密而成了死局，又上了另一条贼船，不得不跟这些人同进退了。既然被揭穿了必败无疑，那么又何不抢先出击，掌握主动呢，凭借宗家的余威震场，再抢先给意图不轨的首恶安插上叛逆的罪名，以最快速度掌控力量，肃清异己。而歪打正着的，叛乱者还真的借助了恶魔的力量，一番苦战总算消解了这场灭族微机。\t\t\r\n4.夜盗（斗争伊始）\t暗精灵\t\t"    而另一边，一直与他们作对的幽魂巫师，却总是避开与他之间的战斗。那种熟悉和亲近的感觉让他情不自禁却又必须强制抑制，因为，理智告诉他，知道真相也就意味着这份羁绊的消失，消失的不是自己，就是那个面无表情却其实心地善良的小女孩。\r\n     夜盗频繁作案，大部分都知道他也是竞争者之一，但是谁都看不清他的计划和目的。他或许更像一个事件触发者，或者游戏管理者，负责制定和维护规则，修正错误，应对意外。看不懂他，是因为这些人，与曾经是夜之王座有力竞争者的他，有太大的差距。他们也渐渐发现，自己只不过是纷争最前线、最底层的基石。"\t\t"7.没想到，曾经所憧憬的爱恋之类的情境，也会发生在自己身上啊。可惜，却没有那个福气享受啊，自己，还有更重要的使命需要去履行。当人们都专注于这个多彩美妙的生活中时，我们这些在暗与影之中徘徊的人，也必须专注于自己的命运了。\r\n8.舍弃一切踏上必死之路。\r\n   “这样做活下来的可能性更高，”他说，“我只是做了这样的判断而已。”\r\n     不知道为什么，即使身边很亲近的人的生死，也不太那么在意。是因为薄情寡义？不知道。\r\n     舍弃一切，只向往着一个新的开始，为此而愿意牺牲一切？这么做到底有什么价值，当自己的理智无法掌握现状时，就全部交给直觉吧。"\r\n5.幽魂巫师\t\t\t"    随着黑夜纷争的继续，夜之王座的降临越来越近。少年自己也越来越不稳定。真祖的血渐渐苏醒，他也渐渐知道，自己不过是玻璃般透明的存在。（人工生命、虚假的存在）然而即使如此，他仍然在探寻自己的意志、争取自己的自由。\r\n    “或许自己受制于人更深一层，但是既然已经存在，既然还能思考，就当然不能放弃自己。”\r\n    夜之王座原本的主人随着纷争的扩大而复苏，而包括他的创造者在内的众多真正有实力的竞争者也被唤醒。以月神自居的伪神，魔法世家背后的黑手，为复仇和为生存奔波的暗精灵们，抢夺者，真正最纯粹的，恐怕要属从头开始就异常强大而清冷的幽魂巫师了。\r\n    然而，幽魂巫师的弱点则是，她所要保护的那些并不太可爱的玩偶。无意中闯入她领地的众人，发现原本强大无比的她，在自己的领域内，却反而柔弱不堪。\r\n    就在她们以为能消灭一个有力竞争者时，幻终于忍不住出来制止了。他请求或者几乎是恳求幽魂巫师立下放弃暗之王座的誓言，原本只是想通过言语的错觉让同伴们放过她，但是却没想到她那么随意的发下魔法真言，还那么轻易的将言灵交给了他。那深邃的眼瞳中的一丝微笑，到底有着怎样的情感呢？徐幻，几乎不敢想象。因为他此时又一次感觉到，如果知道了真相，自己或者她，有一方必将不复存在。"\t\t\r\n6.堕天使\t\t\t"    与堕天使的战斗中，原本已经无力阻止的仪式，竟被从一开始就被众人忽略的可说毫无战力的徐幻阻止了。对自己有绝对自信的堕天使无法容忍这样的失败，用尽全力要取他的性命，而其他人完全没有救援的可能。就在这时，他却笑了，不是慨然赴死，而是知道有一个人一定会救他——这个世界上第一个与他有所联系的人，幽魂巫师。\r\n    被幽魂巫师带出来的他，当然已经知道了自己的过去。在被她抚摸头顶时，他感觉一股舒适和飘忽的感觉，仿佛自己的灵魂都要消融一般的舒适感。然而，他轻轻抓住了她的手，“还，还不想变回去。毕竟，难得有了自己的人格和意志。”她注视着他严肃的目光，沉静的笑了。然后伏在他身前，将自己的生命之力分了一部分给他。"\t\t"    影之王，最有资格取代前代成为夜之王。在召唤出他的幽灵城堡中，他的战斗力无人可及，然而在这里他唯一的作为异世界存在的弱点也暴露无遗，可以被召唤而来，也就可以被反送回去。无法力敌的众人，在他的游戏中纷纷“落败”，然后暗中准备着反召唤他的仪式。最终走到他面前，陪他废话的，当然是一无是处的主角。当影之王发现他们的意图时，却已经再无力阻止他们了，最后关头想要取走眼前可恶小子性命时。一直处于中立的幽魂巫师，突然出现并挡在了他面前。\r\n    虽未被影之王所伤，但一路闯关过来，徐幻已经撑不住了。幽魂巫师扶着他坐了下来，仔细的端详着他的面容。徐也尽力保持着最后一丝清醒看着她，他曾经的主人。当她伸手去点徐幻眉心时，徐幻艰难的摇头，虽未有只言片语，她还是听懂了他的意愿。\r\n    大小姐赶过来时，正看到徐幻被阴魂不散的幽魂巫师抱在怀里，似乎正在吸取他的生命之力，她毫不犹豫的出手想将她赶开。然而，幽魂巫师完全没有注意大小姐的到来和她的攻击，她的额头抵在徐幻的眉心上，白皙的前额出现了一个泛着银辉的月亮标记，更宽广的银色光辉环绕着他们两人，而即使被大小姐的魔法球炸得面容尽毁，她的目光也没有丝毫动摇，只是温柔的注视着徐幻昏厥后苍白的面庞。那温柔的目光，让一向冷静的大小姐也忍不住嫉妒、羡慕交杂，一时间不知所措。\r\n    大小姐看出来她在向徐幻输送自己的生命力量，所以阻止了后赶到的世家女和血族少女，让他继续在幽魂巫师的怀中安睡。而不管来的人有多少，幽魂巫师始终不曾关注，她只是一心一意的将自己的生命分给徐幻。她的面容仍是刚才被大小姐炸毁后的样子，肌肤也渐渐老化，让陆续赶来的各方势力几乎认不出这个超然物外的boss级人物了。想趁机杀死她或俘获她的人跳了出来，大小姐则带着其他人反对，她在救的正是策划了这次行动，让大家免于灭顶之灾的徐幻。\r\n    正在紧张的关头，幽魂巫师站了起来，脸上的伤痕迅速恢复，老化的面貌也迅速复原，没有一丝瑕疵。重新变得不见丝毫表情的她，眼睛只是随意一扫，就将意图不轨的人群变得寂静，幽寂的环境让他们重新想到了恐惧。\r\n    在飘然离开之际，她在血族少女的耳边轻轻的说了一句话，留下了一个浅浅的笑容。只是这样一个微笑，竟然让同是女孩的血族少女也为之失神。"\r\n7.王座启动\t"夜之王\r\n大魔导师\r\n死神\r\n大恶魔\r\n月神"\t\t"   徐幻再一次出现时，已经不在是血族女孩和大小姐她们认识的他了。血族真祖的灵魂占据了他的身体，而幽魂巫师则远远的跟在他后边。作为夜之王座新的有力竞争者，他也加入到了这个越来越风起云涌的争斗漩涡之中。\r\n    至于最终血族真祖的真意，夜盗的指引，月神的毁灭，魔法世家的使命，血族女孩的心愿，以及徐幻所想要追求的自由，究竟有什么意义呢？也许直到一切结束以后，旁观者们还是无法看清，即便看清也无法理解，即便理解也难以认同。\r\n    唯一确定的是，最终的最终，谁也没能得到夜之王座，谁也不可能成为暗夜的统治者。\r\n"\t\t"    \r\n    一切尘埃落定时，他也重回了两大世家中间那栋小房子，带着魂和血族少女。魂先一步踏进家门，直接占据了楼上血族少女常住的阁楼，将她气得没办法，最后在徐幻的劝说下屈居了地下。两边世家的家主，大小姐和世家女都来串门。在跳脱生死，真的成人之后，徐幻以前那怪异的性格倒是变得圆滑了，虽然也会开些过分的玩笑，但毕竟知道分寸了。最后，徐在血族少女怂恿下，将自己的家办成了一个驱魔师的聚会点。"\r\n	概要			Paragraph	2021-05-30	30000553
31000104	100	2021-05-30	目录：\r\n1.亡灵的崛起\r\n2.铁血的挑战\r\n3.恶魔之山\r\n4.圣盟初成\r\n5.自由之都会战	圣战诗篇一：混乱伊始	追正传六卷		Paragraph	2021-05-30	30000550
31000105	200	2021-05-30	目录：\r\n1.野蛮人的入侵\r\n2.东北方的战神\r\n3.十字军的危机\r\n4.丛林勇士\r\n5.教庭死士\r\n6.天空骑士	圣战诗篇二：百族大战	追正传十一卷		Paragraph	2021-05-30	30000550
31000106	300	2021-05-30	目录：\r\n1.亚龙骑士\r\n2.一战成名\r\n3.魔法皇帝\r\n4.枪墓\r\n5.骑士的荣耀	圣战诗篇三：英雄时代	追正传十五卷		Paragraph	2021-05-30	30000550
31000107	400	2021-05-30	目录：\r\n1.幽灵城堡\r\n3.黑暗众议会\r\n	圣战诗篇四：死亡阴影	追正传十六卷		Paragraph	2021-05-30	30000550
31000108	500	2021-05-30	目录：\r\n*屠龙行动\r\n1.龙王之威\r\n2.龙族侵袭\r\n3.三强互战（剑皇、风圣、黑龙）\r\n\r\n\r\n    在硫磺山附近遭遇的光明和铁血的军队之间，战斗一触即发，而双方后续的不断投入，使战况逐渐陷入胶着。血战正酣时，一声惊天动地的嘶吼，几乎震慑了全场的吵杂。双方指挥官不安的预感应验，但是已经几乎无法撤退了。被龙威震慑的双方军队，看到天空中那巨大无比的黑色阴影时，已经知道，自己的死期不远了。\r\n\r\n\r\n\r\n\r\n    冰龙王气愤的从龙神那里离开了，龙神（土）只能叹息这个世界的狂乱。原本想让龙族远离这个斗争漩涡的他，终于还是放弃了。倒不是担心其他几个子侄辈的龙王有什么危险，只是担心又会与其他种族陷入仇恨的连锁当中，就像龙族曾经统治这个世间时那样。他还叹息，无法理解老友智慧之神将这个世界引向混乱的做法。\r\n\r\n\r\n    \r\n    红龙王要抢回被人类占领着的，自己曾经的城堡。而那个魔法帝国最强要塞，现在正处于两军对垒的紧张时刻。作为对铁血帝国的桥头堡，只要这个要塞存在，铁血的军队就几乎毫无作为。\r\n    前来攻打要塞的军队，因为强大的魔法结界，甚至连城门都接近不了。六大魔导士之一在这里坐镇，原本已机智百出闻名的铁血名将，也是无机可趁。\r\n    而红龙王的到来，显然出乎了双方所料。当巨大的双翼遮住天空时，铁血的将领第一个反应过来，制止了妄图攻击的部下，以从未有过的卑下语调与其交谈。然后，灰溜溜的带着部下安全撤退了。\r\n    而当他的视线中再也看不到那个要塞时，他知道，自己的目的其实算达成了一半。那座要塞，已经注定要陷落了。毕竟它的对手是“神”，而且在众神中也是偏向于战斗的。那是需要一整个帝国集结起来才能与之对抗的力量。\r\n\r\n\r\n\r\n\r\n    绿龙的目标，从头到尾都是那座天空之城。然而，自从风神占据以来，他就知道自己再也没有了机会。怨念和欲望不断累积，直到百年前，新一届的风神在众神的争斗中死去，他又看到了希望。\r\n    这一次其他两个兄弟开始在百族大战中发威，他当然也不甘落后，带着自己的族群，直扑天空之城。\r\n    原本号称最强的天空骑士团，在真正的龙族面前还是显得太过孱弱，即便有赶往天空之城的荣耀帝国精锐，也只能勉强抵挡绿龙王及他的族群一时。就在天空之争最激烈的时候，突入起来的风神结界和风之禁咒，将搓手不及的绿龙王击伤了。\r\n    黑龙和红龙都是大发神威，唯有他稍微有些悲剧。\r\n\r\n\r\n\r\n\r\n\r\n\r\n    肆意破坏的黑龙，显然令得光明与黑暗双方都非常头痛，但是却又实在管不了。这种时候，站出来的保护无辜的，只有一直处于中立地位又被人们称颂为“英雄”的剑皇一行。只是没想到，与原本只是想合四人的力量赶走横行无忌的黑龙王的一行人，却又遇上了另一个强大神秘而且中立于光暗之争的神族集团。\r\n    三方的对峙，争斗，几乎席卷了整个山脉，最终结果，却是不清楚了。\r\n\r\n	圣战诗篇五：龙之怒	追正传十八卷		Paragraph	2021-05-30	30000550
31000109	600	2021-05-30	目录：\r\n1.奇兵突入\r\n2.圣剑继任者\r\n3.绝地反击	圣战诗篇六：光暗争霸	追正传二十卷		Paragraph	2021-05-30	30000550
31000110	700	2021-05-30	目录：\r\n1.黑暗的隐匿\r\n2.亡灵的末日\r\n3.恶魔的封印\r\n\r\n\r\n    世界重生，遮天蔽日的黑暗天幕消散，各种力量造成的天地异变消失，整个世界的地貌回到了末日浩劫发动的那一天。冥界的通道重新开启，亡灵得以进入轮回。各种变化，越是处于世界顶端的人物，感受越是深刻。降临之子和暗之君的面前，她复活过来，当着光暗双方很多大人物的面，做出了大胆的动作。\r\n    光与暗的对决结束，天使返回天堂，黑夜种族回归黑暗，世界即将从混乱中恢复。虽然还剩下很多问题需要解决，但是希望已经有了。至少降临之子和暗之君等很多顶级人物都心照不宣的进行着同一件事，让战争结束。剩下还继续着最后疯狂的，大概只有死灵君主罗德和恶魔族了吧。\r\n\r\n\r\n\r\n\r\n\r\n    自从亡灵大军被萧瞬间消灭而且求死不得之后，罗德的情绪就一直处于狂乱状态。一直跟随在他身边的被他变成死亡骑士的兄长，听着他的自言自语，表情虽然没有变化，灵魂却似乎有些触动。\r\n    罗德最后是被他兄长的养子们杀死的，其中，还有算是他徒弟的寒星。兄长最后的一剑，倒仿佛是他自己设下伏笔。想成为这个世界上最罪孽深重、最恐怖的人的结局，当然也会悲壮。相对于兄长被天使接引去的天堂，既没有地狱可去，也不会留恋人间的他，所应该走向的结局，只有完全的毁灭。\r\n\r\n\r\n\r\n    恶魔族仍然想要冲向人间，但是完全腾出手来的正义联盟的实力已经不是恶魔一族能够对抗的了。光明公国从东边、魔法帝国从西边，仅仅两个国家联手，已经因为大邪神的那次乱入弱了不少的恶魔族一触即溃，最后连恶魔之山的地狱通道，也被六位大魔导士联合封印了。\r\n\r\n\r\n\r\n\r\n	圣战诗篇七：最后决战	追正传二十三卷		Paragraph	2021-05-30	30000550
31000111	100	2021-05-30	目录：\r\n1.托付之物\r\n2.异域战场\r\n3.守护种族\r\n4.铸剑之血\r\n5.大战群魔\r\n6.邪族退却\r\n	第一卷 冥月之境			Paragraph	2021-05-30	30000548
31000112	200	2021-05-30	目录：\r\n1.魔法之都\r\n2.暗之子\r\n3.龙骑士与屠龙士\r\n4.战神之胄\r\n5.宙斯的愤怒\r\n6.智慧之神的庇护\r\n7.守护的传承	第二卷 人界之旅			Paragraph	2021-05-30	30000548
31000113	300	2021-05-30	目录：\r\n1.叛逆与背叛\r\n2.危机\r\n3.拼死一搏\r\n4.血污的咒印\r\n5.毁灭与守护\r\n6.守护与毁灭\r\n7.合一的命运\r\n8.尾声	第三卷 守护之心			Paragraph	2021-05-30	30000548
31000114	1	2021-05-30	1.双生之子\r\n2.天籁之音	序章			Paragraph	2021-05-30	30000548
31000115	0	2021-05-30	                          玛亚的守护\r\n                          一  异地故友\r\n    伯德尔，大陆西边边境的山脉。这里的地势陡峭、峰谷相间, 满山的巨树莽草，树枝交错夹杂,将整片森林封得严严实实的。森林边沿倒还有些住户，林子里却似乎只有传说中的森林守卫和一些小动物了。据一些猎户说，曾有军队来这里清剿那个森林守卫，可他们才走进森林，周围的树木就突然变化成人型，将他们团团包围。这些人好不容易突围出来，都吓得再不敢进去了。由此，“森林守卫”的传说才蔓延开来，而且那怪物的形象也被谣传得越来越恐怖。\r\n    对于大陆中心的五大国而言，这里已经是世界的尽头了。然而，雷特从一些旅行家口中得知，在森林的另一边，存在着另一个世界：一望无际的草原，稀稀落落的各族部落，兽群错杂，蛮族割据，是个原始的弱肉强食的世界。听说那边也有人族部落，似乎是多年前被其他人从森林这边驱逐过去的。人们为了生存，每天都与其他种族斗争，与大自然斗争，民风彪悍可见一斑。不过又也许只是为了领略那传说中草原上狂傲不羁的风，总之，雷特决定到那个界去走一遭。反正对浪迹天涯、四海为家的雷特来说，与其在这个刚摆脱生命威胁就开始你争我夺的腐朽的世界里晃荡，到不如去那个新世界。其实，虽不愿意承认，他也知道，自己心底还是留存着寻找归宿的想法。\r\n    享用完好不容易猎到的兔子，雷特招呼了一声疾电，示意该上路了。只见它嚼了最后的兔腿，缓缓站起身来，紧收着翅膀，小心翼翼地向雷特这边走来。这几天也的确难为了疾电了，让习惯了在天空自由飞翔的骏马跟着自己在这树枝参差的林子里走了两天，实在是把它憋闷了。疾电青绿色的毛皮上有些刮痕，虽未流血却明显受了些伤。\r\n    雷特选择从森林穿越过去，本是想会会那个森林守卫，可他们在森林里穿行了两天，却连那守卫的影子也没看到。本就对这守卫没了兴趣，又因为疾电的不悦，雷特便决定离开了。于是他和疾电走到一处树木稀疏的地方，翻身骑到它背上。疾电心领神会，欢快的嘶叫一声，振翅腾空而起。一时间风之元素环绕在他们四周，将错杂的树枝吹断折裂开来。\r\n    而雷特没注意到的是，在不远处的一棵古树的阴影下，一个身影正观察着他们。在他们离开的同时，它也遁入了森林的绿之海洋中。 \r\n    飞在天空中的感觉是多么舒畅啊！上是蔚蓝天穹，白云飘逸，下是丛林密布，郁郁苍苍，四周一片空旷，任他们自在翱翔。比之先前弓身而行的情境，好太多了。憋闷了的疾电一开始就全速飞行，无数山谷沼泽，被迅速的抛至脑后，迎面的强风吹得它青绿的毛发舞动，连雷特的头发都扬了起来。这也就是它名字的由来了：风驰电掣般迅疾。\r\n    连绵不断的群山，在疾电的飞驰中也终于到了尽头。才出森林，雷特便看到了与之前完全不同的景象。天空更高更清澈了，云少了，狂风席卷，茫茫草原上或绿或黄的波澜起伏不断，连绵不绝，直延伸到地平线的尽头。还不见人兽，便清晰的感觉出了这片大陆的无限生机。\r\n    太阳已开始滑落，雷特和疾电继续前行，还没飞多远，便接连遇到几个兽群，狼群、鹿群，甚至还有个熊人部落。一直到夕阳已经再看不见时，雷特才找到一个人类居住地。它座落一个很陡的斜坡上，侧临一条不宽的河流，背靠森林，外围尖头木栅栏一个挨着一个，内部还有些防御工事，俨然是座临时据点。    \r\n    雷特和疾电在大门前停了下来，下马站到门口等待。哨塔上的两人看见陌生人的到来很快作出反应，其中一个去报告了，另一个则一脸好奇地盯着疾电，应该是从未见过飞马吧。毕竟，除了荣耀帝国的天空骑士团，别的地方飞马骑士也的确少见。\r\n    几分钟的等待后，接待雷特的人便出来了。不过这个貌似光明神信徒的人的装束却是有些搞笑。本该黑白相间的袍子是用褐色布料做的，上面补几块蓝色的布条当装饰。胸前的十字架又是陶塑的。而他本人，蓬乱的头发和带血丝的眼显出他的极度疲劳，但这并不能压住他爱唠叨的嘴。\r\n    “骑士先生，很明显您是位骑士。我叫布恩，是一位光荣的神的信徒。我想您在这时候走到这里，应该是想在这儿休息一晚吧。很抱歉，我们正在迁徙，首领不想再牵连陌生人了，其实他也并不是讨厌陌生的人。不过您放心，我这就带您去见神使大人,他是神派来救赎我们的使者，他的伟大和仁善给予我们信仰，教导我们友爱。他一定会给您这样流浪在外以帮助的。”\r\n    一路走来，这个布恩的嘴没有一刻闭上过。不过雷特看出无论是老人、妇女，还是那些守卫的士兵都对布恩恭恭敬敬的，显然他跟着那位真神官，沾了不少光。随着这个布恩穿越了整个据点，直走到森林边沿。据点靠向森林这边一些巨石构成了一堵矮墙，绕过巨石间自然而成的“门”之后，便看见一个小而旧的帐篷立在那里。布匹泛黄，边脚几个补丁的那个神官的住处给了雷特一个不错的印象：他看起来不像是个贪图享乐的人。\r\n    那位神官似乎不在，雷特只好和布恩一起等在帐篷前。太阳已经半隐在森林上，晚霞连天，红云万里，似乎整个天空都变得暖和了。而雷特这里，没有鸟鸣，布恩也停住了嘴，惟有无聊的疾电在一旁走来走去，不时的轻嘶两声，倒显得有些沉闷了。\r\n    闲来无聊，雷特又看了看这个小帐篷，忽地有种熟悉的感觉。当他靠近了仔细查看时，门帐旁模糊的字迹引起了他的注意，雷特看了之后惊讶不已。只见上面写着：\r\n    追风者雷特\r\n    禁咒法师布莱特\r\n    神使莱尔\r\n    影\r\n    正在这时，帐篷的主人在一群孩子的簇拥下回来了，正笑盈盈地说着，“只要小娜娜和大家乖乖听话，跟着爸爸妈妈不捣乱，然后真诚的祈祷，神一定会保佑我们平安的。那么现在，大家快回到父母身边，好吗？”\r\n    一群孩子喧闹着跑回去后，他才顾得上看向等在自己帐篷门口的人。而也就是这一刻，他迎上了雷特的目光，一瞬间的惊讶之后，莱尔跑了两步来到雷特身前，激动得说不出话来。\r\n    旁边的布恩一脸茫然，而雷特却欣慰地看了看莱尔，然后指着那帐篷笑道：“这个帐篷，你还带着呢。”\r\n    “恩，这上面留存着我们那段流离失所的最艰苦的日子的痕迹。我，总是舍不得丢掉。”\r\n    “也是啊。那段日子里，我们几个由互不相识到患难与共，甚至可算是我最珍贵的时光了。记得那时侯你就安慰我们，说什么神会救我们的。”\r\n    “可神也的确把我们引导到了老师的身边啊。”\r\n    “这个，我倒是跟相信是我们同舟共济的努力和顽强的生命力让我们坚持了下来。”\r\n    “这样说也无可否认，呵呵。那段日子虽然艰苦，却也有着那么多美好的回忆。记得过沼泽的时候，大家手牵着手走，我被陷进泥沼里了，你们都坚决不放手，差点一起葬身在泥潭里……”  \r\n    布恩已经去向首领报告了，雷特和莱尔则挤进小帐篷里慢慢聊着。这个曾经容纳过他们四个兄弟的帐篷，现在却显得格外的小了。\r\n    雷特虽然习惯了一个人的生活，但此刻显然也因为能与阔别的兄弟叙旧而特别高兴。谈话中雷特得知，莱尔也是从别的旅行家口中听说了这片土地。特地赶到这边来，希望能用自己的努力，感化这些被“驱逐”的境外的人们重新拥有信仰，却不料，自己反被他们所感化了……\r\n    两人渐渐地又聊起了往事。雷特开口道，“你终究还是将影写在帐篷上了。十多年不见了，也不知他到底怎么样了。”\r\n    “虽然老师被迫把他逐出了骑士学院，但他毕竟是流亡时我们患难与共的兄弟。老师说他天生就是生活在黑暗当中的人，而且因为好强和叛逆，他的一生将多灾多难。我，总还是有些担心他的境况。”\r\n    “即使他遇上危险，我们也是帮不上忙的。不过以他的精明，应该也不那么容易死的。只希望他做事别太过火，别惹上了那些不得了的大人物……”\r\n\r\n    正在这时，夜幕中布恩急匆匆的跑来传话，“不好了，神使大人……我们的探子……敌人追来了……首领正策划去营救……您快去看看吧。”雷特没法从他语无伦次的话中听出什么，只能跟着明显有些着急的莱尔赶向首领营帐。半路上，雷特问，“莱尔，敌人是谁？”莱尔急匆匆地走着，深沉地回了句，“我们人类的宿敌。”\r\n    雷特有些惊讶，但不久就回过神来，暗想：这个世界上能称得上人类宿敌的不外乎三大势力：黑暗，邪恶和死亡。然而，经过六年前地的那场空前绝后的“圣战”，黑暗议会再没有什么大动作了，恶魔又早就被赶回到地狱跳舞去了，至于亡灵，更是基本绝迹了。那么在这里的敌人又能是哪个势力呢？\r\n    莱尔似乎看透了他的心思，补充道：“就是你认为最不该出现的那个几乎绝迹了的那一族。”\r\n    “啊！亡灵！”雷特一惊，“在这里的是哪个亡灵？还是亡灵巫师？”\r\n    莱尔低声道：“我还不能肯定。等你亲眼见过后就知道了。”\r\n    此时，几人已来到首领帐前。首领叫卡伽，粗犷的脸和高大魁梧的体格已彰显了他的霸气，而如鹰般锐利的眼神更透露出他的敏锐。这样一个人，的确很适合做首领，雷特暗想。\r\n    首领正在集合士兵。一群穿戴各异，高低不齐，胖瘦不均的士兵却笔直而立，个个透露出严肃、敏锐的表情。这些人与雷特从前所见的那些金玉其外的士兵正好完全相反，那坚决的眼神让雷特清晰地感觉到：决不能因为这松散的站队而轻视了他们的战斗力。\r\n    莱尔走到首领面前，卡伽首领和士兵们竟一齐向他致敬，显然他在这个部落里地位不低。首领简要地向莱尔和大家说明了情况：“通讯鹰送来消息，我们在敌后周旋的斥候取得了重要情报，但在斥候们聚集返回时被敌人发现，那个斥候重伤昏迷，没办法说明那个情报了。我们现在要组织一队骑兵去救援正在逃向这里的斥候们，并希望神使大人能救治那个昏迷的人。您也知道，我们现在必须把握每一线生存的希望。”\r\n    莱尔略一沉思，知道首领不会答应由自己亲自去救援，于是说道，“就这么办吧。不过，我想推荐一个人参加这次行动。我想，有他在，活下来的人应该会多些。”  \r\n                            \r\n                          二  救援行动                         \r\n    一小队骑兵杀气腾腾地奔出了据点，向西方急弛而去。队伍中疾电因为它那青绿色的毛发和收着的翅膀而格外显眼。\r\n    赶路途中，紧崩着脸的一行人神色渐渐变了，竟然暴露出了本性来。一群人一边驾马，一边嬉皮笑脸地聊了起来。一个带头说笑的标准屠夫模样的胖子还开起了雷特的玩笑，“嘿！小伙子，你的马可真特别，是有翅膀的啊，它会不会飞啊？”旁边的一个瘦高个的正是下午哨塔上站岗的人，他笑着应道，“会啊，我就看见这马儿在天上飞的样子了呢！多帅气啊，真是羡慕死了！”胖子听了大笑，“哈哈！那我们可就可以放心了，一会要是有危险您就立马飞上天去，保证那些死家伙拿你没辙。您可是神使大人的贵客，我们可不能让您受伤了。哈哈哈哈！”\r\n    雷特实在有些不敢相信这群人就是刚才杀气腾腾飞奔而出的战士。不过他更在意的是：看来自己不露两手，是没法让这些人服的了。\r\n    虽说是在说笑，可他们的行进速度丝毫未减。远远的，已能看到约定好的会合地点斜峡谷了。只见一座高山从中断开，形成一个狭小的裂缝，仿佛是被一柄巨斧劈开了的样子。而此刻，即使是深夜之中，雷特也隐约看见了裂缝中闪动的黑点：他们所要救的人正在向峡谷这边奔来！\r\n    然而，众人已无法高兴于同族的健在了，峡谷后更多的黑点追来，显然就是亡灵的部队了，而同时，大山两边也各冲出了一队亡灵骑士。这些亡灵骑士样貌和着装各不相同，雷特能看出其中有人类、半兽人、熊人、狼人以及其他雷特不认识的种族。他们的坐骑也是各异，马鹿熊豹参差不齐。 \r\n    正当亡灵骑士群快要堵住峡谷的出口时，雷特这边的战士收起了玩笑的神情，在那胖子的带领下冲了出去。由于雷特和众人先前的所在比较隐蔽，这时突然冲出，骑士的冲锋特长尽得施展，亡灵们被打了个措手不及。战斗初始众人借冲势突入敌群，刀枪剑斧一阵狂攻，打倒了不少亡灵骑士，将敌人搞得混乱不堪再不能前进一步。亡灵骑士们因为受阻，再不能堵峡谷口了，于是大怒地围攻向雷特这边的战士。虽然没了冲势，但战士们以一敌三或以一敌五却也能撑得住。雷特也被敌人团团围住，虽然这些低等亡灵对他造不成多大威胁，可他也无心顾及他人了。雷特紧握长剑，左右挥砍，将刺过来的几支长矛挡开，跃马前冲，一剑斩下一个亡灵骑士的头颅。雷特知道，虽然不算彻底，但这样对付亡灵能最有效让它们失去战斗力。\r\n   由于战士们的不错的战斗力和地形的阻碍对方人多施展不开的弱点，己方人在以十倍于己的敌人面前仍能应付自如，无一人落马。雷特连续砍翻几个敌人后斜望向峡谷，看见逃亡者们已经冲出了出口，几个战士已经迎上去将他们拉上了马背。可正在雷特暗暗庆幸之时，却不料一个体格巨大的亡灵骑士咆哮一声，一柄巨斧直劈向挡在最前面的那个胖子。胖子正与几个敌人交手，这突然一击让他猝不及防，只来得及将斩马刀横在身前。却不料，那劈下的巨斧将胖子的斩马刀连带右臂右腿一起削去了。一时间鲜血飞溅，胖子痛吼出声时人已翻身落马。\r\n    那个亡灵竟是个有思维的死亡骑士，砍翻了胖子后，一边指挥其他亡灵进攻，一边又冲向了下一个敌人。雷特见状，立即甩开身边的敌人，直冲向那个亡灵骑士。当另一个同伴被杀死时雷特才赶到，雷特借势挥剑斩下，却还是只与那个死亡骑士抵了个平手。雷特感觉着手臂的颤抖，暗自吃惊于他惊人的臂力。再仔细一看，这死亡骑士是个魁梧的半兽人，坐骑也是高大的蛮牛，怪不得力气非比寻常。\r\n    不过大家伙的动作灵活性就远比不上会操纵风的雷特和疾电了。雷特来回冲突，不仅挡下了不少敌人，还在这家伙身上留下了几道伤痕。可雷特无奈的是，这看似蠢笨的死亡骑士却很会自保，雷特根本找不到机会给他致命一击，而普通伤对亡灵可真只能算是苍蝇的骚扰，引起他的注意和愤怒而已。\r\n    雷特牵制住死亡骑士，帮其他人减轻了负担，逃亡的人们已经差不多都跳上同族的马背了。正当大家准备撤离的时候，摔在地上还无人搭救的胖子却大叫起来，“里恩！你个混蛋，忘了我了吗？”里恩似乎就是那个瘦高个，正犹豫的他再次听到胖子的吼叫后，纵马直冲过去。雷特旁顾时以为人都救完了，正退开时，却看见了冲向另一方的里恩。里恩还没冲到胖子身前，胖子已经大笑出来，“谢了，兄弟！我的尸就不用收……”他的话音未落，头已经被冲来的里恩削了下来，脸上竟仍带着大笑的表情。\r\n    雷特惊呆了，可没时间让他思考，战士们已经突围撤退了，他只好跟了上去。然而，对方却并不想让他们就这么逃了，一众亡灵跟随着那个死亡骑士紧追而来。凭借着高超的骑术，战士们一点一点拉开了与敌人的距离，可这仅有的一条大路使雷特他们没办法甩掉后边的亡灵骑士。\r\n\r\n    这场追逐似乎没有尽头似的，战马已经累了，战士们也是死一般沉默。雷特赶上众人时发现，本来前来救援的和刚才逃过来的斥候总共二十四、五人现在还剩十六个，其中一个还处于昏迷当中，应该就是那个知道情报的人了。雷特望向那个里恩，只见他满脸的泪水，又想起了刚才的胖子。旁边一个中年人断断续续地向雷特解释道，“那些亡灵中有不少是我们的兄弟，有时会觉得，死的是自己而不是他们就好了，就不会有不得不斩杀朋友的痛苦了……我们知道这次出来，十几人的性命就是为了赌一赌那个不知能不能拯救全族的情报，为了它没有人会退缩……我们的唯一的愿望就是像施森，就是刚才那胖子那样，在自己快死时有人来料理一下……施森是我们的开心果，在战斗之外，他总是努力让我们笑，就像他父亲为我们的长辈做的那样……里恩是施森的堂兄弟……”\r\n    虽然在与亡灵的战斗中斩杀无法生还的同伴的事雷特也曾听过，但从这些真正这么做的人口中说出时，雷特才真正有所感触：想起刚才还爽快地开自己玩笑的施森瞬间变成身经百战穿梭于敌群而毫不畏惧的战士，再下一瞬间变成了被同伴削下头颅的死尸，这才是在生与死之间斗争着的人们，单纯、真挚而悲壮。雷特深深感到，这群人虽然可能有着或养殖或手工的各种活计，但他们并不是闲散的士兵，正相反，他们个个是身经百战的战士；他们并不是冷血，正相反，他们个个身体里流淌着炙热的鲜血，甚至引得自己的血液也激荡得无法平静。\r\n \r\n    追逐战终于到了尽头，不过成功的并不是雷特这方。当众人看到前方一层又一层仿佛看不到尽头的亡灵骑士堵住了来路时，便知道已经冲不回基地了。\r\n    前有强敌，后有追兵，雷特见状旁顾，毫不迟疑地领头向左前方一处窄小的斜坡冲去，斜坡上不远就是茂密的森林，现在也惟有躲入其中才有可能摆脱敌人了。同伴们很快领会了他的意思，都急弛着跟了上去，其中两个没有载斥候的骑士甚至抢到了他前面做出一副应战的姿势，因为对方也看穿了他们的意图，一队亡灵骑士以同样的速度冲向斜坡。   \r\n    正当双方快要在斜坡下接触时，雷特的眼睛却定在了对方的指挥者身上：黑色骨马、黑斗篷，因为挥手指挥亡灵才露出巫师帽的脸——竟正是雷特最痛恨的那个人！\r\n    “死灵君王罗德！”雷特心中的震惊无法言语，“他不是已经死了吗？”\r\n    这一惊，雷特已经落到最后，前面的战斗已经展开了。虽然己方晚到一点，却以急速的冲锋闯出一条路来。一行人一边抵挡两面夹攻的敌人，一边向斜坡上退。雷特也没有多想，立刻前冲，经过一番厮杀，解救下被团团围住的从出发开始就一直沉默着的少年和坐在他背后的一个满脸是伤的汉子。少年以感激的目光看向雷特，雷特喊道，“我开路，你跟上。”。于是雷特与那个少年一起向前突进，很快来到了斜坡下。\r\n    在经过一番激战，己方在留下六具无头尸体后，终于上了斜坡。雷特走在了最后，冷静的他跳下马来抵敌于斜坡边缘，让疾电跑向了其他同伴，同时大喊道，“让那个人上我的马！你们进森林，我断后！”  众人很快领会了他的意思，虽然这么做并不妥当，但这样的场合已没时间给他们考虑，只好照雷特说的办，把那个情报员抬到疾电背上。\r\n    可此时的疾电却不听话了，竟将背上那人摔了下来，雷特瞥见了，焦急地命令式地向它吼到，“把这个人带回莱尔身边，不许把他摔下来！”\r\n    雷特这一分心，被不知从哪里钻出来的那个死亡骑士的巨斧当头砍下。慌乱之中，雷特抬剑去挡，巨大的冲击力将他击得坐倒在地，头晕目眩十分难受。还没等他调整身形，旁边一个亡灵骑士的长矛已经刺了过来。眼看着雷特的身体要被洞穿时，矛头却被一个瘦小的身影举剑挡了下来，这正是雷特刚才救的那个少年，他也同样跳下马来，守在斜坡边。 \r\n    没时间道谢，托他之助再次站立起来的雷特，重新与死亡骑士战在一起。而那少年，也在一边帮忙抵挡着其他亡灵骑士。虽然骑士少了马实力大减，可狭窄而陡峭的地势也使对方同样无法发挥骑士移动性和冲击的特长，斜坡上的战斗持续着。\r\n    当疾电搭着昏迷者飞向据点时，亡灵后方竟飞出了一群骨鹰直向疾电远去的方向追去，显然亡灵也是有飞行部队的。疾电会很快甩掉追兵的，雷特并不担心，他现在要顾及的，是自己这些人的撤离。忽然，雷特听到后方的群马嘶鸣，并且马声越来越近，一下子明白过来，正要向一边闪开，却又瞥见了那个共同对敌的少年，只见他倒在地上，脚上的伤口血流不止。雷特于是又改冲向了他。少年似乎明白了什么，已经闭上了眼睛，却不料雷特插剑回鞘，双手抱起他躲过刺来的各种武器，闪向了一边的森林，刚好和马阵差开了。七、八匹战马嘶叫着冲下斜坡，将反应不及的亡灵骑士们撞了个人仰马翻。雷特等人也借着这短暂的混乱穿进了森林。不过因为冲向了西侧更远离据点的方向，雷特两人与其他同伴走散了。\r\n\r\n    雷特在森林中穿行了很久，直到天快亮时才停了下来。少年一直沉默着，直到雷特把他放下靠在一棵树上，他才轻声说道，“你还是自己走吧，带着我这个累赘是很难逃出去的。”\r\n    “我很佩服你们壮士断臂的勇气。但是，要我丢下同伴，无论何时，我都做不到！我到过很多的地方，见到过很多因为贪生怕死而对同伴见死不救或为了利益手足相残的混蛋，但在这里我看到的却是完全不同的大义和友情。我现在明白莱尔为什么会被这里的人感动了，他所感动的是你们的真诚，而让我感动的却是这些战士的铁血。如果你们能为那个情报从容赴死，我也愿意为你们而死并以此为骑士的荣誉！”\r\n    雷特感觉自己这两天说的话比前两年的总和还多，这一说完，两人都沉默了。少年伤口上的布松了，血液缓缓地流出。雷特默默地撕下衣襟再给他包扎了一下，然后坐到了他旁边。强忍着疼痛的少年一直阴霾着脸，静坐了一会儿后，他轻轻地把胸口的挂坠拿了出来，出神地凝视着。这个所谓的挂坠实际上是个徽章，纯银的镶边围绕着一个金色小盾，小盾中央又刻着只金色狮鹫，一旁的雷特一眼就认出那是魔法帝国的皇族徽章。雷特正想伸手去触摸那个徽章时，少年很快挡住了他的手，严肃地说道，“别碰它！”\r\n    雷特看了看他，又仔细回想了一下他的战斗方式，问道：“你也是从森林那边来的？”\r\n   “恩，从魔法帝国逃出来的，多亏了这个宝物。”\r\n     雷特对魔法帝国的皇家的内幕也略知一二，他奇道：“魔法帝国皇族虽然没有掌控国家的实权，却也是有不少特权的。不过我听说，四个皇家徽章是不允许外落的，听传言曾有不少皇戚因为丢失了徽章而被处死了的呢。难道送这个东西给你们当通行证的人不知道？”\r\n    少年听了惊讶不已，激动得有些口齿不清了：“有这种事？恩人并没有说啊！父亲说恩人叫我们走得越远越好……从我们穿过森林开始就帮着这个部落发展，安定后本想回去却又几次穿越森林都失败了，再后来就遇上了亡灵，父亲至死都因为没能亲自送还这个宝物而惭愧。可照你这么说，恩人不是早死了？”\r\n    雷特虽然对少年的故事也有些好奇，但他知道现在不是想这些的时候，他缓缓起身，说道；“该上路了。”\r\n    \r\n    雷特两人开始在森林里摸索着前进，一直向东试图找到那个临时据点，却似乎总走错路。\r\n    途中，雷特和少年渐渐的熟悉了对方，谈话也多了很多。雷特知道这个孩子叫尤迪，挺机灵的，年纪不大却通晓很多东西。雷特不久就发现，尤迪和自己很投缘的原因了：他和自己一样，极其好强，无论何时都不愿意成为累赘，每当给朋友带来麻烦时，都很恨自己的无能，并不是因为愧疚于给他人带来烦恼，仅仅是很看不起这样的自己。不过这短暂的相处中，雷特也看出了尤迪孩子的天性，很容易被捉弄，生起气来脸蛋红红的像个女孩子很是可爱。\r\n    不过雷特也有些焦急，依照他们这胡乱摸索,等找到那个据点时，恐怕罗德的死灵军团已经把那儿踏平了！\r\n    然而，雷特所不知道的是，莱尔他们所面对的局面，并不比自己的处境简单。   \r\n\r\n                          三  算计与被算\r\n    对生死判决的等待永远是漫长而急噪的，在没有看到雷特一行安全归来前，首领和莱尔都没法平息心中的焦虑：这次行动的时间太长了！他们究竟遇到了什么？ \r\n    忽然，天空中一个影子飞下，落在众人身前，正是载着情报员归来的疾电。莱尔抢先跑向了疾电，他不敢猜想雷特等人的境遇，现在只能先救醒这个伤者了。莱尔刚接触到他的手，立即感受到微弱的死亡气息，这个人是被血族所伤？虽然猜疑着这个人就快“死”了，可莱尔并没有停下扶他下马的手：得趁他还有最后一点意识的时间，问出那个情报！\r\n    然而事情并不如他所愿，正当他似乎碰到伤者身上什么松动的东西的时候，后者深埋着的脸扬起，嘴角细长的獠牙瞬间印上了莱尔的肩头！\r\n    事出突然，正跑过来的首领卡伽等人大惊，接着更迅疾地向这边冲来。而莱尔忍着被嘶咬的疼痛，将左手抵在已变为亡灵的斥候胸口，口中轻念，“以神之名，请安息吧。”刹那间白光闪动，亡灵如遭雷击，一下子摔下马来再动弹不得。\r\n    其他人见这一连串变故，都有些不知所措，莱尔却丝毫不顾伤势，俯身在死者身上翻找起来。他很快找到了刚才所碰到的东西，一张泛黄了的羊皮书卷。莱尔将书卷拉开，自顾自地看了起来。书卷是用莱尔也并不太懂的古希族文字写的，字迹密密麻麻的古卷排头的是个醒目的名字：玛亚之卷。\r\n    莱尔十分想丛中找出能拯救全部落的情报，但身上的伤却越来越明显，身体开始战粟，血液翻腾，头也晕得厉害。莱尔忽地明白过来：自己太大意了！敌人是罗德已毋庸置疑，吸血鬼的死亡之牙虽伤不了自己，可罗德的黑暗力量却是可以会毁灭任何人的！\r\n    莱尔越想越感到心寒，还好自己隐藏实力在敌人所能了解的情况中只是个普通传教士，没被罗德看出来。罗德这人是喜欢用能杀死主教的方法来对付普通神父的，但还好莱尔比一般的主教要强得多。\r\n    再看了一眼躺在地上的亡灵，这个家伙身体颤抖着竟还未“安息”，莱尔忽然想到了些什么。可正当想他附下身时，他的身体一下子不受控制地瘫倒在地上……\r\n\r\n    还算成功的设计了来到那个部落的“传教士”的罗德却也并非是一帆风顺的。先是一个可恨的人偷盗了他好不容易找到的古迹里的宝物，而自己竟在毫不知情下将他变成亡灵后又送到了那个部落里。被蒙蔽和算计的罗德怒不可遏，发誓要追回那个宝物。可正当他截下那群逃亡的人时，却又发现了那个该死的雷特，仇人见面可是分外眼红，罗德连夜调遣自己的大部队紧守着森林，并派大量骨鹰在空中搜索，宁愿放弃了那个部落，也决不放过这个曾“杀”了自己的人。可无奈的是，那个混蛋宁愿缩在里面不分东西的乱走，也决不出森林来。这个连接横贯整个大陆的森林也不是罗德现在这点军队所能包完的，罗德一时也拿他没办法。\r\n    此刻的罗德正坐在人族部落的临时据点里，看着这空无一人的地方，心头不禁又是火冒八丈。不过出乎他意料的是，他用来算计传教士的小吸血鬼一击都手马上遁逃，竟还逃了出来。现在的他，只能察看这小家伙的脑子里有没有能追踪那群人的信息，比如说关于森林边上那些特殊符号的信息。\r\n    罗德伸手抵在那个吸血鬼额头，刚准备探察，整个身体却立即被一阵耀眼的白光淹没。两旁的骷髅们恐惧于这神圣的光华，全身不停颤抖着。白光消散后，那个吸血鬼全身僵直地躺在地上彻底死掉了，脸上尤带着惊恐万分的表情。而罗德，斗篷敞开了，露出了其中的骷髅身躯，他脸上早已没了表情，下巴抖动发出的声音也完全不像人声，“真巧啊，不仅那风骑士来了，原来那个神使来得更早啊，都等不及了来送死呢！敢算计我，你们以为自己逃得出我的手掌心……要不是我才重生，还没找到强大的手下，我会把你们放在眼里……要不是兰斯那混蛋，我怎么可能会被你们杀？”\r\n    罗德自身可并不像他说的那么轻松，米伽勒的光明神力可不是那么好化解的，尤其是对于他复活用的这个纯黑暗系的骷髅身体。虽然这力量出自重伤了的莱尔，但受设计了的罗德也无法使出全力了，至少他是没法操纵大量亡灵顶着阳光大肆进攻了。可真是一报还一报了。不过罗德可是不会放过算计过他的人的，即使是上次“死”之后，也拉了光明教会不少高层陪葬了，可以说现在还健在的许多大人物都还活在他的阴影下呢，更别说这几个他从没放在心上的后辈。  \r\n    罗德一面命令身边的骷髅将那吸血鬼抬出去，一边思考着什么，不时地发出些阴险的冷笑，似乎是找到抓住那群小老鼠的方法了。\r\n                                                                                          \r\n    几个骷髅抬着死吸血鬼往森林边缘走去，尸体上附着的光明力量让这小喽喽们害怕得抖个不停。骷髅们刚到森林边，就赶紧丢下死尸，一摇一摆地走了回去。\r\n    然而，这具尸骨并非就无人问津了，就在骷髅们走后不久，一个身影小心翼翼地从森林里钻了出来，俯身察看着那尸体，这正是在森林里晃荡了一天多的雷特。当他翻过匍匐在地上的尸体，发现自己一行辛辛苦苦救回来的竟是个“陷阱”时，心中既惊讶，又愧疚：白忙活了一场。莱尔怎么样了，恐怕是受伤了吧，伤得重不重？\r\n    雷特没有停留，立即又反身进入森林，去告诉尤迪自己的发现。而尤迪却正看着一些树上奇特的符号发呆，雷特多次招呼他，他却根本不理。又是比画又是念叨地看了良久后尤迪恍然大悟似地说道，“我明白部落留下的信息了，跟我来，我们去追他们。”雷特也心忧莱尔的伤势，立即跟上了尤迪。雷特看着尤迪一瘸一拐的脚步，不仅有些感叹：这孩子还是太好强了，脚伤那么重还坚持自己走，不过自己背他又会伤他自尊心，真跟当年老师收留自己时一样。不过雷特自认，自己是永远赶不上老师的和蔼和睿智的。\r\n\r\n    两人很快远离了据点，不久就从一处亡灵守备薄弱的地方突围。然后又毫不停歇地向东行进。根据尤迪所解译的信息，两人从早上一直走到黄昏，却无奈地发现，自己两人竟走到了一处悬崖。望着断崖下烟云缭绕的情景，两人相视苦笑。\r\n    尤迪迷惑了，“我的理解应该没错啊，怎么会走到这样的地方来呢？”\r\n    雷特也是同样的无奈，现在再回去理解那些特殊符号是不可能了，只能试试这最后一点希望了，“在附近找找，看有没有他们留下的标记，也许他们自己也是仓促行动结果不小心走上这悬崖的吧！”\r\n    “不可能！”尤迪立即反驳，“我们的行进路线都是由‘云岚’或其他人探察过的，断不会有走错路的情况！” \r\n    听尤迪提起“云岚”，雷特才想起这个跟疾电一起长大的小家伙，它可算是马中最高贵的一种了——独角兽。还不论它所拥有的光明力量的量和强度，光是它的智慧就远非它的“哥哥”疾电所能及的了。本属光系的云岚却可以向疾电学些御风之术，它的思维也并不比人类差多少。雷特见到莱尔的时候就觉得莱尔身边少了什么，却一时望了是它呢。那若是由它带路，是不可能把人们带上绝路的吧，其他人类就更不用说了。可这样一来，理解那些符号也没错，部落的路线也没错，可这明显的悬崖难道还是正确的路？虽然寒星也说过，这世界上没有不可能的事，可怎么才能把“悬崖”和“逃生之路”联系起来呢？难道这死路上有避难所？\r\n    “避难所！”雷特不知哪来的灵感，而旁边的尤迪听他说出这三个字时却是一脸茫然。为了验证自己的猜想雷特向四周张望着，很快跑到一棵矮树下，削下一支较细的树枝，自顾自地走到悬崖边，将树枝当作标枪掷了出去。凭他的臂力和投掷技巧，树枝本该直飞出去二、三十米而不想下掉的，然而这根树枝才飞十三、四米，就像撞上什么东西似的反弹一下然后直直地掉下了悬崖。\r\n    这地方果然有结界！ \r\n    尤迪依旧是一副茫然的表情，正当他上前想问雷特时，雷特却已经在沉思如何与结界内的莱尔取得联系了。尤迪见他不理睬自己，只好讪讪地走开了。\r\n    莱尔一定就在这个结界内，可是到底怎样才能和他联系呢？又不能胡乱打击这个结界，谁知道它的强度有多大。这样麻烦的问题是应该交给寒星的，雷特可学不来他那些千奇百怪的魔法理论。\r\n    正当雷特束手无策的时候，眼前的景象却忽然起了变化。悬崖前半空中出现了一个巨大的光屏，直延伸向崖下的云雾之中。屏上淡淡的彩色光华照耀着四周，显得神圣而庄严。正当两人暗自惊讶时，光屏消散了，显现出一座笔直的山峰，雷特眼前的峰顶上矗立着一座高大的城堡。泛黄的墙壁更显出它的古老，雷特看到它的第一眼时就想到，要是从山下仰望它，恐怕就只能用“圣城”来形容了吧。\r\n    吊桥是城堡唯一与外界连通的通道，如今正慢慢放下搭在这边悬崖上，大开的城堡大门旁布恩大声的向两人喊着，“快进来！快进来！”雷特和尤迪毫不犹豫的冲向城堡，他们前脚才跨进大门，吊桥就收了起来，光屏出现将城堡包裹住，惟有那阳光穿透了这层结界，使这里依然明亮。\r\n    雷特刚进城堡便听到空中一声熟悉的马嘶，等他抬头看时，疾电已冲至身前。疾电用头顶了顶他的胸膛，表示问候。雷特也抚着它的头，高兴的说，“伙伴，让你担心了。”疾电的低声嘶鸣像是在回应他的话。\r\n    雷特、尤迪跟着布恩和其他几个来迎接他们的战士走向城堡中心的宫殿，在内城门前的广场上见到了莱尔。雷特一眼就看出莱尔的身体极度虚弱，被一个女孩扶着，一身睡袍，脸和嘴唇都是那么的苍白。他正想问莱尔的伤势，莱尔却勉强微笑着说道，“你们先吃点东西睡一觉吧，已经两天没睡了吧。我先帮尤迪治伤，他的伤看起来挺重的。等你醒了我们再谈。”雷特瞥见莱尔额头的汗珠，最终将那许多的疑惑搁了下来。\r\n    莱尔被扶着走了，尤迪也被带去治伤了，反倒是部落首领卡伽来到雷特身前。正如他粗矿的外表，卡伽的语言一点也不绕弯子，“感谢您把尤迪安全带了回来，我们本就很对不起他父亲了。这本来只是我们部落的事，却连累了您和神使大人陷入这样的危险当中。我们祖先的誓言要求我们靠自己的力量生活在这片大陆上，所以我们不能听从神使大人的向森林另一侧求救的建议。我们的固执也许会导致自身的毁灭，但你们二位却不必如此，毕竟我们没有任何留住你们二位的理由，也根本没办法报答你们……”\r\n    “如果是对于我的报酬，那么与我同行的那个胖子已经付过了——他给了我一身沸腾的血液和一颗以死为荣的心。我到现在才发现，自己竟是个好战者。平凡的生活容不下我这样的人，战士的灵魂惟有争斗才能寄托。虽然理由不同，但我跟莱尔都很清楚什么是值得自己付出生命的。”雷特边转身，边回头笑道，“既然你选择了坚守这座城池与敌人决战，那么我们又何尝没有希望置之死地而后生呢？我可是最喜欢游荡在生死一线的感觉呢！”\r\n    置之死地而后生！雷特明白这座城虽隐蔽而坚固，但终究会被罗德发现的。现在的片刻休息还只是暴风雨前的宁静，与罗德的决战已经不远了。\r\n\r\n                          四  圣城玛亚              \r\n    由彩色的光屏透进来的昏黄的光线可以看出，现在已经是黄昏时分了。\r\n    结界内的人们各自做着自己的事。战士们边磨着武器，边聊着天。妇女们正收拾着新家，孩子们聚在一起，“探索”着这从未见过的宫殿。\r\n    躺在床上养伤的莱尔也正跟身前照顾自己的女子开着玩笑，“摩雅也十八岁了吧，到该出嫁的时候了呢。怎么样，有没有意中人啊？要不要我帮你说和说和，说好话我可是很在行的噢！”莱尔若无其事地开着玩笑，却不知背对着自己的摩雅听了他的话紧张得说不出话来，清丽的面庞上透出几许红晕。 \r\n    莱尔见摩雅没回话，又说道，“要不然，你有其他什么愿望吗？说出来看嘛，也许我可以帮你实现呢！”这次却并不完全是开玩笑了，莱尔预料着自己的性命或许不长了，到也有心帮帮摩雅，不知怎么的，他总觉得自己亏欠了她些什么。\r\n    在莱尔的催促下，摩雅几番犹豫，最终轻声细语地向心仪的人吐露了心声：“我的心愿是……是……有一次我们一群女孩子跟您一起祈祷的时候，我偷偷看了看您，那时您说，‘不专心祈祷，愿望是不能实现的’。从那以后，我每天都很专心的祈祷……祈祷能一辈子在您身边照顾您，帮您做饭洗衣……我知道如果现在还不能说出来，以后可能就没有机会了，我……神使大人，我的愿望能实现吗？”摩雅刚说完，刚才一脸决然的表情尽失，怯生生地望着莱尔。\r\n    莱尔露出些微难堪的表情，顿时没了话语。从来都禁不起人请求的他对摩雅这样近乎哀求的示爱不知所措，又想到也自己不知到底还能活多久，进退两难的他只能支吾着，“这个……摩雅……”\r\n    摩雅见他不知所措，立刻“明白”是自己一相情愿了，心里一下子又乱了起来：我怎么那么冲动，一下子把心里话说了出来。即使不说，自己只要能见着他也心满意足了。要是以后他都不让自己照顾了，躲着自己，那怎么办啊！又羞又急的摩雅也慌张不已，正欲冲出屋子，却被莱尔叫住了。\r\n    此时的莱尔已不在紧张，双手轻轻地抚摩着静静地坐在自己身前的摩雅的秀发，温柔地说道，“其实在第一次与你相遇时，我就被你坐在草地里的身影所吸引，你的浅笑给我一种很温暖很像‘家’的感觉……”\r\n    摩雅将头轻轻地靠在莱尔的胸前，静静感受着他的体温，小小的一颗心被幸福装得满满的，不知不觉就睡着了。\r\n    莱尔心里却并非只是简单的满足感，轻扶着摩雅的头，他的内心却在挣扎：我是不是太自私了呢？照现在的情况看，与罗德的一战，必须战斗在最重要的地方的我恐怕是凶多吉少。明知道活不久了，却还接受摩雅的感情，这不是让她更痛苦吗？可在这最后的时刻，还不能表达自己的内心，也太遗憾了吧。哎，既然已经选择了，也只好如此了。\r\n    摩雅做着甜蜜的梦心满意足地睡着，莱尔却细细地盘算着敌我双方的战力，思索着击败罗德的方法：亡灵巫师的长处在于他们能控制无可计数的不知畏惧的死灵为其战斗，像罗德这样的人还能当即将战场上的死者收为己用，是根本无法于其硬拼的。想要击败他们，就得事先了解其方位，然后依靠精锐部队突破死灵的防卫，击杀巫师本人。只要巫师本人一死，靠他所施法术维持的众多亡灵便全灭了，剩下的少数有自我思维的高等亡灵虽然强大，却也不足为虑。可是就现在的形式，己方能冲入亡灵大军击杀罗德的就只有雷特一个，罗德就算失了从前那众多的强力手下，也还不至于连一个刺杀者都对付不了吧。而且就自己的观察，雷特也和自己一样大不如前了，看来也只有由我来帮他了。等我养好了伤，应该能够成功召唤出一位天使，可即使是神灵，也不一定能碰得到罗德啊。\r\n    还是燃烧生命召唤炽天使才能有胜算吧！莱尔，抚着摩亚的秀发，叹道，“只是这样就对不住她了吧！”\r\n\r\n    当摩亚慢慢醒转时，正瞧见雷特站在门口饶有兴致地看着她偎在莱尔怀里的样子。被客人这么看着，初偿爱情滋味地少女立时羞得脸红到耳根，急忙站起身来退到一旁，尴尬得说不出话来，一双水灵的眼睛也急得直打转。\r\n    莱尔看了不禁好笑，看来今天的告白已经用掉了她积攒起来的全部的勇气，一下子又变回那个乖巧可爱、胆子极小的姑娘了。不过毕竟是自己的女孩儿，莱尔可不忍心看她在这自顾自地慌张，于是柔声说道：“雅儿去找些吃的吧，我们俩要好好谈谈。”摩雅知道是“他”帮自己解围，忙应了一声，飞也似地逃了出去。\r\n    雷特慢步走进房来，笑道：“想不到竟是你这个假神父先成了家呢。”莱尔无言以对，自己明知很可能死去却还接受摩雅这么好的女孩子，这样误人一生的行为也不知雷特会怎么想。雷特似乎看出了他的心思，笑脸一收、话音一转，拍着他的肩膀沉声道：“我们几兄弟都不像是能成家的人，但是既然你接受了人家的情意，可就得一生都好好对她啊。”\r\n    “一生都好好对她，可自己这一生还有几天我都不清楚啊！自己也不知怎么就答应她了……”\r\n    “是说罗德吗？”雷特的眼中似乎映出了那张可憎的面孔，眼中的杀气一闪而过，恨恨说道：“既然我们能杀他第一次，也一定能想办法杀他第二次，而且这次一定让他永远的消失！”\r\n     “他的复活也许与那枚神秘的戒指有关，就是他上次死的时候手上戴的那枚。听说戒指才收藏进魔法图书馆几天，就不知为何不翼而飞了，而且现在似乎又到了他手上。上次老师也就是为了毁掉那枚戒指，才忍辱负重受他控制的……”\r\n     一提到“老师”二字，两人都沉没了。对于崇尚自由而从不循规蹈矩的雷特而言，死灵君王这样害人无数的邪恶魔头他虽也坚决打击，却决不会如此憎恶，毕竟不受人了解和尊重的自己多少也理解些他们的悲哀。但罗德不同，与他的血海深仇雷特决不会退让一步！因为他心目中最伟大最和善的尊师，神圣骑士团前团长兰斯•帕尔斯，正是被他一直真诚以待希望他能改过向善的亲弟弟杀死的，不止是杀死了他，还故意将他变成死亡骑士，连带圣骑士那无上的荣耀和他最珍惜的诸多徒弟的性命，都被这个可恶的家伙夺了去了。最后尊师竟欣然选择了这世上最痛苦的死法走向了毁灭,而执行那光之葬力的，正是眼前这个人。雷特想到当年老师收留自己时，为了顾全倔强的自己的自尊心而提出平等对决，输了就做对方徒弟的可笑决斗。老师的微笑、他温柔的话语和搭在自己肩上的厚实的手掌，雷特至今都记忆尤新，然而他老人家却已撒手人寰。\r\n    莱尔更有着难以磨灭的酸楚。在他们四兄弟里，与老师相处最久感情最深的就是他了。老师的谆谆教诲让他懂得了如何做人，老师的用心磨砺让他不再怯弱；而为了让他能拜教皇大人为师，带着他苦苦地等候召见，又为助他通过教皇大人的测试，四处打听以前的“考题”，辛苦地给他找来了几大本书，本来也不怎么懂这些烦琐理论的老师坚持和他一起读到深夜；当莱尔通过了考验后，老师的脸上分明是对儿子的成功而欣慰和骄傲的表情，莱尔哪能忘记呢！尽管他不可能说出心中大逆不道的言语，但莱尔明白，在他心里对恩师的崇敬比之对神的信仰更深厚得多。然而他还没来得及报答恩师，却就做了老师的送终人，看着老师在光明力量中强忍痛苦的向他微笑，莱尔的心似被千万把刀割裂着。而也就是那次，原本召唤炽天使的自己，竟破天荒地见到了光明战神米迦勒的降临，老师的灵魂也由主神大人收了去了……往事历历在目，莱尔低声而决然地说道，“我决不会让罗德再夺走我任何一个亲人了。”\r\n    雷特从回忆中回果神来，强笑着接过话茬：“有了家室的人可没权利去送死，只有我这样死了都没牵挂的人才有资格说这话。”\r\n    雷特话一出口，气氛顿时轻松了许多，只是莱尔显然还不习惯“家室”这个词，尴尬着说不出话来。\r\n    雷特也没有刁难他的意思，岔开了话题，“给我详细讲讲这边发生的事吧。那个被‘初拥’的情报兵到底送回了什么，这座城堡又是怎么回事？我可是越来越糊涂了。”\r\n    莱尔并没有立即回答他，他从怀中取出一张羊皮古卷，展开来给雷特看。古卷上最显眼的是右上角画着的一座城堡，那高耸的塔楼厚实的城墙，显然就是他们现在所在的这座古堡。然而雷特也就只看得懂这个，书卷上的古文字哪是他能懂的啊。\r\n    莱尔看了看雷特，慢慢解说道：“这些文字是圣联中最神秘的古希一族的独特文字，其文颇为艰涩难懂，我也只能给你简单翻译一下。\r\n\r\n                                 玛亚之卷\r\n    人类终将发展变迁。\r\n    虽然我比不过古希过去的诸位伟大先知，但我相信自己的决定是正确的。以神的名义，我将带领我的族人一路向东，穿过远古森林，到森林另一侧的富饶的大地上去生活。这片土地因为几大部落间长久的战争已经不堪重负了，如今的它极其贫瘠，已经限制了我们的繁荣了，野外众多的野兽等待着吞食我们离群的族人，诸多的困境束缚了我们意欲伸展的手脚。所以，我们不得不离去了。\r\n    祖辈辛劳全铸进了我们的圣城玛亚之城的辉煌中，族人们都认为不能任由狂风暴雨摧折它。于是，我和族里的两位法师联手制作了一个保护结界将它完美的隐藏了起来。然后，就快要起程了。\r\n    最后一件事，是我们的守护者。我想尽办法解除了它与我族祖先的契约，但是它仍有着守护这片大陆的责任，所以它决定留在这片大陆。我在此卷中留下了召唤守护者的方法，若是邪恶力量入侵时，持卷者可照我记下的方法召唤它来为大地而战。\r\n    守护者离去了，我们也将离去。我将这张卷轴藏入先祖墓中，后继者可据此卷所述之法开启玛亚之城及召返守护者。                                                                 \r\n                                                              “先知恩布达”\r\n     \r\n    书卷的后部分记录的便是开启圣城和召唤守护者的方法了，莱尔知道雷特没兴趣听，也就不再念了。他停住了等待雷特将得来的信息消化后，才道：“我已经用书中所记的方法发出信号了，只是不知这位几百年前的守护者是否还健在。”\r\n    雷特理了理思路，沉声说道：“别太指望别人了，即使那个什么守护者还在，他是否会庇佑这个贸然进驻圣城的部族也还是个问题。而最重要的，这些人，是你我守护的。”\r\n    莱尔略一惊讶，随即笑着应道：“是啊，这次圣城玛亚的守护者，是我们了。\r\n\r\n                          五  围城\r\n    “咔嚓！”一声刺耳的玻璃破碎的声音传来，正谈论着的雷特和莱尔被惊动了，都不约而同地望向窗外。\r\n    天空中彩色的光屏已经消失，城堡前方黑漆漆的夜色中满布着摇摆不定的黑影，月的几丝残光照在黑影上，赫然映出些白森森的骨骸。雷特和莱尔都是心中一沉，罗德竟来得这么快！\r\n    两人都想出门看个究竟，但莱尔体内怨灵之气未清，猛一起身顿觉胸口气闷，忍不住一阵干咳，竟咳出血来。雷特只得上前扶他，当他的手掌碰到莱尔时，却忽的感到一点轻微的刺痛。莱尔似乎也感受到了，两人都看向雷特的手掌：一个小黑点因为引动了莱尔体内的光明神力，被烧成了灰烬，一触即散。\r\n    雷特还未明白是怎么回事，莱尔却早见识过这手法了，他苦笑道：“看来罗德是没把你放在眼里了，不然他也不会安心地让你带路了。”\r\n    雷特大惊，他当然知道莱尔的意思是自己被罗德算计了，是自己把他引着来到了这里，可究竟是什么时候……\r\n    这时摩雅慌张的跑进屋来，莱尔也收起苦笑，严肃的向雷特说道，“你快去城头协防，千万别让他们放下吊桥了。让罗德占了主动我们是没有胜算的，现在也只能死守了。若是能支撑到天亮，我们就还有一丝希望！快去吧！”\r\n    雷特也知道现在不是沉思的时候，他大步冲出屋子，却又回头喊道：“你别太逞强！”然后唤了疾电向城楼跑去。\r\n\r\n    此时城墙外的飞行亡灵已经开始侵入城堡了，如同无边的黑云压下，战斗一触即发。为了后方的老幼，雷特本不想引起敌人的注意，只希望能悄悄赶去城头，可一看亡灵军队那铺天盖地摧压城池的进攻，他知道隐蔽也是无用了，立刻骑上疾电，飞驰上城。而就在他翻上马背时，忽的想通了：自己那时竟想都没想就触碰了罗德丢出来的那个情报兵的尸体，这才被算计了啊！\r\n    城楼上的士兵们也有些慌张，本以为躲进了这个隐蔽的地方，在出兵决战之前怎么也能有个几天悠闲，却不料敌人竟找到己方了，而且战士们也还是第一次看见这么多飞会行的亡灵。幸好一向谨慎的首领卡伽强令战士们在城头警戒，是以才能快速的回到自己的岗位准备战斗。\r\n    天空中充斥着晃动的黑影和亡灵们凄厉的呼嚎，在罗德一声令下，无可计数的骨鹰和血蝠攻向城中，黑色的洪流直涌而下，几乎要冲跨了这座古城似的。可是久经战场的的战士们不会也不能被这气势压倒，如今座守孤城，已是退无可退，那就只能拼了！\r\n    战士们据守在几个梯道入口，注视着疯狂扑来的骨鹰和血蝠握紧了武器。梯道口的弓弩手在敌人进入射程的第一时间射出箭矢，破空而出的弩箭以强劲的冲力贯穿了前排的亡灵，有的冲势不止，又穿透了后一只亡灵，而弓手们射出的火箭更是亡灵的克星，中箭者异常痛苦的死去，连旁边一起前冲的亡灵也被那近在眼前的火光照得慌张地逃了开去，这些四散开去的亡灵顿时把整个部队前冲的阵势打乱了。\r\n    然而后边的亡灵军团仍然笔直向前，慌乱的家伙被后继的同类撞死，地上的残火被亡灵们用身体扑灭，最前排的骨鹰已经将爪子伸向了敌人。战士们也迎了上去，挥舞着手中的大斧、长剑，同不怕死的敌人战在一起。惨烈的肉搏战展开了，有的战士被横冲直撞的骨鹰的利爪抓断了脖子，也有外围的脱离了群体的人被众多血蝠吸成了干尸，而战士们的武器则更为锋利，每次挥斩都会将一名亡灵切成两段，还有一些战士举着火把驱赶围攻过来的亡灵，颤动的火光中尽是鲜血残骨和刀光剑影。战士们靠着高超的战斗技巧和默契的配合稳稳的守住了梯道口，可占着绝对数量优势的亡灵那悍不畏死的攻击也让众人头痛不已，不时的有人死去。\r\n    尤迪带着其他青年守在正中靠左的地方，这些经验不足的年轻战士们一开始就被亡灵军团的铺天盖地的数量震慑了。慌张的青年们刚一接触敌人便被撞得大乱，其中两个青年被疾飞的骨鹰撞得昏了过去，尤迪只得冲上前挡下冲向两人的亡灵。可他这一出来，立时被亡灵阻断了退路，后边的同伴大多忙于应付敌人，几个想冲过来帮忙的也被挡了回去。尤迪四面受敌，又想要保护那两个同伴，苦苦支撑却很快就抵敌不住，手中的剑被撞在地上，而同时又有数个身影向他撞来，其中已到他身前的一只骨鹰已经亮出了那银白阴森的骨爪。\r\n    就在这千钧一发之际，一阵凌厉的风从他耳旁刮过，将前方那只骨鹰劈作了两段。风之刃过后只刹那功夫，发出风刃的疾电已经掠过了尤迪冲近了敌群。雷特挥剑将身旁的亡灵一一斩杀，疾电则扇动青色的羽翼，无数带着淡青色光芒的风之刃四散射出。风刃肆掠，所过之处亡灵如瓜果般被轻易切开。\r\n    己方的战士被这位新战友的实力所震惊，看着他横立城头，独力挡下了浩荡的亡灵大军，不尤得士气大振，个个都奋力厮杀，本已被迫进梯道的也都冲杀了出来。\r\n    \r\n    然而雷特的注意力全部在眼前的骨鹰等脆弱的亡灵，他驾着疾电四处飞掠，终于在东城头的北角发现了他要找的东西：缩在地上发抖着的血蝠，它们的身体不断地膨胀着，数目竟然不少！雷特毫不犹豫的刺死所能看到的这类血蝠，同时向各处的战士吼道：“射杀地上的血蝠！”弓弩手们显然也明白这些家伙变身后的厉害，纷纷射向这些亡灵。只是对方也很在乎它们，许多箭矢都被横飞过来的亡灵挡下了。这可让战士们着急了，骨鹰血蝠尚且难以应付，要是再加上这些身手敏捷的吸血鬼，可还怎么打啊！\r\n    雷特这边也正清除着正在变身的血蝠，忽的，一只僵硬的爪子向他脖子袭来。雷特大惊之下急忙厕身闪避，同时看也没看就顺势挥剑斩去。那利爪堪堪从雷特颈边划过，而他的剑也击了个空。等雷特坐直了身子，定睛望去，只见一个高大而苍白的吸血鬼正邪笑着看着他，正是那种看到了可口食物的神情。雷特注意到他紫红色还算完整的袍子，又想起血族那严格的等级制度，看来这是个吸血鬼子爵无疑了。想起刚才咽喉边的那阵冷风，雷特此时仍然心有余悸，当下也不敢大意，驾御着疾电攻向了他。\r\n    吸血鬼子爵本敌不过雷特的，但一则旁边不少小吸血鬼不断向雷特进攻，分散了他的注意力，二则雷特忌惮他涂有剧毒的利爪，不能与他硬碰，两个身影相互交错，互有攻守，基本上战成平手。但雷特急于找机会解决他去帮助其他人，打得颇为急噪，几次险些命丧爪下，外加一旁几只稍强一点的吸血鬼能趁机突出破开物理防御教弱的风盾对他造成伤害，雷特和疾电被这些家伙划破了不少伤口，竟渐渐趋于弱势了。\r\n    雷特尚且如此不堪，更不用说其他战士了。由于一大群强悍的吸血鬼的加入，亡灵军团势如破竹，轻易打散了梯道口的守军，惨死在他们爪下的战士大多被后来的亡灵撕成了碎片。战士们被迫退入了梯道，但更在狭窄的梯道内，吸血鬼身手仍是那么敏捷，普通战士以一敌一都办不到。而更重要的是，这座城堡内梯道极其复杂，战士们也不知是否已护卫周全，要是有亡灵窜进了老幼藏身的地方，那可就麻烦了。\r\n    可他们不知道的是，老弱妇孺的藏身之处倒是没有敌军闯入，但另一个重兵把手的地方却遭到了不速之客的袭击。\r\n\r\n    吊桥控制台遭到了梯道内一群亡灵的袭击，首领卡伽亲自领兵抵敌，小小的控制室门口六、七十个战士分三批战斗着。然而在其中两批战士换位时，一个高大的身影急撞了进来，完全不理身旁的战士们，笔直地冲向了他的目标——吊桥控制台。卡伽等人反映过来时已慢了一步，除了正战斗在门口的战士，其他人都向着这边冲来，人人都明白：若是吊桥放下了，亡灵骑士一旦入城，这个部落最后一点希望就都没有了。\r\n    然而心急如焚并不能让他们的追上这个紫色蓝紫色袍子的吸血鬼男爵，卡伽瞪着发红了的眼睛看着男爵扳下了吊桥的开关。冲在最前边的战士一剑贯穿了男爵的身体，男爵全然不顾这疼痛感，反手一掌劈在那战士头顶，那战士未发一声，立时毙命。卡伽等人急切想再守起吊桥，而那男爵似乎也接到死命令要守住控制台。众人没有丝毫停顿的攻向男爵，男爵因为要守在此处，不能发挥敏捷优势，只能以强横的肉体硬抗下众人的攻击。但男爵的实力毕竟比普通人强很多，在杀死第七个战士时，他才被其他三、四十人分了尸再无法动弹了。吊桥开关已经扳起了，但卡伽并未听到吊桥收起的隆隆响声，他并不清楚外边到底发生了什么，但却直觉地认为己方是还有一份希望的。\r\n\r\n    面对如此危险的局势连一向沉稳的雷特也有些慌张了，完全是靠着对危险的超人直觉才几次死里逃生。而正当他苦战之时，忽听得一阵隆隆声响，雷特惊讶的发现吊桥正在放下。雷特不知梯道内的战况，暗想：难道没人守护吊桥控制台吗？还是他们都……他立刻意识到现在不是胡思乱想的时候，那看似缓缓下降着的吊桥实际却是宣告这个部落生命终点的丧钟。决不能让它放下！\r\n    雷特正想冲向吊桥，可身周这众多的亡灵显然不想放跑他们眼前的美餐：也许喝下他的血后，自己就能拥有他那操纵风的强大魔力也说不定。雷特瞧着这些贪婪的目光愤怒不已，前身下俯，右手拖剑在身后，一副正欲冲杀的姿势。众亡灵也不敢大意，不想像刚才那些死在他剑下的同类一样，纷纷摆出了防御姿势，任他飞马冲力再强也突不透这重重包围。\r\n    然而就在雷特冲出的一刹那，疾电前蹄奋力一踏，双翼舞动，一下子冲天飞起。其他亡灵都未能反应过来，那个子爵虽也没想到这个一直都直来直往的对手会耍这样的小聪明，但他也很会应变，身子一跃而起，直扑向以停不下冲势的疾电。吸血鬼的弹跳能力非人能比，只一瞬间，子爵已到了雷特身下。然而这子爵的战斗直觉也不差，就在他的利爪快触到疾电前蹄的时候，忽然双脚向前挥，头部后仰，上半身极力向向后退去。也就在同时，雷特的剑画着优美的圆弧挥下，堪堪划过了子爵的前胸。剑虽斩了个空，但着一斩所带的风之刃却硬是在子爵的胸口开出一道足以将他断成两截的伤口。子爵完全惊呆了，没有任何动作，就这么直直的摔到了地上。\r\n    雷特根本没时间去解决这个子爵，他一飞上天又被亡灵所保围，此时吊桥已经放下，第一批亡灵骑士正呼啸着冲向城内。雷特和疾电同时发出风刃，直直地劈开了一条通路，飞马骑士立即从这唯一的空旷之处冲出了重围。疾电的速度岂是这些弱小亡灵能比的，它的优美的身姿划着弧线冲向了吊桥，将众多敌人远远甩在了身后。\r\n    雷特以风的速度疾飞而下，双手举剑，爆发出全身的劲力和魔力，大喝一声，斩向吊桥。只见剑身上青光暴涨，将原本一米左右的利剑辉映成了一柄十几米张得巨大光剑。光剑斩下，剑锋与吊桥坚实的木板相撞，只听“喀嚓”一声，宽五六米、厚度近米的吊桥木板应声断成两截，带着上边正不知所措的亡灵骑士摔下了万丈深渊。\r\n    雷特这奋力一击用力过度，顿时感觉头晕气喘，疲乏不已。但战斗仍在继续，他哪有时间休息，立即纵马又杀回了城上。只留下崖对面的亡灵们傻傻地站着，不知所措。\r\n\r\n    梯道入口附近的战士们也听到了吊桥放下的隆隆声响，可又实在无能为力。正当他们万分焦急之时，却又听到“咔嚓”的巨响和隐隐约约的巨木落下悬崖的声音，众人都隐约猜了个大概，不禁都精神一振，看来己方还是有一线希望的！振奋的士气让战士们越战越勇，终于渐渐抵挡甚至压制了亡灵的进攻了。然而战士们之所以能抵挡住悍不畏死的吸血鬼的进攻，还是因为外边都源源不断的亡灵援军被压制住了。\r\n    以雷特一人之力是不可能压制住这铺天盖地的亡灵大军的。正当他冲突撕杀时，原本漆黑一片的内城宫殿内竟射出两道耀眼的白光，直照上城头，将这里映得如同白昼。连雷特一时都感觉双目刺痛，原本就惧怕光芒的亡灵们则更是惊骇得全身颤抖，极度的刺痛深入脑髓，极度恐惧的难以形容。一些弱小亡灵更是直接被那白光埋葬了。\r\n    雷特虽不明白到底发生了什么，但他知道这一定是莱尔的作为。只有他和雷特是住在梯道外的，也只有他才有能力释放这富含有光明之力的光芒，但令雷特疑惑的是这光芒中还含有的补充他力气的大量的生命之力又是从何而来的。莱尔应该不能像寒星那样能兼容如此含量的多种魔法能量的，难道他已经……雷特正思索时，没有注意亡灵中一只挂着紫红色袍子的大蝙蝠硬挺着神圣之光的折磨一摇一摆地飞回了对面的亡灵军团中。\r\n    这阵白光不仅压制了城头的敌军，内城外城漫天的亡灵都被吓得动弹不得了。\r\n    罗德显然也不想让这么大片的飞行部队被全歼。雷特忽的看到对面亡灵军团中一阵暗红色的光芒闪动，而眼前的亡灵那干涸的眼中也闪烁着与那魔法能量共鸣的红光。一时间，亡灵群中瞬间散发出一种狂暴的能量，许多亡灵竟强制克制着对光芒的恐惧迅速向悬崖对岸飞去。吸血鬼们也没时间再变成血蝠，之间他们跑到城头，奋力跃起，竟大多数都跳了过去。\r\n    亡灵军队刚要撤退，那阵刺眼的白光便消失了。雷特注意到其中一些亡灵因为白光的消失，失去了压制，体内那狂暴的能量一涌而出，竟难受得暴体而亡！雷特倒吸一口冷气，暗想：怪不得罗德一开始不运用这力量了。\r\n    白光虽然消失，但雷特并不担心亡灵的反扑了，因为他看到东方的天空已渐渐的亮起来了。\r\n\r\n                          六  最后准备             \r\n    圣城玛亚的宫殿内，将领们惶惶不安的踱着步子，忽而又大骂几句。雷特和莱尔站在一旁，两人对望一眼，都是满脸的苦笑：这个罗德，戏弄人的精力也太旺盛了吧！\r\n    阳光明媚的早晨正该是亡灵们躲到暗处的时候了，可罗德偏就不退开。他发动“黑暗天幕”招来了一大片乌云，挡下了大片阳光，虽然此时血蝠仍发挥不了战斗力，但悬崖对岸的骷髅士兵们却活跃了些。嘈杂混乱的“鬼叫”听得人们心烦意乱，不少人暗想：若是敌人就这么死赖着不走，不出一月自己这些人就得被困死。战士们虽身经百战，可面对这样的局面也不禁有些士气低靡。\r\n    城头上正打扫战场的战士们也有些心神不定的，自从其中一个战士被忽然爬起的已死的同伴背后一刀死不瞑目后，其他人都再不敢大意，随时注意着四周的情况。不过雷特那之后一直守在旁边，一有变作亡灵爬起来的都立即斩杀了，倒是没有再出现死者。心有余悸的战士们匆匆将敌友的尸体投下悬崖后才稍微安心了一点，只是心中又想：若是万一能活下来，一定到崖底寻得兄弟们的尸首，好好安葬。\r\n    梯道内老幼妇女集中的地方，一个神智不清两眼通红的男人忽然发狂地掐住了给他喂饭的妻子，竟是要致她于死地。幸好旁边的众人一涌而上方才将他拉开，可这人仍旧狂性未减，像只野兽般扑向人群。莱尔闻讯敢到，便立刻运用光明神力驱除他身上的魔力，而此刻罗德也正全力操纵这个“心死”的傀儡。死灵之气与神圣之力在那人体内碰撞既而爆炸开来，不仅此人当场毙命，那反震之力也使得本就虚弱的莱尔全身震荡，口中连咳出几口鲜血来。这可把一旁的摩雅吓得花容失色，急忙将莱尔扶了回去。\r\n    操纵了身死或心死的傀儡之后，罗德又不知怎么在亡灵军团中架起了两架投石器，连续不断的将带着瘟疫的秽物向城里抛来。可一则人们都住在梯道内，根本不会被打中，二则这器械准确率太低，根本就投不进城，所以几乎没造成什么伤害。这百发不中的玩意儿可把罗德气得够戗。\r\n    虽然目前危害不大，但人们都或多或少的有些悲观了，毕竟任人戏弄是人人都受不了的。雷特和莱尔都明白，罗德并不需要运用心理战来打击这个如瓮中之鳖的部落，他不过是喜欢戏弄人而已。而面对他这些孩子气的行为，两人都是毫无办法，只能任他折腾。既然白天抓不到他的狐狸尾巴，拖久了己方又会崩溃，那么成败生死，就只能在今晚见真章了！   \r\n \r\n    接近中午时头领们探讨战术的集会才散了，各自回到了自己的岗位。其实也没什么可论的，主要就是雷特负责突进亡灵军团击杀罗德，莱尔从旁协助，其余人守护城池。若是敌军飞行部队撤退，己方战士就架起备用吊桥板，冲出城去帮忙。至于卡伽首领一在提到的那个为抵御死灵军团这个草原一些部落组成的攻守同盟的外围攻击，则是己方所不能预测的了。雷特甚至怀疑这些部落不会来陪着自己送死，只要他们不是太苯，就能看得清形势。但他并没有说出来，他是从来不会指望别人的帮助的，能救自己的只有自己。\r\n    雷特和莱尔两人一边步出宫殿，一边谈论着。莱尔似乎看出了雷特的怀疑，半开玩笑的说着：“别小看了这个攻守同盟，我为了他，可真是九死一生呢！我知道你不喜欢接受他人的帮助，但是很多时候，成功，是多方努力的结果。你能很快信任这个部落的淳朴的人们，那么像相信他们一样相信这片美丽的土地上的其他种族好吗？”\r\n    雷特停了一下，轻点了头，既而笑道：“连世界上最狡猾的一族——人类我都能相信，又有什么理由不相信其他族呢？”\r\n    两人对望一眼，笑着走出了宫殿。\r\n    正殿前立着的正是昨天的功臣之一——守护者半人鹿的青铜雕像。昨日那压制敌人的两股神圣的光芒便是出自它的双眼。半人鹿四蹄着地，昂首前望，甚是威武，而那对皇冠似的巨大鹿角更增添了它的威严。\r\n    雷特走上前仔细看了看，总觉得似曾相识，却又说不出在哪见过，只得感叹：“我是看不出这铜像有什么奥妙的，爱研究这些东西的家伙也不知跑哪去了。”\r\n    莱尔在后边笑着应道：“我也不怎么会啊，这其中应该有几个机关，可我只会启动昨晚用的那一个。哎，若是能通知到寒星这个古堡和这众多的魔法遗迹，说不定他会直杀穿亡灵大军冲过来研究呢！呵呵！”\r\n    想到另一个兄弟，两人心中都是一阵感叹，他是越研究魔法力量越强大，而这边两人却被平淡的时光消磨得脆弱不堪，完全不似曾经的意气风发了。现在又面临这绝境，也只能希望他能好好的活着了。\r\n\r\n    两人正沉思时，两匹骏马一前一后嬉戏着跑到他们身前，正是飞马疾电和独角兽云岚。这两兄弟也是阔别重逢，自然十分欢喜。雷特拍了拍云岚，向莱尔笑道：“想不到这小家伙也已经长得跟疾电一样高了呢。”\r\n    以独角兽的智慧当然听得懂雷特的话，云岚站到疾电旁边，轻轻的碰撞着疾电的身体，似乎在说：我可再不是只会躲在疾电大哥身下的小马儿了。连一直小心翼翼走在莱尔身后一语未发的摩雅也被它逗得抿嘴偷笑。莱尔欣慰的说道：“云岚也的确长大了，该给它……”\r\n    “神使大人，我……这个……我……”这说话吞吞吐吐的正是尤迪，他欲言又止，就这么不知所措的站在那里。当他对上莱尔的目光时，更是慌张的低下头去。\r\n    莱尔似乎看出了他的心事，却又不点破，只是面带微笑温和的看着他，好一会儿才说道：“尤迪，你想要什么可得自己开口哦。”\r\n    “我……”尤迪略显激动的说道：“神使大人，我想做云岚的骑士，我想做雷特大哥一样强大的能保护大家的骑士，昨天晚上若不是他，我们早就被冲进城来的敌人杀光了。”他一口气说出了心里话，心中顿觉舒畅，既而却又一脸担忧的望着莱尔。\r\n    莱尔没有反对也没有当应，他微笑着说：“这些话你本就不用问我了，你该问的是它吧。”说着莱尔望向了云岚：“云岚虽然是一直跟着我的，但我可从没说过我是它的主人啊！”\r\n    此时云岚脚步轻盈的走到尤迪面前，看了看他，温和的伸出头去贴在他的脸上，亲昵的神态溢于言表。尤迪原本有些激动的神情也因为它的动作而沉静了，他轻拂着云岚洁白的鬃毛，回想起了与它相遇的那些岁月：在还不知它强大的力量的日子里，每天照顾着它，看着它的伤势一天天好起来，和它一起在大草原上自由自在的奔跑，躺在草坪上惬意的晒太阳……尤迪忽的眼神一变，一脸肃穆的抓稳云岚的脖子，翻身上马。云岚心领神会地扬起身子，一声欢快的嘶鸣后纵身跑了起来。\r\n    雷特笑着说道：“跟小家伙去熟悉熟悉吧，独角兽可不是好骑的，可别摔下来了哦！”\r\n    正渐渐跑开的尤迪忽的又回头喊道：“雷特大哥，我们会和你一起去对付那个巫师的！”\r\n    雷特和莱尔都明白，让尤迪骑上云岚也就将他推到了同雷特同样的危险境地。本来心照不宣还好，毕竟是为了多一分胜利的希望，可这时被他本人提出来，两个人都惭愧地低下头去。而尤迪自己却全没在意，此刻正兴奋地骑着云岚上了街。\r\n    雷特和莱尔也在这里分开了。莱尔和摩雅径直向住处走去，直走到再看不见其他人时，摩雅才撒娇似的环抱着莱尔的左臂，满脸笑容的跟他说笑起来。莱尔欣然享受着这份温馨，现在就数着这幸福的时光直到夜色降临吧。其实他心里还一直回荡着雷特走之前留下的话：“莱尔，我也知道没资格劝你不出手。我只是想说，别太急着送死。战斗就像赌博，若是必定要输掉一些东西，就实在不能算是赢了。”\r\n\r\n    雷特在嘱咐了莱尔以后，先去领了多人份的干粮，谢绝了几个战士喝酒的邀请，一语不发的向城西无人区走去。众人都认出他是昨天的“英雄”，而今晚更要指望他，于是殷勤的给他装好干粮和水，也没太在意他面无表情的样子。\r\n    一路上一人一马一前一后静静的走着，就如同曾经六年流浪的日日夜夜一样走着，只是却有很多东西已经发生了改变。\r\n    雷特突然停了下来，一拳愤怒的砸在墙上。忍了很久的怒气终于能够发泄出来了！\r\n    而这愤怒的对象，正是他自己：雷特，你这个窝囊废，真的是越活越脆弱了吗？回想起昨晚的战斗，紧一个血族子爵就将自己拖住了，眼睁睁看着那么多战士死去而无能为力。六年前的大战中与血族第一公爵埃尔拉打得不分上下的人竟已落魄到这地步了吗？六年的沉寂的生活已经让追风者退化若此了吗？\r\n    现在不是感叹的时候了，雷特单手拂着疾电的头，坚定的说道：“伙伴，我们可没时间休息了。一起找回当年追风者的风范吧！”说完翻身上马。疾电会意的长嘶一声，双翅一展，四周的风之元素刹那间呼啸起来；雷特自己也双手握剑在胸前，开始聚集着风……\r\n    夕阳西下的时刻，一道霞光闪过西城上空，又一面墙被雷特的剑拦腰斩断。雷特收回剑，凑到胸前，剑身通体银白，剑刃锋利无比，四周的青色光华清晰可见。以魔法代替斗气还能达到如此强度且收放自如，这世上可并无几人能办到的。雷特满意地收剑下马，靠着断墙坐下，轻声对疾电说道：“休息一下吧。”然后自己也闭上双眼，假寐着等待今晚的决战。\r\n\r\n                          七  决战     \r\n    当太阳的最后一丝光芒从西方影去时，地上的亡灵更活跃了，由白天的时不时的吼叫变成了铺天盖地的鬼哭神嚎，那声音震得这边的战士们握武器的手都浸出汗来，虽不能算惶恐却又的确是紧张不已。而天际，罗德的飞行部队已然出现。没有任何停顿，骨鹰和血蝠的混合部队直飞入城，扑向了任何可以看到的敌人。\r\n    双方甫一接触，守护者雕像的白光便照了过来。而罗德也快速反应，亡灵军团中暗红色光芒闪现，本来无法动弹的亡灵们强行抑制着对光的恐惧，极度疯狂的扑了过来。战况比之昨日更为惨烈。\r\n    当暗红色光芒闪现之时，城堡两头两个身影一齐冲出，那疾飞向高空的正是雷特，而凭借不纯熟的驭风术由城头跃到亡灵军团中的白色身影则是尤迪和云岚。两位骑士一上一下同时向暗红色的出处冲去。罗德，就在那里。\r\n    雷特才飞出不久，便瞧见了昨日那个吸血鬼，只见他背上已长出了一对巨大的蝙蝠翅膀，身上的袍子也换成了紫红镶铜的，竟是一天的时间里便进化成吸血鬼伯爵了。新晋伯爵也发现了仇家，扑打着巨翼疾冲了过来，似乎是想用雷特来试试自己新得的巨大力量呢。\r\n    然而新晋伯爵的对手却也并非昨日的雷特了。雷特见他横冲过来，也略微转向，迎了上去。正当两个身影快相撞之时，雷特突然加速，以数倍的速度撞了过去，犹如一道霞光贯穿了伯爵的身体。雷特的剑奇准无比，正斩在昨日未愈的旧伤口处。这次伯爵还未来得及惊讶，就已经真的断成了两截。\r\n    不会驭风术而仅靠一双翅膀还敢在空中战斗，根本是找死。雷特想着，正欲转身前进，却忽然感到一个庞然大物的来袭，立即闪身躲避。当他抬眼看时，赫然发现自己已被三只骸骨巨龙围在了中间。雷特暗自心惊，此时与骸骨龙交战可不妙，就算他们伤不到自己，可自己更难伤到它们。骨龙那极度坚硬的龙骨雷特用尽全力也只能一根根的削断，而只要未完全摧毁，他们就能很快将散了架的躯体重新组合起来。雷特的风以斩切见长，根本不适合对付骨龙，能毁灭他们的只有驱散黑暗的光明或者焚烧一切的烈焰。雷特正想以速度突出包围，却不了三只骨龙已经呼啸着攻了过来，它们配合之默契，应变之迅速，竟是让雷特根本看不到破绽。雷特一边应战一边感叹，龙族果然不愧是能与神魔并立的人间最强的种族，力量强大不说，智慧也决不比人类差多少。他俯身向下看去，在那片耀眼的白光中，骑着云岚的尤迪正与曾追击过他们的那个死亡骑士战在一起，显然也没能成功突破过去。\r\n\r\n    这场决战越早结束，伤亡就越少，而如今雷特、尤迪两人都受阻无法前进，正是需要第三只力量的出现的时候了。莱尔为雕像注入了足够的能量后立即往城头赶来，一路上为了驱赶袭向自己和摩雅的亡灵已经让他身上多了不少伤痕，但此刻已不是顾虑伤势的时候了。莱尔毫不犹豫地将自己的十字架给摩雅戴上，轻声说了句“对不起”，然后肃然而立，面向暗红色光芒所在之处开始吟唱：“遵从神的旨意，当黑暗降临之时，将我的生命化作赞歌，请光之神灵倾听我的呼唤，引领……”一旁的摩雅早已哭得泪流满面了，虽然早料到幸福的时光很短暂，可真的到了分别的时候却仍是那么的痛苦和难以接受，她泪眼朦胧的向外看去，陡然发现地平线上的阵阵骚动。她直觉的仿佛抓住了一根救命稻草似的扑过去阻止了莱尔的吟唱，她急急忙忙地指向那远方的骚动之处给莱尔看，竟是激动得说不出话来。\r\n    城堡的对面，亡灵军团后方的地平线上冲出了一排发了疯似的野马，它们完全无视于骷髅们手中的武器，横冲直撞硬是在密集的骷髅海中撞出了一个大窟窿。马群的冲势未止，后方又出现了一队巨熊骑士，众骑士步调一致的朝马群撞开的道路压了过去，充分地冲锋地速度转化为力量，将拦路的一切敌人挑翻或撞飞开去。而在他们后方，远远的是狼骑士的身影……简单而有效的连续数次的骑士突击在亡灵军团中闯出了一条道路，竟已离罗德不远了。然而反映过来的亡灵也开始了疯狂的反击，纷纷向这边围了过来，兽战士们努力抵挡着，等待着后方的一个重要人物的到来。\r\n    在这条不算宽阔的道路后方，一个兽人老祭司骑着只老鹿向前奔跑着。他的手中举着一直奇特的法杖，法杖前端的圆盘中央燃着一团火焰，火光随老祭司的吼叫而越来越亮，渐渐地映出了一个怪异的图腾，图腾中四散的火红色光芒竟似乎透出一股燃尽一切邪恶的威势来。圣火所过之处，骷髅们纷纷弃下武器，双手抱头，痛苦地嚎叫起来。\r\n    火光虽只在一处闪耀，其散发出的魔力却似乎对本族兽人变为的亡灵有特别的效果。正于尤迪酣斗的死亡骑士忽的抱头痛苦了半晌，然后弃下尤迪怒吼着径直向亡灵后方奔去。尤迪在嘈杂的敌军中看不到后边的情况，完全弄不清形势。但他并不追赶那死亡骑士，他谨记着自己的任务，知道机不可失，于是很快摆拖了四周的其他亡灵骑士，云岚也停止释放那驱散恶灵的光芒，一人一马很快隐进了夜色之中一步步向罗德靠了过去。四周虽撞上到不少亡灵的攻击，但根本阻挡不了他们的步伐。\r\n\r\n    罗德似乎很生气，以前一直被自己赶着东躲西藏的老鼠们今晚竟全都跑来凑热闹了。难道他们以为就那点儿军力斗得过我的亡灵大军吗？罗德忿忿地想，也好，让我一次过把你们清理干净。罗德边想着一边走出大帐，翻身上马，显然是想亲自指挥那些愚笨的亡灵了。在这片土地上的所向无敌让一向谨慎的罗德也自大了起来，若换在从前，他是决不会把自己暴露给敌人的，即使对方注定要死。\r\n    由亡灵巫师指挥的部队当然要可怕得多，不过还未等罗德看清形势，他身周却已经躁动了起来。一阵白光突然显现，照得罗德都不禁伸手挡住了眼睛，其他亡灵吓得更是纷纷退了开去。当罗德感到危险时，尤迪和云岚已经冲到了他身前，高举着的剑正要劈下了。罗德见避无可避，赶紧举起右手去挡，而他的右手上戴着的，正是那枚闪着暗红光芒的戒指。长剑正好机在了戒指上，正当尤迪以为得手之时，却不料自己全力以赴的一击竟只是打断了罗德戴戒指的骨指，罗德本体几乎没受什么伤，相反自己却似乎完全承受了自己刚才的冲击，一人一马竟瞬间倒飞了回去，鲜血忍不住冲口而出。\r\n    魔戒一脱离主人的手，光芒立即消失了，就这么一声脆响掉进了已经萎谢了的草丛中。刚才那一瞬间的恐惧，被打掉了宝贝戒指的愤怒交织在一起，惊怒交加的罗德以一根骨指指向了还未能爬起来的尤迪和云岚，“去死吧！”之间一股黑色闪电从他指中射出，瞬间贯穿了尤迪和云岚的身体，连魔法抵抗力一向很强的独角兽也承受不了罗德的黑魔法，一人一马扑倒在地，很快化成了石头，然后，碎裂……\r\n    刚解决了尤迪，正慌忙寻找戒指的罗德却又看到了刚从骨龙的包围中突了出来的雷特，旧恨加新仇，一副显然是想把罗德碎尸万段的样子。罗德知道自己一个巫师是没法跟他对打的，立即放弃寻找，俯身释放魔力启动了脚上的闪电之鞋，只一瞬间，罗德竟已经来到了亡灵军团的边缘！罗德刚一停下，立即靠在一棵老树上休息，忍受着头部抽搐的神经传来的极度的刺痛。他所发明的这双闪电之鞋是一个极端的加速器，借闪电之力将自己的移动速度提到根本接近光的速度，这样，在绝大多数人看来，就像那传说中的空间魔法“瞬间移动”了。可是这速度可不是人的肉体所承受得了的，而罗德，为了保持最佳的思维能力，还保留了有生命的大脑，还好他是向上前方跳的，要是横冲直撞，恐怕他的整个骨架早就被得稀烂了。他喘着粗气，转身望向天空，他的肉眼在黑夜中完全看不到亡灵军团内的情况，但罗德能感觉得到，那个傻瓜飞马骑士找不到自己，正气得大吼大叫四处乱晃呢，只要再过几秒，骨龙们就又能围住他了。只要骨龙不依不饶的根他耗，他也只有累死的分。哈哈！\r\n    城堡内的战斗因为魔戒的消失而呈现一边倒的局势，战士们很快解决了敢于飞近前来的敌人，果然架起木板冲出城去，但他们只能在亡灵外围战斗，几乎对战局没什么帮助。而城楼上，摩雅因为刚才的一扑被莱尔周围的魔法能量震得昏了过去。莱尔根本没时间去责骂她，只得慌张停下施法去抱住了她。之后不过片刻工夫，战场上形式一变再变，连莱尔也弄不清形势了。直到他最敏感的罗德的能量波动由一处瞬移到了另一处，他才不禁苦笑：看来即使自己出手，也是没法把他怎么的了，罗德的逃命本事真是天下无几人能及，现在竟还让他掌握了寒星在最危险时才偶然用过的“瞬间移动”的法术。这一战还有得打吗？莱尔摇了摇头，知道现在只能走一步算一步了，当即放好了摩雅，一只手指向围攻着雷特的骨龙，另一只手指向罗德所在之处，释放神力，刹时射出两道耀眼的白光。这道白光显然不能给予罗德以伤害，却给正无头苍蝇似的乱转的雷特指明了罗德的方位，而射向雷特那边的光也妨碍了一下骨龙的行动，给了雷特突围的机会。\r\n    这“聚光灯”将罗德突显成了的战场舞台的主角，几股力量都毫不犹豫的朝这边赶来，其中冲得最快的，当然就是雷特了。他此刻像是疯了似的不顾一切的向这边撞了过来，根本没想过罗德刚才的逃命本事，更不管挡着自己的骨龙，在莱尔的帮助下拼着受伤硬突了出来，以最快的速度冲向了罗德，骨龙的速度及不上他，只能眼看着他越飞越远。雷特和疾电都是一个性子，平时还算沉着冷静，却很容易因为亲近的同伴的惨死而暴走。雷特本以为以自己的速度是该先对上罗德的，什么凶险都让自己来承担就好了，却不料还有必须完成的事的小伙子却先于自己死了。这怎能不让他愤怒呢！\r\n    罗德才喘过气来，又被城头的光照到，一下子几股敌人都要拥过来似的，不过片刻，又看到了一道霞光似的雷特。他啐了一声，俯下身去，可他正欲启动鞋子时，却愕然发现，一直朝战场看的自己所背对的那棵老树的枝条竟无声地动着，就在他发现的一刻，老树的众多枝条迅速拥来，竟将他整个身子缠得严严实实！\r\n    罗德感受到那股奇特的能量波动时已经被老树缠得动弹不得了。他惊骇地看向那个施法者，在一块岩石后边，隐藏了许久的身影终于缓缓走了出来，那高大的半人鹿的身形和巨大的鹿角使他不怒自威。罗德一眼便认出那正是这片大陆上唯一给过自己教训的那个伯德尔的森林守卫，他怎么会跑到这儿来了！\r\n    然而罗德已没时间惊讶了，当他回过头时，雷特那比之刚才尤迪的更为凌厉千百倍的斩击将他连带树枝一起劈成两段。然后，狂暴的风之元素将罗德德残躯绞成了碎片……\r\n\r\n                            尾声\r\n    清风徐徐，枯树杂草，拂过雷特等人的脸颊，也拂过了尤迪墓旁的小花。\r\n    莱尔望着墓碑，喃喃道：“是我的错。尤迪还是个十五岁的孩子，我若是……”\r\n    “没有谁有错，我们毕竟是从这场赌博中胜利了。”雷特最后一次默哀后，一脸严肃地说道，“也别再把他当个孩子了，他已经是一个为自由和正义勇敢战斗的骑士了……虽然对于命运让我这样活腻了的人活下来而夺走了他的生命很不甘心，但是事实就是如此。”\r\n    莱尔看着雷特，忽地一笑，“我知道你比我更了解他，尤迪就好象少年时的你的影子一样。”\r\n    “所以现在，他的旅程也只能由我去完成了。”雷特慢慢转身走向疾电，手中紧握着尤迪的挂坠。他不是个拖沓的人，轻声说了句“我走了”，人已经翻身上马了。疾电在靠着墓碑怀想了一下云岚的模样后，展开翅膀，准备离开了。\r\n    莱尔看了看一旁静静站着的摩雅，然后转向雷特喊道：“我和雅儿还不急着结婚，若是一年之内你能回来，我就请你作主婚人。”\r\n    雷特嘴角一扬，回头笑道：“那这个主婚人我可当定了。毕竟，我是你大哥嘛！”话音未落，人已经远去了。\r\n    一旁的摩雅来扶还有些虚弱的莱尔时随口问道，“他真的会回来吗？他在我们这里呆了还不到半个月。”莱尔笑道，“能让风留恋的只有风的故乡，它所思念着的地方。而对于从小流浪的我和他，过去的家已然不在。只有这里，才是我们最眷恋的地方。”\r\n    按原路向东从伯德尔森林上空掠过的雷特吹着清爽的风，心情还不错。这次的旅行有两个目的，一是去光明公国，将罗德的魔戒和莱尔的神使信物交给教皇处理。其二便是到魔法帝国送还尤迪的挂坠给它原先的主人。\r\n    雷特想着想着，指着疾电的头说道，“我们这次的旅行可不一样了。因为，有必须回去的地方了，不是吗？”\r\n    一声欢快的马嘶划空而去。\r\n     ( 完 )\r\n\r\n\r\n \r\n \r\n	序章一：玛亚的守护			Paragraph	2021-05-30	30000549
31000116	2	2021-05-30	                           冰之魂\r\n                          一  疑惑\r\n    没个人都有着自己对这个世界的独一无二的认识。\r\n    根据寒星的经验，魔法修行大致可分为四个阶段。初级魔法师仅从魔法学校学到了魔法的基本理论和使用方法。中级魔法师则能够具体理解和应用魔法原理，创造出具体实用的魔法。高级魔法师则融会贯通了一系或多系魔法，建立了一套属于自己的魔法理论，而且能够在自己体内筑建起魔法魂晶。而最后的顶极魔法师能够深入了解和完善自己的魂晶，完全发挥其内在的强大力量。\r\n    这个等级划分对于大多数魔法师来说都过于粗略，寒星却并不在意。虽然这世上能够筑起魔法魂晶的人类法师决不超过二十个，而寒星恰巧就是其中之一。对于他来说，一二阶段都已不在重要，他现在所面对的是从第三阶到第四阶的坎。这个不仅是个坎，更是个令人痛苦的选择。寒星的意识每次接近他体内的冰之魂晶时，都要忍受一种刺入骨髓的酷寒，冷得他几乎疯狂。寒星的直觉和亲身体验都告诉他，若是太接近冰之魂，他就会被其影响从而变得冷漠、冷酷甚至冷血，但若是不去体会它的冰寒，自己就只能永远停留在这个地步。情感和魔法力量只能选择其一！\r\n    寒星本就是个理性远超感性的人，他的兄弟朋友怎么算也不到十个，但正因为少，他很注重没一分友情。曾经有几次突破第三阶的机会，但他想到雷特老大、莱尔、影或是淘气的女骑士爱丽克丝时，都终于还是放弃了变强的机会。寒星不怕死亡，更不怕任何敌人，但他却怕自己被理性完全操纵，变得失去人性。这两年，他甚至常常不用自己最熟悉的冰系魔法，时常使用火系法术，利用火魔法对感性的放纵来平衡自己的性格。\r\n    寒星的分阶法虽然粗略，但他的魔法理论却比普通法师详细得多。有人甚至称他为“魔法科学家”，因为他总致力于将零星琐碎而又深奥难懂的魔法知识整理成完整的体系，使其能够解释绝大多数奇特现象。就比如学徒们的魔法书上只是写着这个世界由水、火、风、土四种基本元素构成，但他却有更合理的解释：构成这个物质世界的有以火为代表的半实半虚形态的能量元素，有能形成风的性质不同的空气元素，有以水为基础的诸多液体物质，还有包括了多种固体物质的土。此外风的分支雷，水的分支冰，土质中的金属元素另有其特殊之处，而光明、黑暗、生命、精神四种元素则更为深奥，至于寒星能略微使用一点的空间之力则是比以上这些元素更为特别的存在。寒星自己很清楚，这些还只是自己的理解，其中有纰漏是难免的，即使这根本与世界的本质无关也并不奇怪。寒星知道自己是以自己的意识来解读世界，所以，他所能看到的并不一定正确，任何人都不能说自己是绝对正确的，这世上只有不正确是绝对正确的。\r\n    说道“绝对”，寒星就又想起了自己这几年来的唯一成果，第一个属于自己的禁咒——绝对零度。他的“绝对零度”当然不是传说中冰之神与身为十二主神之一的火之神同归于尽的禁咒，也不是大魔导士菲尔德封印恶魔之山的同名法术。主神和偏神的差距之大原本不能相比的，但冰神凭借这个法术却超越了这个界限，寒星隐约感到，冰神的“绝对零度”应该是个超越了极限的无限降温的违背自然法则的毁灭性的不成熟而且永远不可能成熟的死咒！寒星光是想想就觉得冷得受不了，人和神的差距终究是太大了。而寒星自己的“绝对零度”，却是个更像个空间系的咒术。通过几年的研究他发现，任何物质内部都在震动着，而且温度越高的震动越快。于是他就想到，如果能将物质完全静止，那么它的温度是否就是传说中的“绝对零度”了呢？寒星也曾去调查过被菲尔德封印的恶魔之山，他发现，虽然那里冰封万里，没有任何生命迹象，但那其中的非生命物质仍在震动，仍然有温度存在。所以寒星确信，即使自己的法术并不能达到魔法师们的终极梦想，却也比菲尔德更接近“温度”这一定律的实质了。\r\n    只是寒星想到的这个法术并不实用，因为这也是个毁灭性的自杀式的法术。虽然寒星通过研究将施法范围缩到了很小，它也只能是万不得已时，与敌人同归于尽的法术。几年的时间只研究出了这么个送死的法术，寒星也很是无奈。\r\n    寒星正在思考时，忽听得重重的敲门声响起。可怜原本结实的木门被外面那人敲得吱吱作响，随时都有断裂的可能。\r\n    极地之城里寒星认识的人不多，其中会来拜访他而又是如此敲门方式的，就只有一个人了。寒星慢慢走到门边，在开门的瞬间向旁边极闪了一步，刚好躲过了敲门人的熊抱。\r\n    扑了个空的凯特差点摔倒在地上，他刚一站稳，便向着寒星嚷道：“太没义气了吧，连抱一下都不行！”看着他的糟样儿，寒星心里就好笑，可本想笑骂两句的他，却始终改不了那习惯性的冰冷的语气：“你的拥抱根本就是合法谋杀，我可经受不起。反正又是和谁打赌说能抓住我之类的，输了也活该。你要是再这么胡闹，哪天我一不小心可就把你做成冰雕了。”\r\n    两人正说话间，迪安娜轻笑着走了进来，“寒，我知道你是不会这么对待朋友的，是吧？”一身华丽的衣衫，深蓝色的秀发和皎好的面容再配上这柔和的浅笑，她就是这茫茫雪国中最漂亮的公主了。\r\n    被人驳得这么直接，连寒星也不知该说什么了。他只得一边将两人让进屋里，一边问道：“找我有什么吗？”凯特略有些惊讶，“你忘了？今晚有本城名流一念一度的例行聚会啊，你不是答应过要参加的吗？”\r\n    寒星此时才注意到窗外灰暗的天空：原来自己在那空间中呆了大半天了，难怪一向清醒的身体也有些疲意了。寒星从不是个拖拖拉拉的人，他很快回过神来，“那走吧。”\r\n    然而自顾自坐到桌边的凯特却示意寒星坐下，迪安娜也是一副有话要说的样子。待寒星和迪安娜都坐下后，凯特板直了脸，严肃地开始了谈话：“寒，我向来都是有话直说的。是魔法协会派你来这儿调查的吧，而你调查的对象就是我的老师菲尔德先生，是吧？要不然以你的性格是不可能特意跑道极第之城来看我们的，更不可能理会像今晚这样的应酬。”\r\n    寒星看着这个身强体壮一脸胡子渣的年轻野蛮人身穿大魔法师袍，板直了脸说话，实在有些讽刺：多少自命不凡的大学者们的魔法造诣还比不上这个野蛮人呢。寒星一般也不会对朋友撒谎，既然话都说到这份上了，寒星只好承认：“不错，协会的观察员报告说极地之城附近有强烈的冰系能量波动，而菲尔德先生又渐渐有些不理会城邦事务了，所以派我来看看情况。不过我认为菲尔德先生没什么需要隐瞒的，所以这次也只是例行走一遭而已。”\r\n    寒星说话时一直看着迪安娜，从她闪动的神情中看出了些问题。迪安娜似乎也注意到了他的目光，没等他发问，自己就先开口了：“其实这几个月来我父亲的表现也的确有些可疑。他的身子越来越不好所以就渐渐地把大多数事务都委派给了其他官员。然而他却时常出门而一夜不归。有一天我去他房里找他，本该在屋里休息的父亲却不知所踪了。我无意间看到了父亲的一本日记，上面的内容我从没听他提起过。”\r\n    “上面写了些什么？”\r\n    “那是本很老旧的日记了，是父亲年轻时在某个秘密场所研究魔法的研究记录。父亲在其中特别提到了他的同伴，一个叫罗伯特•帕尔斯的男人。他用我根本无法相信的笔调写道：我这个神秘的同伴看起来不像个正派人物，不过我是不介意的。正相反，他这样的人若是个恶魔，那他的研究经验必定比那些所谓的大智者们深入、实用得多。”\r\n    “这不可能！菲尔德先生怎么会说这样的话？我不相信！”凯特显然也未听过这事，最尊敬的人被说成这么正邪不分，难以相信的他一时激动得吼了起来。\r\n    “学习冰魔法的人冷漠一点儿也并不奇怪。”寒星掩饰过听到“罗伯特”一词的惊讶，插嘴道，“当时的他的心境我是比较理解的，就像现在的我，也是不太在意正邪。迪安娜，日记中还有牵涉到‘罗伯特’这个人的吗？”\r\n    “日记的最后有新的笔记，估计是最近才写的。那是些我看不懂的话语：我的意志开始随身体的快速衰老而逐渐弱化，恐怕已经无法对抗那些死缠不休的敌人了，这难道就是罗伯特留下的诅咒吗？用自己的力量结束一切，我的意识怕是已经清醒了。”\r\n    寒星细细斟酌着这些句子，却只能无奈地得出众多疑问：菲尔德的敌人是谁？罗伯特留下的诅咒是什么？他又想要终结什么？一切都言语不明，让寒星完全摸不着头脑。\r\n    迪安娜自言自语地说道：“最可疑的就是那个罗伯特了。如果真如日记里说的他和当时的父亲的力量不相上下，那么他至少也该是个有名号的人物。你，知道吗？”她说这最后一句话时看向了寒星，因为她自己都不认识的人凯特就更不可能认识了。\r\n    寒星原本不想说出来的，但被她问起了，也只能仰头叹道：“这个人我的确是认识的。他的名号也的确很响亮，甚至超过了菲尔德先生。菲尔德是魔法帝国当代的六位大魔导士之一，而那个人，却是有史以来最强大的亡灵巫师。他的另一个名字自不必我再提示了吧。” \r\n    “死灵君王罗德！”迪安娜和凯特同时惊呼，显然都很难接受这个事实。\r\n    “菲尔德先生跟年轻的罗德相识倒不算奇怪。但是谁都知道，罗德的诅咒是可怕的，不管是用血咒结成的实质性的诅咒，还是被他的黑暗灵魂所影响而形成的“心病”。”\r\n    寒星知道现在还无法判断任何事，只能继续观察事情的发展了，他站起身来：“走吧，宴会要开始了。”\r\n    迪安娜似乎也抛开了刚才的烦心事，挤出一丝笑容：“寒你穿得这个样子怎么能去呢。”一边说着，一边拿出了一直藏在身后的一套华丽的服饰。\r\n                 \r\n                       二  恶魔山的来客\r\n    穿戴了一身自己平时最看不惯的华而不实的贵族衣冠，寒星这一路走得实在别扭得不行。而更让他哭笑不得的是，迪安娜在一旁评头论足也就罢了，可一向大大咧咧的凯特却也像个姑娘似的时不时给他整理一下一帽。寒星感觉自己是看错他了！\r\n    凯特所接受的礼仪教育无疑是很到家的，当三人在宫殿门口遇到伯森大叔后，凯特已完全变身成一个标准的绅士了。与瘦小的寒星相比，强壮的凯特简直就是座小山，可当凯特站到他父亲伯森这个正宗野蛮人战士身边时，寒星只能感叹：真是强中自有强中手，一山更比一山高。不过在想想凯特不在他老子身边时候的样子，这就叫“上有政策，下有对策”吧。不过就在他感叹之时，自己已被大笑着的伯森半拉半提“抓”进了宫殿。\r\n    自从菲尔德率领魔法帝国的军队击败了雪域之国残暴的国王后，极地之城的宫殿自然而然成了帝国的城主府。而当菲尔德退出了权力顶峰的争斗退到这里养老时，全城人民全都聚集在城门口迎接他的到来。菲尔德也没让城民们失望，他的一连串利民的法令，公正的审判，真诚温和的待人态度，以及他高绝的魔法力量在这片土地上给他自己树立了绝对的威望，任何人都比不上的威望。 \r\n    而这位神明一样的人物此刻正在正殿接待着一个个来宾。他果然还是老了，须发尽白，额生皱纹，时不时的咳嗽更暴露了他身体的虚弱。与他同龄的伯森仍是一副正值壮年的样子，可他却恐怕已活不了几年了。\r\n    此刻的菲尔德一脸和蔼可亲的样子，寒星看不出任何无可疑之处。伯森坚持要帮着菲尔德招呼客人，迪安娜和凯特也得陪在各自的父亲身边，寒星只好一个人找了个偏僻的位子坐了下来。旁人知道他是未来城主的朋友，又这么一副不苟言笑的样子，也没人来招惹他。\r\n    寒星独自坐在会场边上，静静地观察着会场内“贵族们”的表现：夸夸其谈的，耀武扬威的，咬牙切齿的，当然也有表现得彬彬有礼的。寒星笑了，很不友好的笑容。\r\n    “你喜欢这么看着别人？”一个年轻男人竟向他走过来，自顾自地坐了下来，“总是喜欢看别人漏出丑恶一面的人自身可也不会太乐观的。”\r\n    “我本来就不是个好人。”寒星道，“ 特别的还是个讨厌贵族的流浪人。”                    \r\n    “是不是因为别人在这冰天雪地里冻死的时候，我们却在这畅饮？”两个人倒意外的谈得来，虽然不是什么好听的话题。\r\n    “不是！”寒星道，“只不过是自己小时侯受这种人的欺负多而已。我还不至于自大到以为自己是救世主。”\r\n    “那你倒还是个有自知之明的人呢。”\r\n    “我也一向也认为这是自己这个人唯一的优点。”寒星笑了。\r\n    那人也笑了，温和的笑，笑着说道：“你有没有照过镜子。在我看来，你现在的样子可比那些人更像个孤傲的贵族！”话刚说完，他的人已站起身走开了。\r\n    平时很少惊讶的寒星被这句话惊呆了：在嘲笑别人之前居然没看清自己，寒星什么时候也变成这种傻瓜了。怔了半晌，寒星一脸严肃地朝那个人走去的方向说了声：“谢谢。”\r\n    \r\n    宴会开始没多久迪安娜就跑来找寒星，说是菲尔德想把他介绍给本城名流。看着大魔导士一脸温和的笑容寒星心里直嘀咕：老头子你不是不正常了吗，我怎么没看出来。\r\n    没有公事的烦恼，宴会在欢乐的气氛中进行着，没有人注意到某个其貌不扬的侍者眼中一闪而过的杀意。所以当这个人在从众人身后突起发难，抽出一把匕首直扑菲尔德时，包括他本人在内的人们都还没反应过来。刺客的身手本就敏捷，这突如其来的拼死一击更是锐不可挡，只需一刻就能洞穿菲尔德的身体，但伯森的一只大手以更快的速度抓住了他，同样是只需一刻就能捏碎他的胳膊。然而杀手还有后招，在他的右手被捏碎的前一刻，启动了武器上的机关，刀刃脱离匕首柄飞了出去，直冲向菲尔德的后心。刀锋尖锐刀刃上自然有毒，刀的冲势也是人力难以抵挡的，但瘦弱的寒星还是轻松地抓住了它。寒星手心里突然结起的寒冰不仅冻住了匕首，也让他免于中毒。\r\n    这一连串事件在几秒之内便已结束，快得人们都还来不及惊叫。刺客见自己周密计划这么轻易地就被破坏了，完全忽略了手上的痛楚，苦笑一声，倒了下去，毒药就包在他嘴里。\r\n    宴会不欢而散。\r\n    菲尔德的房间里，伯森咄咄逼人的吼叫终于迫使菲尔德说出了实情。凯特、迪安娜和寒星都静静地听着。\r\n    六年前的空前绝后的圣战的最后阶段，当黑暗议会隐退，亡灵军团毁灭，恶魔一族的最后一搏也失败后，残余势力聚集死守在恶魔之山时，为了尽快结束战斗也为了减少损失，魔法帝国六位大魔导士联手制造结界，再由菲尔德施展他的禁咒“绝对零度”彻底封印了恶魔之山。地狱的恶魔们再也无法从这里来到人间了。\r\n    然而菲尔德的禁咒与他体内的冰之魂有着密切的联系，一旦他的灵魂脱离人间，冰封就不再是无法破解的了。所以，通过其他特殊通道来到人间的不甘失败的恶魔们把目标指向了菲尔德，不惜一切地要他死。原本还只在暗处行动的这些家伙这次却明目张胆地胡来了。\r\n    伯森可是个天不怕地不怕的人，他还在为菲尔德的隐瞒生着气，这时突然吼道：“管他的恶魔还是恶神，我们兄弟什么时候怕过！要打就要主动出击，老菲，敌人在哪？我跟你一起去端了他们！”\r\n    这时寒星插话了：“的确是该主动出击。不过，伯森大叔还是把这些人留给我吧，我要是再不试试身手，恐怕就要成朽木了。”\r\n    伯森笑道：“小伙子你可年轻着呢，怎么可能朽了！”\r\n    寒星平静地回答：“过惯了提心吊胆的日子，只要有一个月没有危险就不习惯，更何况，现在已过了六年了。”\r\n    凯特插话道：“我也去！”\r\n    迪安娜本想说话，寒星却阻止了她。\r\n    伯森大笑：“那倒也不错，还是让你们年轻人去吧。”\r\n    菲尔德看了看他们，叹道：“目前还不知道他们的总部在哪，不过我的暗线已经查到了他们的一个分点。你们跟着他去查探一下吧。虽然敌人应该不会太强，不过还是记住小心行事。”\r\n     \r\n                       三  地狱使者             \r\n    菲尔德的暗线竟然就是刚才那个与寒星搭过话的那个青年，这个人叫雪世。\r\n    寒星和凯特跟着雪世赶到了极地城附近的一个叫雪崃的小镇，潜进了恶魔一族在这里建立的分基地。这个分基地就在镇中心最大的旅馆的地下密道里，密道很空旷，似乎原本就是个洞窟。密道里黑漆漆的很远才有一盏灯，也同样的很远才有一两个房间。雪世是菲尔德安排在其中的卧底，而且身份还不低，寒星和凯特换妆后跟着他潜了进去。密道内的守卫很森严，但他们似乎很信任雪世，并不太过询问。三人一路走到了雪世在这里的房间。\r\n    直到关上了自己房间的门，雪世才露出了他平时的微笑：“现在应该比较安全，我们就在这等等吧。今晚这个基地的几个重要人物会聚在一起，这次正好把他们一网打尽。”\r\n    凯特也笑了：“那还真是感谢你了，这几年要不是你们一直帮助着菲尔德叔叔，真不知后果会怎么样呢。”\r\n    一路上最为沉默的寒星平静地道：“也的确感谢你呢。感谢你带我们到地狱来。”\r\n    凯特不明白他的意思，雪世却是很清楚的，但他的微笑还是一成不变：“如果我能做个地狱使者，带着禁咒法师寒星和大魔法师凯特下地狱的话，倒也不错。”\r\n    凯特还是没反应过来，却没人给他解释。寒星平静地自言自语：“我也的确太大意了，活得太松散后，就完全忘了必要的防范措施了。”寒星忽然看向一脸微笑的雪世：“不过我不懂的是，你这种人怎么要为别人死？”\r\n    雪世仍然笑着：“这个世界并不绝对公平，而我就恰巧不太幸运。至于我的性命，恶魔们当然是用足够换我命的价钱从我这里买去的。”\r\n    凯特似乎终于明白了什么，赶紧起身去开门。门当然是打不开了，门上不仅有牢固的锁，更有一层牢固的魔法结界。还未等他有其他动作，屋里的机关已经启动了，四面的墙上喷出数道火舌，瞬间点燃了整栋房子。雪世已经闭上眼等死了，凯特慌张得不知所措，惟有寒星还是很依旧镇静，镇静永远比慌慌张张好得多。只要再在这火屋里停顿一刻，三个人都会被烤熟，而这点时间当然是来不及破坏结界的。寒星感觉自己又回到了那段为生存而奋斗的日子，一股熟悉的豪气冲上脑门，既已到生死一线的时刻了，那就像曾经一样赌一赌那个平时用不出的法术吧！寒星一手抓住凯特，一手抓住雪世，闭眼冥想，默念咒语，瞬间移动！\r\n    三个人一瞬间从火屋中消失，然后出现在了门口。寒星从没掌握好的“瞬间移动”又一次救了他的命。\r\n    \r\n    屋门外只有一个身影，火红的身躯，火红的袍子，身周环绕着烈焰，巨大身体上更有一张狞厉的脸，这赫然是个火焰恶魔。火魔冷笑道：“禁咒法师果然不同凡响，那么强大的结界都阻止不了你的瞬间移动。不过，到了我这里就是到了地狱，谁也别想逃得了。”\r\n    寒星平静地道：“那还要看你有没有本事留下我。”他根本没看那恶魔，转身向雪世道：“现在你不会插手的吧。”雪世被自己迫害的人救了，此刻惭愧已极，点了点头默默地走到了一边。\r\n    就在寒星转身之时，恶魔背后的黑暗中响声不断，无数冰块从地上冒出，构成了三道冰墙从三个方向袭向寒星等人，来势汹汹。但寒星没有动，他知道眼前的恶魔比后面那几个偷袭者强大得多，而那恶魔看他没有动，也同样的只是站着旁观。动的人是凯特，他迅速抽出自己的魔法杖，将杖尖点地，念动咒语，用的正是与敌人同样的“冰墙术”。只是凯特一次放出三道冰墙，没一道却都比敌人的至少大上两倍。冰墙相撞，整个地道都在震荡。只见凯特的冰墙爬上了敌人的冰墙，由原路直逼向了黑暗中的施法者。黑暗中很快就寂静无声了，冻死在冰块中的人当然发不出声音的。\r\n    冰墙用以进攻完全是搬石头来砸蚂蚁，浪费力气的事寒星是不会做的。寒星正想说话时，凯特却惊讶地问：“这些人没有被恶魔附身！为什么他们要为恶魔办事？”寒星看他原来还不明白情况，只得解释道：“敌人的敌人当然就是盟友，想对付菲尔德的除了恶魔，当然也有些忠诚于原雪域王国的势力。雪世就是那一伙人中的一远。要不然仅凭这些自大狂妄的恶魔怎么可能辛辛苦苦的建立众多的分基地在暗中与菲尔德对抗……”\r\n    就在寒星说话时，那个被完全忽视了的火魔出手了。他只一挥动左手，身上的火焰立即会聚成一个大火球直扑向寒星。寒星没想到他施法竟然如此之快，只得也挥手发出一只细小的冰箭，实体冰块只轻轻一撞就打散了能量巨大的火球，四散的火球的爆炸根本没能伤到寒星。然而就在爆炸的烟雾遮住寒星眼光的时候，突然又是一声爆炸连带着凯特的痛呼声，寒星这才醒悟过来，他迅速穿过烟雾移到了凯特身边查看他的伤势。凯特被火魔的右手的火球的爆炸所伤，还好伤得并不重。寒星扶他坐下后，转身时，眼里已带上了明显的愤怒。他看不起偷袭的人，更饶不了伤害他朋友的人！\r\n    这段时间里，火魔已经先后放了多个火焰法术了，却全被立在寒星眼前的一层薄薄的冰壁轻松挡下了。攻击完全无效的火魔对上寒星愤怒的目光时，竟然被逼得有了一丝恐惧。但他不相信自己会输给人类，疯狂的挥动双手，数以百计的火球从各个方向攻向寒星。火魔知道自己最大的特长就是施法速度快，他正是弥补了火系法术最大缺陷的特殊存在，他不该会输给人类。\r\n    但他却不知道，寒星体内的冰之魂正是最好的魔法施放和加成的东西，它完全替代了魔法杖和咒语的效果。所以拥有魂晶的人依靠自身施放法术，其速度之快当然更在这火魔之上。只见寒星出了冰壁直向火魔走去，所有攻向他的火球都被一个个细小的冰箭击穿。寒星就是要用气势压倒他，让他知道自己的力量有多么渺小！\r\n    火魔的法术完全不能伤到寒星，寒星却已一步步靠近了他。火魔此刻才感到这个敌人的强大，实在比恶魔更为恐怖。但他也并非是会被吓傻的家伙，他不甘心认输，他一直都认为人类不过是神与魔的附庸者，他不能容忍有超越魔族的人类存在！所以他决定，即便要死，也要拉这个人陪葬！\r\n    这个火魔果然是个说道做到的人物，他大喝一声，举起双手，全部的力量在他手中会聚，一团红得发黑的恶魔火焰熊熊燃烧起来，他有把握在寒星瞬间移动之前将这个小镇烧成灰烬。凯特和雪世看他这么做都是惊讶不已，他手中的巨大能量是任何人都抵挡不了的！\r\n    其实火魔的魔法再快也快不过“瞬间移动”，只是寒星知道自己的这个不完全的法术是移不出他的毁灭范围的。不过还好他也不是没有后招，寒星悄悄地将自己的“冰火”融入了恶魔的火焰中，就在火魔想砸下他的火焰的瞬间，寒星放开了对冰火的控制，雪白色的火焰与发黑的恶魔火焰相互摩擦，却只发生了很小的爆炸，仅仅将那个恶魔炸成了碎片。他四散的尸身竟是一半冰冷一半滚烫的。\r\n    战斗已经结束。\r\n    雪世缓缓走到寒星面前，轻声问：“为什么救我？我本就该死了的。”他的脸上第一次露出痛苦的表情。\r\n    寒星道：“你是个很有趣的人，我会用比他们更大的代价来买你这条命。所以，你还不能死。”\r\n    这本不是句真心话，所以凯特听不懂。但是雪世却很清楚他的意思，因为他们是天生的知己。\r\n    人的生命真的是说卖就能卖的吗？雪世原本是知道的，无论为了什么人，无论有多么充分的理由，人只要做了错事，就始终逃不过过自己灵魂的谴责。人是不能用出卖生命这样的理由来欺骗自己的，生命永远属于自己，是不能出卖更不可能出卖的！\r\n    这道理雪世本是知道的，但却似乎在最迷茫时忘却了。所以才需要寒星的提醒，就好象他提醒寒星时一样。他们本就是一类人，原本能够看透人生的一类人，却都有迷茫，有需要别人来点醒的时候。而现在，雪世已经醒了。\r\n    雪世终于恢复了自信，他抬头道：“这里已经没有强敌会来了，就交给我来处理吧，你们先回去好了。我已经想赎回自己的命了。”知己者之间并不需要太多的语言，寒星扶起凯特，启动了自己身上的传送器，在光芒的辉映中消失了。\r\n    寒星没有丝毫停留并利用传送器的往回赶是有原因的，他知道这段时间里极地城里有了变故。临走前寒星给了迪安娜一枝白花，叮嘱她一旦有情况，立即烧掉它。这只花出自一种一体同生的植物，它最大的特点就是，一旦一个部分着火，其他部分即使被带到了千里之外也会莫名其妙的燃着。而现在，寒星发现自己身上的出自同一植株的花已经燃烬了。所以他不得不往回赶了。\r\n    寒星使用的这个传送器也是个魔法阵，魔法阵连接的终点就是他在极地城的临时住所。寒星此刻正用自己不太纯熟的水系法术为凯特治伤，效果倒还不错。立刻又变得生龙活虎的凯特看着魔法阵外一幕幕快速变化的景象，叹道：“你小子可真好啊，能做出这些特殊法器，可省了不少麻烦。”\r\n    寒星道：“这传送器做起来才麻烦死了，限制又大根本不实用。还好这中关键时候还有点用。”他的脸变得严肃了：“真正的麻烦事恐怕还在前面等着我们呢。”\r\n    \r\n                       四  绝对零度\r\n    寒星两人一出传送阵就向内城赶去。迪安娜正在家门口等着他们，她脸上的泪痕还未干。\r\n    寒星从迪安娜那里得知了事情的经过：菲尔德似乎还另有阴谋，他利用刺杀事件引开了寒星两人，然后突然出手冻住了伯森，打晕了迪安娜，一个人急匆匆地出城不知所踪了，他似乎是急着去做什么事。\r\n    寒星忽然想起了那个火魔，临死前也要拉人陪葬。他又想起了冰之魂，难道他已经完全同化了冰之魂了？寒星的心里有了片阴影。\r\n    他看了看迪安娜，泪水还在她的眼里打转，憔悴的神情更是遮掩不住。寒星忽然感觉心痛，如果自己也像菲尔德那样越上了第四阶，是不是也会让自己的朋友们这么痛苦呢？本就没有几个朋友的他，决不想看到任何一个朋友伤心！\r\n    寒星快步出了城，他要去追菲尔德。现在只有他能阻止菲尔德了！\r\n    寒星没有让凯特同行，凯特既不能对菲尔德出手，更没有实力与他对抗。他也不需要任何人引路，因为他早已在菲尔德身上留了只有他才能发现的追踪器。所以他在漫天大雪的土地上，毫不迟疑地前进着。很快的，他找到了菲尔德的所在地，一个奇特的山谷。\r\n    冰天雪地里本应该是白茫茫的什么也没有，但这里却有个生机盎然的山谷，绿草、鲜花、年轻的树，还有些昆虫雪兔。连寒星也完全不知道这究竟是怎么回事。\r\n    只是寒星却没时间来研究这些奇观异景了，他的目标菲尔德就在这山谷深处。\r\n    寒星静了静思绪，运用风之力将自己轻轻托起，脚不沾地的向山谷内前进。他走得并不慢，但警惕的他能够化解任何角度的攻击。只是他还是算漏了些东西，至少当他走到山谷中心时，实在惊讶不已。谷的中心竟然是一件神器——世界冰冻器。也就在他惊讶的瞬间，四周的冰元素迅速凝结，以迅雷不及掩耳之势冻住了他的手脚，冰块越集越大，很快包住了他的身体，只留着个脑袋露在外面。\r\n    本来只要还能思考寒星就还有机会逃出来的，可惜他的对手是大魔导士。极寒的冰块很快就让寒星的手脚都失去了知觉。冰块内还有大魔导士级的结界，又靠得那么近，寒星这次连“瞬间移动”都用不出来了。\r\n    菲尔终于出来了，他看着冰块内的寒星，冷笑道：“小伙子，你还是太嫩了点。不过……”他转身看向冰冻器，道：“我最初发现它的时候比你还惊讶十倍。”他接着道：“世界冰冻器是原雪域王国的一个魔法师制作的收集了冰之神四散在世界里的最纯净的冰元素的神器。我想制作它的那个人就是和我有着同一种想法的人吧，所以他没能成功的事正好由我来完成？”\r\n    “冰封世界？”寒星虽然已经动弹不得了，但他的神情依旧平静，“你真的想要这个世界陪你一起死？”\r\n    菲尔德神情怪异的道：“你应该懂的啊！你难道没听到体内的冰之魂的召唤，你没有回应过？”\r\n    寒星道：“那是比死神的召唤更恐怖的东西，你自己会不明白？我劝你最好还是放弃，迪安娜在等你回去。”\r\n    菲尔德表情略微有些痛苦：“我如果拒绝呢？”\r\n    寒星道：“我会阻止你。”\r\n    菲尔德咆哮道：“为什么你不能理解我？为什么你要阻止我？我们本该是同意类人的，我本来很欣赏你的！”\r\n    寒星道：“这个世界还有存在下去的意义。这里还有我的朋友们的笑容。”\r\n    菲尔德的表情又变成了冷笑：“我倒想看看根本动弹不了的你怎么阻止我。小子，不要以为自己了不起，你做不到的事还多着呢。”\r\n    寒星道：“你会看到的。”\r\n    谈判破裂，已经没什么话可说了。菲尔德来到冰冻器前，他将手放在神器上，念动了禁忌的咒语。他体内的冰之魂光芒闪动，光芒透出了他的身体直照在冰冻器上。神器开始响应这寒光，整个山谷都开始颤抖。这就是菲尔德的那个冰封万里的“绝对零度”了吧。\r\n    寒星此刻的确动不了，但他却不是什么都做不了。他还能做最后一搏，赌上自己性命的最后一搏。他并不知道能否成功，但恐怕自己是无论如何都要死的。他闭上眼开始冥想，空间中尽是跳动的粒子，寒星穷尽他全部的精神力释放出一阵意念波，波动向四面八方震荡开去，所过之出震动的粒子竟真的停了下来，其中更包括刚成为冰雕的菲尔德和冰冻器，他的寒气也被那阵波动震停了。波动只一瞬间便撞上了寒星为它制造的边界，然后反震而回，直扑向寒星本人……\r\n    \r\n                       尾声                \r\n    寒星渐渐醒转时发现自己正躺在床上，身边有个金发女孩埋头哭泣着。\r\n    寒星坐起身子时只感到全身酸痛，但他还是勉强微笑着道：“爱丽克丝，你怎么跑到这里来了？还哭哭啼啼的，我还没你哭得这么像淑女过呢。”女孩抬头看着他，眼泪又忍不住流了出来，她突然伸出双手抓住寒星，将头埋进他怀里，带着哭腔的“笨蛋”、“傻瓜”的叫个不停。这本是很温馨的画面，可只有寒星才知道，爱丽克丝身材虽然苗条，但她的怪力可比之凯特一点也不差，寒星被她抱得几乎断气。\r\n    休养了两天刚能走路得寒星就坚持要去那个山谷看看。寒星在这两天里想通了不少事，现在他正想去验证自己的看法。在爱丽克丝的搀扶下，寒星进了山谷。\r\n    山谷中的确有些特殊的变化，别人也许感觉不出来，但寒星却很清楚。并不像菲尔德的“绝对零度”般冰封万里，这山谷本身甚至没有一丝寒意。寒星知道自己所能感觉到的温度全在于自己身上的从谷外带进来的物质，因为这山谷竟没有了温度。寒星闭眼冥想时发现，谷中的粒子仍然静止着，一切物质都静止着，连已死的生物们都没有腐烂。寒星想，也许自己那个不完全法术就是将空间中的“温度”这条定律给打乱了吧。\r\n    谷中心还有一个人在，迪安娜静静地站在菲尔德的冰雕前。寒星正想告诉她自己发现的这整件事的真相，却没想到她已知道了。\r\n    迪安娜静静地站着，轻声诉说着：“今早我才找到父亲给我留下的遗书，他在上面写明了事情的真相。他说，以他的身体恐怕活不了几天了，为了不让恶魔之山的封印被打开，他只能选择用法术将自己的灵魂封引在人间。”\r\n    寒星边听便观察着菲尔德身后的世界冰冻器，那个时候在这里的有两个东西没有被静止，一个是寒星自己，另一个就是这世界冰冻器。他忽然发觉其中透出的不是寒气，却反而是一股暖气，甚至印得他体内的火元素力量的共鸣。寒星总算明白，菲尔德之所以要选择在这里施法原因以及此处这冰天雪地中的绿洲的成因了，原来这里竟封印了那个不得了的家伙，那就难怪自己破坏不了它的温度了。寒星忽然感觉，自己之所以能幸存下来，恐怕是多亏了那个怪物吧。\r\n    寒星于是道：“老头子的打算还不止这些吧，至少我还知道他这么设计的另两个原因。其一是为了给封印在这里边的那个恐怖的家伙再加一层封印。其二则是想考验我。”\r\n    迪安娜道：“父亲听我提起你，就想看看你究竟到了什么境界，有没有犯和他同样的错误。”\r\n    寒星苦笑道：“可他这试法也太要命了吧。要不是运气好，我早就死在这里了。”\r\n    迪安娜道：“父亲说了，修行冰之魂的人很容易险进那个误区，做个没有人性的魔法师还不如死了算了，免得害人害己。不过我相信你一定能通过他的考验的。父亲还说，他对不起我母亲，直到她死时，都没有真正关心过她，也是直到我母亲去世了，他才了解到情感的重要性。他不想我也像母亲那样，所以才要考验你……”迪安娜说到最后几句时脸已通红，声音更比蚊子还小。\r\n    寒星却并没听清她的话，他正思索着。他以前总以为情感与力量只能二选一，现在想来不管选择哪一方都并不正确。真正正确的路应该是在战胜冰之魂，依靠强大的精神力在冰之魂的寒光中保持自己的本性。\r\n    寒星没听到却并不意味着没有人听到，扶着寒星的手突然一紧，爱丽克丝大声道：“寒！你跟这个女的什么关系？”\r\n    （ 完 ）\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n    \r\n	序章二：冰之魂			Paragraph	2021-05-30	30000549
31000117	3	2021-05-30	                       死者苏生\r\n                      一  影之牙\r\n    死，是一种什么样的感觉呢？\r\n    它本应该是忘却一切烦恼、痛苦、欢娱和骄傲的彻底的解脱吧。\r\n    但精于生死之道的术士们却知道，人死之后，灵魂将被引入冥界等待冥神的审判。其中至善至美之人将被送上天堂，至凶至恶之人将被罚下地狱，而绝大多数迷茫的人则被洗去全部记忆而后随新生命降生到人间，再次经历苦难的人生之旅。这就是生与死的轮回。\r\n    但影却不愿顺从这轮回，他的灵魂死死地依附着尸身，不肯接受冥界的接引。他自己也不清楚为什么会如此不甘心，作为一个杀手，死亡本就是他唯一的归宿，但他就是不愿这么简单的完结。果然如他的老师所言，影的一生都生活在黑暗里，黑暗蒙蔽了他的眼睛。影的雇主们曾说，他有一双能透视黑暗的眼睛，但只有他自己清楚，在黑暗中他什么也看不到，因为这里本就什么也没有。正因为太过迷茫，正因为连活下去的理由都没有，所以他更不愿意死，更不愿让一切都重归于无。所以他要活下去，即使化作怨灵即使化作恶鬼，即使生不如死即使万劫不复，他也一定要存在下去！\r\n    也不知过了多久，影只知道这是自己的尸身腐烂之前，他恍惚中忽然听到了一个声音：“这个人的灵魂怨气重得真是罕见。”接着那个人对影说：“这位死者，你还是看开一点，早点去冥界吧。若是始终滞留在这里，可是会成为怨灵的。”\r\n    影到是有些惊讶，他在恍惚中不知过了多久也从没听到任何声音，这才知道普通人的灵魂是感觉不到这个世界的。而这个人竟能与灵魂交流，却不知他是哪里的术士。只是影却不知道怎么回答他，他只有继续留在这里，以此表明自己要活下去。\r\n    那人似乎很快就知道他了想法了，问道：“你真的还想活下去，真的愿意继续这没有任何意义的苦难？”那个人似乎看透了影的内心，一句话便把他问住了。原本就没有理由活下去，又到底执著些什么呢？影实在不清楚，他只知道自己要活下去，仅此而已。\r\n    那神秘人知道了影的答案，叹了一声，道：“好吧。既然你想活下去，我就给你续一个月的命。我将一颗魂石注入你体内，它可以维持你大概一个月的生命。我现在有急事得去办，这段时间你就自己去寻求你的目标好了。不过无论你能否找到答案，都记得在二十天后到友谊之城外的大桥边等我，我可以再为你续命。”\r\n    影突然感到一股柔和的力量移向自己的心口，自己那几乎脱离了肉身的灵魂又再次稳稳地与嵌入了肉体。没过多久他就睁开了，再次看到了这个世界。只是那个神秘人却已经不见了。\r\n    这不可思议的变化就这么发生了，连影自己都很难相信自己是死而复活了。唯一能证明他曾死过的，恐怕只有胸口还没完全愈合的致命伤口了，被骑士剑贯穿心脏留下的伤口。影努力感知自身的情况，他发现自己体内的确有快奇特的石头正散发着柔和的力量，源源不断为他提供着能量，并治疗着他身上的伤。影的发觉自己的身体其实仍是死掉了的，实际上是完全依靠着这魂石的能量才能再活过来。\r\n    影实在有些疑惑不已：这个神秘人究竟是什么来历，不仅能与灵魂交流，更随随便便就拿出近乎神器的宝石来帮助一个陌生人。影想不同，所以只能不在去想。他现在只知道，自己又活过来了，其他的一概不清楚了，连他想要做的事也不清楚了。在死了的时候，他只想要活下去，因为没有理由活下去所以要活下去。可当他真的活过来后，又的的确确没有理由活下去了。这实在不是个很好的冷笑话。\r\n    影只得拾起了自己的拳剑，这把跟随了他多年的拳剑除了剑刃锋利外并无什么特别之处，但他对影却有着特殊的魔力。它是他存在于世的唯一的也是最好的证明，他只有握着它的时候才真正有了一个身份，杀手的身份，这就至少证明他还活着。它更是他的象征，干影这一行的人都很少以真面目示人，所有的委托都是在暗中进行的，这时候他们就需要有个信物了。它的名字叫牙，而“影之牙”正是自由都市的大酒馆里的特别名单里排在第一位的名字。\r\n    所以，当影再一次握住牙时，他就有了想要做的事了。影自从十六岁开始做杀手，十年来未有一次失败，但这一次他却败了，并且陪上了性命，但他并不甘心。在敌明我暗，突然袭击，一击毙命，快速隐遁，这本是杀手惯长的作风。可这一次他在出手之前敌人就了解到了他的情况，这对于杀手本就极糟糕了，可他还不幸的被不知哪来的不速之客下了毒，然后被拖着半麻痹的身子被人逼战的他的确只有输，只有死。但现在，重新活过来的他却有能力证明自己强过对手了。所以这一次他同样不会用偷袭暗杀的手段，他决定向那个人挑战，和他公平的决斗。杀手本已没有了公平决斗的资格，但影相信自己能为自己赢得这样的一个机会。\r\n    影是死在友谊之城城郊的一个庄园里的，他原本的目标便是这庄园的主人。只是这庄园主竟请了圣骑士团团长特兰克来作保镖。影就是在与特兰克的对决中被一剑穿心死掉的。但来暗杀庄园主人的显然不止影一个人，特兰克刚杀死影就马上带着庄园主一家逃离开了。也正因此，影的尸身还没被处理掉，也没被这漫天的大雪所掩埋。不过这就更让影不能理解那个救他的神秘人是怎么找到他的了。\r\n    影知道特兰克不可能会找隐蔽的地方躲起来，他一定是带着庄园主一家回到了友谊之城，在他自己的保护下当然比其他任何地方都要安全。于是影顶着漫天飞雪向友谊之城进发了。\r\n    圣联的确太过软弱，为了彰显所谓的仁爱友谊，竟然连国家首府都几乎不设防御，整个国家唯一的战斗部队就是神圣骑士团。也难怪几年前死灵君王罗德的亡灵部队可以在这片地方横行无忌了。影根本不用化装改扮就进了城。城楼的守备稀少而松散，街市里一如既往的一片平和景象，这一幕幕触动了影的回忆。\r\n    这是影十几年以来第一次回到这里，自从他被那些道貌岸然的圣骑士们驱逐后，他就再没有来回来过，甚至故意避开了这片土地。影一直都克制着自己不去回想在曾经的记忆，长久以来他就真的连自己最好的三个兄弟的样貌都记不清了，他只能依稀记得，雷特老大好强又行事卤莽，常常若些不必要的麻烦；莱尔则心善胆小，总是受了欺负都不说；而和他一样黑头发黑眼睛的寒星就只爱摆弄他的瓶瓶罐罐，整天整天的不苟言笑的样子，让他帮忙教训人又很可能会闹出人命。结果每次莱尔受那些阔绰子弟欺负的时候，出谋划策教训那些个自命不凡家伙的都是影，几个人一起的行动的时候也都是由他指挥的。可现在，四个兄弟已经各奔东西了。\r\n    影不由得想到，自己为什么想要与特兰克决斗呢？影本不是个好强的人，爱争斗的杀手绝对活不到现在。但他这次却一定要与特兰克争个高下，为了证明自己胜过那些骄傲自大、目中无人、仅凭自己一句话就断定断定别人善恶生死的圣骑士们。因为影自己就是被那些人判断为邪恶黑暗之人，也许就因为他的夜眼，所以，影必须证明自己强过那些家伙，自己不被他们接受也照样能更好地活下去。\r\n    影轻松躲过了城主府外的守卫潜了进去。已知道此时府内的守备就不会像外面那样松散了，他现在必须十分谨慎才行。他躲进较为阴暗的角落，警惕地在府内搜寻着。可他无论潜到哪里，都始终找不到特兰克的身影。\r\n    他这时正藏身在一个黑暗的角落里注意着外边的情况，根本没想到他自己身后竟会有一块从墙上落下，而露出来的墙口还有个身影正往外窜。影注意到身后的变动时，身子已自然反应地扑了过去，并指为刀砍向了那人的颈口。还好影手快的同时眼睛也够快，当他看到那个身影是个小女孩时，努力收手，力道去了大半，却还是将正笑着往外窜的小女孩打得晕了过去。\r\n    影一眼就认出这女孩正是那庄园主六岁的独生女儿，可是现在影已没有理由再杀他们来完成那已经失败了的任务了。正当他想将小女孩丢到明处时，却又突然想到，自己的确没把握能有与特兰克公平决斗的机会，在他的地盘自己没有任何优势，但若是以这女孩为人质，自己就能把特兰克单独约到一个隐蔽之处去决斗了。\r\n    影思考了一会儿，认为这个计策是可行的，于是以最快的速度开始实行了。他抽出拳剑在一面墙上留下了自己：雷诺斯的女儿在我手上，想要救人就叫特兰克独自到城外北边禁林里的小屋来。留名为“牙”。只是不知特兰克看到这个已死之人的留名后，会怎么想。他从小女孩的衣服上撕下了一小片布料，丢再了墙角。\r\n    影刚做完这些就带着晕过去的小女孩掠出了城主府，出了友谊之城，以最快速度向禁林那间小屋进发，他的脚印很快被大雪掩埋了。\r\n\r\n                      二  麻烦的人质\r\n    这间小屋十分简陋，甚至没有火炉，处地有远离人群，夏天有炎炎烈日，冬季有漫天飞雪，这里本该是不能住人的，但影却曾经在这里住了三年，这间屋子就是他修的。在这里的三年是他的转折点：在这三年以前，他是与兄弟同甘共苦，活得自在开心的孩子；这三年之后，则是杀人不眨眼却又迷茫不已的杀手。\r\n    影找来些木柴，在屋中间燃起了一堆火。其实他体内的魂石会源源不断地为他提供能量，他自己根本就感觉不道寒冷和饥饿。这堆火是为那个小女孩生的，影知道这些贵族家的孩子一向都锦衣玉食过惯了，是禁不起这风雪哪怕最轻微的吹打的，要是她死了，自己的目的恐怕就达不成了。\r\n    小姑娘慢慢醒转了过来，一脸疑惑的样子。影闲来无聊曾猜测她醒来后发现自己处在一个完全陌生的地方，面前又有个面相恐怖的陌生人时，是会哭爹喊娘的大叫呢，还是会哇哇大哭呢。不过她的反应却完全地出乎了影的预料。躺在木版上的小姑娘先是疑惑地看了看这房顶，侧头看了看火堆，然后蹦起来，环顾四周，再跑去打开门，看了看外边的森林，她突然欢呼一声，蹦蹦跳跳地到了影身边，天真地道：“是你带我来这里的？你叫什么名字？”她似乎又突然想起父母教的礼貌，自己先报名字：“我叫伊德妮，今年六岁。”\r\n    影本就等得很无聊，这个小女孩不像普通孩子那样哭闹，他倒省了不少麻烦，于是他很少见的开口说了一个字：“影。”\r\n    小女孩疑惑地看了他半天，才终于明白他的意思，她笑道：“原来你叫影影啊。可是你在这里干什么呢？”\r\n    “等人。”影答道。\r\n    “等什么人呢？如果我知道，我可以帮你找啊。”这小女孩完全不明白自己“俘虏”的身份，一脸好奇地问着。\r\n    “特兰克。”\r\n    “哦，原来你等的是兰兰啊，他就在城里啊，你为什么在这里等他啊？要不你跟我一起去找他吧。对了，你又找他干什么呢？”伊德妮追问不休。\r\n    “等他来决斗。”\r\n    “那你为什么要和他决斗呢？决斗很好玩么？”\r\n    “……”影终于发现这个不普通的孩子比普通孩子更麻烦得多，他于是严肃地道：“到火堆边安静地坐着。”\r\n    “我为什么要过去坐着？”伊德妮的声音天真得让人受不了。\r\n    “等特兰克来接你。”\r\n    “为什么兰兰又要来接我？”\r\n    “因为你是人质。”\r\n    “人质又是什么？”\r\n    “……”影再次无话可说了，这个小女孩实在太没常识又太爱问了。影知道现在最好的摆脱她的问题的办法就是什么都不说。他于是闭上眼睛休息，不管伊德妮问什么，他都完全没反应。伊德妮问了半天甚至还捏了影两下，他都全无反应，无聊的伊德妮只好走开了。\r\n    伊德妮开始在屋子里打转，她翻箱倒柜地将这屋子里全部的东西都堆到了满是灰尘的木桌上，一会儿摆弄这个，一会儿又碰碰那个，自得其乐地玩着、笑着。\r\n    影毕竟不是无知无觉，他睁开眼看伊德妮摆弄着他曾经的全部家当，一瞬间似乎又看到了十几年前的自己。刚被贵族们驱逐了的年仅十三岁的他独自一人住在这破屋子里时，不也曾一个人摆弄过这些自己做出来的小玩意吗？如今的影已不在是曾经的小男孩了，现在的他是黑暗里最锋利的一颗牙，可仔细想想，除了“影之牙”的称号和手上的“牙”，他还拥有什么呢？直到此时他才发现，除了迷茫之外，出生入死地拼搏了十年后，自己所拥有的却并不比十年前多。自己这十年到底都在干些什么，影这么问自己，却显然得不到一个满意的答案。\r\n    影正思索时，伊德妮已到了他身前，笑着道：“这里比黑屋子好玩多了，谢谢你带我来这里。我跟爸爸妈妈整天整天地呆在那个黑屋子里，实在无聊死了。”影实在把她没办法，这小女孩实在太不通人事了，真是一点人质的自觉都没有。\r\n    影看着他天真的样子，忽然莫名其妙地问：“你不怕我？”\r\n    伊德妮疑惑地问：“我为什么要怕你？”\r\n    影道：“我的样子不可怕？”他当了太久的杀手，实在已忘了自己的原本的模样了，他只知道被自己所杀的人一个个都面容极度恐惧。\r\n    可伊德妮当然不可能像那些人那样害怕影，她轻轻地拂开影的头发，仔细地看着他的脸，看了又看，终于说道：“你的样子很帅，比兰兰还帅。”\r\n    影又一次无语，他怕这小家伙又说个不停，赶紧闭上了眼。\r\n    不过这次伊德妮却一句话也没有多说，却忽然欢呼着跑出了屋子。不明情况的影赶快睁开眼，当他起身赶到门口时，伊德妮已抱着个小雪兔走了回来。\r\n    伊德妮将兔子放在火堆边，然后就开始逗它玩。这小女孩总是能找到有趣的事做，真是一刻也闲不下来。天色很快暗了下来，伊德妮抱着兔子睡着了。看着她高兴的样子，影感叹，果然是贵族家的孩子，处在父母的悉心呵护下，一点都不知道世上的险恶，天天都这么无忧无虑，与从小就无亲无靠偷抢要饭什么都干的影完全是两个世界的人。\r\n    影不知怎么又想起了以前，想起了那时候的那些贵族，不管男女老少一个个都瞧不起人，动不动就出手打人，根本不把别人当人看，自以为天上地下他最大，根本就是无可救药的渣滓。影突然想到，那些人就是由伊德妮这样的小女孩变成的，不知道什么时候她就会变成那样呢？影突然生出一种厌恶感，他讨厌贵族，他所见过的贵族人没一个好东西！\r\n    第二天，伊德妮起身时才发现，火堆已经熄了，自己又冷又饿，而影却不见了。她喊了两声都没人答应，只好出门去找。不过她刚打开门时，就看见影扛着一捆柴大步走了回来。影走到伊德妮身边时，她撅着嘴道：“我妈妈教的，出门的时候要打招呼的，你什么都不说就不在了，害人家白担心你。”影不知怎么地突然想到：你是担心自己没饭吃吧，哪有人质担心绑架犯的。连他自己都没注意到，自己竟和个六岁的小女孩呕气了。\r\n    伊德妮静静地看着影生起了火，才道：“我饿了。”\r\n    影道：“没有吃的。”\r\n    伊德妮惊讶道：“你不吃东西的？”\r\n    “不吃。”现在的影的确可以不吃东西，其实即使他吃了，早已死亡了的身体也消化不了。\r\n    “可是我饿了！”伊德妮嘟囔道，她显然是朵受不得饿的娇嫩花儿。\r\n    影想了想，忽然指着还躺在地上的那只雪兔，道：“我们可以吃它，我可以把它烤得比你吃过的任何东西都更美味。”\r\n    伊德妮突然变了脸色，急忙把兔子抱在怀里，大声道：“你怎么可以吃兔宝宝呢？它这么乖！”\r\n    影冷冷道：“你又不是没吃过肉，它跟你以前吃的猪狗牛羊有什么区别？”\r\n    伊德妮不知如何反驳，她满脸警惕地移向了门口，嘴里喃喃道：“反正就是不能吃我的兔宝宝，反正就是不能吃。”到达门口时，她忽然大叫道：“影影要吃兔宝宝，影影是大坏蛋。我最讨厌影影了！”话还没说完，她已经冲出了门去。\r\n    影本来就是大坏蛋，把善良的小女孩气跑本就是大坏蛋该做的事。可是伊德妮才跑出去一会儿，他就开始担心了，这冰天雪地里她这又冷又饿的小女孩能往哪里跑呢？影只得将衣服里的面包和热水袋放到木桌上，赶紧跟了出去。\r\n    伊德妮果然没地方去，他靠在一棵披上了雪衣的老树上，双手紧抱着那只雪兔。影一旦向她靠近，伊德妮便警惕着向后退。虽然影能很轻松地抓住她，可把她弄哭了也不好办。影此时正想出森林去看看，但他终究还是有些担心，只得向伊德妮吼道：“回屋里去。”可伊德妮仍只是戒备地盯着他，完全不听他的话。\r\n    影知道自己不离开，她是不会进屋的。还好这寒冬里别森林里的野兽都不会出来，影想了想，没什么好担心的，于是大步走出了森林。\r\n \r\n                     三  改变\r\n    照常理，城主府里那些巡逻的人应该能看到影的留言的，而特兰克也早该赶到森林里来救伊德妮了。可都近一天了，特兰克都还没出现，影找了找森林里也没他的踪迹，影只能想到，也许友谊之城里出了什么事了。可到底发生了什么，他不知道，所以他只能再入城看个究竟。\r\n    影进了城主府来到他劫走伊德妮的地方时才发现，这里竟完全变了样。厚实的墙壁被切断了，有的地方还破了大洞，空气中的血腥味还未消弭，而影留字的那堵墙完全塌了。土堆还无人处理，当然更没有人能看到影留的字和伊德妮的一片衣衫了。\r\n    影四处查看了一下，暗想：这里显然有过一番激烈的战斗，墙上第上的血迹也表明伤亡不少，可究竟又是什么人敢在友谊之城内与神圣骑士团火拼呢？影直到现在才有些怀疑了，雇佣他的那些到底是什么人，他们的目的是什么，又到底还招揽了些什么人物来帮他们。这一切本不是一个杀手该过问的，可影现在已不是杀手了。他只想再一次与特兰克决斗，可这件事似乎没那么容易了。\r\n    影想了想，还是决定再向特兰克留言一次。他不喜欢多管闲事，这一场恩怨本也不是他该插手的，他只想与特兰克决斗证明自己比他强而已。于是他抽出一张纸，再次留了言。这一次他怕那些人又找不到，于是将纸条折好挂在针上，直接掷进了城主府大厅里。这个大厅似乎二十四小时都有人在，而且还都很戒备，影的针刚插到桌上时，厅内的四个人第一时间冲了出来。不过他们的反应虽快，身法也如豹子般敏捷，可还是没能看到影的身影。影的速度已几乎超越了极限，即便是从这些人身边掠过，他们的眼睛也是捕捉不到他的。\r\n    影轻松地出了城主府，心想这次应该可以回森林里等待了吧，特兰克总不至于不顾伊德妮的安危吧。可他忽然又想道，也许特兰克根本没去过禁林不知道那间小屋在哪，他于是上街买了些纸张，他准备用这些纸做路标，贴在还没完全被雪覆盖的树上。他顺便又用身上余下的钱买了些好吃的，毕竟让一向娇生惯养的伊德妮整天吃面包也不好。而食品店里又正好有只木刻兔子，影也买了下来，伊德妮这么喜欢兔子，就买一个给她好了。他想着想着又跑到城角割了一把青草，那只雪兔只怕也饿得不行了吧。\r\n    影往回走的路上有种奇怪的感觉。一个终身徘徊在生死一线间的流浪杀手忽然想起自己竟还有个家，家里还有个人在等他（不管这个人是不是愿意等他），这该是种什么样的感觉呢？影是个杀手，一个除了杀人什么都做不了的杀手，只有杀人才能证明他的存在的杀手，当他忽然有个家时，当这个家里还有个人在等他回去时，杀手当然会感觉奇怪，但奇怪中还有些别的什么情绪呢？这恐怕只有影自己才知道了，又或许，那是连他自己也不能理解的。\r\n    可是当他打开木屋的门时，就立即笑不出来了：屋里的火已经灭了，伊德妮也不见了！影首先想到的就是她被人带走了，若是被特兰克带走了还好，可要是被那些顾主带走可就麻烦了。但影的直觉判断又告诉他伊德妮也许不是被人带走的，也许她是自己一个人害怕就出去找影，结果在森林里迷路了，又或许……影已经没时间假设了，他所唯一能做的就是出去找她。他连东西都来不及放，就急急忙忙奔了出去。森林这么大，影又有些慌张，伊德妮的衣服又是浅蓝色的不好辨认，影找了很久都没能看到她。\r\n    不过还好影的眼睛不仅能透视黑暗，白天里也比普通人的好得多。他终于发现了一棵几乎被雪掩埋了的老树下的已被埋了一半的小雪人。影赶紧冲过去想把伊德妮从雪里拉出来，没想到冻得全身僵硬的她仍然清醒着。见到影走过来，她努力摆动了两下想逃开，嘴里还喃喃着：“你走开，不许吃我的兔宝宝。”她的身子抖个不停，脸也冻得通红，那双大眼睛却仍盯着影。\r\n    影这才知道，伊德妮倔强得根本没回屋里去，她竟然就在这里坐了大半天。影再一看，伊德妮怀抱里的雪兔已经冻死了，可这个伊德妮还活着，这真的是个从小娇生惯养的孩子吗？影很震惊，他确定这的确是个锦衣玉食的贵族千金，本应该是只知道在父母怀里撒娇的小孩子，完全抵御不了伤害的小孩子，她也的确是个小孩子，会赌气的小孩子。可是她却能在这冰雪覆盖中顽强地活着，这几乎是精于计算的影所不能理解的了，不过此刻他却似乎有点醒悟了，虽然只是一点点的醒悟，却让他几乎惭愧得无地自容了。他看了看自己手上的还未贴完的纸张，狠狠地把将它们撕成了粉碎，影甚至有种冲动想将自己也撕个粉碎！\r\n    影走过去将伊德妮从雪中抱了出来，拍去了她身上的冰渣，示意她站在一边，然后将吃的东西拿给了她。伊德妮果然静静地站着，其实她现在即使想跑也跑不动了，全身发抖的她硬要抱着兔子，弄得连食物全掉到了地上。影用自己的拳剑在树下挖了个坑，轻轻拍着伊德妮的肩膀，轻声道：“它死了。把他埋了吧。”伊德妮显然也知道兔宝宝死了，她走上前，郑重其事地将雪兔放进了坑里。影用泥土将雪兔掩埋后，又将那木刻兔子放在了小坟前。\r\n    正当影想拉着伊德妮回屋子时，伊德妮却忽然向下倒去。影赶快抱住了，细细查看得知：小姑娘毕竟身子弱，倔强地在雪里撑了这么就都没冻死已经算奇迹了，发高烧大病一场也很正常。可麻烦的是，影从来没照顾过生病的人，他自己病的时候从来都是硬挨过的，现在要他照顾高烧的伊德妮，简直比面对比他强百倍的敌人更慌张。（虽然这世上比他强百倍的人类根本不存在）影只得抱紧了她，希望自己体内的魂石能起点作用。他根本来不及回屋，直接就向森林外走去。离这里最近的城镇不是友谊之城，而是一个猎人特别多的小镇，影现在就是要到那里去找医生。\r\n    他怕伊德妮受颠簸，只得放慢了点速度，很平稳地走着。虽说放慢了速度，他的移动却也决不比快马慢一丝半毫，至于平稳性，即便是一杯装得满满的水握在他手上，也决不会撒出半滴来。他很快地就赶到了那小镇。但小镇里大多数人家都关了门，影费了好半天才找到一个小诊所。\r\n    这诊所的医生形容邋遢又一脸奸猾相，简直比传说中的庸医更庸十倍，可影现在也只能指望他了。影还没说话，那医生却先开口了，直入主题：“有钱就给治，没钱就走开。我可已经穷得响丁当了，决不会做白工的。”他显然是看影一身衣服单薄得可怜，明显是个穷光蛋，所以说话刻薄之至。\r\n    影现在身无分文，可他却有对付奸商庸医最好的法子。那医生还未转过身去，影的拳剑已经抵住了他的咽喉，口中冷冷地道：“治好她，不然你死。”\r\n    被人突然架住脖子的感觉显然不好受，被吓住了的医生发抖着道：“你别乱来！杀人可是要偿命的！”\r\n    影知道还得吓吓他，于是冷笑道：“我杀的人连我自己都数不清了，大酒馆的档案里也记不清楚的，你要是想知道，就自己到天堂里去看吧！”\r\n    奸商怕恶霸，这是亘古不变的事情。医生虽然昏庸，却显然也听得出影的意思。杀手如果要救一个人，那只因为他还有用处，就算这任死了，对杀手的影响也不会很大的。医生当然知道这就意味着自己的命对这个杀手来说也是可有可无的，他只能无奈地将两人带进了屋子。\r\n    这医生看起来邋遢不堪，但在有生命危险的时候还是有点能耐的。原本不停呵气，表情痛苦的伊德妮很快就静静睡去了。听着她平稳的呼吸声，影这才安心了下来。医生还在忙碌，影已经无声地开门向外走去。\r\n    影刚打开门手还停在门把上时，门外竟有个身影疾攻向了他，那人的武器正是适用于突刺的长剑。这一击来得之快，本该是避无可避了，而那暗杀者显然也以为自己得手了。可当长剑刺过这仅一米多的距离时，竟钉在了门板上。也就在同时，暗杀者还没来得及惊讶，影的牙已经贴上了他的咽喉。暗杀者的速度虽比不上影，眼睛也捕捉不到寒星的动作，但他知道，就在刚才，影的牙已经从他脖子上划过了一次了，没有要他的命而只是留了一道很细的伤痕，在这一击之后又将拳剑抵在了他咽喉处。\r\n    暗杀者此时才真正了解到“第一杀手”的恐怖，但他却一丝惊慌也没有，反而冷笑道：“想不到连‘影之牙’也有了情感了。黑炎说得果然没错，你的不败神话就要被打破了。他还说，若是你没杀我，他就要取代你的位子了。你难道忘了杀手的原则了吗？”\r\n    不杀人就只能被杀，杀手的原则影当然记得，但那却已是过去的东西了。影没有回答他的话，而是静静地反问道：“你真的确定自己没有心？”\r\n    这话若是其他人问，这暗杀者一定会回答得很肯定，可这时却是由他的最强的同行问的，那份徘徊于冷酷和情感之间的疑惑问话者显然比他更清楚，暗杀者一时竟不知如何回答了，他希望自己没有情感，杀手本不该有，但无论是谁都不能完全否定那颗“心”的存在。\r\n    影拿开了拳剑，向那暗杀者道：“你逃吧。”\r\n    暗杀者道：“你既不杀我，我为什么要逃？”\r\n    影道：“别回去见黑炎。”\r\n    暗杀者突然明白过来，黑炎当然不会放过失败了的他。他默默地收起长剑，快速离开了医馆。\r\n    影还未转身，屋内的医生就叹道：“杀手原来也有感情的，也有不杀人的时候呢。”\r\n    影平静地道：“杀手只杀需要杀和该杀的人。”\r\n    这话说得模糊，但医生却明白了他的意思，他忽然笑道：“那既没人买我的命，我自己又没造孽，就是不该杀的了吧。哎，早知道就不忙活了。”\r\n    影道：“她是好人，你治不好她，就该杀。”\r\n    这倒是个很不错的理由，医生只能苦笑。\r\n                     \r\n                     四  死者的忠告    \r\n    在医馆里住了两天，待伊德妮的病好得差不多了，影才带着她向友谊之城走去。伊德妮一路上蹦蹦跳跳快活极了，不过她没走多久就累了，影只得背着她往前走。\r\n    两人慢慢到了友谊之城，城市里仍是一片和平热闹的景象，特兰克和影的顾主之间的争斗显然没有波及到这些平民。伊德妮虽然身在其中，却显然也不知道这场斗争的激烈，要不然她也不会偷跑出来玩了。走在街的伊德妮一脸好奇的神情，这里逛逛那里看看，根本没想过回家，影随时保持警惕的跟在她后边。可伊德妮的玩心实在太大，到最后影只得强拉着她走向了城主府。\r\n    这一次影走的是正门，让他想不到的是，走偏门躲躲藏藏地在这府里晃悠了几遍都找不到特兰克，可这次走正门还没向门卫答话，特兰克就自己开门走了出来。这个偶遇两人都未曾想到，影和特兰克这一照面，眼神立刻变得尖锐起来，毕竟是曾拼命搏斗过的人，彼此间自然地有所警惕。两人的目光如刀剑般锐利，随时可能出手伤人，周围的空气都凝结了。\r\n    两人终究没有打起来，打破这僵局的是影牵着的伊德妮，她从影的身后窜出来，指着特兰克嚷道：“兰兰！你怎么可以这么瞪人家！”\r\n    特兰克一见伊德妮，严肃的表情立即散了，他突然松了口气，而后笑着向伊德妮道：“还好你没事。叔叔和你爸爸妈妈都担心死了。”\r\n    伊德妮却不买他的帐，她不满地嚷着：“你还没说清楚呢，影影那么好，你怎么那么凶地等着人家？”\r\n    特兰克看了看影，又看了看伊德妮，然后再看了看影，似乎明白了过来。他苦笑道：“好了，好了，是叔叔错了。叔叔给他道歉行了吧。”\r\n    影看着堂堂圣联元帅统御神圣骑士团的特兰克竟然也拿跟伊德妮没办法，忽然地笑了，这竟是他十年来第一次在别人面前开心地笑了出来。影一笑，伊德妮也笑了，而后特兰克也笑了。生死之仇竟就在这轻松的一笑中淡去了。而门口两个守卫则完全搞不清这三人在傻笑什么，他们可以将门前的两人当成傻瓜，却不敢把特兰克当成疯子。\r\n    忽然不知何处传来了一阵树叶折断的轻微声音，伊德妮和守卫都没听见，但这细微声响却逃不过影和特兰克的身影。特兰克也许疑惑对方怎么会这么不小心地暴露了自己，影却知道这是怎么回事。影将伊德妮拉到特兰克身前，道：“她就交给你了。最难缠的对手由我来应付。”影和特兰克对视一眼，信任是不需要言语的，生死之交就是这样的吧。影似乎从特兰克身上看到了雷特老大或者莱尔的身影，但他没有停留，收回眼神很快出了城主府。而特兰克也以最快速度拉着伊德妮走进门去。\r\n    影连拐了几个弯，走进了条无人小巷中，才停了下来。他静等了一会儿，忽然大声道：“黑炎，出来！”影知道，刚才发出那声响的就是黑炎，那是向他发起的挑战，为了要取代他“第一杀手”的位子。\r\n    又过了一会儿，黑炎果然从墙后走了出来。身黑色劲装比影的轻便衣服更薄得多，他手里的武士刀上黑色的火炎正无声地燃着。黑炎冷冷地道：“你已经准备好受死了？”\r\n    影迎上了他冷漠的目光，忽然叹了口气，道：“黑炎，我一直都把你看成是曾经的自己，你的人生跟我的几乎完全一样，同样的孤苦，又同样的精明而好强，甚至连黑发黑眼都那么相似。”\r\n    黑炎插话道：“但是我的实力却不是以前的你能比的，即使是现在的你，也同样要死在我的刀下。而且，虽然发肤颜色相同，但我的血统和你的完全不同，我可不是你们那软弱民族的后代，我的民族是最高傲最强大的。”黑炎显然也是个不爱说话的人，他挥刀指向影，道：“出刀吧。”\r\n    影只得抽出了牙，但他仍说道：“我只是想给你一个忠告。我的老师曾说过一句话……”\r\n    黑炎抢话道：“死者的忠告我不需要。”他已经做出了进攻的架势。\r\n    黑炎曾数次向影挑战，但影都避开了，因为他和黑炎的实力实在太接近了。若是在黑暗中，影也许能凭借天生夜眼得个惨胜，不死也得少胳膊断腿的。而若是在白天，只怕就只有同归于尽一种可能。\r\n    但这次影却不得不战了，而且形式还不容乐观。一旦有了情感，杀手的命就不长了，大家都相信这句话，影自己也相信，但他现在却知道了它的另一种解释方法。虽然他的身体因为死亡而迟钝得多了，但影的胜利的信心却决不比黑炎小。他也做好战斗的准备。\r\n    杀手间的决斗一定只有一招，最快最狠致命的一招，一招之后必有一死。就在这一瞬间，两人同时出手同时停下，以普通人根本就什么都不到的感觉不到的短暂时间结束了这世上两位顶级高手的决斗。\r\n    黑炎没有受伤，但他却很惊讶，惊讶于自己竟输给了现在这个影。影的牙从他脖子边划过却并没有要他的命。杀手不能杀人就只能被杀，但影却没有杀他。黑炎看向了影。\r\n    影站直了身子，轻轻拍灭了胸前的黑色火炎，平静地道：“你以为我违反了杀手的规则？”他然后又自言自语地道：“杀手对决必有一死，这话并没错，不过我没杀你，只因为，我已经死了，又何必要拉你一起死呢。一旦有了情感，杀手的命就不长了，这点也没错，不过杀手的命虽不长了，不做杀手不就行了吗？”\r\n    黑炎表情痛苦地道：“你以为自己逃得出这个圈子吗？你的下场只有死！”\r\n    影道：“其实不过是大家都相信这句话，在相互制约着，所以才没有人能逃得出去。这个世界就是这样，明明大家受着同样的痛苦，同样想解脱，却又不肯让别人脱出去。”\r\n    影顿了顿，道：“我的确没逃出来，所以我已经死了。但是你却有可能逃离，因为你还活着。”\r\n    黑炎道：“可是我根本没有脱离它的能力，我们都是注定了要在黑暗中偷生的人。”\r\n    影突然笑了，他道：“我被赶出友谊之城那天，我最尊敬的人我的老师曾留给我一句话，他说他曾从一本书上看到过这样一句话：黑暗给了我黑色的眼睛，我却用它寻找光明。这话对于我们来少，真是再恰当不过了。”\r\n    影停了停，又道：“你知道我为什么能赢你吗？”\r\n    黑炎也的确有些疑惑，照常理自己是绝对不会输的，影到底是怎么做到的，他于是问：“为什么？”\r\n    影道：“因为我不能输，我若是输了，那个小女孩和她的父母都得死。那是个很善良很可爱的孩子，对于现在这个已死了的我来说，她是我在这个陌生恐怖的世界里所唯一想保护的人。”\r\n    黑炎道：“就这么简单？”\r\n    影道：“我们杀人的时候，能发挥的只是自己能够控制的力量，只是赌上自己的生命在战斗。可我们的那些对手，那些保护别人的人则更要赌上他们所要拯救的人的性命，而那些人对于他们来说，往往比自己的生命重要得多。这种时候，人也许就可能将全部的潜力发挥出来了。我能赢你也只是偶然，但却是只有保护者才能抓住的偶然的机会。”\r\n    影接着道：“黑炎，你也该去寻找比自己的生命更重要比名声地位比杀人的快感更重要的东西了，我们的世界里能否有个人冲出这藩篱，就要看你的行动了。这也许是我这是我这十年来话最多的一天了吧。”他的话音刚落，人已经去得很远了，只留下黑炎默默地沉思着，回想着他的话。\r\n                     尾声\r\n    影这十几天来一直在暗中守护着伊德妮，不过自黑炎以后就再没有人来袭击这家人了。\r\n    影在这段时间里终于想通了，曾经的要存在下去的执著已经淡了。这些天看着伊德妮无忧无虑的样子，他已经很满足了，虽然伊德妮早已忘掉了他。他心里感叹，其实自己存在与否又有什么关系呢，一个人来世上走一遭，又何必一定要让别人记住呢，只要自己在意的人能活得好，有了这么一分满足，又何必在要求其他呢。让世人恐惧的杀人魔，掌握人生死的独裁者，最一流的强者这些“梦”都是过去的事了，说来不过是个无聊的冷笑话而已。             \r\n    影现在已经满足了，也没什么好留恋了，所以他要走了。死者本不该在这世上多呆，影也不想让这分满足感淡去，所以他要去见给他魂石的那个神秘人。影并不需要他再为自己续命，这一次不管是去冥界还是去地狱他都不会皱一皱眉头。\r\n    走之前，他还得向特兰克辞行。这些天来他与特兰克相出得还不错，他发现特兰克虽然位高权重，却完全没有架子，是个很开朗很和气的人，倒是跟伊德妮一唱一喝地配合得很不错。\r\n    特兰克也知道影不想让别人看到，在影进他屋子前就将旁人谴了出去。影悄无声息地进了屋，直入主题地道：“我要走了。”\r\n    特兰克道：“我知道自己留不住你，你走好。不过我会一生都记得你的，你若是没什么地方可去的时候，随时都可以再到这里来。”\r\n    想要被人记住的时候，这个世界仿佛都是健忘的，而已经不再在乎存在的时候，却有人终生都记得他。影心里感叹着，到底是这世事太难琢磨了，还是人太苯呢，总是做这样的傻事。\r\n    特兰克忽然想什么似的，又道：“你以前的事我也知道不少，甚至你被驱逐的时候我就站在人堆里。只是当时的我什么也做不了。我还知道，其实你只认同兰斯叔叔才配做神圣骑士团团长的。”\r\n    影道：“但是现在我也认同了你，你也有这个资格。”\r\n    影又问道：“对了，你知不知道对方的用意，他们为什么这么向对付这家人。”\r\n    特兰克道：“我也不太清楚，不过似乎与伊德妮他们家祖传的徽章有关。只是对方花大力气宁愿放过这家人也要取得那个徽章，但抢到以后却又回过头来杀伊德妮他们，这的确有些奇怪了。不过现在我倒是想到了一种可能。我曾经看过那个徽章，它与魔法帝国的皇家徽章极为相似。而据传说魔法帝国的皇家徽章似乎隐藏这一个极大的秘密，直指这一个巨大的宝藏，而帝国皇族更是把那四个徽章看得比什么都重要的。我估计对方一定是误认了这徽章，又想要窃取那个宝藏，所以才要袭击这家人的。”\r\n    特兰克停了停，忽然笑道：“我与你决斗的那天虽然你中了毒，我却也被那些人算计受了重伤。所以后来那次你找我决斗，我想我也不一定会输的。”\r\n    影道：“那次我们若真的打了起来，输的一定是我。而且，即使前一次我没中毒，输的也还会是我。因为我总是在杀人，而你总是在救人。杀人的人最终总会输给救人的人，不管他杀过多少人，也不管他到底有多强。”\r\n    特兰克这才想起还有话要传给影，他忽然神秘地笑道：“伊德妮又问起你了，她问你到底去哪了。我跟她说你去了很远的地方，不知道什么时候会回来。她于是叫我帮她传话给你。”\r\n    影问：“她说什么？”\r\n    特兰克一字一顿地道：“她说，她喜欢你。”\r\n    影“哦”了一声，显然没明白他的意思，一个六岁的小女孩喜欢爸爸妈妈哥哥姐姐叔叔阿姨的有什么好笑的。\r\n    特兰克只得补充道：“她的意思是，她要嫁给你！”特兰克刚说完，自己先忍不住笑出来了。\r\n    这话可把影弄懵了，这像是六岁孩子说的话吗？这个人小鬼大的鬼精灵。\r\n    特兰克似乎还嫌不够，变本加厉地道：“其实伊德妮年纪虽小，思想却是很成熟的，由我做媒你们的婚事绝对没人阻拦……”这家伙边说边笑，边笑边说，笑声比哭还难听。\r\n    影可受不了他的话，轻轻挥了挥手，窜出了门去。\r\n    （ 完 ）\r\n	序章三：死者苏生			Paragraph	2021-05-30	30000549
31000118	101	2021-05-30	                            双使                              \r\n                            楔子  邪神的诅咒 \r\n    影跟着这个神秘人已经一个多月了，可他却完全不知道这个人到底是干什么的。他跟着这人出入许多毫不相关的地点，做着完全不同的事。有时是去失落了的神殿里修复古魔法阵或去扑灭远古森林的大火，有时是去偏远小镇捡起被遗弃了的孩子，暗中送到那些没有孩子的家庭里，又有时装神弄鬼吓跑那意图猎杀珍兽的猎人们。影不清楚他到底有什么目的，他只知道，这人时刻在帮助着别人却又不愿被别人瞧见他的存在。\r\n    这神秘人相貌极为普通，放到人群里很难辨得出来。但影看得出从他那冷静的表情中现出了一股不怒自威的王者之气。这气势几乎让影觉得自己在他眼中就如同蝼蚁一般。这本该是不可能的事，影自己就是最强的杀手了，能让他胆寒的人物用十只手指就能数得清楚，可这人却似乎完全不像是那些个达到神级的传奇人物。\r\n    不过这个人倒从没像对待蝼蚁那样对待影，他不仅用宝贵的魂石为他续命，更很友好地和他谈天说地。两个人虽然都不太爱说话，不过这么长时间一直什么都不说也是受不了的，所以比起为他续命，影倒是更感激他经常陪自己说话。\r\n    两个人现在正在一个密林里穿行，两个人都踩着树枝轻松地向前越进，速度之快甚至连飞奔的骏马也比不上。影不知道到底要去哪里，那个人这次没有说话而只是表情严峻地前行着。\r\n    影正猜测着这次的事件时，那人却突然道：“你是不是在想我们这次又该到哪里去？”\r\n    他停了停，却道：“我们相处了一个月了，我却连自己的名字都没告诉你，实在是对不起了。你就叫我‘肖’好了。”\r\n    “肖！”影惊讶不已，他当然知道这简单的一个字在他们的世界意味着什么。原来他还没有死！\r\n    就在影惊讶的时候，他们已经到了目的地，森林边的一个小镇。只是，这本该宁静的小镇此刻却成了一片火海。冲天的火光照在他们脸上，肖很平静，影却有些触目惊心。\r\n    火光中有坍塌了的屋梁，有摔碎了的碗盆，更有焦黑的面目全非的尸体，却没有哪怕是一点儿的人声。影不由得皱起了眉头，到底是谁放的火，做下这样丧尽天良的事情。\r\n    而肖似乎早预料到了这样的结果，他神色平静地向镇中走去。他没走一步，挡在他前面的火焰就退后一步，完全像是在给他让路一般。肖的特殊能力影这一个月来已见识了不少，而推开火焰也并非难事，所以他并没有惊讶，只是紧紧跟了上去。\r\n    肖完全没有拐弯地直走到镇中心一所坍塌了的房子前，这是这里唯一没有烧起来的地方。地上竟有个襁褓，里面是个睡着了的婴孩，而他旁边，则是已被房顶得石料压死了的他的母亲。此刻这孩子睡得很熟，似乎天地间无论发生多大的变故都影响不了他的安睡。\r\n    肖正想抱起这婴孩时，旁边的火焰中却传出了一个声音：“慢着。”\r\n    影立即看向那声音的来源，他们前方的火焰竟如镜子一般映出了一个高大的身影。影仔细一看才发现，映出的是个宫殿，那黑影是坐在宝座上的，他的眼睛、头发和胡须都燃烧着烈焰，脸形也像是个恐怖的恶魔。他的身后还有三个黑影，但影却看不清楚他们的样子。\r\n    那高大恶魔的影子邪笑着道：“虽然我留下了这个小家伙，可却没说过你能把他带走哦。不过，如果你不把他带走，小家伙又会饿死在这里。呵呵！你该怎么做呢？”\r\n    肖静静地收回了手，平静地道：“那我走好了。”他说着竟真已转过身来。\r\n    影既愤怒于那恶魔的残忍，又惊讶于肖竟对这孩子见死不救，他忽然走上前，躲过了肖伸过来抓他的手，想去抱那孩子。可他还没走几步，忽然地一阵极度强大的威压传来，霎时间将他压得跪倒在地上。影一时只感觉心肺几乎被压得爆裂，脑袋更是晕眩不已。他此刻才知道火中那恶魔的难以置信的恐怖，仅是他的气散发出来形成的威压便可以将影压得跪下，这的确已不属于影自己这些人类范畴。影立刻想到，怪不得连肖都不想惹他，他们都是这世界上最高一层的存在了，他们都是神。\r\n    正当影以为自己就快被压死的时候，肖走到了影与那影子中间，影身上的威压感又瞬间消失了。脱离了那恐怖压迫的影不住地喘气，他现在才明白为什么肖一直挡在他前方了。\r\n    那恶魔又开口了，仍是带着那种邪恶的笑意：“肖，你什么时候收了个杀手？杀手很好玩么？不过却是个不会杀人只想救人的杀手，这倒有些有趣了。”那恶魔显然也一眼看穿了影，话中却显然不把他当人看。\r\n    影的确想救那孩子，他曾经杀过太多的人，有太多的罪孽没有完清。所以，曾经很迷茫如今的他比谁都更珍视生命，因为一个孩子的提醒而改变的他比谁都更看重幼小的生命。他不愿放弃好不容易找到的这份信念，即便是死也不能放弃，更何况他本已死过一次了。可是如今的他，在那恶魔面前什么也做不了，他唯一能做的就是，有生以来第一次以哀求的目光看向站在他前面的人，现在也只有他有可能救这孩子了。\r\n    而就在此时，肖也看向了影。目光相接，肖当然能明白影的意思。静立了一会儿，肖终于叹了口气，抬起了自己的左手。他的左手上戴着一枚奇特的金戒指，通体纯金的戒指上刻着只龙头蛇身有爪的神兽。戒上忽然泛起了金光，然后突然从肖的手上消失了，再下一瞬间金光又出现在了婴孩的襁褓内。影看到那枚戒指竟变小了轻轻套在了小家伙的小手指上，将他的整根手指都包住了。婴孩仍旧静静地睡着，完全没有被这些人的举动惊醒。\r\n    肖仍旧静静地站着，影疑惑地站着，只有那恶魔狞笑道：“你终于把那戒指摘下来了，这下我就可以不违诺言地杀掉你了。”他似乎原本就是这么设计的。\r\n    影完全不明白他的话，肖便解释道：“他是个说话算数的人，他说过不杀这戒指的主人，所以他自己一直没向我出手。而现在，这戒指的主人已是那孩子了。”\r\n    影还是似懂非懂，那恶魔却道：“那你就准备好受死吧。”他说着抬起了左手。\r\n    受过刚才那极度的威压后的影知道这恶魔的强大，一看他抬起左手的动作，竟不由得心中一紧。而他前面的肖却仍然很平静，他道：“你不会杀我的。对你来说有趣的人并不多，杀一个就少一个。”\r\n    恶魔倒是有些惊讶，但他很快又邪笑起来，道：“你确定？”\r\n    肖坦白道：“我不确定，所以我在赌。”\r\n    恶魔没想到他回答的这么直接，一时竟无话可说了。不过只片刻以后，他又道：“既然你想赌，那我就跟你赌好了。”\r\n    “让我想想，”恶魔伸手摸了摸脑袋，道，“我们就赌这个小家伙好了。你说他若是将来不死，会是怎么样一个人？”\r\n    肖道：“当然是能负担得起那枚戒指所带来的责任的人。”\r\n    恶魔冷笑道：“别以为那枚破戒指很好，那不是人类所能拥有的。就凭他有那个戒指，那我就赌他将来会是个十恶不赦的大坏蛋，若不是这样，那就是个疯子傻瓜，反正决不会是正常人。好，就这么定了！若是我赢了，你的命就归我了。若是你赢了，我就允许你多活几天。怎么样，有意见吗？”\r\n    肖苦笑道：“我能有选择的权利吗？” \r\n    恶魔道：“你知道自己没权利就好。对了，为了公平起见，我们双方都不能再接触小家伙了。”\r\n    他的话话未完，肖和影同时注意到，地上的婴孩已经不见了。肖立即闭眼进入了冥想，而影则一时激动地向恶魔吼道：“你把那孩子丢到哪去了？”\r\n    恶魔只是邪笑而完全不理会他，回答影的还是肖，他睁开眼道：“在圣联的一个小城里。”有了这句话便已足够了，影知道圣联的人们是不会不顾路边的婴孩的，那个国家的平民真的是这世上最善良、最软弱的人类了。影这才放心下来。\r\n    然而肖却对那恶魔道：“你当然不会这么公平的跟我赌，这次又做了些什么手脚？”他显然很了解这恶魔的性情。\r\n    恶魔也没有隐瞒，他邪笑道：“果然还是你最了解我，其实也没什么大不了的，只不过是给那小家伙留了个小小的诅咒而已。我可是控制好了力度，确定这小玩意杀不了小家伙的哦。也不算太违规吧。”他似乎也没什么好说的了，最后道：“好了就这样了，记得洗好脖子等我砍。”话音刚落，影子已经消散了，只有四周的火焰还静静地燃着。\r\n    肖又只能苦笑：“那什么才算违规？这个喜欢乱来的家伙。”\r\n    过了很久，影才从刚才的情景中回过神来，刚才的会面已完全不是他这个人类所能参与的了。影已经想到，他们就是在暗中戒定着这个世界的规则的神族，超越了人类极限的存在。但他还是不知道哪个怖恶魔的什么，于是问向肖：“那个恶魔，到底是谁？”\r\n    道：“他是这世界内最强大的存在。” \r\n    说得很平静，影却听得惊讶不已。再回想了一下刚才那恶魔的样子，他的脑里蹦出了一个令人恐惧的名字：撒旦。地狱双王之一的恶魔之王，十二主神中的魔神，撒旦的确是这世上最强大的存在了。十二主神可是这世上至高无上，不可毁灭的存在了。\r\n    而看穿了影心思的肖却给了他一个更不可思议的答案，他道：“撒旦和路西法都是米伽勒能够应付的，但刚才那家伙却是十二主神联手也对付不了的，甚至连伤他一下都不可能。他给自己取的名号叫做大邪神。原本他也的确不属于这世界的，他是从另一个世界来的。我能给你解释的也就这么多了，说多了你也理解不了。”\r\n    影现在就已理解不了，他不能相信这世上竟还有超越了主神的存在。这也是人之常情，就好像一个打遍天下都难逢得几个对手的人类突然发现世上还有强自己百倍的偏神存在，而又有比偏神强上百倍的主神存在，然后这时又有比主神更强百倍的大邪神出现，他当然接受不了。不过更让他担心的是，这样一个随时可以毁灭世界的邪恶存在不受压制，那可怎么得了？\r\n    影根本不用说话肖也完全了解他的想法。肖叹了口气，道：“其实邪神并不像你想象中那么可怕，若是他想毁灭世界，你只会什么感受都没有就消失了，根本用不着恐惧的。他做这么多事其实只是为了寻找乐趣，他活得太久太久，他自己创造的世界又太过无聊，所以才想在我们的世界里找点乐子。”\r\n    肖停了停，又道：“虽然他的做法给我惹来了不少麻烦，但他的想法我们也都该是有些理解的。上次的持续了三百年之久的圣战时代里，虽然世道混乱不堪，人们流离失所，各种战争死伤无数，出现了很多像我们一样的孤儿，没有亲友，没有人保护，没有来历出生，更没有前路。但是到了现在，国家安定了，人们将家园重建起来了，却也并非人人都能满足。没有了时时刻刻与命运抗争的日子，许多在乱世中生存下来的战士迷茫了，没有再战斗的理由，忍受不了和平时代的平稳，更无法接受自己实力的锐减。于是这时代也有不少寻求权柄和力量的野心家的存在，不知所谓地胡闹。这也算是战争与和平两者间的平衡吧。”\r\n    影无法理解这些他从未听过的事情，他知道最好不要去想了，所以他也的确没再多想。他现在只有些担心那个孩子，他虽然不懂诅咒，但受过诅咒的人决不会活得很好这点他是知道的。肖则已看向了西方圣联的方向，叹了口气，自言自语似地道：“其实刚才我不愿救那孩子，是因为不想让他来担当这个沉重的担子。他若是刚才就死了，转世之后也许会活得更好。但现在，他必须比常人更坚强十倍百倍地活下去了。因为他已经继承了那枚戒指，已经算是揽下了那份责任。”\r\n    正在此时，在圣联的一个叫瑟斯之城的小城里，在城最外边的一条街的一个破败的屋子前，一个破落的糟老头看着眼前的襁褓内那熟睡着的婴孩。他以为是自己的心意诚恳感动了上帝，他激动得跪在地上向天膜拜。当他满心欢喜的抱起地上的孩子时，却根本没想到这孩子带给他的只有死的厄运。\r\n\r\n\r\n\r\n\r\n	楔子  邪神的诅咒 			Paragraph	2021-05-30	30000549
31000119	11	2021-05-30	亡灵之灵\r\n\r\n※放逐\r\n    众神所设置的远古结界的对面，是作为流放之地的荒芜平原。所有不被世界所接受的种族或群体，都会被驱逐到这片荒凉之地上，任其自生自灭。雷特刚刚穿过远古森林来到了这片放逐之地，他把自己“放逐”了。\r\n    其实是他受不了现在的人类世界的压抑感，记起以前一个兄弟所说的，这片人类还挣扎在生存边缘的土地，于是来转换一下心情。\r\n    这片土地其实不算荒凉，毕竟就在远古森林旁边，比起大陆最南端的大漠好多了。至少，雷特还能正常的打到猎物，虽然需要坐骑影风的帮忙，这边连小动物都跑得特别快。\r\n    雷特和影风一起吃完烤兔子，就坐在篝火旁边打瞌睡，马儿影风则自己散步去了。初到这么一片未知的地域，雷特当然不会这么没有警觉，装睡的他在钓鱼。在钓从几天前就偷偷跟着自己的一群“人”，为此，他甚至没有上马，以防影风一时兴起飞奔起来，让他们跟丢了。\r\n    几个人影已经潜到了近处，准备动手了。“他们”动的瞬间，雷特也动了，左移躲开当头一锤，转身横剑挡住直刺过来的狼牙棒，一脚踹向握狼牙棒的人影，上身则顺势后仰，一个链球险险的从头上划过，后翻回来后，反手用剑鞘点在了背后一个人影的喉头处。然后，拔剑指向前方，笑着打量起眼前的偷袭者们。\r\n    豺狼人和狗头人各五、六只，虽然已经有两只惨叫着倒下了，这倒是个有趣的组合。兽人们围了上来，正中间最强壮的豺狼人用锤子指着雷特：“财宝留下，饶你性命！”\r\n    黑暗中又走出十来个兽人，种族更加复杂了。\r\n    看着这个奇妙的兽人强盗团伙，雷特笑了：“兽人的强盗什么时候也变得这么和善了？”刚才的攻击，普通人中了任何一个都会重伤，却死不了。雷特能看出他们留了手，至少狼牙棒不是用来刺的。\r\n    不过雷特的话显然激怒了他们，兽人们从四面扑了上来，“不杀人”也许只是一时兴起的想法。\r\n    篝火旁边先后响起了几十次金属的撞击声和十几次惨叫声，然后世界又清净了。雷特没伤他们的脚，所以能看到他们跑的速度，比先前的小动物们更快。看来这边的生物的身体能力都比人类世界里强悍，虽然暂时看来不会用斗气和魔法。\r\n    重新坐下的雷特想起影风还没回来，只好起身去找，然后在河边看到了影风，以及强盗团伙的一个兽人。显然对方还有专人负责抢马的，不过抢到这个美差的狗头人已经被影风踩成了猪头。\r\n    雷特提起猪头，“这附近的人类部落在哪？”\r\n    猪头挣扎着乱叫，雷特干脆又把他丢到了影风脚边。\r\n\r\n\r\n※故人\r\n    顺着狗头人指的方向跑了一天，终于在第三天上午看到了人类的部落。这个外貌简陋的部落，警戒却非常严格。雷特费尽口舌哨岗才答应带他去见族长，而剑和马都被扣下了。\r\n    族长还不在自己的帐篷里，听说去了第一战士哈特家。警卫带着他去哈特家，却又说两人一起到了巡逻队长菏泽那里。到菏泽家时，不出所料的，三人一起去了神使的住处，而这回警备却不再领路，准备回到族长帐篷前等。雷特只能感叹，这一路绕得。\r\n    “不行，我们死也不会向那些人屈服！”\r\n    刚到门口就听到争吵声，看来那几人已经回到了这里。\r\n    “仅靠我们根本无法战胜那个敌人，请相信我的判断。而且，抵抗那个敌人是全人类的责任，所以这其实并不算求援。”\r\n    看来是有争执，语气愤怒的大概就是那个第一战士，而另一个温和诚恳而又坚定的声音，则是雷特熟得不能再熟的了。\r\n    屋内的几人争吵之时，雷特已经绕过警卫，径直走了进来。\r\n    “哟，莱尔，我想起你以前说的话，所以逛到这边来了。啊，你们慢慢吵，我先出去逛一圈，晚上就到你那里住。还有，影风被这里的人扣下了，记得去领。”\r\n    说完雷特又径直走出去了，让莱尔还没来得及惊喜，然后又被族长和战士们围了起来。\r\n\r\n    刚才已经在警卫的带领下把这个小部落逛了两圈，大概知道一些，所以雷特直接朝刚才路过的斗技场走去。这个斗技场只是一块大圆石，现在正有两个人在战斗。双方都拿着剑和盾互击，铿锵之声不断，挺卖力的。\r\n    看了一会儿，觉得力量比拼没什么意思正要走时，旁边一个正要上去的战士却拦住了他。\r\n    “怎么样，新人，较量一下？”\r\n    呃，虽然没打瞌睡，但是也没隐藏脸上的无聊表情，貌似被人盯上了。\r\n    雷特并不讨厌武斗，要不然也不会来斗技场。不过让别人认为自己轻视了他们而引发的战斗，他不喜欢。所以拿着武器上场后，他首先道了歉。\r\n    “我并没小看你们战斗方式的意思，只是或许更想看些剑术和技巧发面的演练。”\r\n    对方或许认同了他的说法，走到场边把盾牌放下，然后回头。\r\n    “好吧，那么我们就来一场剑术‘演练’好了。”\r\n    虽然是在说笑话，但是这个黝黑皮肤的中年人脸上没有一点笑意。\r\n\r\n\r\n※较量\r\n\r\n    旁边开始有人聚集和起哄了，雷特想在问题闹大前结束战斗，于是主动攻了上去。\r\n    从起哄的人的语气中，雷特大概知道，这个叫柯特的魁梧中年人是斗技场的强者之一，所以雷特的单手剑斩出时，已经用上了十分的力气。在看到对方轻轻松松挡下后，雷特知道要取胜只能靠速度了。\r\n    他抽剑直刺，柯特也同时刺了过来，双方让开对方的剑时，一起收剑，随后一个上撩一个下斩，两把剑又撞在了一起。下斩的雷特能感觉到自己的力量明显弱于对方，不过还是这样互击了十几回合。当对方大概适应了这个速度时，雷特的杀招到了，剑快要互击时，雷特手腕快速一抖，身体后仰的迅速下蹲，让过了斜划过来的斩击。利用身形上的差距，俯下身的雷特快速欺身上前，刚才保留的速度释放出来，连续十数次刺击，几乎有半数打在了对方要害位置。当然雷特的刺击只是虚点，看着刺在身上，其实连衣服都没有刺破。\r\n\r\n    在其他人从剑斗中醒过来前，雷特已经抽身走出了斗技场。在莱尔的帐篷前，却又被一个疑心重的少年挡住了。倔强少年死活不让雷特进莱尔德帐篷，一言不和就拔出腰间的匕首对向雷特，让雷特有些哭笑不得。这片地方的部落，尚武是自然的，不过这个少年知道拔剑相向的意义吗。\r\n    不管他知不知道，现在的雷特决定硬闯了。比起人类世界那些压迫别人也压抑自己的交流方式到更好些，雷特倒更喜欢这样，简单明了。\r\n    不过当他绕道少年身侧时，突然发现自己有些轻敌了。少年的速度，似乎比自己更快，而且匕首也怪异，简单的一刺一划，竟然让自己有躲不开的感觉。危机关头雷特运气斗气加速，堪堪躲过了划向脸颊的匕首，被削下了一些头发。\r\n    然而少年也看出他身手敏捷，在一划之后又连续追击。没有带剑的雷特无从抵挡，被追得连连后退，狼狈不堪。他虽然带着铁护手，却有些不敢去挡那把锋利无比的匕首。万一挡不住，可就连手一起被切掉了。\r\n    在连续几次擒拿被对方闪开后，雷特终于抓住了少年拿剑的手，同时制住他踢过来的脚，双手用力把轻盈的少年提了起来。少年还在挣扎，脚踢、口咬，完全不让雷特省心，。\r\n    两个人就这么僵持了好一会儿，过来给他们解围的是刚从族长那里回来的莱尔。听了少年缇亚的话，莱尔只能劝解少年别跟雷特计较，而后又回头笑话雷特，跟小孩子这么较真。雷特则只能苦笑，这个孩子，可比斗技场那边的大叔厉害多了。\r\n    没多久，一个慌慌张张的女子过来领缇亚。那是缇亚的姐姐摩雅，两人的脸真像。摩雅一到就不停的道歉，求神使大人别计较小孩子的胡闹，让莱尔又得费力气来安抚这个姐姐。\r\n    \r\n\r\n※骑兵\r\n    部落只在驻地停了一天，第二天天光微亮时，雷特估计莱尔和族长他们争吵完达成共识后，就开始迁徙了。可是也就在这时，敌袭到了。\r\n    轰隆隆的大地的颤抖声显示了事态的严峻，不管来的是什么队伍，都不是这个部落可以战胜的。莱尔和族长带着大部队从驻地旁的峡谷退走，全民皆骑兵的部落，撤退很快，而雷特当然随断后部队守在峡谷入口，他就是为此而来的。不过莱尔最后的话让他有些在意。\r\n    “用你的眼睛去确认一下敌人吧，我其实并不肯定。”\r\n    当雷特看到冲锋而来的延绵不尽的亡灵骑士大军时，惊讶的同时，心底也升起一丝恐惧。什么人又在这边缘之地纠集了这样一批亡灵军队，难道是。然而现在不是胡思乱想的时候，亡灵骑士们前赴后继的冲击着人们事先在谷口设置的防御工事。壕沟被尸体和骨架填平，拒马被踩断，磐石也被撞开，战士们刚刚封上的谷口被打开了。不过顺着谷口挤进来的亡灵骑士，正好迎上了谷内骑士们的冲锋！\r\n    十几个骑士的全力冲锋，将谷口的二十几个亡灵骑士撞散了架，然后他们招架着后方亡灵骑士的骨矛往侧面退开，给第二波冲锋队伍让出了道路。而趁这段时间挤进来的亡灵骑士，再次成为了靶子。连续三波冲锋将原本气势汹汹的亡灵骑士的攻势彻底压制了，甚至连旁边的雷特都看得热血沸腾起来。可是他知道，真正的血战现在才开始，没有冲锋空间的缠战，任何骑兵都别想在这些不死的怪物身上讨到便宜。而断后部队，有可能需要战至最后一兵一卒。\r\n\r\n    莱尔所带领的大部队也同样受到了阻击，从峡谷上方直线飞行绕到出口的骨鹰群拦住了他们。骨鹰虽然弱小，但飞行的它们很容易的突破了前方战士们组成的防线，扑向队伍中央的老弱。许多战士抽弓搭箭，虽然常能一箭射落数只，但骨头军的数量实在太多了。\r\n    忽然，一道白光显现，蕴含神圣力量的光辉将冲进人群的骨鹰击散，后方的骨鹰群也畏惧的绕开了。这是莱尔的契约神兽，独角兽“岚”所发出的光辉。岚围绕着人群跑动，将盘旋着寻找机会的骨鹰群逐个驱开。\r\n    在岚驱赶骨鹰的同时，莱尔终于念完冗长的咒文，降下一片更为强大的圣光，仿佛太阳一般映亮了谷口。圣光净化了骨鹰身上的魔力，大片骨头如雨般洒落。剩下的敌人也不敢再靠近，从峡谷上空隐去了。\r\n\r\n\r\n※巫师\r\n    雷特和影风也在拼命了。影风背上伪装成背包的翅膀早已展开，扑打着翅膀带起无数风刃袭向谷口的敌人。不少骷髅骑士被风刃切开，但随即更多包裹着铠甲的亡灵骑士挤了进来。雷特全力运用斗气，几乎每一剑都将一两个亡灵劈成两截，守住了半边谷口。第一战士哈特手持着一个小巧的魔法盾牌挡住了另一边，后方的骑士们则有序的冲锋、回调、冲锋，将骑兵的优势发挥得淋漓尽致。但伤亡总在增大，人族骑士们的弓箭只能迟钝一下亡灵的动作，但对方的冷箭却在收割己方的生命。\r\n    激战中，雷特忽然注意到远方一个披着斗篷的身影，一股熟悉的恐惧感印证了他的猜测，以及莱尔的欲言又止。然而就在他失神的半秒，一把巨剑横斩过来，危急关头回剑格挡的雷特被巨力打下马，在地上滚了两圈才站起来。骑士的巨剑上附着魔力，看来是个死亡骑士将领。死亡骑士带着几个亡灵骑士追杀雷特，巨剑加几柄骨矛逼得雷特连连后退。雷特砍到两个亡灵的同时，自己也身中数创，鲜血染满衣襟。\r\n    影风回救雷特的同时，也让更多的亡灵涌入谷口，防御阵势快要崩溃了。现在不振作只有死路一条，雷特大吼着前冲，身体擦着两柄骨矛迎上了死亡骑士。双剑相击，雷特的双手几乎握不住剑了，但仍咬牙向前，手中剑再次与巨剑碰撞。雷特在生死关头爆发的力量稍微压制了对方，在巨剑再次挥动前，砍下了死亡骑士的头颅。\r\n    砍倒死亡骑士的瞬间，雷特就又看到了刚才的亡灵巫师，以及他斗篷下的冷笑和在前伸的骸骨手心凝聚的那团代表死亡的魔法能量。躲不开了，雷特的身体告诉他。\r\n    雷特毕竟没有死，第一战士哈特的盾牌替雷特挡下了致命的法术，虽然他一直看雷特不顺眼。\r\n    “撤！”\r\n    哈特的话简单明了，他要断后，也只有他能阻挡亡灵大军一时。\r\n    雷特却不是他的部下，翻身上马，拦在哈特前边。\r\n    “你先！”\r\n    影风会飞，雷特当然要走最后。\r\n    一支劲力极强的火箭从后方飞来，击穿一个亡灵骑士后钉在了另一个身上，而箭头的大火暴涨，瞬间燃烬了后一个骑士。那是巡逻队长菏泽带着先头部队的人来救援了，而跑在部队最前方的则是独角兽岚。\r\n    在独角兽的光辉压制亡灵的片刻间，哈特和雷特迅速集结起战士们从峡谷撤走了。\r\n\r\n\r\n\r\n※迁徙\r\n    与大部队会合时，所有战士都已经疲惫不堪了。还好亡灵没有追来，雷特看着天上的烈日想，要是亡灵还能追来，这边也不用跑了。\r\n    雷特顾不上伤势，直接将莱尔拉到一边。\r\n    “真的是他？”\r\n    雷特现在知道莱尔想让他去确认的事了，他们所面对过得亡灵巫师只有一个，最恐怖的那一个。而最后真正与那个人面对面厮杀的，正是雷特。\r\n    “如果你也认为是，那就没错了。”\r\n    莱尔德声音虽平静，内心绝不平静。他拉开修士袍，路出乔雄的一个印咒，亡灵巫师的死亡诅咒。\r\n    “你不会有事吧？”\r\n     这下轮到雷特惊慌了。\r\n    “不小心被一个魔化的族人伤的，你也知道那个人很喜欢暗算。”\r\n    莱尔勉强的笑了笑。\r\n    “不用担心，亡灵巫师的诅咒怎么可能杀死智慧之神的使者。”\r\n    “但那可是有史以来最可怕的亡灵巫师，山德鲁。”（请原谅我实在不会取名也不想给这么经典的角色改名）\r\n    \r\n    现在却不是回忆往事的时候，族长带着几个战士赶了过来，商议起了迁徙路线。为了抵御亡灵的军势，必须要一个坚固的城堡或险峻的要塞，然而在这片荒凉之地上不断迁徙的部落，哪有时间建造城堡。\r\n    不过莱尔他们的话语中，还真有这样一个所在，古代亚玛人建造的城堡。不过当地居民也没见过这个古堡，线索只有一张残破的古卷。\r\n    “吾等的后裔啊……若能承受生命之重……集齐象征……的七个信物……日落之地……鼓起勇气……返回吾等彩虹的住民最初的城堡吧。”\r\n    古卷还未解读完，但现在似乎只能靠这些文字找出城堡了。不擅长思考的雷特也只好尽力与他们一起解谜。\r\n    日落之地已有定论，部落正在向世界的西北尽头日落的地方前进。但日落之地太广泛，只靠这确定不了城堡的所在。更重要的是，在到达目的地前，得解开这个谜题，至少找齐开启古堡所需要的“七个信物”。莱尔和族长正在解读关于信物的一段，雷特只能将这些文字在脑力来回放映。\r\n\r\n    在迁徙和解谜的途中，还有几件引起雷特注意的小事。\r\n    一路上照顾受伤的莱尔的都是缇亚的姐姐摩雅，这个温柔善良的女子显然对莱尔有意思。而缇亚只要姐姐不在，就过来缠莱尔，求他把自己安排到前线去。虽然已经被承认为战士了，但每次作战缇亚都被分到护卫老弱的队伍中。雷特倒是挺喜欢这个小子的，有一次出击就干脆把他带在身后去了战场，影风也挺配合的没把他甩下去。不过回来后，好几天都能感觉到背后姐姐摩雅那“幽怨”的目光，雷特才知道错了。    \r\n    峡谷一战后，持续追击的亡灵骑士并不太多了，走走停停的几战伤亡都不算大，但是部落族人们压抑的情绪和疲劳在不断累积。更让雷特不安的是，亡灵白天的活动时间似乎越来越长了。\r\n    因为部落的前进方向，族人们再次发生了分歧。两条路，一条穿越兽人部落，可能引发与他们的战争，另一条路穿越森林，但也可能被森林守护者阻拦。无意义的争论持续了两个小时，然后理所当然的选择了前一条。稍微想想就知道，若在森林中被追兵围堵了，无法借助马力，怎么突围。\r\n    \r\n\r\n\r\n\r\n※兽人\r\n    雷特带着缇亚先行一步，到兽人部落去了。这片地域的有十数个兽人部落，雷特只能一个一个去“拜访”。莱尔不想来的，但雷特怎么能让重伤员到处奔波，所以他只带了缇亚。这片土地上，连孩子都会兽人语。\r\n    雷特骑着影风在第一个兽人部落上空盘旋、示警。停在部落中央，被兽人弓手们用瞄准着也毫不示弱，空手打翻了数十个兽人，显示了力量后，才开始谈正事，警告他们防备亡灵和商量借道。\r\n    但后边的部落就没这么轻松了。仇恨人类的部落根本不给雷特说话的机会，大闹了一通后被兽人的乱箭逼退了。而觊觎他坐下飞马的部落则狡猾的设下了圈套，虽然连缇亚都能看穿他们的阴谋。食人魔的地盘当然不用去了，不能对不起他们的名字。\r\n    当二人抵达最强大的部落绿皮兽人的白石部时，雷特知道，如果不能成功借道，人类部落恐怕走不出这片地域，单只这一个部落，就比己方强大得多。\r\n    化装潜进部落后，雷特故技重施在斗技场引发了骚动。在连续打败十几个魁梧的绿皮兽人后，终于惊动了对方的大人物。一个比雷特高两倍的兽人提着吧锯刃走上来，用难听的人语问。\r\n    “你来干什么的，人类！”\r\n    “那当然是要打赢你之后再说。”\r\n    雷特抢先攻击，但被对方挥舞锯刃逼开。兽人体型巨大，却并不肥硕，力量和敏捷兼具，攻击距离更远超雷特。一时难以近身的雷特只能左右抵挡，寻找机会。雷特不能躲避，为了彰显力量把对方的所有攻击硬抗了下来，同时还不能用太强的斗气攻击，以免重伤了对手。面对原本就棘手的对手，束手束脚的雷特更难取胜了。\r\n    雷特终于抓住机会格开了对方的锯刃，冲到其身下，却没想到这竟是兽人故意露的破绽，另一只大手迅速的抓过来。在被大手包裹之前，雷特用力一脚踢过去，借势翻飞到空中。但是，下一刻迎接他的，是横扫过来的锯刃。勉力用剑去挡的雷特，脸和右肩都被突出的锯尖刺入，整个人被巨力打飞。\r\n    来不及感受疼痛的雷特在空中调整身形，安全落地的瞬间，又冲向了兽人。在对方反应过来之前，用长剑压着锯刃的刀背前冲，兽人发挥不出挥击的力量，反而被雷特爆发的力量将锯刃弹开，露出了正面。雷特双手提剑上撩，，精准的控制剑气将兽人的腰带、锁甲和头盔斩断。\r\n    雷特的脸颊和肩头都在冒血，肩上的伤更影响了握剑的手。然而，台下又走上来两个高大的兽人。\r\n\r\n\r\n※	新序章一：亡灵之灵			Paragraph	2021-05-30	30000549
31000120	12	2021-05-30	\r\n※商谈\r\n    茫茫冰原上矗立的塔楼中，摒弃了人世的魔法师进行着危险的研究。\r\n    寒星望着窗外的风雪，似乎看到了那样的影像。事实上，这座冰雪覆盖的极地之城，也的确很适合寒星这样不适应道德、不敬畏神明的“异端”，进行自己的研究和修炼。不过这次，寒星并非未修行而来，想起那位任性的骑士大人的面容，寒星也只能感叹，五十年后，再考虑移居到这里来吧。\r\n    寒星的思绪很快被打断，来的人是凯特和迪安娜，这个城堡里寒星也就认识他们。\r\n    凯特是野蛮人的后裔，身材魁梧、性格爽朗，却被老爹逼着学魔法。据说当初他一直反抗，后来终于适应了那身精致的魔法师袍，开始在年轻一代魔法师中崭露头角。\r\n    迪安娜则是大魔导师、极地之城城主菲尔德的女儿，这片冰雪世界的公主。由于上次大战的大撤退时，寒星曾“盛气凌人”的教训过她，而至今还没道歉，相处难免尴尬。\r\n    “寒，你不只是来这里学习的吧？协会派你来，是针对菲尔德老师的吧!”\r\n    凯特直截了当的问，寒星也就一清二楚的答。\r\n    “嗯。协会探测到这边有神器的波动，而菲尔德先生又不给回应，所以派个人来看看。这回不小心被抓了差，原本就什么都不准备做的。几个老头子之间的联合与斗争，谁参与谁倒霉。”\r\n    “好吧，只要你不偏帮协会就行。其实，我们是来找你商量对策的。这几天周围的环境有些诡异。我总感觉有一股莫名的敌人，在暗中窥视着我们，目标或许就是菲尔德老师。我抓到过几个可疑人物，可他们之间完全没有联系。而且最近，老师也有些奇怪。”\r\n    凯特说着，向迪安娜示意。\r\n    “是的，父亲最近身体渐差，所以将城堡的事物交给了我们。但他又有时在大雪中出门，而且彻夜不归。有一次去父亲房里时，看到他桌上一本很老的日记，也写了一些奇怪的事情……”\r\n\r\n\r\n※宴会\r\n    第二天是节日，这座冷清的城堡也热闹了起来。特别是晚间的宴会上，谈笑声源源不绝。\r\n    寒星影在会场中间的石柱下，一边注意着与老友们聊天的大魔导师菲尔德，一边也观察着在正面接待来宾的凯特和迪安娜。虽然不停的被来宾们祝福，但寒星总觉得这两个人不是一对。不是情侣，也不像兄妹，硬要说的话，两人大概就是同学关系，一起经历了很多事情，虽然没有誓言，却也特别默契。\r\n    就在寒星对自己也没有经验的人际关系胡思乱想时，意外发生了。一个似乎小有名气的剑士，突然从背后偷袭向菲尔德，用的是怀中所藏的短剑。周围唯一对刺杀有反应的是凯特的父亲伯森，短剑擦过他的大手，稍稍改变了方向。\r\n    刺客的冷笑展开的瞬间，他刺到菲尔德身前的短剑被一只苍白的手抓住了，纹丝不动。刺客挣扎了两下，突然双眼圆睁，软倒下去。来得快去得更快，在惊呼声想起时，刺客已经死了。\r\n    “剑上有毒，给伯森大叔解毒。”\r\n    寒星冲跑过来的凯特说，然后对看向他的迪安娜展开了抓剑的手。他的手掌上附着一层薄冰，所以才敢空手去抓带毒的剑刃，冰块如皮肤般柔和的展开，上面还留着几滴毒液。\r\n    “你们先稳定下场面，宴会结束了来我那里。”\r\n    寒星小声对迪安娜说，然后提着刺客的尸体先走了。\r\n\r\n※犯人\r\n    骚动平息，宴会结束后，迪安娜马上拉着凯特到了寒星的房间。寒星则刚摆弄完刺客的尸体，将其冻住放到了一边。\r\n    “你查到什么了吗？”\r\n    “恩，这个人被人用精神魔法控制了。我只读取到他一小段记忆，不过其中有个地方非常可疑。凯特你带我去找一找吧，应该不会很远。”\r\n    迪安娜也想去，被寒星劝去留意父亲菲尔德的动向了。寒星当然希望菲尔德哪儿都别去，不过那显然不可能，所以至少应该知道他的去向。\r\n\r\n    \r\n※	新序章二：冰之棺			Paragraph	2021-05-30	30000549
31000121	13	2021-05-30	\r\n※\r\n    剧本错了，影还活着。\r\n    本应贯穿影胸膛的长剑断成两截，握剑的全身光鲜铠甲的神圣骑士团团长倒在了地上，而影的思绪，回到了十几年前，耳中又想起了那和蔼的声音。\r\n    “雷特和莱尔就继续留在我身边，学完我的剑术和圣光法术。寒星适合研究魔法，我会送你到熟识的魔法师那里去学习。而你，影，你跟我来吧。”\r\n    老师送给影的饯别礼最为特别，他让影与他决斗，然后将影打得遍体鳞伤，好几剑都差点要了影的命。\r\n    “我没能消解你复仇的执念，却也不忍心此时杀你。你的命运就由你自己在挣扎中寻觅吧。但是你要知道，当你犯下罪行，堕入黑暗后，你将时刻恐惧着圣骑士的惩戒。”\r\n    但是现在，剧本错了啊，老师。您的继承者，这位年轻而自信的骑士团长，因为疏于武艺而丢了性命，抱着必死之心，堂堂正正战斗的刺客反而活着，这样的结果，让根本没想过后续剧情的影不知所措。\r\n    若对手是老师，影或许还可以冷笑着说，即便没有你教，我也一样报仇了。可如今看来，自己所为的第二个目标，击败曾经遥不可及的老师，不过是个飘渺的梦，为了让自己得到“光明的救赎”可悲愿望。\r\n    当老师在数年前的大战中牺牲以后，自己这条堕入黑暗的罪人的命，已经没人收了吗？\r\n    “啊！！！”\r\n    影发出了有生以来最嘶哑的吼叫，没有知觉的心的痛苦让他疯狂，相较之下，复仇成功的快感，是那么的微不足道。自己的一声，究竟都干了些什么？\r\n    “砰！”\r\n    影的吼叫吓到了躲在衣柜里的小女孩。一家人接到报讯迅速离开了这别墅，小女孩却躲起来看热闹，或许以为帅气的骑士团长能赶跑所有坏人吧。\r\n    “出来。”\r\n    影面无表情的说，自己也不知道该怎么处理这小孩。\r\n    小女孩畏畏缩缩的出来，还不小心被绊倒了。爬起来的小女孩好奇的看着影，大概是在观察“坏人”的模样。\r\n    “你家在哪，我送你回去。”\r\n    影自己都惊讶于自己的话，但又同时感觉到，再不找件事做，自己会因为刚才的情绪而崩溃。\r\n\r\n\r\n\r\n\r\n※\r\n\r\n\r\n\r\n※	新序章三：惩戒			Paragraph	2021-05-30	30000549
31000122	200	2021-05-30	黑暗祭祀:\r\n    幽宅：满了十六岁的叶空和雷琪儿终于要出去历练了，告别了师傅寒星和两个师母，两人最初的目的地是古都亚特兰蒂斯，为寒星送信给魔法协会总部的大魔导师艾维斯，顺便旁听一下女皇伊丽莎的即位仪式。两人风餐露宿，缓缓地走在往南的道路上。叶空一路上到处闲逛，所有与魔法相关的商店、路摊都要看一看，有一次还哭笑不得的买了自己制作的东西。某次在街上遇到强收保护费的大汉，雷琪儿想出手教训人却被叶空阻止了，强行介入反而会激怒对方，让弱者受难更重。他随手用空间魔法抓来，然后又传回了受害者们的口袋里。至于之后会如何，毕竟不是旅行路过的他所能掌握的了。\r\n    两人夜间正准备在一座破败庄园里停歇，没想到开门时正看到一个女孩在换夜行衣，雷琪儿随手用剑背打翻了发呆的叶空。这年纪与他们相当的女孩伊丽莎白天也在街上，此时正准备去偷那大汉的钱袋还给那些穷人。聊了几句之后，连同样不通世事的雷琪儿都知道，这个离家出走的大小姐想当侠盗，根本就是异想天开。\r\n    这庄园本是伊丽莎家的，三人正聊着，又来了一群不速之客。这群黑衣人个个身手不凡，想要绑架伊丽莎，在眼见有意想不到的两个保镖之后，更是下了杀手。雷琪儿艰难地抵挡着两个魔法剑士的攻击，雷系剑士的闪电让她握剑不稳，冰系剑士则让她行动迟缓。叶空带着伊丽莎先跑，却很快发现是自己被她带着在跑。\r\n    被围堵的叶空使用空间魔法带着伊丽莎逃脱了，但很快又被另一股身份不明的魔法师追上。最终一个神秘人以强力的魔法赶跑了这批魔法师，逃了一夜的两人这才终于能休息一会儿了。雷琪儿很快找了过来，危机关头救下她的是伊丽莎的哥哥修直。他是伊丽莎父亲萨里特带来的儿子，身份低微，同时也行事低调。修直要带偷跑出来的伊丽莎回古都完成即位仪式，叶空两人也正好同路。\r\n    古都：伊丽莎直接回了皇宫，叶空二人则找到了魔法帝国最有实权的六大魔导师中最和蔼的艾维斯。坐镇魔法协会总部的艾维斯是水系大魔导师，虽然本身实力出众，但所负责的工作主要是联络和杂务。\r\n    艾维斯曾隐晦的提醒叶空，最好不要参与皇族的斗争。叶空也曾从身为冰系大魔导师的寒星那里听说过，魔法皇帝不在的帝国皇族对皇位有过争夺，伊丽莎的母亲大公主最终胜出。然而大公主已逝的现在，二公主、四公主两系大概又再次觊觎皇位了，几乎没有势力的伊丽莎能否即位，就要看她的父亲萨里特了。对于皇族斗争，连出身皇族的雷系大魔导师拜伦都躲开了，其他五位就更是选择了袖手旁观。\r\n    叶空和雷琪儿去皇宫找伊丽莎的时候见到了他的父亲萨里特，虽然表现得温文尔雅，但叶空直觉到，他绝不是个好欺负的人。面对二公主、四公主两系暗杀伊丽莎的行动他并未予以追究或还击，只是在加强戒备的同时积极推动加冕仪式，只要仪式完成，其他两家也闹不出什么来。\r\n    叶空、雷琪儿与活泼的伊丽莎在来古都的路上就混熟了，在她父亲的允许下，暂时充当起她的保镖。三人多次上街游玩，在修直的暗中保护下一直没出什么问题，还在艾维斯主办的晚会上会了会二公主、四公主两家的人，面对自视甚高的公主和支持他们的伯爵、公爵，以及身后的一堆纨绔，叶空都不免感叹他们怎么斗得过萨里特。然而奇怪的是，萨里特竟然被那两方联手挤兑得决定加冕仪式的最终地点定在后殿的黄昏之庭，只有皇族能够去的地方。在那里，没了修直的保护，萨里特和伊丽莎就更显得势单力孤了。\r\n    加冕：加冕仪式当天，本随着几位大魔导师在皇宫前殿观礼的叶空，在簇拥伊丽莎的队伍去往后殿后，就悄悄拉着雷琪儿向后殿潜去。他知道，这个仪式不可能平安无事的进行完，不仅另外两位公主的人会有所动作，萨里特的行为也颇为诡异。然而，拦下他们的却是这些日子经常与雷琪儿切磋剑技的修直。\r\n    在叶空的帮助下雷琪儿终于险胜了修直，然而还没能前行就又遇上了支持四公主的伯爵的人。知晓更多内情的叶空决定一个人进去阻止萨里特，让雷琪儿留下来帮助修直抵挡敌人。当他到达黄昏之庭时，支持二公主的伯爵已经明目张胆的带人攻向了萨里特，然而，他们很快被萨里特独特的黑暗魔法打倒。入赘皇家以来从未显露过力量的萨里特本是黑暗议会的一位执事，虽然完全无法与大魔导师们抗衡，但在精心准备后对付公爵的家仆还是不在话下。从一开始就没将另外两位公主看作对手，他想要挑战的，是将皇族当做傀儡来操纵的大魔导师们。\r\n    祭祀：萨里特的目标是初代魔法皇帝封印在这黄昏之庭地下的远古魔兽，精通黑暗魔法的他要将这里汇聚的所有人，特别是魔法皇帝的后裔们献作生祭，解开魔兽的封印，其中甚至包括他自己的性命。拥有最后一枚皇家徽章的伊丽莎将会免于此难，萨里特要为她留下的，仅仅是与远古魔兽签订主从契约的渺茫的机会。虽然对伊丽莎而言太过不近人情，但这是萨里特所知的，唯一让女儿摆脱傀儡命运的机会。如果能使役可与魔法皇帝匹敌的魔兽，即便仍无法胜过几位大魔导师，也有机会逃出帝国，去寻找新的生活吧。\r\n    萨里特的黑暗祭祀已经开始，身处祭典中央的伊丽莎即便有皇家徽章的庇护也仍然十分难受，身体逐渐被黑暗力量侵蚀、改变。而观礼的两位公主、公爵等人则瘫在地上无法动弹，生命力正在迅速流逝。叶空对魔法的研究比许多大魔法师都深刻，虽然自己不能使用魔法，却对各类魔法的运行机制十分了解，是最适合阻止这个祭祀的人。\r\n    刚苏醒还未显露身形的远古魔兽的力量就远超了萨里特的想象，他那让伊丽莎收服魔兽的幻想被轻易打破。萨里特和伊丽莎都有被魔兽杀死的危险时，叶空打断了祭祀，救下了昏迷的伊丽莎，其他人也总算保住了性命。只有发动这场祭祀的萨里特本人，却已经走到了生命的尽头。面对力量强横同时极具智慧的魔兽，叶空只能尽力用话语去交流，分散了它的注意力。\r\n    但事实上，这只身形似狼的魔兽并非完全是魔法皇帝击败后封印的，与初代皇帝交情颇深的他其实是自愿在这里沉睡的。如果不是它故意压下了萨里特的献祭魔法，在场的皇族早就已经丢了性命了。而对于想要摆脱大魔导师们，让伊丽莎成为具有实权的女王的萨里特，魔兽甚至故作嘲笑的劝解他，不用异想天开了，执掌魔法帝国的只能是魔法皇帝，而因为遗传，皇族女子是完全没有魔法能力的。大魔导师们也并非夺权者，只是他们真正效忠的皇帝不在中枢而已，虽然沉睡了近三百年，魔兽还是能够感知到真正的魔法皇帝的存在的。\r\n    萨里特苦笑着承认失败，叶空答应他会将伊丽莎带出帝国，给她一份自由。而在外边阻挡伯爵手下的修直也在帮助雷琪儿击退强敌后受伤很重，事实上他早在多年前就已死去，是父亲依靠黑暗魔法复生的傀儡似的存在，无论是否受伤，在父亲死后，都将随之消散。在最后，他还是向相处多日的雷琪儿表露了自己的心意，虽然无法得到答复，却也心意满足了。\r\n    叶空和雷琪儿带着失去一切的伊丽莎离开了帝国，暂时的目标是光明公国。大魔导师艾维斯虽然知道叶空藏匿了伊丽莎，甚至可能对曾经的萨里特的行为了若指掌，但完全没有干预。大概他也能够理解，让伊丽莎如她母亲一样留在帝国当一辈子的傀儡根本没有意义，自己这些老人，不该再去操纵年轻人的人生、继续制造悲剧了。\r\n	第二章 黑暗祭祀			Paragraph	2021-05-30	30000549
31000125	102	2021-05-30	                       武斗\r\n    三年很快地过去了，小混蛋已经八、九岁了，而彼得则已十四了。小混蛋当然已知道“小混蛋”并不是个好名字了，可他自己又实在找不出一个可以替代的名字。然而，就在这一天，他终于有了一个属于自己的名字，是他这一生最尊敬的那个人给他取的。\r\n    这一天中午，莫比慌慌张张地跑来告诉小混蛋，说他哥哥彼得竟跑去城里最有名的圣焰剑士学院挑战去了。小混蛋不明白事态，只好急忙跟着他和另外两个孩子赶去看看情况。\r\n    原来彼得在送货时路过一条街时，看见角落里几个佩剑的青年调戏一个年轻女子。看不惯这些人的他低声骂了两句，没想到这几个家伙竟然听见了。他们不想让彼得把事情抖出去，于是拦下他想吓唬吓唬他。没想到双方都看对方不顺眼，一言不和打了起来。结果几个自称是圣焰剑士学院学生的青年全被苦练了三年的彼得打得趴下了。这几人却还不服，嚷嚷着“有本事就去圣焰学院去挑战，保证你连个八岁的女孩都打不过”。彼得一时兴起，竟真的跑去挑战去了。\r\n    小混蛋和莫比赶到剑士学院时，彼得握着铁剑站在比斗场上，他的对手竟真是个八岁的小女孩。这女孩样貌俊俏，一头紫色短发更是特别，而她握剑的姿势和那冷俊的神情更给人一种英姿飒爽的感觉。莫比和雷萨当场就看呆了。\r\n    几个孩子中年纪最大的托马克向大家解释道：“她叫雷琪儿，是圣焰学院院长的独生女儿，今年才八岁却有一身甚至超过许多大人的剑技。”托马克看了看他的两个好兄弟，嘿嘿笑道：“她可是我们城里刺儿最尖的一朵玫瑰了，哥俩要不要追追看？不过，我看没我的指点你们是没有半点机会的。”他故意转头不看另两人，显然以为这两个哥们会低声下气地求他指教呢。\r\n    然而雷萨也不是省油的灯，立即揭穿了他的阴谋：“若是你能追到她，自己早去，哪还有我们的份啊？你自己不过是想拿我们先试试她的好恶，别以为我会让你得逞。”莫比也很快反应过来：“就是，就是。”三个孩子很快斗起了嘴。\r\n    小混蛋并没有在意他们的话，让他在意的是，彼得看着雷琪儿的神情：他死死地盯着女孩手中的剑，一副如临大敌的样子。彼得的实力小混蛋是最清楚的，他每天拼命地练习，身上的上从未完全好过，时常累得动不了还要小混蛋去林子里把他拖回家。而他的苦修也得到了应有的回报，外城多数守备士兵都败在了他的剑下。而小混蛋每次买菜被市集的不良少年欺负时，也是彼得去把那帮人暴打一顿帮他报仇的。久而久之，彼得已成了他们那条街的煞星，没人敢招惹他。所以他的实力是不容小觑的。\r\n    只是小混蛋不知道的是，就在刚才，轻敌的彼得已经被雷琪儿的剑架住了脖子。而此时，旁边的被彼得打得鼻青脸肿的青年们又起哄起来了，叫嚷着要台上两人赶快打起来。\r\n    彼得和雷琪儿几乎是同时出手了，但彼得是向前踏步，而雷琪儿则是举剑急冲，两人的剑很快撞到了一起。小混蛋很快就看出了他们的差别。彼得力气大又用的是铁剑，挥舞起来力道大得多，可以说只要有一剑击中雷琪儿，她就肯定受不了了。但是雷琪儿的速度是远非彼得所能比的，两个人打起来时彼得完全就像是在放慢镜头，人家就算从他剑边晃过，他也是击不中人家的。而且雷琪儿又全以闪避代替阁挡，出手一击即退，根本就不让彼得的剑靠向她。彼得很快地发现自己只有被动防御了，他只要一出手，不但碰不到对方，自己身上反而会添几处伤口。而就算他拼命防守，也仍然挡不完雷琪儿的攻击。\r\n    单方面挨打的战斗没持续多久，彼得就已伤痕累累了，虽然他死不认输，但那些伤口明显地进一步拖慢了他的速度，一个不小心，他的剑已经被雷琪儿打掉了。很明显的，胜负已分。\r\n    沉重的铁剑掉地时，彼得的心也沉了下去。一个拼命苦练自以为有所成就的剑士却被一个八岁的小女孩打败了，还能有什么话说呢。彼得呆呆地坐在地上，完全忽视了伤口的疼痛，当然更忽视了那些青年的嘲笑。\r\n    彼得忽视得了那些青年的话，小混蛋却不能装做听不见他，不能容忍别人辱骂彼得，因为他是他的哥哥。小混蛋走上前，争辩道：“不许你们这么说我哥哥，彼得很强的。”\r\n    青年们早忘了自己脸上的疼痛，一个个厚颜无耻地嘲笑道，“连个八岁的小姑娘都赢不了也算是强？”“他强得足够被小姑娘打了！”“就是，就是。”\r\n    这群不堪一击的废物说的话实在难听，把不太会说话的小混蛋气得没办法不说，更把站在一旁的雷琪儿惹着了。她冷冷地道：“你们几个是不是也想试试？”她把剑一横，剑刃上泛着青光。\r\n    几个青年连忙摇头同时闭上了嘴，他们可不想让自己的舌头被割下来。过了一会，却有一人不识好歹地道：“我们不想试，不过看来那小子却要试。”他指的是小混蛋，小混蛋正拾起了铁剑低头站在那里一动不动的，样子的确像是在向雷琪儿挑战。\r\n    不过他们当然不知道，小混蛋是因为帮彼得捡铁剑时自己体内的那股奇异能量突然活动了，他因为一时不敢走动，才站在那里的。当众人的目光集中在他身上时，他立刻就慌了，并不知道他们为什么看着他。大家显然都以为他想要跟雷琪儿打，几个青年在嘘叫，而莫比几个却被他的“勇气”所感动，纷纷为他加油助威。\r\n    小混蛋还不知道是怎么回事，台下的托马克已经叫了起来：“小混蛋，好样的。居然敢跟雷琪儿打。”小混蛋疑惑地问：“你说什么呢？我为什么要跟她打？”\r\n    托马克道：“你不是要为你哥哥报仇吗……管那么多干嘛，用你手上的剑砍过去就行了。”加油打气很快成了怂恿，而小混蛋本就是很没主见的人，别人怎么说他就怎么做，这时竟真的举起剑看向了雷琪儿。\r\n    只有彼得最清楚小混蛋，平时脸只鸡都不敢杀的他又怎么可能跟别人比斗呢？彼得挣扎着站起来，叫道：“爱哭鬼，回来。你连剑都拿不稳，怎么赢人家？”\r\n    小混蛋出乎彼得意料地没有乖乖回到他身边来。小混蛋静静地想了想，突然回头向彼得道：“其实，有时候，我也能打的。”彼得显然完全听不懂他的话，但他却知道，小混蛋虽然平时没主见，但他若要坚持一件事时，是谁也劝不住的。所以彼得只能静静地看着他。\r\n    小混蛋所说的“有的时候”其实就是指他体内那奇异能量活动时，而此刻，正是这种时候了。小混蛋虽然不能操纵那股力量，但他只要随便做些动作，那力量就回自然地爆发出来。此刻小混蛋就举起了剑，努力向雷琪儿冲去。可这铁剑对于小混蛋也实在太重了，他使尽全力才将它“拿”到了雷琪儿身前。雷琪儿没想道这个斗胆敢来挑战的小男孩居然真的连剑都拿不稳，她只顺手挥剑，就将他的铁剑打飞很远。小混蛋用尽了力气，又整个人跪倒在地上，他也没想到这个看似柔弱的女孩子力气竟这么大，他的双手都被震得发抖、痛得他几乎要哭出来了。\r\n    两个孩子的比斗却还未完。就在旁边几个青年想嘲笑，莫比三人想笑骂，连连雷琪儿都忍不住想开口时，异变突生，雷琪儿手上的青铜剑忽然断了，整整齐齐断成了六节，缺口都光滑如镜。两把剑只碰了一下，却出现了六道断痕，没有人知道这是怎么一回事，大家都惊讶地看着小混蛋，一时间谁也说不出话来。\r\n   \r\n    就在大家惊讶之时，墙后走出了一个面相和善的老人，穿着一套最普通的牧师袍，慢慢地走向了众人。看到这老人后，除了小混蛋和彼得，其他孩子都立刻恭敬地低下了头，连最高傲的雷琪儿也不例外。\r\n    老人慢慢到了众人身前，他先看了看满身是伤的彼得，叹了口气，轻声责问雷琪儿，道：“怎么又把别人打伤了？”\r\n    雷琪儿不敢与他对视，低着头道：“是他自己来挑战的。”\r\n    老人又叹了口气，慢慢走到了彼得身边，温和地道：“你先坐下来。”彼得明明不认识这个人，却很自然地听他的话坐在了地上。老人将手放到了彼得的伤口出处，只见一阵白色光芒从他手心里发出，照在了彼得身上，他的伤口竟很快地愈合了。\r\n    老牧师缓缓地站了起来，问：“孩子，你脚什么名字？”\r\n    彼得答道：“彼得。”\r\n    老牧师微笑着道：“孩子，年纪轻轻就拼命训练可不好，长此以往，你的身体可是受不了得。”\r\n    彼得虽然知道他说的有理，但想到刚才的惨败，他不禁恨恨地道：“连个小女孩都赢不了，还算什么努力。”\r\n    老牧师知道他很不甘心，想了想，微笑道：“其实败给我们雷琪儿也不是什么丢脸的事，这学院离能胜过她的也不多呢。这样吧，我看你虽然努力，但缺乏老师指点，不如就住到学院里来吧。我倒是可以请费雷教教你。”\r\n    彼得学剑一直都是靠拼命苦休，根本不懂剑术的精要，此时这和善的老人竟愿意请这个有名的学院的院长来教他，他不由得激动地问：“真的？”\r\n    一旁的托马克插嘴道：“劳伦斯爷爷的话谁也不能违背，院长也得听他的。”而老牧师也点头答应了他。\r\n    彼得立刻跪下来，不停地给老牧师磕头。劳伦斯赶忙扶起了他，正色道：“我是看在你勤奋刻苦的劲头才帮你的，在这里修行时可也不能太过放松哦。”彼得连连点头。\r\n    彼得又想起了小混蛋，轻声向劳伦斯道：“爷爷，我若住进了这里，那爱哭鬼……”他说着看向了小混蛋。劳伦斯也顺着他的目光看向了小混蛋。\r\n    小混蛋一见劳伦斯的目光看向了自己，连忙好奇地问道：“老爷爷，你刚才使用的是魔法吗？”\r\n    劳伦斯笑道：“我所用的是光明力量，与魔法有些不同。”小混蛋并不知道自己的话有多冒失，很多神职人员是非常忌讳“魔法”这词的，不过劳伦斯显然开放得多。\r\n    此时，一直沉默着的雷琪儿突然俯身捡起了自己的断剑，走到了劳伦斯面前，指着小混蛋道：“他把我的剑弄断了。”\r\n    劳伦斯仔细看了看断剑，脸色一下子沉了下来，他当然看得出破坏这剑的特殊能力。劳伦斯再次仔细看了看小混蛋，脸色更沉重了，他从他身上看到了不好的征兆。\r\n    小混蛋这才意识到自己又毁坏了别人的东西，他以为这老爷爷要责怪他，慌张地说道：“对不起，对不起。我不是故意的……”他话还没说完，又意识到自己说谎了，赶紧改口：“我，我是故意的。对不起，对不起！”别人还一句话都没说，他自己就快把自己逼哭了。\r\n    劳伦斯看到这孩子快哭了的样子，连忙安慰道：“没事，没事。剑断了就算了，没什么大不了的。别哭，千万别哭。”老牧师的话像是有魔力一般，小混蛋激动的情绪很快就平静了下来。\r\n    劳伦斯拂着他的头，温和地道：“想不到你还是个能力者呢，空间系的异能连我都从没见过呢。孩子，你叫什么名字？”\r\n    小混蛋当然不知道劳伦斯所说的能力者的意思，但老爷爷问起他名字时，他只得慢吞吞地答道：“我，我叫小混蛋。”\r\n    原本安安静静站在远处的青年们立刻笑了，自己叫自己混蛋的人他们还没见过呢。听到他们的笑声，小混蛋自己也有些不好意思了。但是劳伦斯没笑，他知道这名字的意思，于是温和地说道：“原来现在还有你这样的孤儿呢。不过也没什么可笑的，在我年轻的时候，像你这样的孩子可到处都是呢。”\r\n    劳伦斯静静地看了看小混蛋，那深邃而温和的眼神似乎看透了他的内心一般。劳伦斯接着说道：“孩子，你以后就跟着我好不好？我可以教你刚才那种光明力量哦。”\r\n    能够跟着这样和蔼可亲的老爷爷，小混蛋当然求之不得，可是他还是很诚实地道：“可是，我会给您带来麻烦的。”他果然也对自己身上的诅咒有些了解。\r\n    劳伦斯当然知道他的意思，他正是看出了这孩子身上的诅咒，才想将他收在身边以便帮他化解这厄运的。于是他道：“没关系的，你身上的麻烦就是要我这样的人来化解的。”劳伦斯没在这事上纠缠，他很快换了个话题，道：“孩子，你以后就叫我爷爷好了。恩，要不要我帮你取个名字呢？”\r\n    小混蛋立即点点头。\r\n    劳伦斯想了想，道：“我看你很头发黑眼睛的，应该是那些东方人的后代吧。我倒是看过些东方人的书，听说‘叶’是个不错的姓氏，而你又是空间异能者，不如就叫‘叶空’吧，你看好不好？”\r\n    小混蛋当然不可能反对，他高兴地默念这：“叶空，叶空。”\r\n    从这天起，他就有了真正属于自己的名字，也有了一个象样的家了。\r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n   1\r\n	武斗			Paragraph	2021-05-30	30000549
31000124	101	2021-05-30	                      患难兄弟\r\n    瑟斯之城最外边的一条街上最破败的一所房子里住着个5岁的小孩，他叫做小混蛋/他没有亲人没有朋友甚至没有会和他说话的人。邻居们都听说他是被上帝唾弃受到诅咒的人，因为他长着黑色头发和一双乌黑的大眼睛，更因为曾经帮助过他的人都或多或少遭了厄运。也就因此有人叫他小混蛋，久而久之，他自己就把这当成了自己的名字。\r\n    小混蛋也不知自己是怎么活到现在的，他只知道自己吃过很多人施舍的东西，邻居们暗中给了他不少吃的，他自己又到饭馆的垃圾桶里捡了些，连路过这里的其他乞丐也会分他些东西。但这些都是他能记事能走动之后的事了，他人生的最初两年是怎么过来的，连他自己也不知道了。\r\n    从三岁到五岁，值得小混蛋回忆的事情不多，他只记得有一次自己不知怎的进了一间学校，看见老师正交一群比他大一些的孩子认字。小混蛋很好奇地在门口偷看，也跟着学了起来。年轻老师看他可怜也没有赶他走，他就这么跟着学着。后来老师看他好学的样子，竟破例让他坐到其他孩子后边学习。小混蛋似乎天生就有学习的天赋，亦或是他根本没有任何能在意的事所以学得很认真，竟比其他大他三四岁的孩子血得更快更多。只是一屋子的小少爷大小姐并不想跟这个脏兮兮的小家伙做同学，又一天小混蛋向往常一样来到学校的时候，却被一个凶神恶煞的中年人追了出去。中年老师追出来时发现，学校后边的土地上全是小混蛋用树枝些的字，一时间怔在了那里。\r\n    小混蛋是善良的人们养大的，他自身几乎就是善良。他从未欺骗过任何人也从未偷窃过任何东西。这样一个孩子能活下来可多亏他的异常坚韧的身体。他即便天天吃饭馆垃圾桶里乱七八糟的食物，也能消化得了。他身体虽瘦，病却不多。\r\n    小混蛋也有他自己的处事原则，他知道自己总是给人带来不幸，所以虽然寂寞却并不主动找人说话，他又从不偷窃，不做坏事。也许正因此虽然被判定为受诅咒的人，小混蛋却没有被人们驱逐吧。\r\n    还值得一提的是，小混蛋很幸运地在内城不知谁的家外的垃圾桶里捡到了两套贵族的旧童装。他把衣服拿到河边洗了，又用针线将破口缝上了。他在河边洗了澡，穿上这身衣服，再理了理头发，竟变成了个小少爷摸样。不认识的人一定还以为他是哪个被降了级的军官家的孩子，穷得连孩子穿的衣服都有补丁了。\r\n    这身衣服对小混蛋的帮助很大，他从此就可以放心地到街尾的那个陈旧的图书馆里去看书了。馆长老头是个最怕惹麻烦的人，平时都几乎在内屋里睡大觉，偶尔一次出来看见穿戴整齐的小混蛋，也没理睬他。\r\n    小混蛋学习能力很强，他先是抱着字典拼命认字，而后又开始看魔法书。这图书馆里书籍虽乱，但藏书倒很丰富，甚至有不少很特别的书。小混蛋对那些千奇百怪的魔法很感兴趣，但他花了很长时间都没能聚集起半点魔法能量。他不久又着迷于寒星、维奇等几个被称为“魔法科学家”人的书。他们在书中详细的描述了世界的构成和许多奇异现象的成因，更给读者们留下了许多有趣的实验。小混蛋将实验方法硬记下来，然后溜到城里的魔法公会外捡拾写魔法师们丢弃了的材料，在自己的破屋子里做自己的实验。有一次他做出了几颗失败品的冶炼火焰丸，摔在地上就能燃起火来，只是那火焰温度太低，完全不能用来冶炼或铸造。不过一个叫莫比的贵族男孩无意中发现了他做的这东西，很感兴趣，于是花了一个银币买去了他的火焰丸。一个银币对小混蛋来说已是笔不小了的财富了，他省着省着的用，连续两个月都没有吃垃圾桶里的东西。\r\n    可是魔法师们的废材料实在太杂，又有很多液体混在一起没法用了。所以小混蛋记得的实验虽多，能做出来的却只有几个。所以大多数时候，若是垃圾桶里没有可吃的，他就只有稳稳当当地挨饿。\r\n    而冬日里的这一天，正是小混蛋稳稳当当挨饿地一天。他缩在房子的一角，这破房子根本挡不住寒气。他本想睡一觉好尽快熬过这一天，却总是睡不着，肚子一直咕咕地叫着。\r\n    也不知过了多久，门外有个乞丐一般的十一二岁的少年走到了这座房子前边。他也许以为这里根本没有人，径直走了进来坐在地上想在这里避一避这漫天的风雪。少年并没有注意到角落里的小混蛋，只是望着门外的风雪出神。少年的肚子忽然叫了一声，声音大得连小混蛋都听见了。少年拂了拂自己的肚子，只能无奈地叹了口气。\r\n    小混蛋看那少年衣衫破烂的样子，想了一会儿，最终决定要帮他。自己都挨饿的人怎么去帮别人？总之小混蛋有他的办法。他从自己的内衣口袋里摸出了一枚有奇怪花纹的金戒指，这戒指似乎是他与生俱来的东西，他把它看得比生命更重要。这戒指并不是普通的戒指，它是有着特殊魔力的。小混蛋以前曾将它戴在手上的时候曾被人抢去过两次，不过最终都莫名其妙地回到了他手上，这戒指似乎认得他一样。从那以后他都把他藏在衣服里，只有特别寂寞的时候才把它拿出来对它说话。\r\n    这枚戒指更大的魔力在于它能实现小混蛋的愿望，小混蛋此时就闭上了眼在许愿，请求戒指给他一个面包。当他睁开眼时，角落的木凳上果然已有了个看来很不错的面包。\r\n    既然有这么一个宝贝，小混蛋又为什么要挨饿呢？因为他喜欢看书，他从那些科学家们的书上知道了“事物守恒”的道理，知道没有凭空出现的面包。他认为自己要的面包一定是从哪里“偷”来的，他想到，也许那个面包是从这世界的另一个角落里和自己一样挨饿的人辛辛苦苦赚到的的话，那偷东西的他不就完全不可原谅了吗？这个想法显然有些愚蠢，但他相信并将它坚持了下去。所谓好人有好报，小混蛋此时并不清楚这错误想法其实却保护了他免于被欲望所戕害。不到万不得已时，小混蛋是不会动用这戒指的，他总共也只用过三次戒指，第一次是还不知他的作用，后两次则是饿得快死了。而且每次使用之后，他都很诚心地忏悔过。\r\n    小混蛋收好了戒指，拿起面包走向那少年，他双手将面包递向那少年，道：“这个，给你。”少年抬头看着他，看着他那一身整齐而华丽的贵族衣服，忽然挥手打掉了他手中的面包，向他吼道：“走开，别以为一个面包就能收买我，我跟你们这些假人假意的贵族誓不两立！”\r\n    小混蛋不明白他说些什么，他只是想让这个哥哥吃面包而已。于是他捡起面包，擦了擦，又递向了他。那少年显然有些意外他的坚持，但他也有自己的坚持，他与那些害他母亲又瞧不起他的贵族势不两立。少年又打掉了他递过来的面包。\r\n    小混蛋生命力虽强，但他的性格却既善良又软弱。他的好意被少年两次拒绝了，竟然就伤心地哭了起来。这一哭可让少年慌了，他没想到这小孩竟然这么就哭了，而且就在他面前伤心地哭个不停。少年只得吼道：“别哭了！别哭了！”小混蛋却根本不听，反而哭得更伤心了。少年拿他没辙，最终只得道：“好了，好了！我吃还不行吗？”他说着捡起面包，也不怕脏，大口大口地吃了起来。\r\n    小混蛋果然很快就不哭了，他望着少年，忽然又笑了。少年也看向了他，完全搞不懂他怎么脸变得这么快。少年忽然又听到了肚子叫的声音，却不是自己发出的，他惊讶地看着面前的小孩，立即撕下一半面包递还给他。小混蛋接过面包，轻轻地撕下一块，慢慢地吃着。\r\n    两个人都吃完了面包，小混蛋又跑到角落从橱柜里取出了他另一套衣服给那少年，道：“这件衣服比较大，给你。这里是我家，你以后就住在这里吧，这样你就是我哥哥了。”小混蛋说得有些高兴了，他从来没有过拥有亲人的感觉。\r\n    少年也不推辞，接过衣服，道：“我叫彼得，你叫什么名字？”\r\n    小混蛋道：“我叫小混蛋。”\r\n    彼得诧异道：“这也算名字？”\r\n    小混蛋道：“大家都这样叫我的，这名字不好吗？”\r\n    彼得这才明白过来，原来他的遭遇比自己更惨，连个名字都没有。不过他看着小混蛋那张笑脸，忽然笑道：“与其叫小混蛋，倒不如叫爱哭鬼好了。”\r\n    小混蛋问：“那个名字很好吗？”\r\n    彼得答道：“不很好，但是很适合你。”\r\n    从这天起，彼得就在这里住了下来。他找来了些木头将房子补了补，破屋子总算像是有人住的地方了。彼得每天在城里干些苦力活，挣些钱让两人不至于挨饿。而在劳作之后，他却还要用自己做的木剑苦练剑术，因为他有着必须打倒的人，他得努力变强。\r\n    而小混蛋则负责一切家务，在忙活之余他又钻进图书馆里去了。随着魔法知识的逐步加深，小混蛋已经能很轻松地做出些贵族小孩们感兴趣的东西了。除了莫比外，他还认识了托马克、雷萨等几个同龄孩子，他们都肯花钱买小混蛋的发明。小混蛋听说他们拿这些东西去哄那些女孩子开心，但他却从未见过那些女孩子。（莫比他们当然都说东西是自己做出来的，怎么会让他看见呢？）不过小混蛋并不在意这些，他只知道自家已经有了一金币十三银币四十六铜币了，这在这个类似平民窟的街上算是很不错的了。毕竟这里一般人的工薪才每周三、四十铜币，七十二个铜币才能折合一个银币，三十六个银币才能折合一个金币。有了这笔钱后，小混蛋就可以买些便宜的实验材料了。而彼得也用小混蛋做的冶炼火焰丸和废铁做了一把厚重的铁剑，他决定几年以后就用这把剑去报仇。\r\n    小混蛋和彼得相处了一年多以后，才从他的口中得知了他的身世。彼得原本生活在一个小镇里，他的父亲是当地最有名的剑客，是当地贵族的领袖之一。他的母亲虽出身贫家，却是小镇里最漂亮的女人。彼得原本生活得很好，小镇一直都很安定。可是有一天彼得的父亲刚带着小镇的武装部队到大城里去，小镇就遭到了山贼的袭击，很多镇民被杀害，人们的财产被劫掠一空。而彼得的母亲刚把他藏起来不久，自己就被山贼们抓住玷污了。彼得的父亲回来时知道了他母亲的事，脸色铁青。那些贵族则更是众口一词地斥责彼得的母亲直气得她只能跳河自杀。而他父亲虽然当时很伤心，但不久之后又另结了新欢。\r\n    彼得原以为事情就这样结束了，可他的贫寒的外祖父似乎发觉事情有些蹊跷。有一天，他外祖父找到他父亲询问些事情，却莫名其妙地死在了回家的路上。也就在发现外祖父尸体的那天的晚上，彼得无意中发现了他父亲和那些贵族们的秘密。原来，在山贼袭击小镇以前，彼得的父亲和那些贵族就已得到了消息。可是他们知道自己敌不过那些山贼，不想白白送死，又受一个发灾难财的人的鼓惑，彼得的父亲竟借口上级指令将自己的部队掉离了小镇，只留下无辜的镇民们毫不知情之下被山贼们无情地杀戮和掠夺。而在他们回来之后，一番假仁假义地抚恤后他们的声望地位有增无减，镇民们这时都知道要努力求得他们的保护才能免于山贼的侵略，对他们也就更恭敬了。而他们逼死彼得的母亲则是他父亲为了将养在外面的女人娶进门来。\r\n    彼得发现着秘密时，当场就冲出去责骂那个伪君子的无耻，不料被他一下就打晕了。那些人没有杀彼得，却将他丢到了离小镇很远很远的地方，想让他找不到回去的路。彼得靠自己的努力活了下了，决心要回去揭穿那个伪君子。可是他知道自己现在的力量太弱小了，他现在即使回去也是什么也做不了的。他现在所要做的事是努力变强，要强过那个伪君子十倍、百倍，只有这样才能报得了那血仇。\r\n    \r\n\r\n\r\n\r\n\r\n	患难兄弟			Paragraph	2021-05-30	30000549
31000126	103	2021-05-30	                     光的研究\r\n    圣焰剑士学院占地很广，但房舍却不多。学院内的大片草地就是剑士学徒们的训练场，学院创立者只留了一条规定：学院学生每人每天必得训练超过八小时。无论是夏日炎炎还是风霜雨雪，这条雷打不动的规定都在持续着。创立者也只留下了一种特殊情况可以免于练习：当兵临城下时，所有学员不论年龄都必须提剑上城携防。\r\n    正是因为院规的严苛，圣焰学院每一届都会出几个出色的剑士，而正是因为他们，圣焰在圣联这个只重视神圣骑士的国家里也有着不小的名气。\r\n    彼得和小混蛋（应该叫叶空了）都很快适应了这里的环境。彼得不用再出去干活，每天练习的时间有增无减，受的伤也一点不比以前少，不过还好有劳伦斯爷爷帮他治疗，他的身体依旧结实没出什么问题。而他的刻苦引起了另两个学员的注意，三个人一来二去成了朋友，彼得也不再总是一个人苦练了。\r\n    学院的住房都做成了小院的形式围在草地周围，叶空和劳伦斯爷爷两人就住在其中一个小院里。这院子只有三间屋子，分别是叶空和爷爷的住房，以及一间小教堂。叶空每天跟着爷爷学习圣经（那个世界不同于我们的世界，所以那圣经也与现实中的圣经有所不同），然后又在自己的房内进行魔法实验，每天都忙得不亦乐乎。爷爷房内书架上各式各样的书籍也让天生就喜欢学习的他大开眼界。唯一让他觉得麻烦的就是，爷爷每天都要为他洗礼，每天傍晚饭后他都必须洗好澡穿好衣服到教堂里静坐两个小时，而且还什么都不能想。\r\n    叶空却不知道，真正烦恼的人应该是劳伦斯。劳伦斯第一次看到他时，就看出他受过诅咒，但老牧师却没想道这诅咒会这么强大。他本以为凭借自己的光明神力，不出一月就能化解绝大多数诅咒，可现在他已经连续为叶空洗礼两个多月了，叶空身上的诅咒竟完全没有削弱的迹象。这个月来，劳伦斯几乎每天都在为这件事忧心，若是自己不能消除那诅咒，它很可能会毁掉这个善良孩子的。\r\n    此刻劳伦斯只得从另一个方向着手了：若是能让叶空自己学会使用光明力量，自己运用这股力量来排斥那诅咒，再加上劳伦斯的帮助，应该能够将它化解掉的。\r\n    于是他叫来了叶空，向他道：“孩子，想不想学我的光明力量？”\r\n    叶空点点头。\r\n    劳伦斯接着道：“那你可要看好了。”他说着伸出了左手，他的手心很快地亮起了一阵白光，白光越来越亮，到后来直刺得叶空睁不开眼睛，他赶忙将手挡在了眼前。\r\n    过了一会儿，白光消失了，劳伦斯缓缓地向叶空问道：“孩子，感觉到什么没有？”\r\n    叶空低头想了想，那白光中似乎有些什么，但他却完全说不出来，只得摇摇头。\r\n    劳伦斯叹了口气，这两个月来他也看得出叶空没有当神官的天赋。只是因为他身上的诅咒，劳伦斯不能放弃。他于是道：“光明力量是来自于对光明的向往和追求，只有绝对信奉上帝的人才能很好的运用这力量。我教你的圣经你记住了吗？”\r\n    叶空答道：“记住了。”\r\n    劳伦斯道：“你只有努力去体悟书中所教授的信仰，才有可能掌握这光明之力……”\r\n    劳伦斯话还没说完，叶空却插话道：“可是，爷爷，读了圣经后我有个疑问。”\r\n    劳伦斯诧异道：“什么疑问？”\r\n    叶空道：“人真的是上帝造的吗？可是我以前从书上看到，有人说人和其他一切生物都是慢慢进化来的。”\r\n    劳伦斯这下更惊讶了，他急忙问：“谁的书里写的？”\r\n    叶空答道：“寒星。”\r\n    劳伦斯听说过这个名字，他问：“你说的是以前那个‘禁咒法师’？”\r\n    叶空道：“恩，但那些人的书里都叫他魔法科学家。”\r\n    劳伦斯叹了口气，他拂着叶空的头，苦笑道：“你知道的东西还不少呢。但是你可千万不能吧这些话拿出去说。”\r\n    叶空疑惑地问：“为什么？”\r\n    劳伦斯沉声道：“我们这个国家的人是信奉上帝的，任何违背上帝的言论都会被认为是邪说，异教徒是要被处以绞刑的。”劳伦斯已算是思想最开放的光明神信徒了，念了几十年圣经做了几十年牧师的他当然看得出圣经中也有着错漏，同样看得出光明信徒们所信奉的“绝对正义”的缺陷，而同时，他也对那些新兴的魔法科学家有些了解，知道他们的理论也有些可取之处。但是，劳伦斯更知道，那些所谓的“魔法科学家”毫无顾忌发表各种与光明教会完全对立的学说，这无疑是在冲击教会的权威，几乎可以预见这样下去会引起的思想界的斗争，而这一斗争则很可能会引起国家间的战争。持续了三百年的圣战完结还不到二十年，这世界可经不起再次的战争了，而为了避免它，劳伦斯和其他许多中立人士都只能尽量压抑新思想的泛滥，希望新旧两种认知能经过长时间的磨合共存下来。（我们当然知道这想法是不太现实的）\r\n    叶空似懂非懂地点点头，却还是有些不服气地道：“可是，根本就没有人真正见到过上帝，没人知道他的样貌，谁也不能证明他的存在啊。”\r\n    劳伦斯道：“但是上帝是一定存在的，赋予我们天师军团领导者伟大的光明战神米伽勒大人遵从上帝的教诲，而且即便是已堕入地狱的双王堕落之王路西法和恶魔之王撒旦也同样能证明上帝的存在。”\r\n    劳伦斯突然意识到这番谈话已经有些大逆不道了，让叶空这么小的孩子去思考这些问题可不好，他于是道：“孩子，别整天想这些问题了，你先想一想怎么使用光明之力吧。”\r\n    叶空点点头，慢慢走出了教堂。\r\n\r\n    叶空早已像他最崇拜的魔法科学家寒星一样养成了在自己的实验室里研究的习惯，叶空很快回到了他自己的房里。各式各样的实验用具乱七八糟地摆放在房内占据了大半的空间，而为了能够睡觉，他的床反而被放在了门口。    \r\n    叶空开始思索刚才爷爷示范的那种白光，到底怎么才能做得出那种光线呢？他很快的摆弄起了自己的东西。叶空完全没能理解劳伦斯的意思，光明之力出自对神的信仰，可不是他用实验做出来的。\r\n    不过光明之力他虽做不出来，会发白光的东西他这里却也有几样。叶空发现一些特别的金属在燃烧时发出的光颜色不同，除了普通的黄色，还有红、蓝、紫各种颜色，而其中就有一种轻质金属发出的就是白光。\r\n    叶空高兴地拿着他的发现去给爷爷看，换来的当然只是劳伦斯无奈地苦笑。劳伦斯这下真有点没办法了，连神都不相信的叶空又怎么可能运用得了魔法力量呢。劳伦斯还发现，叶空体内那强大的空间异能也似乎排斥了其他能量进入他体内，使得他不仅学不了光明之力，连魔法也使用不了。劳伦斯原想让他自己体悟光明之力，从而对体内的诅咒产生排斥，可是现在却难在叶空的悟性和特殊体质这两个问题上了。劳伦斯仍然不想放弃，他只能让叶空自己继续去感悟。但他也知道自己不能在提示更多了，能不能成功就看叶空自己了。\r\n    本以为有点成就的叶空只得缓缓向外走去，当他走到门口时，劳伦斯却忽然想起什么似地叫住了他，道：“你先别忙着回去，先将我准备的饭菜送到雷琪儿那里去。今天是她的生日，你去陪陪她。今天的她可能会有点生气。”\r\n    叶空应了一声，端着饭菜走了出去。他显然不知道每年这一天雷琪儿都将自己锁在屋里不肯吃东西的。\r\n\r\n    雷琪儿这次没有把自己锁在屋子里，却一个人抱着剑坐在院子里发呆。她和院长都是单独一人住一个院子的。除了负责打扫的仆人外，只有劳伦斯或叶空会到她的院里来。叶空一走进院里就看见了正发呆的雷琪儿，但他却没跟她说话，而是先自顾自地走进房里放下了饭菜，然后才折返回来，向她道：“雷琪儿，吃饭了。爷爷亲自给你做的。”\r\n    雷琪儿像往常一样毫无反应，雷琪儿可以对别人视若罔闻，性格孤僻得许多人都难以接近。但即使她真是聋子，也不能忽略叶空的存在，因为他更可以不厌其烦反复一句话无数遍直到他说话的对象听懂为止。他重复道：“雷琪儿，吃饭了。爷爷亲自给你做的。”\r\n    雷琪儿仍旧没反应，十秒后叶空又重复道：“雷琪儿，吃饭了。爷爷亲自给你做的。雷琪儿，吃饭了。爷爷亲自给你做的……”\r\n    天地间仿佛只剩下这对活宝在这里坚持着，一个坚持沉默不语，一个坚持没隔十秒就重复一次刚才的话。虽然不说话的人要轻松些，但自从叶空却一次都没输给过雷琪儿。雷琪儿可以不理他的话三十次、五十次甚至这一次更突破了一百次的大关，但当叶空声音开始沙哑了的第一百三十几次时，雷琪儿终于开口了，她轻声说了两个字：“不吃。”\r\n    叶空仿佛对自己沙哑的声音完全没感觉，诧异地道：“为什么呢？爷爷说今天是你的生日啊。我听说就算最穷的人家，到了孩子过生日时都吃得很好的。”\r\n    雷琪儿冷冷地道：“但是我本就不该有生日，本就不该出生。”\r\n    叶空似乎有些明白了她的意思，他想了想，道：“可是有生日总比没有的好吧。”\r\n    雷琪儿抬头正想反驳，却忽然意识到眼前这男孩似乎就是没有生日的。她又低下了头，道：“一出生就害死了母亲的人本就不该出生。”\r\n    叶空道：“出生了总比没有出生的好吧。而且，有母亲的人总比没有母亲的好吧。”\r\n    雷琪儿忍不住问道：“你真的连你母亲是谁都不知道？”\r\n    叶空苦笑道：“从能记事开始我就是一个人生活在城边那栋破屋子里，又怎么可能知道母亲的事呢？”\r\n    雷琪儿轻声道：“你没有家，所以也无法理解我，我的家根本就不算是个家。”\r\n    叶空道：“可是有家总比没有的好啊。而且，我现在也有家了啊，我觉得这个家很好啊。我还有了很多家人，有爷爷、彼得，有你，还有学院里其他的人。”\r\n    雷琪儿一下子把头埋得更低了，嗔道：“谁跟你是一家人了！”\r\n    叶空道：“爷爷说我们大家聚在这个学校里就是一家人了，是要互相帮助的。总之就是，是一家人总比不是的好。”\r\n    雷琪儿忽然起身，道：“好了，好了。你怎么老说这句话呢？”她说着向屋里走去，到了门口却忽然回过头来，向叶空道：“好吧，算你说的对。你来了总比没来的好，进来一起吃饭。”\r\n    \r\n    叶空回到爷爷身边时，爷爷问道：“她吃了吗？”\r\n    叶空回答：“吃了，我跟她一起吃的。”\r\n    爷爷立即笑了，道：“你这孩子还真不错，连雷琪儿都说得动。她以前这一天都是不吃东西的。”\r\n    叶空问：“今天是她的生日，她为什么还不吃东西呢？”\r\n    爷爷没有回答，他很快转换了话题：“对了，孩子，你应该不知道自己的生日是哪天吧？”叶空不能否认。\r\n    爷爷笑道：“那不如就把今天当作你的生日吧，好吗？这样你和雷琪儿就是同一天生了，你们都不算是很幸运的孩子，更该好好相处才是呢。”叶空又似懂非懂地点点头。\r\n    \r\n    第二天，叶空又投入到了他对光的研究中，他始终不明白爷爷到底要他去领悟什么，糊里糊涂想了半天后最终认定，一定是自己做出的白光不够亮，不像爷爷发出的那么刺眼，才得不到他的认同。他于是很快工作起来，他要做出比之前的更亮上百倍的白光。\r\n    买材料、提纯、制作，叶空这一忙就是一个多月，专心致志的人的时间总是过得很快的。劳伦斯这一个月来都缩在自己房里摆弄那些瓶瓶罐罐，知道他离光明之力越来越远了。可是老牧师看着他那兴奋的样子，又不忍心打断他：叶空毕竟还是个孩子，现在能活得快乐就尽量更快乐了一点吧，至于光明之力，就尽人事听天命吧。\r\n    叶空终于完成了他的研究，这一天晚上，他拉着爷爷去看他的发明。劳伦斯也有些好奇他到底做出了什么东西，叶空年纪虽小，却是个天才发明家，他能做出来的东西许多大魔法师也未必做得出来。\r\n    当劳伦斯猜测时，他眼前忽然闪过一个笔直冲向天空光球。他立即抬头望向天空，只见那散发着耀眼白光的光球忽然在空中爆成几块，更为耀眼的白光瞬间映亮了他们所在的这片空地。然而光球并未就此消散，几个小光球再次爆裂，白光映亮了整个天空。瑟斯之城被完全笼罩在了白光之下，城里的人们都被这突如其来的光芒惊呆了。有人以为是天使带来了福音，做了亏心事的人则感觉是触怒了上帝，少数几个见过世面的人物则立即想道了一个神迹：天堂之光。\r\n    叶空当然不知道其他人的想法，他此刻正充满期待地看着爷爷，问：“爷爷，这是不是光明之力？”\r\n    劳伦斯想了一会儿，终于摇了摇头。\r\n    叶空毕竟是个孩子，他为之努力多时的期待落空了，兴奋的脸一下子沉了下去，头埋得很低，眼睛里也有了泪水。\r\n    “不过，”劳伦斯很快拂着他的偷，温和地笑道：“这却是个很不错的焰火嘛。孩子，能不能也教教我呢，我们一起做一个更漂亮的到圣诞前夜放吧，好不好？”\r\n    叶空立刻转悲为喜，忙不迭地点头，一时间心里满满的很舒服。不管需要多少努力，不管付出多少，只要能得到爷爷的肯定，叶空就很满足了。\r\n    劳伦斯也温和地笑着，但此刻的他却被叶空的发明提醒了，他想到了另一种解除诅咒的方法。叶空当然不知道爷爷心里的想法，也不知道老人为了他，下了多大的决心。\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n	光的研究			Paragraph	2021-05-30	30000549
31000127	104	2021-05-30	                             佣兵来袭\r\n    三年该算是不短的时间了，有时三年可以决定人的一生，就像马上就要高三的笔者（-_-!)，有时三年可以让人完全变成另外一个样子，就像在圣焰学院生活下来的叶空。\r\n    也许是因为劳伦斯爷爷的努力，又也许是因为他的宠溺，叶空已不在像以前那样呆呆的了，他现在已成了个整天都带着笑脸的开朗少年了。学院里几乎每一个人都收到过他自己发明的千奇百怪的礼物，而他英俊的笑脸和学自爷爷的温和体贴更是让大家都感觉容易亲近。\r\n    然而，就像以前的两个三年一样，这第三个三年里，十一岁的他又将迎来一次改变。\r\n    这一天，叶空像往常一样早早地起床，向爷爷的画像道了早安，整理了一下房间，做了早餐端着走向了雷琪儿的院子。\r\n    自从爷爷病逝之后，叶空就像雷琪儿一样单独一个人住一个院子了。而自从负责这两个小院饮食和扫除的老仆人去世之后，一向清闲的叶空就自然而然地担起了这工作。\r\n    三年来，叶空和雷琪儿相处得好得多了，对她的事也了解了不少。雷琪儿和她父亲费雷关系很不好，这学院里真正照顾过她的只有劳伦斯爷爷和那个叫黑古的老仆人。而两个人都去世了的如今，真正能跟雷琪儿说上话的就只有叶空了。\r\n    雷琪儿和叶空静静地吃着早餐。雷琪儿什么都不说、什么都不想，所以吃得很快。但叶空却想得很多，他一会儿想起了爷爷，不知他老人家在天堂过得怎么样；一会儿又想起了莫比几人，不知这次他们又要求自己做些什么来帮他们完成他们的“大事”；他忽然又想起了彼得，今天似乎又是他向雷琪儿挑战的时候了。彼得这三年来每一季都要和雷琪儿比剑，但不管他如何努力，也不管叶空如何为他加油，彼得至今还一次都没能胜过雷琪儿。（其实叶空不知道的是，他的加油声越大，彼得反而输得越惨。）\r\n    叶空正出神时，已吃完饭的雷琪儿突然问道：“空，我想问你个问题。”\r\n    叶空回过神，问：“什么？”\r\n    雷琪儿犹豫了一下，道：“你是不是想你哥哥彼得胜过我，是不是想要我输给他？”\r\n    叶空诧异道：“也不是啊，只不过……”\r\n    雷琪儿不等他说完，插话道：“那你为什么总是帮他加油，却从来没帮过我？”她突然觉得这话有些不妥，刚说完便起身拿剑向门外走去。\r\n    叶空也没想到她会说这样的话，一时不知如何回答，想了想，笑道：“那我以后也帮你加油好了。”\r\n    雷琪儿没有停下脚步，只是用蚊子般大小的声音说了句：“不希罕。”\r\n    \r\n    叶空和雷琪儿说话的同一时间，费雷院长正在他的小院里训示着他最钟爱的几个学徒。人们都称费雷为“瑟斯之狮”，而他高大的身材和刚毅的面庞也的确透着与万兽之王相似的威势，让人敬畏不已。\r\n    费雷正用他锐利的眼神逼视着眼前这几个十七、八岁的年轻剑士，他暗自叹可口气，他们虽各有所长，相较于其他学生已有了不错的剑技，但比起前几届学生中的佼佼者，可就差得远了，果然只有乱世中才能出得了真正的战士啊。\r\n    费雷突然正色道：“你们是圣焰学院这一届学生中最优秀的了，但以你们现在的实力，还远远不能在外面的世界中站稳脚跟。所以，在将要毕业的往后这一两年里，你们必须加倍努力去克服自己的弱点，争取让自己的剑技更上一层楼。明白了吗？”\r\n    几个年轻剑士齐声答道：“明白了！”\r\n    费雷接着一个一个点名道：“杰克，今后的两年不许再偷懒了，被我抓到了有你好受的。你要是有彼得十分之一的努力，实力就决不止提升一个档次。还有你，乔，以后做事多用脑子想想，别蠢到别人说太阳从西边出来你也信……”当他叫到彼得时，突然顿了一下，彼得的努力程度在这个时代的确少见了，但费雷犹豫的是，他隐约地在这孩子身上看到了一种巨大的野心，一种几乎与生具来的原始的罪恶倾向。费雷很快回过神来，道：“彼得，我不管你有什么仇恨，也不管你想要追求什么，你都必须先掂量一下自己的实力。你与上流社会的差距还远着呢，有很多人都是你竭尽毕生的努力也赶不上的。量力而行，知道吗？”\r\n    彼得严肃地答道：“弟子明白了。”\r\n    费雷正想说话，屋顶上却忽然传来一个声音：“原来圣焰的精英就是这么一群毛头小子呢。”\r\n    费雷和学徒们同时看向声音的来源，只见屋顶上跳下来了两个怪异的中年男子。其中一个长着老鼠脸、衣着邋遢的人右手握着只铁爪，另一个身材高大面相丑陋的男人则提着把钢斧，显然一副来者不善的样子。\r\n    费雷走到前边，厉声问：“两位擅创我的宅院，是什么意思？”\r\n    老鼠脸笑道：“也没什么意思，不过是来看看瑟斯的老狮子到底是怎么教徒弟的。”\r\n    这两人显然是来找茬的，语气里尽是嘲笑的意味。杰克第一个就忍不住了，拔剑冲了过去，一边叫道：“我师父岂是你侮辱得的！”他冲得很快，话音未落人已到了老鼠脸面前，杰克虽然是几人中实力最差的，但他这最自豪的一记突刺即便是几人中最强的彼得也是不敢硬接的。\r\n    然而那老鼠脸不闪不避，只是轻挥左手便抓住了杰克的剑，随即将右手的铁爪贴到了杰克脸上。老鼠脸阴笑道：“不识好歹的小子，该给你留个什么印子呢？”他说着又将铁爪在杰克脸上晃来晃去。\r\n    杰克从没被人这么抓住过，一时慌了神使劲挣扎。那老鼠脸原本抓得很稳，却故意一松手，使足全力的杰克的脸一下子撞到了铁爪上。惨叫着倒地的杰克脸上已经血肉模糊了。\r\n    乔和其他几个剑士看到杰克的惨状，都气急了想冲上去，却被站在前边的彼得抢了先。他走上前，严肃地道：“两位是不是太过分了？是想来踢馆的？”他说话时已经抽出了剑。\r\n    老鼠脸笑道：“我可没做什么，大家可都看到了，这小伙子是自己撞到我的爪子上来的。”\r\n    彼得没跟他多话，举剑击去。老鼠脸显然看得出彼得比刚才的杰克强得多，不敢再空手接剑，挥舞铁爪迎上了彼得的剑。剑爪相击，两人很快战在了一起。然而彼得的剑虽刚猛，却远不及对手出手的狠辣，彼得的剑虽是苦练出来的，而对方的武技却是实战中磨练出来的。两相比较，彼得显然处了下风。\r\n    两人激烈拼斗了近百招后，彼得自己退了回来，他虽然不及对方战斗经验丰富，却也知道对方故意放过了几个可以打败自己的机会。彼得不是个输不起的人，他退回来，轻轻的道：“我输了。”\r\n    几个学生打不过对方，只有轮到费雷出马了。费雷看了看两人，问道：“两位到底是什么人，可否报上名来？”\r\n    老鼠脸看过彼得的实力后显然不再如刚才那般狂妄了，他笑道：“我们不过是些跳梁小丑，您老有何必问得那么清楚呢。”    \r\n    费雷听得这话时，已经拔出了剑，一边道：“那也就是说，你们也不会告诉我你们前来了目的了？”\r\n    老鼠脸直白地道：“当然。”\r\n    费雷厉声道：“那就只好用我的剑逼你们说了。”他的剑很快到了老鼠脸面前，老鼠脸这次完全不敢大意，很专著地盯着费雷的剑。\r\n    同样的招式从费雷的手中使出来时，就完全有别于杰克和彼得几人了。刚猛霸气的狂攻打得老鼠脸只能拼命抵挡。才过几招，高下立见。\r\n    老鼠脸知道自己一人敌不过费雷，向他的同伴叫道：“还不来帮忙！”\r\n    那个一直沉默着的丑陋男人立刻出手了，斧头带着风力直砍向费雷的侧身。费雷只得转身抵挡，剑斧相撞，费雷的手被震得直抖。这个高大的男人显然有着一股异于常人的巨力。\r\n    费雷的剑术的确高超，以一敌二却仍霸气十足逼得对方两人难以还击。只是对面两人虽性格相异，却显然配合得很默契，在费雷就要打倒其中一人时，另一人总能恰当地救应同伴。三人酣战不休，旁边的年轻剑士们都看得惊讶不已，他们大多都还从没看过老师显露实力。\r\n    彼得看出老师虽然占着上风，但非但不能拿下敌人，反而更快的消耗着体力。彼得正想上前助老师一臂之力，对面的两人却一齐退出了战圈。\r\n    老鼠脸显然有些疲乏了，他喘了口气道：“想不到瑟斯之狮的确有两下子，我们就不打扰贵院长教徒了。”话音刚落，两人一跃跳上了屋檐，很快地消失了。\r\n    彼得等人正想追赶，却被费雷制止了，他道：“先别管这两个来历不名的人，赶快扶杰克去治伤。”\r\n    彼得想想道：“去找叶空来，他应该能治疗杰克的伤。”\r\n    乔应声去了，但等他到叶空或雷琪儿的院子时，两处都已没了人。\r\n    来找茬的两人显然不是来看热闹的，他们是想拖住费雷等人，以确保另一组人的行动不受阻碍。而这另一组人的目标，竟就是雷琪儿。\r\n    \r\n    雷琪儿刚走出门就察觉到了不速之客的到来，她握紧了剑，走到院子中央，冷声道：“出来！”\r\n    很快地，角落里果然走出了两个青年男子，其中青色头发的一个道：“哦呀，小姑娘的耳朵挺灵的嘛。” \r\n    雷琪儿看得出这两人不是泛泛之辈，更加握紧了剑，问道：“你们是什么人？到这里来做什么？” \r\n    另一个满身都是奇怪首饰的人摊手答道：“哎，我们呢，是群很废佣兵，废到只能接这种绑架大小姐的任务。哎，不知什么时候才能接得了大生意啊。”\r\n    雷琪儿当然知道他的意思，她已经抽剑直刺向了那戴满了首饰的人，冷冷道：“那还要看你有没有那本事。”雷琪儿因为是女孩子，身法敏特别敏捷，她的剑是学院里最快的，即便是费雷也比不上她的速度。\r\n    那男子虽然知道对方会攻来，但这速度却显然不在他意料之中，慌张之下他赶紧抽剑抵挡。而雷琪儿则根本不给他喘息的时间，很快地又是几剑刺了过去，压得对方连连后退。一旁的青发男子却显然没有要帮忙的意思，反而幸灾乐祸地道：“哦呀哦呀，小姑娘挺不错的嘛。”\r\n    雷琪儿很快看出眼前的敌人实力还在她之上，她完全是因为刚才对方的轻敌，才能暂时占着上风。雷琪儿正想着怎么应对这两人，是不是该让叶空去报信时，屋内的叶空终于感觉到不对，放下碗，顺手提上自己的小包走了出来。\r\n    叶空刚到门口还没看清情况，就被不知从那里伸过来的一只手打晕了过去。青发男子轻轻提起了叶空，向同伴笑道：“我可已经抓到一个了，那位大小姐可要你自己应付了。”\r\n    戴首饰的男子气愤于同伴的“无情”，叫道：“那个又不是顾主要的人，你抓了又有什么用？”他的吼声虽大，但毕竟沉得住气，趁着雷琪儿惊慌于叶空的被擒时，顺势扭转了局面。雷琪儿苦苦支撑了很久，最终还是被对方用剑背打晕了。\r\n    已经浪费了很多时间，两个佣兵显然也不敢停留，一人抱起一个，很快出了学院，上了老鼠脸的马车，出了城。马车在郊外一座老房子前停下来了，几个佣兵把雷琪儿和叶空丢进了房子后的冰窖里，盖上了厚实的窖门。\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n	佣兵来袭			Paragraph	2021-05-30	30000549
31000128	105	2021-05-30	                     第五章 脱困\r\n    叶空醒来的时候发现自己已经处在一个密封的地窖里了，沉闷的空气让他很不舒服。当他支撑着身体站起来的时候，第一眼就看见雷琪儿正缩在地窖出口的门板下。\r\n    叶空直到看到雷琪儿面色苍白瑟瑟发抖的时候，迟钝的神经才反应过来：好冷！\r\n    叶空很久没有再体会过以前在破屋子里过冬的感觉了，一时间还真受不了这样的寒气。不过叶空从来都是关心别人多于关心自己的人，他又看向雷琪儿，她抖得似乎更厉害了。叶空已经很久没用过那东西了，现在似乎又到了它派上用场的时候了。\r\n    叶空一边在衣袋里掏着，一边走到雷琪儿身边，道：“你很冷吧。这……”\r\n    他话还未说完，一直沉默着的雷琪儿忽然道：“别出声！我在听上面的动静。”\r\n    叶空立即闭上了嘴，他从衣袋里掏出了那奇特的戒指，递向雷琪儿。\r\n    雷琪儿不解的问道：“你干什么呢？”她的脸本已冻得通红了，这时却似乎更红了些。\r\n    叶空轻声道：“拿着，暖和的。”\r\n    雷琪儿下意识的接过了戒指，那神奇的温热的戒指入手的瞬间，她不只感到全身都暖和起来了，更有一种说不出的舒服感觉。雷琪儿从没见过叶空戴这戒指，一时好奇地问：“这东西你是从哪里弄到的？”\r\n    叶空答道：“这可是我从出生开始就戴在身上的宝贝，现在可只是借给你的。它的用处可大呢，似乎无所不能的样子。”\r\n    雷琪儿似乎明白了这戒指的用途，因为它的确给了她一种无所不能的感觉，就像童话中能实现任何愿望的宝物一般。她又问：“那我怎么从没看你用过这东西？还有，有了它，你以前又怎么会挨饿的？”\r\n    叶空想了想，道：“以前是因为一个奇怪的想法而没用它，后来，爷爷说过，最好尽量少用它，以免被它鼓惑。”\r\n    雷琪儿忽然笑道：“怎么可能，它不过是个死东西，怎么会迷惑人呢。有这么好的东西不用才是浪费呢。”\r\n    叶空仔细盯着她，忽然道：“雷琪儿，你变了？一点也不像以前的你了，你没事吧？”\r\n    雷琪儿终于意识到不对劲。她仔细想来，仅仅是握着这魔戒，自己就已经性情大变了，看来它真的有些鼓惑人的特殊能力呢。\r\n    雷琪儿立刻将戒指递还给叶空，他却没有收下，只笑着说：“你没事就好，爷爷说得果然没错。爷爷也说过，不许要避开它的，我们一起拿着好了，这样既暖和又不容易被鼓惑。”他说着已经伸出了一只手捏住了戒指另一端。\r\n    雷琪儿没有反对，听了叶空的提醒，她已有了警觉，而那戒指中的魔力似乎并不招惹有防备的人。她想了想，又问：“空，你带着这东西这么多年，怎么都没事的？”\r\n    叶空笑道：“我也不知道它的确会鼓惑人的。爷爷曾说过，能戴这戒指的人不多，它不仅会影响人的性情，更会特别针对性格孤僻的人。不过它毕竟是我从出生开始就拥有的宝贝，爷爷也没叫我丢掉，只说要多跟别人相处，变得开朗些就不容易被它影响了。不过我自己倒觉得，它是从没想过伤害我的，我们是患难与共的同伴嘛。记得我以前一个人的时候，就经常跟它说话的。”\r\n    雷琪儿突然听到了一个细微声音，这才想起自己只顾着跟叶空说话，听漏上边抓他们的那些人的谈话了。她马上做了个禁声的手势，向叶空指了指上边，自己将耳朵贴在了厚重的木板上。只是那群人离得似乎比较远，除了那青发青年的叫声，雷琪儿就什么也听不到了。\r\n    叶空明白了雷琪儿的意思，他很快从自己随身的小包里掏出了个奇怪的耳朵型的器具，贴在了木版上，外边的声音一下子响亮多了。叶空得意地看了一眼雷琪儿，似乎在问：“我的发明还不赖吧。”\r\n    不过他没想到的是，雷琪儿不但没有想，反而似乎有些愤怒地问：“你做这种东西想干什么？”她想到自己的那些自言自语有被他偷听的可能，实在紧张得不得了。\r\n    叶空也想到，窃听器这种东西似乎的确不值得炫耀，只好打哈哈道：“恩，这个，还是先听听外边的动静吧。”\r\n    两人都想知道这些人为什么要绑架他们，不过外面的佣兵们在等待的时候，谈论的是他们自己。\r\n    -----------------------------------------------------------   \r\n    四个佣兵各自单独站在房内的四边，青发青年首先抱怨道：“老鼠，我们到底什么时候才干得出一翻大事业啊，这些什么乱七八糟的任务我都做烦了。”\r\n    老鼠脸答道：“你小子实力不怎样，就知道异想天开。你根本就不了解自己在我们的世界里是个什么角色。哎，我们在自由都市里只不过是个不入流的小佣兵团，根本没有与其他人竞争的实力。现在这世道，能有委托给我们已经算是万幸了，想干大事，就你那点本事，千万条命也不够人家杀的。”\r\n    青发嘟囔道：“可是这样好无聊哦，你们倒好，在那以前那个乱世里打过滚，活得多滋润啊。我们呢，在那个时代最后几年才出生，还没长大战争就结束了，佣兵的生意也很快变得冷清了。”\r\n    老鼠脸听了，并没有回答，只是苦笑着看向了另一边的黑古。如哑巴般沉默的黑古居然说话了，他道：“绝大部分委托都是充当炮灰这类工作，同等的实力下在以一敌十、以一敌百的战斗中活下来，只有这样才能拿到赏金，活得下去。走上了这条路，就再没有回头的可能，唯一的解脱方法只有死。这些事，你们也许永远不会明白的。”\r\n    老鼠脸补充道：“在自由都市里，佣兵是比杀手更为艰难的职业。杀手只要杀得了目标，就能活得下来，委托人至少会考虑一下杀手的能力。而佣兵，委托人只负责事后给钱，而能完成任务回来的人是越少越好。我们团原本也有六七十号人，可大战后活下来的就只剩我们俩了。”老鼠脸说完长叹了一声。\r\n    \r\n    沉默了半晌，四个佣兵同时听到了马蹄声，他们的委托人似乎来了。\r\n    打开门的男人没有打招呼就直接走到了几人面前。那人没说话，老鼠却先道：“你要的人我们已经带来了，你可以自己去验。我们要的钱的呢？”\r\n    那男人沉默了一会儿，忽然道：“你们做得很好，人我不需要验了。不过我还需要你们做件事。”\r\n    老鼠脸又提出新的要求了，皱眉道：“这和事先说好的可不一样。”\r\n    那男人道：“其实这件事对你们来说是再简单不过了。”\r\n    老鼠脸忽然有种不好的预感。而就在那人要说出那件事时，黑古已经冲了过去，显然他比老鼠脸更清晰地感觉到了危险。不过那神秘人显然不是他们能对付的，他开口道：“这件事就是，请你们也在这里安息！”话音刚落，两个青年和老鼠脸都还没得及行动，连冲得最快的黑古也还没冲到那人跟前，整个屋子都在一瞬间结起了厚实的一层寒冰，四个人在第一时间成了冰雕。\r\n    -----------------------------------------------------------    \r\n    叶空和雷琪儿被从缝屑穿透进来的冰渣吓了一跳，他们想再次探听时已经什么都听不清了。两人只知道那神秘人在外边停了一会儿，轻声说了句什么后便离开了。\r\n    这一变故让叶空更摸不着头脑了，那个神秘人既然要拜托别人将雷琪儿劫出来，却又为什么在将这些人都灭口后，又独自走了呢。那个人到底想干什么呢，叶空越想越疑惑。\r\n    叶空立刻想到了个比起了解真相更大的问题，他们俩貌似被困在这里了的样子……\r\n    雷琪儿身子忽然又抖了一下，道：“我们就要死在这里了吗？”她努力敲了敲头上的木板，忽然又转向叶空，问：“那个戒指能不能带我们出去？”\r\n    叶空想了想，沉稳地道：“没事的，不用戒指我们也能出去的。”他说着又抱起他的小包找了起来。\r\n    叶空先是找出了几颗没写名字的弹丸，试着往地上一砸。弹丸爆裂的时候，一圈火焰在他们周围燃起，照得两人的脸红红的。\r\n    叶空楞了十几秒，然后突然醒悟过来了，笨手笨脚地开始找东西灭火，这里边空气本来就闷得够戗，这火烧久了不把他们闷死才怪。不过他做的火焰丸的火也不是好灭的，直到他找出自己做的冰冻弹之后，才将那特殊的火焰灭掉了。\r\n    叶空刚扑灭了活，又开始翻找起来，过了会儿后，他又找出了另外几颗标着“爆”字样的弹丸，这次似乎是找对了。\r\n    两人走得远了些后，他使劲将弹丸砸向了木板。\r\n    就在那些东西快触地时，叶空又是恍然大悟似的想起了那东西的威力，他赶紧将雷琪儿扑倒在地。\r\n    随即，一声震耳欲聋的爆炸声响起，整个房子仿佛都被轰飞了似的……\r\n\r\n\r\n\r\n\r\n	脱困			Paragraph	2021-05-30	30000549
31000129	106	2021-05-30	                                  第六章 决计流浪\r\n    黄昏时分，瑟斯城外多了一片废墟。在爆炸之后好一会儿，废墟里才缓缓地爬出来了两个小黑人。\r\n    叶空一边拍着身上的尘土，一边傻笑的道：“以后再也不干这种傻事了，我还以为死定了呢。”  \r\n    雷琪儿面无表情的问道：“你能记得住就好了，八成三天不到又会忘掉的。”她并没有多说，显然也是拿叶空这性子没办法，很快转换话题道：“现在我们去哪？马上就要天黑了。”\r\n    叶空想了想，道：“去找个人家借宿吧。我们也不知道这里是哪里，要想回去就只能找人问路了。”圣联里绝大多数人都是友善待客的，两个孩子只要能找得到人家，就不愁没地方吃饭睡觉。\r\n    满面污垢的两人没过多久就找到了一处人家，女主人看两人这可怜样子，和蔼地带着他们进了屋。主人家并没有多问什么，先是烧水让他们俩洗了澡，然后一起和和气气地吃了饭，还给把自己孩子的那间房让给了他们。     \r\n    入夜后，叶空很快就熟睡了过去。而雷琪儿却怎么也睡不着，最后独自一人走出了门去。    \r\n    雷琪儿若有所思的漫步在主人家的小院子里，却遇到了主人家的小女儿穆瑞耳。\r\n    比雷琪儿小不了多少的穆瑞耳比起她可就普通得多，调皮可爱得多了。穆瑞耳一看见雷琪儿就想溜了，但她当然快不过雷琪儿，才转身想跑时，雷琪儿已经到了她身前，问道：“这么晚了，你跑出来干什么？”\r\n    雷琪儿的语气就好像是她父母的责问似的，穆瑞耳条件反射式地答道：“出来玩，出来玩的。”\r\n    雷琪儿这下反而不知道说什么了，不比别人大多少的她自己不也独自跑出来了。她顿了顿，道：“自己小心点，晚上看不见，不知道哪里有危险呢。还有，早点回屋里去。”穆瑞耳和她并不熟，却似乎很听话的点着头，一边还答道：“哦，谢谢姐姐。”雷琪儿从来没有过姐妹，听她这么说时，反而有种很奇怪的感觉。\r\n    穆瑞耳正想跑到其他地方去玩时，她的父亲正好出现了。他慢慢的走了过来，轻声斥责穆瑞耳道：“总喜欢偷跑出来，以后不许这样了，知道吗？要是再让我抓到……”\r\n    他还没说完，雷琪儿却突然插话道：“是我无聊了才叫妹妹出来的，不是她的错，对不起。”\r\n    穆瑞耳不知道这个相识不久的姐姐为什么会替她说话，正一脸疑惑地看着她。穆瑞耳的父亲显然相信了雷琪儿的话，向她笑道：“是这样啊，那就没什么了。”\r\n    他顿了顿，又问道：“对了，雷琪儿，你和你弟弟又为什么会到这里来呢？恩，我也只是有些好奇而已。我感觉你好象有些心绪不宁的样子，才想问问你的苦恼的，也许我们能够帮上什么忙的。你如果不想说就不说好了。”\r\n    雷琪儿想了好一会儿，终于道：“我们的家人在一场意外里死了，我们是到瑟斯城去投奔亲戚的。只不过，我不太想去找那个人，我跟他有点仇恨。”上边帮穆瑞耳开脱的那个是雷琪儿的第一个谎言，但这个却不是她的，而是叶空那鬼精灵编的。\r\n    主人家道：“原来你们还遭遇了这样的不幸啊。不过你一个小姑娘又怎么会跟亲戚结仇呢？”\r\n    雷琪儿想也不想地道：“他对不起我母亲。”\r\n    主人家想了想道：“哦，你还真是个孝顺孩子。恩，我想，如果你们不想去投奔那个亲戚，不妨就跟我们住到一起吧。有血缘的人不一定能有亲情，没有血缘也是有可能像一家人那样和睦相处的，不是吗？雷琪儿和你弟弟又都是那么聪明那么懂事。”                           \r\n    雷琪儿经他这一提醒，忽然想到了另一件事。她的确不一定要回到那里的。\r\n    -----------------------------------------------------\r\n    第二天一早，叶空和雷琪儿就起程了。\r\n    叶空正想朝瑟斯城的方向前进时，雷琪儿就道：“你自己一个人回去吧。我暂时不会回去了。”\r\n    叶空完全没想过她会说这话，疑惑地问：“为什么呢？”\r\n    雷琪儿道：“在他的道场里再怎么努力，我也赢不了他。只有出去闯荡，在实战中提高自己，我才有跟他打败他的可能。”\r\n    叶空问：“你说的是院长大人？”\r\n    雷琪儿点点头。\r\n    叶空又问：“可是为什么呢？为什么你一定要赢你父亲？”\r\n    雷琪儿道：“他根本就不能算是我父亲，他从来都没疼惜过我母亲。”                                                                                                          \r\n    叶空不知该说什么，雷琪儿继续道：“我曾听老仆人说过，我母亲虽然从小就与他定了婚，但他只顾着练自己的剑，根本不关心我母亲。后来母亲跟一个从外地来的年轻男子相爱，还跟着他私奔了。但后来，她还是被抓了回来。老仆人还听到了他们两人的争吵，母亲是被强逼着嫁给他的。而且，即使是母亲死后，他也从没到他坟前去看过。”\r\n    雷琪儿歇了一下，道：“所以我说我的家根本就不算是个家，那个人根本就不算是我父亲。我留在那里只是为了能练好剑打败他，要他在我母亲的墓前认错。”她越说越激动，脸都气红了的样子。\r\n    叶空还是第一次听她自己说起过她的身世，一时也不知该说什么。他呆立了半晌，突然笑道：“不回去就不回去好了，爷爷说过我们该互相帮助的，反正你去哪我就跟到哪就是了。”\r\n    雷琪儿道：“随便你。”她却没想过，根本什么都不会的自己该怎么在外面的世界活下去。\r\n    叶空忽然问道：“可是，我们该去哪呢？”\r\n    雷琪儿只想着要出去闯荡，也没想过到底要去哪里，这时只得反问：“你觉得呢？”\r\n    叶空道：“那不如就去魔法帝国吧，听说那里有很多精通魔法的大魔法师呢。然后再向东到铁血帝国奥弗尔去，听说那里有很多出名的战士，你也许可以向那些人学剑术呢。”他自顾自地说着，不过雷琪儿显然也没有什么不同的意见。\r\n    叶空忽然听下了刚才的话，道：“不过，在这之前还有一件事得做。”\r\n    --------------------------------------------------\r\n    学院的人们很快就发现雷琪儿和叶空都不见了，大家一起搜索了很久都没能找到。经过几天的搜索都得到没有半点消息，院长费雷只得放弃了。\r\n    彼得最是不甘心，他很担心叶空的安危，独自一人又多寻了一天。这天天快黑的时候，有一个陌生人来找他。那人只说一个孩子要他带一句话给他：“我要去外面的世界去看看了，你好好为自己的事努力吧。”\r\n    这一天，叶空和雷琪儿带着些许愉悦塌上了征程，开始了他们俩的流浪之旅。\r\n    一个月后的一天,一个叫忒河的行商正带着自己的车队向大城市走去。\r\n    在一处森林边，忒河遇到了两个灰头土脸的小孩。他不禁问两人道：“你们是哪家的孩子，怎么跑到林子里去了？你们可知道里面有多危险？”\r\n    其中男孩答道道：“我们本来是要去下一个城市的，结果却在这森林里撞见了只炎魔犬。我一时好奇去捉弄它，结果差点被它咬死了。那个家伙可真够难对付的，我们费了半天劲才把他弄倒下。”\r\n    他停了停，自言自语似地道：“我以后再也不随便惹那些魔兽了。”\r\n    忒河可听说过魔兽的厉害，眼前这一男一女两个十一、二岁的孩子怎么可能从魔兽那里生还出来。他再仔细看了看两个孩子的样子，瘦弱的身子上都或多或少有些血迹，却似乎并不是他们自己的，女孩手上还有把锋利的长剑。\r\n    忒河心里已有了数，不过他也不便说破，只笑着道：“两个孩子这么勇敢，还不错嘛。对了你们不是要去下一个城吗，就跟着我走好了。跟着我们你们不用愁吃穿的。”忒河是个很豪爽的人，帮些素不相识的人是常事，即便这两个孩子想骗他。\r\n    叶空笑笑道：“这样也好，我听别人说这附近有股不太强的强盗，一起走也好有个照应。”忒河没等他说完，已经大笑着拉两人进了他自己的车子。车队也继续前进了。\r\n    车队走到一处地势险峻的山地旁时，突然出了变故，一群强盗骑着马从暗出呼啸着疾冲了出来。\r\n    忒河根本没想到他走过无数次的这条路上真的出了股强盗了，从不雇佣护卫的他这下子栽了，他一时慌了神愣住了。车队里其他人更是无措，几乎全都条下车四散逃去，希望这些人只抢东西不追杀人才好。\r\n    忒河此刻后悔不已，他的全部家当都在这车队里了，他实在丢不起这些东西。太豪爽太大度的他始终都没能赚到大钱，年过四十了却连老婆都没娶到。要是再把这些货物丢了，他真是很难活得下去了。\r\n    车队里唯一没有慌的只有雷琪儿了。叶空根本制止不住车上的人们亡命的奔逃，也有些慌可，只得问她：“现在怎么办？”\r\n    雷琪儿平静地道：“你先保护好那个大叔和车子，用你那些火弹。我先顶着。”她说着已经提着长剑向前冲去，这剑是他特地回那废墟捡的那带满首饰的青年的剑，对于身材娇小的她实在太长了。\r\n    冲过来的强盗没想到在其他人都逃窜的时候，一个小女孩居然提着把跟身体完全不相称的长剑相阻挡他们。其中一个强盗叫嚣着冲了过来，刺出了长矛。结果被雷琪儿轻松闪过，挥剑砍去，剑尖刚好砍中强盗的手。她用的力道并不大，那个强盗却以为自己手断了似得惊叫一声落下马来。雷琪儿很快又迎上了下一个敌人。\r\n    叶空自己的确没什么战斗力，他的异能此刻也没有发动。不过在这种战斗中，他那些千奇百怪的发明却显然能派上用场。正当几个强盗冲向没有叶空和他旁边呆住了的忒河时，叶空接连丢出了三枚火弹，火弹爆炸时，自动地形成了大中小三个火圈，将叶空和忒河团团包围了起来。强盗们的战马畏惧火光，不敢冲进火中去。叶空自己安全以后，又掏出些爆弹，一看见哪个人想靠近载货的车子，就用劲全力砸一个过去，他的爆弹威力可是很恐怖的，只不过叶空手力太差，总是丢不到强盗身边去。连续两声轰隆之后，虽没炸到人，却把大部分战马都吓慌了，一些强盗驾御不住惊马还被摔了下来。\r\n    这伙强盗也是倒霉，一趟抢劫不仅什么都没抢到，却既受惊又受伤的。强盗首领犹豫了一会儿，只得吹了个口哨带着人马撤离了。\r\n    忒河很久之后才从惊讶中回过神来，惊讶地看着面前的两个孩子。\r\n    叶空对他笑道：“怎么样，这下相信我们的实力了吧。”\r\n    忒河疑惑道：“你知道我不相信你们？”\r\n    叶空道：“就是知道，才没说要你雇佣我们当保镖的呢。你看我们帮你保下了这么多东西，总得给点好处吧。”他说着拂着下颚道：“恩，我记得我们这里的佣兵的佣金很便宜的，好像是几金的样子。”\r\n    忒河看他那沉思的小大人样子，忽然笑道：“好好，佣金我一定付齐。这一趟商我们就一起走完吧。”\r\n    其他人也算着强盗该走的大概时间回来了，车队再次上路了。\r\n    ---------------------------------------\r\n    叶空的一举一动都落到了某些人（应该说是某些神）的眼睛里。\r\n    在不为人知的一个奇特领域邪神殿内，正中间的墙壁挂着一面魔镜，镜中映出的正是叶空和雷琪儿的身影。不过大邪神这次却笑不出来了，笑的是肖，他道：“这次该算是我赢了吧，那叶空既不是穷凶恶极的坏蛋，也不是呆头呆脑的傻瓜，正相反的，是个既聪明又心地善良的孩子。”\r\n    邪神气恼地道：“就算你赢了好了，也就是让你先留条命，才玩得了后面更精彩的游戏。你可别得意。”\r\n    肖苦笑道：“我什么时候又得意得过呢，你想杀我随时都可以动手，我又能有什么办法？不过，你也不想想圣联的民风，把那孩子送到那里他怎么可能凶恶得起来。”\r\n    邪神摸了摸脑袋，道：“我可是深思熟虑了之后才决定的，那地方不就出过那个叫死灵君王的家伙吗？”\r\n    肖的脸沉了下来，道：“罗德完全是个另类，即便是由你来悉心培养，给人完全等同于他的环境，恐怕也出不了他那样的人的。”\r\n    邪神叹道：“哎，真是失败了。”他正说着，忽然又想起了肖以前那个随从，问道：“你以前带的那个杀手呢？”\r\n    肖道：“你不会自己找？以你的实力，这世上有什么能逃得过你的神识？”\r\n    邪神道：“我可早就闭了神识了，什么都看到了还有什么意思呢？”\r\n    肖听了，道：“就算闭了神识，你随便算一算不就知道了嘛。”他停了停，接着道：“我带他去了冥界，请冥神帮他重生了，然后送他回他能回的地方了。”\r\n    邪神笑道：“你倒有点能耐呢，连冥神那老顽固也说得动。”\r\n    肖苦笑道：“冥神虽然的确有些死板，却比你这个蛮不将理逼赌的家伙好相处多了。”\r\n    邪神故作神秘地道：“那你知不知道冥神的本名是什么？”\r\n    这种事肖当然不知道，知道主神本名的人并不多，他问：“是什么？”\r\n    邪神奸笑着道：“你猜呢？”\r\n    肖想了想，问：“他的本名跟死板有关？还是说，你的意思是他不算个容易相处的人？”\r\n    邪神没有回答，只道：“跟你猜谜还真无聊呢。”无疑是承认了肖的猜想中有一个是正确的。\r\n    邪神很快又回到了刚才的话题，他道：“肖，你说我们是不是该停下我们之间的对斗，一起看看那些小家伙的成长？”\r\n    肖道：“什么对斗呢，根本就是你不停地给我找麻烦，你不闹我可省心多了。不过……”\r\n    肖也有个疑惑：“对了，叶空那孩子身上的空间异能又是怎么回事，我第一次把戒指给他的时候他可普通得很。你可不像那种会给你的小老鼠留保命本事的人。”\r\n    邪神笑道：“在三秒内连续空间传送上千次，带上点异能也不奇怪嘛。”\r\n    肖一听就明白了，这家伙原来还在这里动了心思的，他道：“亏你说得出来呢。连我都不一定做到在那么短的时间内空间传送那么多次。你真是……”\r\n    邪神讪笑道：“传送的时候我可是很好地保护着他的身体的，只不过是想把小家伙变成个傻子而已。结果他小时侯虽然有些呆，越长大也就越聪明了。”他又开始感叹自己的失败了。\r\n    肖重新看向了魔镜中的叶空，自言自语似地道：“那孩子的路也不好走。跟我们所出的这个阶层扯上关系后，苦难绝对不少啊。” \r\n    \r\n\r\n	决计流浪			Paragraph	2021-05-30	30000549
31000130	107	2021-05-30	                              第七章 刁蛮公主\r\n    欧尔若大陆上的五大国家的分布基本上是东南西北中的形式。魔法帝国占据了大陆北部的大片土地，是五大国中占地最广的一国，但其人口数却并不比只有它五分之一土地的圣联多多少，可算是真正的地广人稀。\r\n    魔法帝国的西边是这世界的边界之一，保护这个世界不受异世界生物侵略的远古结界所在的远古森林。除了例行为结界注入魔力的魔法师队伍，这里很少会有人类出现，连飞禽走兽也少之又少。帝国中部是零星分布着沼泽、山峰、峡谷地形复杂的大丘岭。这片地区虽是帝国的发源地，但也同样有狼人、魔兽、精灵、妖精等众多种族隐藏其中，人们为了防备其他种族的袭击，大多以村镇的方式聚居在一起，几乎没什么发达的大城市。只有西南边与圣联接壤的地方有几个较大的城市，正因此帝国才能将疆界扩得如此宽广。帝国北部是大片冰原，再向外就是无边的冷风彻骨的大海了。惟有东部的平原内，聚居着帝国大部分的子民。这片地区的人们以几个大城市为焦点依次铺开，大道旁随时都可能现出一两座房屋来。而平原最中心的城市，便是雷萨之城了。\r\n    雷萨之城，以魔法帝国第二位魔法皇帝雷萨之名命名的城市，是帝国里最繁荣昌盛的城市。虽然在名义上雷萨之城要居于神秘的皇都亚特兰帝斯城之下，但实际上，雷萨之城才是帝国的政治、经济、军事和文化的中心。更特别值得一提的是，自二十年前的大战完结后，帝国的象征女王陛下也住进了雷萨的皇宫里，亚特兰帝斯已成了故都了。所以说雷萨才是真正的帝国首府，同时也是旅行者们决不该错过的美丽城市。\r\n    而此时雷萨城郊的一个小村镇里，叶空和雷琪儿正一边走在人群中一边漫漫谈着。十六岁的叶空又长大了很多，不过那嘻嘻哈哈的性格倒没变多少，对魔法的研究兴趣也是有增无减。雷琪儿则已长成个漂亮女孩了，戎装配剑样子再加上那冰冷的神情，更给人英姿飒爽之感。\r\n    他们走的这条街是专卖魔法器具的，他边走边笑道：“雷萨城果然名不虚传，城郊小镇的摊子上都是那么多希奇古怪的玩意。”\r\n    雷琪儿走在前边，看也没看地道：“别再看了，这种地方哪会有你用得上的东西。还是先进城把你老师交代的事情办完。”\r\n    叶空道：“何必走那么快呢，老师交代的事反正也不及。而且这些地方可也是有可能买到好东西的，反正我要的又不是东西本身，而是这些奇特物品的制造原理。老师说过，创造的灵感可都是从用处不大的东西上得来的。”他说着走进一个小摊边挑了起来，雷琪儿也只好停了下来。\r\n    摊主殷勤地招呼道：“小兄弟，你想要些什么啊？你别看我这摊子小，好东西可是有不少。就比如这个，这个雷光剑，看这闪闪发光的样子，触手酥麻的感觉，可是很不错的魔法武器。还有这个碎冰匕首，只要狠狠插在地上，就像这样，匕尖就会透出一阵寒气将刺中的东西冻住。很厉害是吧，说实话，我卖的东西可不像那些旁边那几个那样没水准。”他边说边演示给叶空看，剑上的确有光，匕首也的确弄出了冰来。\r\n    摊主话说得快，动作也根本没停过，完全没有叶空插嘴的机会。叶空当然看得出他是在装神弄鬼糊弄小孩，不过也不好意思点破，只好带着一脸无奈的笑容望着摊主。反倒是一旁站得远远的雷琪儿忽然冷声道：“假货你也看那么久，快走了。”\r\n    那摊主没想到这么个年轻女孩也能看透他的把戏，而眼前男孩摇头欲走的样子更是让他明白自己遇上了行家。旁边的一个摊主看他的谎言被人点破，也是暗暗发笑。羞愧的神色从他脸上转瞬即逝，摊主不服气地拉住了正要离开的叶空，正色道：“你等等，我这里确实有个好东西，你们也许会想要的。”他从自己的大袋子翻找出一个精致的魔法盒，完全没注意叶空奇怪的神色，夸夸其谈道：“这是个很厉害的魔器，它的作用是营造一个防御结界将自己完美的保护起来。虽然不能用于杀伤敌人，可却是最好的防身的用具。结界可不是人力能够打破的东西，据说它制造出来的结界能跟大魔导士的结界媲美呢，只要有了它，不管遇到什么样的敌人，你都已经立于不败之地了。它可是近年来魔法界新近的那个奇人制造的，他的名字不用我说你们也应该有所耳闻的吧。这可是我的镇摊之宝了，要不是遇到你这样的有缘人，出再高的价钱我也是不会卖的。卖掉了它我这摊子也摆不下去了……”\r\n    这人的口才还真不一般，叶空完全没弄明白他到底是怎么将自己口袋里最后几个金币弄走的。直到那人收上摊子毅然决然地离开已后，叶空只能对着那个魔法盒无奈的苦笑。旁边的那个摊主却知道这东西的确是真货了，绝对值十个金币以上，他正疑惑地望着这个少年，不知他为什么得了便宜却这样苦着脸。\r\n    雷琪儿显然知道原因，她忽然笑了，打趣道：“这次你可没亏。虽然那个盒子制造的结界的强度不怎么样，倒还是值几个钱的。”\r\n    叶空苦笑道：“我自己亲手做的东西我还不了解吗，怎么又从别人手里买回来了呢，真是……”叶空翻过盒子，盒子底的正中就印着个清晰的“叶”字。       \r\n   \r\n    叶空两人正准备往前走，人群里忽然出了骚乱。一个十五六岁的女孩从人群里窜了出来，后边追着几个大汉。那女孩跑得很快又慌张不已，一见前边挡着人，立即左转，结果恰好跟站在那里看情况的叶空撞了个满怀。叶空只感觉一阵香气扑鼻，一个软玉般的身体撞到了身上。\r\n    叶空还没反应过来，那女孩已最快速度退开了。只是她还来不及感到羞窘，后边的人已经追来了，她正不知往何处躲，忽然看到旁边一人握着把长剑，二话没说立即躲到了那人身后。\r\n    追来的六七个大汉很快围向了叶空三人。那女孩直到这时才有时间看清自己前边这剑士的真面目。这一看她不仅后悔了，她面前这人不但是个女人，还是个跟她自己一样苗条标致的女孩子。而那女剑士，此刻正面无表情地回头看着她。\r\n    女孩想继续逃已经来不及了，几个大汉分头包围了他们三人，而其中最魁梧的一个黑脸汉子正面走向了他们。行人们显然都知道这些人的凶恶，有的退出了这条街，有的躲进了旁边的店里，道路上很快只有了这几个人。黑汉走到他们身前，厉声对这两个见了他们还不退避的年轻人道：“把那个小姑娘交出来！”\r\n    一看就知道这几个不是好人，不过叶空并不知道情况，他带着询问似地眼神看向了雷琪儿身后的女孩子。原本已有些胆怯的女孩知道逃不掉了，索性大声地道：“偷了你的钱袋又怎么样，你们的钱还不是从别人家里强抢来的。你们凭什么抓我，要是我回了家，一定要爸爸把你们这些坏蛋抓光。”黑脸汉子脸色忽然变得铁青，他显然从这话里听出了些东西，又向前迈了一大步，右手的大剑也立了起来。\r\n    叶空似乎有些明白了，收保护费这类事他们也见过不少。不过叶空是个不喜欢惹麻烦的人，他走上前，笑着对黑汉道：“这位大哥，有话好好说，不必动刀动枪的吧。”\r\n    没想到那黑汉不但不听他的话，反而用左手掐向了他的脖子。叶空没想到这恶霸这么瞒不讲理，连他这局外人也要攻击，没有防备之下被对方掐住咽喉轻松地提了起来。叶空一时感觉呼吸不畅，身体被人提起来的感觉很是不舒服。\r\n    叶空被对方制住，最先动的当然是他旁边的雷琪儿。她疾速拔剑直抵黑汉的咽喉，冷声道：“放下他。”\r\n    那黑汉明明看清了旁边女剑士的动作，却完全根本上她的速度，刚想挥动自己的大剑，对方的剑尖已经划到了自己喉咙边。旁边几个大汉正想向这边靠拢，却没料到那女剑士速度那么快，老大被别人威胁了，这几人也不太敢进前了。\r\n    不过毕竟在这里当惯了地头蛇，那黑汉显然没脸退缩，毕竟他手上还有个人质。他相信只要自己一用力，手上这个弱不禁风的少年就会死得很惨，于是他恶狠狠地向雷琪儿道：“放下你的剑，要不然我就掐死他。”他正想稍微掐一下这少年，却不料自己的手忽然地握空了，而刚才他握在手上的少年则站在他面前捂着脖子夸张地喘着气。\r\n    旁人都以为是黑汉自己将那少年放掉的，只有他自己知道不是。当了这么多年的恶霸，他也并非是个孤陋寡闻的人，黑汉此刻才知道眼前这几人并不是普通人。他现在已经没了人质，也明显胜不过那女剑士，留在这里已没什么意义了，于是狠狠地哼了一声，转身便走。雷琪儿和叶空都没有留下这几人多一事不如少一事。雷琪儿抽剑回鞘，静静地看着刚才气势凶凶冲过来的一群人灰溜溜地走了回去。\r\n    这时那女孩又说话了，她向雷琪儿道：“姐姐你好厉害啊。”雷琪儿不见得比那女孩大，但她的飒爽英姿却明显给了那女孩大姐一样的感觉。\r\n    雷琪儿冷声道：“你一个富家小姐跑出来干嘛，还到处惹事，不知道危险？”    \r\n    叶空当然也看得出女孩的装束虽古朴，布料和样式却很讲究，明显不是普通人家的孩子。再加上刚才的话，这女孩是个贵族千金无疑。他于是接口道：“就是。你一个小女孩惹上这些地头蛇，可没办法再在这里游荡了，还是回家去吧。”\r\n    那女孩显然很不满他这个“小”字，道：“我都十六岁了，哪里小了。没准比你还大呢，小弟弟！”\r\n    叶空也不生气，仍旧是满脸笑容地道：“算你不小好了吧。那大小姐，你是不是该回家了呢。”\r\n    女孩道：“我家在雷克萨城里。回去之前，总得把我偷出来的钱袋还给那些人家吧。”她说着果真从衣服里摸出了个钱袋。\r\n    这女孩不知是习惯了使唤人，还是认定叶空乐于助人，另一只手拉上他就开走，同时道：“你们也得跟我一起去。要不然那些坏蛋再来找麻烦怎么办？”女孩想了想，又道：“对了，你们如果没事就跟我一起进城吧，就算是我的保镖好了。到了我家，我父亲一定会好好酬谢你们的。”她说得很快，根本没给叶空留拒绝的时间。\r\n    叶空只得苦笑，让这么个大小姐一个人乱走也的确不妥，帮助别人的事他又从来没拒绝过，这时似乎也只能跟着她走了。还好那女孩的家跟他们的目的地相同，跟着她走也没什么大不了的。\r\n    一路走来那女孩一直说个不停，她的名字叫伊丽莎。伊丽莎显然是个没见过世面的贵族孩子，对什么都好奇不已，一路上问题不断。不过还好有个耐性特好又见多识广的叶空跟在旁边，每问必答，倒是满足了她的好奇心。只有雷琪儿一个人静静地走在两人后边，什么话也不说。她一向都是这么寡言少语的，只有跟叶空稍微说得上几句。\r\n    \r\n    伊丽莎依次把钱还给那些小店店主的时候，其中不少人几乎跪了下来，一边感谢一边诉苦，激动得说话都语无伦次的了，显然那些恶霸把这个小镇的人们害得很苦。伊丽莎从来没受人这样感激过，脸上的表情明显的自豪起来，脑袋里更是已经幻想着回家以后要他爸爸来整治那帮坏蛋的情景了。\r\n    不过他们还没将钱全还回去，麻烦已经来了。一队小镇的卫兵赶来将他们三人团团围住了，队伍里走出几个人来，正中的守备队长旁边的一人指着叶空三人，向那队长道：“罗曼大人，扰乱治安、妨碍我们办事的就是他们。”这人就是刚才被雷琪儿赶走的那个黑脸汉子，只不过这时已经穿上了一身守备队的装束。\r\n    这个小镇的守备队长是在这远近很有名气的“荧雷剑士”罗曼，这个三十来岁全副武装的剑士用他锐利的眼神扫过了眼前几人，道：“你们胆子倒不小，居然敢在皇都近郊闹事，活得不耐烦了吗？”\r\n    伊丽莎看见这些兵匪勾结，一起欺负好人，正气不过想上前理论，一旁的叶空却挡在了她前边，笑道：“罗曼大人，久仰久仰。您大人大量，就放过我们几个吧，我保证不会再生事了，而且也马上就要离开这里了。”叶空一向都不爱惹是生非，更何况此时跟这些人冲突一点好处都没有。\r\n    罗曼旁边的黑汉大声道：“大人，您可不能放过这些人！要是放跑了他们，不知道又会出现多少违法乱纪、胡作非为的人啊。”\r\n    还没待罗曼反应，雷琪儿冷笑道：“还不知道到底谁才是违法乱纪、胡作非为的人呢，官匪勾结，监守自盗，还真是只有人渣才做得出来的事呢。”她说话时完全不留余地，显然想挑起事端的样子。听了她的话，罗曼和那黑汉的脸色都变了，一个疑惑了、另一个则铁青了。伊丽莎正高兴于有人帮那些受罪的人们出头，而叶空却很清楚，雷琪儿其实是想会会这个荧雷剑士。\r\n    罗曼很快恢复了庄重的神情，道：“不管事情究竟怎样，看来只有请你们跟我走一趟了。”\r\n    雷琪儿道：“那还要看你有没有那本事。”她话音刚落，剑已出鞘，直逼罗曼而去。\r\n    罗曼没想到这小女孩还有那么两手，就在他反应的时间里，剑已经快到他身前了。他赶紧后退，同时已并不比雷琪儿慢的速度抽剑，只见剑刃上雷光闪动，兹兹的嘶鸣声也那么的清晰，的确不愧为荧雷剑士。\r\n    两剑相击，强大的电流雷光在两剑之间传递。虽然雷琪儿的剑的剑柄是不导电的，但她还是感觉雷元素隔空传来，直击得她双手麻痹几乎握不住剑，脸上也刺痛得难受。剑击过后她立即退了回来。\r\n    雷系的魔法剑士果然不凡，雷琪儿知道不出全力恐怕是赢不了他的了。她没有一丝犹豫，立即运起斗气保住了全身，她的斗气虽然常人看不见，但罗曼显然从她头发的抖动看出了她斗气的强度，他的脸色更严肃了。与魔法剑士不同的是，正宗的高等剑士使用的是斗气，通过修炼斗气增强速度、力量以及防御能力。\r\n    眼看一场争斗再所难免之时，伊丽莎却走了出来。她虽然对这场战斗很好奇，不过看到对方雷光闪闪，嘶鸣不断的剑，以及那雷光映照下有些恐怖的脸，伊丽莎还是更担心雷琪儿姐姐的安危。伊丽莎走了过来，道：“别打了！那个叫罗曼的，你看看这个是什么？”\r\n    所有人都看向了伊丽莎，只见她手上正拿着个精致的徽章，纯银的镶边中间一个金色小盾，盾中间还刻着只金色狮鹫。普通人都知道这样的东西绝对是富贵人家才拥有的，而罗曼则更清楚它的意义。他忽然单膝跪地，庄重地向伊丽莎行礼道：“参见公主殿下。”\r\n    其他人显然都没想到这变故，就连叶空和雷琪儿也没想到伊丽莎会是公主。伊丽莎从容的收回了徽章，向罗曼道：“我们可以走了吧。”\r\n    罗曼显然不知道该怎么回答。伊丽莎又道：“以后你不许再欺负好人了，要是我知道了你们强抢人家的钱，非叫我爸爸招你们算帐不可。”她刚说完就拉起叶空开跑了，还愣着的叶空差点被她拖倒在地上。\r\n    伊丽莎当然不敢在这里停留，她自己回到家，偷跑出来的罪过还没那么严重，若是等她爸爸抓她回去，那可就不好办了。\r\n    \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n	刁蛮公主			Paragraph	2021-05-30	30000549
31000131	108	2021-05-30	                                第八章 废弃庄园\r\n    叶空、伊丽莎和雷琪儿两前一后的走在城郊路上。前边两人说说笑笑，后边这个却沉默不语，似乎正在思索着刚才的战斗。想到那把剑上闪动的雷光，雷琪儿并不确定自己是否能赢。\r\n    叶空和伊丽莎并没有注意雷琪儿凝重的神情，伊丽莎是不知道她的想法，叶空虽知道却并不在意，他们同行几年，日夜相伴，早就对对方的性情了如指掌了。\r\n    叶空对伊丽莎道：“真没想到你会是公主，这世上真是有许多难以置信的事呢。”\r\n    伊丽莎嘟着嘴不满地道：“有什么难以置信的？难道我没资格做公主，难道这个徽章是假的？”\r\n    叶空笑道：“就算有皇家徽章，也不一定就是传说中即将继承王位的那位公主嘛。我可听说魔法帝国的皇家徽章总共有四枚的。”\r\n    伊丽莎不屑地道：“四枚徽章除了二十多年前丢失的那枚和我手上这的这个，拿着另外两个的都是只知道传统和血缘的老古董，难道我会像那些老头子、老太婆吗？”\r\n    叶空忽然故作沉思地道：“经你这么一提醒，我倒是想起来了，听说魔法界那些老怪物们很多都会返老还童的法术呢。”\r\n    伊丽莎没太在意他的话，正想继续说，却忽然反应过来，气呼呼地道：“好哇，你骂我是老妖婆变的！”她说着伸过手来做出要打人的样子。\r\n    叶空嬉皮笑脸地讨饶道：“别打别打，我道歉行了吧。不过我可没说你是老妖婆变得嘛，是你自己乱理解我的话嘛。”\r\n    伊丽莎白了他一眼，问：“那你到底是什么意思？”\r\n    叶空仍是笑道：“你不是老妖婆变的，意思就是，是老妖婆变的你嘛。”叶空本以为伊丽莎会追着他打，可这话一出，伊丽莎反而气乐了，居然就站着不走了，还瞪着他笑。\r\n    叶空并没继续开玩笑，他望了望阴沉的天空，很快转换话题道：“哎，我们走得可真慢，天都快黑了，城门应该就快关闭了。恐怕我们只能在这郊外住一晚了。”\r\n    伊丽莎倒没太怄气，很快插嘴道：“还不是你在那条魔法用具的街上逗留了太久，我都说要早点回城里的，现在害得我们找不到地方住了吧。”\r\n    叶空道：“你好象没资格说我吧。你自己既然说了要早点回去，怎么又在卖首饰的店前看了那么久，我可是催了又催你就是不走的哦。”\r\n    伊丽莎显然还想争辩，不过他们身后的雷琪儿忽然说话了：“我们也许不需要露宿野外了，前边就有个庄园。”\r\n    叶空和伊丽莎一路走一路说话倒没太注意前方，此刻他们应声向前看去，远处果然有个庄园。\r\n    这个庄园与道路之间有些距离，叶空他们走进察看了之后才知道，它是借着地势修建成的，以天然的石壁为墙，整个庄园就像个小型山谷。不过可惜的是，这个庄园却似乎废弃了很久了，墙边杂草丛生，厚重的大门也布满了灰尘。\r\n    只是那门锁依旧坚固，伊丽莎试着努力推了几次，大门都纹丝不动，她只得苦笑着道：“这个庄园明显是废弃了的，结果我们还是只有露宿野外了。”\r\n    叶空什么也没说，走上前轻轻敲了敲门，只听得咚的一声，似乎那门锁掉到了地上。然后叶空使劲一推，大门很轻松地就被打开了。\r\n    伊丽莎一脸惊讶的望着他，问：“你是怎么打开锁的？”\r\n    叶空笑着指了指地上断裂了的锁，道：“我有点特别的能力。”\r\n    伊丽莎狐疑地问道：“你有开锁的能力？你该不会是个小偷吧？”\r\n    叶空苦笑道：“也不用这么说我吧。我用的是异能，异能者你总该听说过吧。”\r\n    伊丽莎道：“异能者我倒听说过，就是那些使用自身的特殊能力的，却既不算魔法师又不算剑士、骑士这样的武者的人。不过你拥有的是什么异能，我看你只是轻轻敲了敲门，那个大锁怎么就断了呢？”\r\n    叶空正要解释，雷琪儿却先一步走进门去，她回过头向叶空道：“这里边恐怕也没有房子可以住，你先把帐篷搭好，我进去看看。”\r\n    叶空没想到雷琪儿会比自己更好奇，他点了点头，然后回头继续跟伊丽莎聊起来。\r\n   \r\n    雷琪儿平时是不会对这些废弃之地这么好奇的，她最看重的是如何增强自己的实力。但这一次，她不知为何有这么一种直觉，这个地方她似乎应该仔细看看，仿佛这里隐藏着什么秘密似的。\r\n    这个庄园并不太大，但大门和四壁的防御很齐全，一边的农田边上有七八间屋子，显然是农民们的房子。除了农田，其他大多数土地都是园林了，曾经修剪整齐的花圃此时已经杂乱了，更多原本就保持自然的木林则生长得更茂密了，甚至已经有枝条爬上了庄园中那栋最大最豪华的房子了。雷琪儿看着这自然之中的房舍，忽然想起了家乡瑟斯之城，剑士学院里也是设计成这种贴近自然的样子的，整个学院都是草地，每个小院也总有些树木花草或者假山小池的。\r\n    雷琪儿并没在停留下来，她径直走向了大屋。屋门上尽是灰尘，虽然已经很陈旧了，却也不是轻松就能推开的。雷琪儿拔剑用力向门一挥，她的剑虽未碰到门，剑气却直接将大门劈成两断摔在了地上，同时发出啪的响声，灰尘飞扬。过了半晌，直到灰尘平静了些后，雷琪儿才轻声走进了屋子。\r\n    \r\n    天已经快黑尽了，叶空已经搭好了帐篷，一旁的伊丽莎却还是没能理解他所说的“背包”。伊丽莎只见他顺手一抓，手中就忽然有了个大帐篷，实在是万分的不解。叶空费了半天口舌还是没给她说明白，实在也是没有办法了，只好不在说了。他所拥有的空间异能实在很特别，别人不能理解也很正常。叶空至今没有看到过其他用这种能力的人，他于是自己将这种能力叫做“空间袋”。他先给物品作上记号，然后将它们放到稳定的外空间中，需要时再按记号提取，这样就可以不用搬运而能携带大量的东西了。这种能力对于长途旅行又喜好研究和收藏的他来说，实在是个很方便的能力。\r\n    叶空才搭好帐篷，伊丽莎的问题又来了：“我们只有一个帐篷吗？”\r\n    叶空没说什么的点了点头。\r\n    伊丽莎又问：“那难道我们两个女孩子要跟你一起睡？”\r\n    叶空一直都只备了一个帐篷的，一时还不知道怎么回答她了：“这个嘛……”\r\n    伊丽莎忽然红了脸，道：“难道你跟雷姐姐一直都睡一起的？”\r\n    叶空和雷琪儿在野外露宿时倒的确一直睡在一个帐篷里的，但是显然没发生过伊丽莎想的那种事。只是叶空这时显然也想到了她的心思，正不知该如何解释了。\r\n    解释不了就不解释了，很“看得开”的叶空可不像伊丽莎那样会那么容易陷入窘境。他看了看天，正疑惑雷琪儿怎么还不回来，于是道：“我去看看雷琪儿到哪去了，你在这里等着。”他不等伊丽莎回话就向庄园内走去。\r\n    伊丽莎虽然还红着脸，想想若是一个人呆在这里实在可怕，赶紧跟了过去。不过她没想到的是，自己才走出几步，忽然撞到了一面无形的墙，疼得哇地叫了出来。\r\n    叶空听到声音才想起忘了提醒她，连忙道：“我在帐篷周围放了个结界，虽然很弱，却还是可以保证你不被野兽袭击到的。你就在里边好好休息，我找到了雷琪儿就回来。”在帐篷边安置结界来保护自己已经成了他的习惯，虽然这次他用的是那个魔法盒，做出来的结界不算好，不过也应该不会有什么问题的。\r\n    \r\n    叶空很快也走到了庄园的大屋前，他看得出大门是被雷琪儿劈开的，而且她似乎还没出来。叶空没用多少时间就找到了雷琪儿，她正站在其中一间屋子中，望着一张画像发呆。\r\n    那张画是一个年轻女子的肖像，长发披肩、玲珑清秀的五官、温和的神情和沉静的眼眸，这显然是个难得一见的美女。不过叶空所看到的不仅是这些，他很快想起自己在另一个地方也看见过同这这一幅相似的画像，虽然出自不同的人，但两幅画所描绘的似乎都是这个沉静温和的女子。而且，她跟雷琪儿还有那么多相似的地方。\r\n    雷琪儿也并非完全呆住了，她知道叶空到了自己身边，看过了那画像。待叶空的眼神看向了自己时，她才静静地道：“你在我原来的房间里看过她的画像吧？”\r\n    叶空点了点头，迟疑了一下，道：“这个是你母亲？”\r\n    雷琪儿没有否认，这种时候没有否认当然就是承认。\r\n    雷琪儿再次拂了拂那画像，带着点忧伤的神色说：“空，还记得我们出来流浪的那天吧。”她没等叶空回答，问：“知道我为什么不回学院去吗？”\r\n    叶空想了想，道：“老实说，我倒的确有点好奇。我只知道当时学院里真正关心你的爷爷和那位老仆人都过逝了，你跟你父亲院长大人相处得很不好，其他的就不清楚了。为什么你要离开，为什么你总是努力想变强，这些我原先是想亲口问的，不过后来还是觉得由你自己说比较好。”\r\n    雷琪儿忽然笑了，不知是感谢他的理解，还是觉得他老实过头了呢。\r\n    她很快停住笑，开始叙述起自己的身世来：“劳伦斯爷爷和前一任院长是从小一起长大的好兄弟，他们各自成家后，在他们的子女都还很小的时候就相互定了亲，劳伦斯爷爷将尤妮丝也就是我母亲许配给了他。”\r\n    叶空知道雷琪儿说的“他”就是她父亲费雷院长，他知道以前她从来没叫过他一声父亲，甚至很多时候见到他都全不理睬。\r\n    雷琪儿的话音一转，道：“可是在结婚以前他就醉心剑术，完全忽视了我母亲，母亲又哭又闹他都完全不理，还独自搬到偏僻隐蔽的地方苦修去了。后来母亲救了一个外地人，后来跟他相恋还跟那个人私奔了。”\r\n    雷琪儿越说越激动了：“但是他们并没能真正跑掉，几年后‘他’的人又把母亲抓了回来。不仅强逼她嫁给他，最不可原谅是在母亲死后，他从来都没去她的墓前忏悔过，如果是他没脸面对她还好，不过他一直的那副高傲的样子明显是完全没有认错的意思。”\r\n    叶空帮她说道：“所以你才决定要出来历练，好回去压下‘他’的嚣张，让他给你母亲认错？”\r\n    雷琪儿点点头，道：“在他的道场里，我不管怎么努力恐怕都没办法超过他，所有我才决定出来闯荡。”她又停了下来，望着叶空问：“空，你会支持我吗？我，也许只是个复仇者而已。”\r\n    叶空也看着她，两人都沉默了一会儿，他才忽然笑道：“这好象是个不必要的问题嘛，我不支持你，还有谁支持你呢。”他没等雷琪儿说话，继续道：“况且你又不是想要院长大人的命，只不过想让他认错而已，也算不上是复仇的。”\r\n    雷琪儿也笑了，她本想说一声感谢，不过最终没说出来。并不是她说不出，而是知道两人之间已经不需要这样得语言了。\r\n    雷琪儿正想说话时，不料外边远出传来一声惊呼：“啊！别过来！”叶空和雷琪儿都听得出那是伊丽莎的声音。\r\n    \r\n	第八章 废弃庄园			Paragraph	2021-05-30	30000549
31000132	109	2021-05-30	                            第九章 强敌\r\n    叶空和雷琪儿一听到伊丽莎的惊叫就立即奔了出来，赶到庄园大门前时他们正好看到几个蒙面的黑衣武士刚刚破开了叶空布置的结界，其中一人刚刚掐住了伊丽莎的脖子。\r\n    不过就在那黑衣人想将伊丽莎抓起来时，叶空正好看到，情急之下一挥手，空间之力直接撕扯到了那人的右手。只见那人一声惨叫倒飞了出去，他的右手虽还未被扯断，但显然已经废了。\r\n    叶空的怪异攻击惊住了几个黑衣人，雷琪儿也立刻赶到利剑出鞘直逼几个黑衣人。她这次可使出了全力，斗气像风一样盘旋缠绕在身周，她的人也像疾风一样冲到了几人面前，一个突刺击向最前边的一人，对方还没反应过来便被刺中，一剑毙命。 \r\n    不过对方没有停下来全力对付他们两人，而是分出三个人来拦截他们，另两人则向伊丽莎冲去。对方的实力显然也不弱，两个人的夹击就把雷琪儿给拦下了。\r\n    不过最后那一人显然是拦不住叶空的。叶空知道救伊丽莎优先，他一个瞬移到了伊丽莎旁边，可现在的他还不能带着别人瞬移，所以到她身边快，带她脱离那些黑衣人却还是只能用跑的。趁冲来的两个黑衣人因7叶空的突然现身时，叶空拉着伊丽莎就开跑，伊丽莎完全是一副被吓呆了的样子。\r\n    叶空没跑出多远，对方就反应过来了，三个人两后一前向他们围了过来。叶空和伊丽莎正往前跑，所以先正面迎上了原先想拦住叶空的那人。对方的长剑横斩过来，不擅长搏斗的叶空使劲了力气已最快速度将伊丽莎扑倒在地上，堪堪躲过了这一击。不过趴在地上完全是任人攻击的姿势，黑衣人剑势向下，直逼向叶空的头。\r\n    就在这万分危急的刹那，叶空的空间之力又发动了。在这短暂的时间里他虽然动弹不得，但空间力量缠绕身周，就在那人的剑砍中叶空的头时，奇异的是，叶空安然无恙，黑衣人的剑反而被空间力量撕裂断成了数截，他的右手也被绞成畸形。黑衣人痛哼了一声倒地不起。\r\n    叶空来不及考虑，拉起伊丽莎又开跑。此时的伊丽莎已清醒了，她正看向叶空，一个“你”字还没说完就被叶空拉着跑了起来。\r\n    后边两个黑衣人越追越近，不过先他们一步到了叶空身边的是雷琪儿，她的身后还有另两个黑衣人追来了。\r\n    叶空一见到雷琪儿便焦虑地问道：“现在怎么办？”他总是缺一根主心骨的样子，在雷琪儿在的情况下从来不自己拿主意。\r\n    雷琪儿看了看他，急道：“你先带伊丽莎走，我来对付这些人。”\r\n    叶空道：“可是你应付得过来吗？对方人多啊。”\r\n    雷琪儿冷声道：“你留下来更麻烦，你又不愿意用你的异能吗？那就至少别给我增加负担。”\r\n    雷琪儿声音很快又缓和了，道：“放心，这几个人我还对付得了。你快走。”\r\n    在生活中雷琪儿几乎全部都听叶空的，在战斗中叶空则多数时候是根据雷琪儿的话行事。他只得说了句“你小心”，拉着伊丽莎向侧边树丛中跑去。伊丽莎本人则一句话都还没来得及说，一直被拉着跑得晕头转向的。\r\n    四个黑衣人迅速围了过来，而雷琪儿则也攻了过去。她所擅长的方式是进攻，进攻才是最好的防御。她的以疾风般的速度连刺两剑，迫使前边中间的两人不得不停下抵挡。而就在对方停下的瞬间，雷琪儿又攻向另外一人，没想到对手出手速度如此之快的黑衣人差点就被一剑穿心。然而雷琪儿还没有停，她的身子又是一闪，很快到了另一边一剑刺出，与对方的长剑交错，铿锵几声之后两人各自向后退开，持剑对立。\r\n    雷琪儿以一敌四而丝毫不显弱势，应该说，在对方急于突破她的阻拦追击逃跑的两人的情况下，对方的四人被她给难住了。单手握剑，面容冷俊，一身蓝白交错的锦衣，原本纤细的雷琪儿却给人一种密不透风的气势。她的眼神是那么坚定，仿佛在说，要想过去，就看你们过不过得了我这关。\r\n    不过雷琪儿也没有轻敌，她已经从刚才的战斗中探知了对方的实力，刚才若不是对方急于突破而不想跟她纠缠，她也没那么多容易对付这四人的。而且更有趣的是，她还发现刚才与自己对剑的最后一个黑衣人竟然是她认识的人。\r\n    四个人在几秒中内走到了雷琪儿面前。在动手之前，雷琪儿说话了：“堂堂的‘荧雷剑士’不会是来找个小姑娘报复的吧？我倒是想知道，你们到哪来的胆子敢绑架公主。”\r\n    黑衣人并没有回答她，回答她的是剑，四个人几乎同时出手，上下左右夹攻过来。雷琪儿早有准备，疾退两步，侧身躲过两柄剑，为免对方趁着空隙突破过去，她立即出手，疾刺加斩击，一连串疾速攻击打得对方喘不过气来。不过将斗气提到最高做连续高速的攻击可是很耗体力的，雷琪儿虽然不是第一次进行这样的战斗，不过她还是能清晰的感觉到疲劳正拖慢着自己的动作。\r\n    双方的第二轮战斗仍没能分出结果，退开之后，雷琪儿和黑衣人们都急急地喘着气。雷琪儿认定了对方中有一个人是那个荧雷剑士，所以她知道对方为了隐藏身份都还没有拿出自己的真正实力。虽然仅是现在这样的情况下雷琪儿的胜率已经比较低了，但她仍觉得不够，雷琪儿在很多地方都有着男孩子的性格，不仅好斗渴望变强，而且战斗方式简单不喜欢算计，然后又是那种敌人越强自己就越强的类型。她冷声对几个黑衣人道：“我劝你们还是拿出真本事来的好，凭你们现在这样的实力要想赢我恐怕是得付出不小的代价的。”\r\n    四个黑衣人似乎也知道现在的形势，追人要紧，对方的实力也的确够他们用上全力来对付。其中三个人都看向了被雷琪儿认为是罗曼的那个黑衣人。只见他沉默了一会儿，然后，手中握着的剑忽然雷光闪动起来，分胜负的时候到了！而且这雷光剑的样子与雷琪儿曾见到的罗曼的剑一模一样。\r\n    另外三人也很快动作，四个人里竟然有三个魔法剑士，除了罗曼的雷剑外还有一柄疾风之剑和一柄水纹之剑。以风来强化剑术不仅能拥有极高的速度，以风为刃也能加强杀伤力和攻击范围，风的运用与斗气的应用是很相近的，所以在数量比较稀少的魔法剑士中风系使用者也是最多的。而与之对应的，使用水系魔法的魔法剑士就是最少的了，至少雷琪儿这才是第一次看到水系的魔法剑士。    \r\n    生死大战之际，面对众多毫不弱于自己的高手，雷琪儿也不得不使用叶空在剑上为她做的机关了。这个机关很简单却很使用，她的剑内装了一块特殊宝石，能够吸收大部分的魔法能量但又不会与雷琪儿自身的斗气起冲突，所以这柄剑几乎可算是魔法师或魔法剑士的克星。而正巧的是，对方居然大半都是魔法剑士。\r\n    运用斗气的那个普通剑士最先动了，他的动作之快斗气之强，丝毫不下于雷琪儿，双方快剑对撞，乒乒乓乓声音不断。短时间内双方基本战成平手，不过大家都看得出，黑衣剑士的消耗比雷琪儿大些。\r\n    风系剑士看见同伙稍微弱于对方，赶紧上来帮忙，他的全速同样快得惊人，两边夹攻之下，雷琪儿已经显出弱势。不过让那个风系剑士郁闷的是，不仅他的风刃对对方完全无效，就连环绕身周的提升速度的风元素也被对方的剑吸去了，一到人家身周速度就明显降下来了。\r\n    水系剑士很快也动了，他用的是很特别的招式。雷琪儿曾听说水纹波动能够影响人的行动，不过就算心里已有了戒备，在一阵如同水波一般的冲击间隔着撞到身上来时，雷琪儿仍旧吓了一跳，差点就被风系剑士一剑削下脑袋来。即便她手中的剑明显吸收了大部分水元素，但那一阵一阵的抖动让她很不适应。而相反的，不仅水系剑士完全不受水波的影响，另两人也没多受水波的影响。被三人夹攻，雷琪儿的形势更不好了，随时都可能会死在他们剑下。\r\n    那个雷系剑士站在一旁，似乎是等着给雷琪儿致命一击。就在雷琪儿被逼得退无可退之际，他才终于出手，只见雷光闪动，他的剑已经逼到了雷琪儿身侧。而此时雷琪儿刚接下那使用斗气的剑士全力劈来的一剑，已经闪避不及。\r\n    眼看着裹着雷光的利剑就要斩断雷琪儿的纤细的腰支时，一道凌厉的剑气忽然从远方飞来，直接斩断了雷系剑士手中的剑。                    \r\n    \r\n    叶空抓着伊丽莎的手努力跑着，但是他们并没有跑出远。两个人忽然看见前方一个高大魁梧的黑衣人立在前边，带着个可怕的面具。\r\n    叶空当然知道来者不善，赶紧停了下来把伊丽莎拉到身后，然后严肃问道：“你是什么人，为什么要追杀她？”\r\n    黑衣人没有回答他，只道：“你最好让开，否则小心自己性命不保。”\r\n    叶空感觉到眼前这个人有一种无形的威势，自己即便用尽全力也很可能对付不了他。叶空一手紧紧地握住了伊丽莎，眼睛则一直盯着黑衣人，注视着他的一举一动。他的行动已经等于说明了，我是绝对不会让开的。\r\n    黑衣人静静地看了看他，他的深邃的深蓝色眼睛里倒映着叶空的样子，他忽然道：“小子，我是个很爱才的人，我能看得出你体内蕴藏着极为强大的能量。若是你肯加入到我麾下，我可以替你开启这个宝藏，到时你的力量就决非现在的你可以比拟的了。怎么样？”\r\n    在这样的情况下要求叶空加入他的阵营，黑衣人的话实在荒唐，但叶空听着他那不容置疑的语气，他显然是说的真心话。\r\n    叶空疑惑道：“你到底是什么意思？我怎么可能跟身为敌人的你走。”伊丽莎在他背后更是紧张不已，双手抓住叶空的手使劲摇，显然有些担心他真的答应了对方的条件。\r\n    黑衣人笑道：“我们怎么能算敌人呢，我们素不相识，我也没有加害这个小姑娘的意图。‘敌人’这词从何说起呢？而且若是你答应跟我走，我保证你的那个剑士同伴和这个这个小姑娘毫发无伤。而若是你不答应，恐怕就……”\r\n    叶空听他提起雷琪儿，紧张道：“雷琪儿怎么了，你抓住她了？”\r\n    黑衣人笑道：“你们是逃不出我的手掌心的，至于那个女剑士，我的手下应该就快把她带过来了。现在，你的回答呢？”\r\n    叶空心头一紧，他也的确不知道雷琪儿到底能否胜过那些黑衣人。但他却知道雷琪儿是绝对不想受别人摆布的，他道：“如果我拒绝呢？”\r\n    黑衣人早料到这结果，叶空的话音刚落，他就已经出手了。叶空只感到空气一凝，一阵寒气扑面而来，庞大的冰元素能量像一堵墙一样压了过来。叶空赶紧用处他的空间异能，只是在被冰元素击中前一秒，他惊讶地发现，一向百试百灵的空间撕扯之力竟然对这面前的冰元素无效，对方的魔力实在太强了。\r\n    \r\n   \r\n    \r\n\r\n    \r\n\r\n	第九章 强敌			Paragraph	2021-05-30	30000549
31000133	110	2021-05-30	                           第十章 皇家徽章\r\n    雷琪儿这边的战斗被一个英俊的年轻剑士打断了，在他的加入下战斗很快的结束了。即便是一向好强的雷琪儿自己也不得不承认，她和四个黑衣人这些所谓的高手跟他完全不是一个档次的。那四个黑衣人甚至连逃走的机会也没有，甚至还没能说出一句话，就被他全部击毙，没有一丝还手的余地。他的斗气之强完全超乎雷琪儿的想象，而在那样强度的斗气的加成下，他的速度已经不是常人能够目视的了，力量更足以斩断黑衣人手中的利剑。    \r\n    解决了黑衣人，年轻剑士对雷琪儿道：“我们快去找公主殿下吧。你知道她在哪吗？”他的声音很平和，但是他的语气却让人感觉不到一丝情感。\r\n    雷琪儿道：“叶空和伊丽莎向那边跑了，我们应该还追得上。”她的话气倒和那年轻人有些相似。\r\n    雷琪儿说完又想起件事，跑到那个雷系剑士身边，揭开了他的蒙面，这人果然就是雷琪儿他们在小镇上遇到的荧雷剑士罗曼。雷琪儿疑惑地问道：“这些人为什么要追杀伊丽莎，你知道吗？”\r\n    年轻剑士没有回答，他轻声道：“比起寻找这个问题的答案，保护公主安全才更重要，我只要履行好自己的职务就行了。”他说着就向雷琪儿所指的方向走去，雷琪儿也只得赶紧跟了过去。\r\n    雷琪儿边走边问道：“你又是什么人，为什么要帮我？”\r\n    年轻剑士道：“我叫修，是萨里特大人也就是公主殿下的父亲的侍卫。我奉萨里特大人的命令暗中保护公主殿下，并随时通报大人公主的行踪。只是我原以为公主殿下跟着你们不会有什么危险的，所以回去向大人汇报去了。却没想到你们竟然会在这里遭到袭击，而我也回来晚了一步。”\r\n    雷琪儿和修都担心着叶空和伊丽莎的安危，所以走得很快。当他们找到叶空和伊丽莎时，两人都昏迷着。一动不动躺在地上的叶空把雷琪儿吓得不轻，她几乎是用自己都有些难以置信的速度冲到他身边的。仔细一查看发现他只是昏迷了，雷琪儿才发下心来，又去看伊丽莎，她也没受伤。\r\n    两个剑士就在原地守卫着昏迷的两人。直到天亮时，他们才醒转过来。\r\n    叶空醒过来的第一件事就是找寻伊丽莎，发现伊丽莎并没有被那个黑衣人带走，他才放下心来。不过，这些动作全都落到了雷琪儿眼里，连她自己都没发现自己那些许的不自然的神情。\r\n    叶空环顾四周很快发现了雷琪儿，对她说：“雷琪儿你也没事啊，我还以为那个黑衣人的部下把你抓住了呢。”\r\n    雷琪儿指了指叶空身后不远处站着的修，道：“是他救了我。”\r\n    这时伊丽莎也迷迷糊糊醒了过来，揉了揉眼，看见修就在不远处，疑惑地道：“修你怎么来了？”\r\n    修走上前，恭谨地鞠躬道：“属下有付大人重托，没能护卫好公主的安全，实在惭愧。不过殿下安全无事就好。”\r\n    伊丽莎随便扬了扬手，道：“没你的错，是我自己跑出来……”她话还没说完忽然注意到修的“有付重托”一词，伊丽莎改口道：“爸爸知道我出来了？”\r\n    修答道：“是萨里特大人要属下暗中保护公主殿下的。”\r\n    伊丽莎本来并不会在意修说的“护卫不周全”什么的，但她一想到自己自鸣得意偷跑出来的计划完全是由于父亲的纵容才得逞的，反而有点不高兴了。\r\n    修并不知道她的心思，立即道：“公主殿下请现在就跟着属下回皇宫去吧，要不然萨里特大人会担心的。”\r\n    伊丽莎也知道现在不回去不行了。她站起来正想走，忽然感觉身上少了点东西，仔细一查看，忽然惊叫道：“遭了，我的徽章不见了！我的皇家徽章被那个黑衣人偷了！”\r\n    伊丽莎立即成了副哭丧脸，道：“这下麻烦了……”\r\n   \r\n    伊丽莎几乎是被叶空拖到皇宫的，她一路上就在唧唧喳喳讲着从前辈那里听来的过去丢失皇家徽章的贵族的悲惨下场，然后一边绝望的想着自己是不是也回跟他们一样的惨死。叶空拿她这胡思乱想毫无办法，雷琪儿完全不闻不问，修知道自己是没办法的，只能回到萨里特大人身边再说。\r\n    在修的带领下，一行人毫无阻拦地进入了皇宫，到了萨里特大人的住处。萨里特，刚过逝不久的莎莱娅女皇的丈夫，实际上的皇族领袖人物，叶空对他的第一映象就是高雅而温和。修带着大家在一个宫殿内等候萨里特时，叶空就仔细观察着四周。\r\n    萨里特的住处位于皇宫之中，富丽堂皇是当然的，但他的殿内的点缀的却不是什么贵重的装饰物，而是许多形象各异的山水景物画像，正常的有群山、日出、冰河等等，叶有些怪异的如火泉，断层山，冰瀑布之类，叶空还在其中找到了他曾亲眼见过的剑断峡，那个巨大峡谷听说是被一位高人一剑劈开的，那破坏力之强可说直逼神魔了。\r\n    叶空从修那里听说这些都是萨里特治理过的地方的一些奇特景象，而且全都出自他本人的手笔。即便叶空不算内行，也知道萨里特的画工不错，进而也能感觉得出他的修养品行。不过，叶空凭着直觉想到，很多像他这样平时高雅温和的人到了真正关键的时候都威势十足，镇得住场面。\r\n    萨里特刚到，伊丽莎就扑了过去，拉着他稀里糊涂乱说了一阵，一会说糟了，一会又叫爸爸一定要救她，本来一句话能说明的问题反而把一脸含笑的萨里特说糊涂了。 叶空实在很佩服她的口才，能把一件简单的事说得这么复杂。他哪知道伊丽莎的前辈是怎么教诲她的，初代魔法皇帝规定的丢失皇家徽章可是死罪，更麻烦的是，这条规定在几百年来都被高层们坚定不疑的执行着。外人是无法知道这件事对皇族到底有多重要。\r\n    有点糊涂了的萨里特苦笑着把目光看向了修，想从他那里得到一个清楚的解释。修一句话便说清了情况：“是属下的失职，公主殿下的皇家徽章被一个神秘人抢去了。”\r\n    这句话的效果是明显的，萨里特的笑容瞬间消失了，立即变成了一副严肃地样子。停顿了几秒，萨里特放开伊丽莎，道：“伊丽莎，你先带你的朋友去休息。修，跟我来，给我详细讲讲事情的经过。”他说完立即向自己的房间走去，修也跟了过去。\r\n    叶空本来想跟过去多提供些情报，不过想想还是算了，自己知道的也不比修多多少，也就知道那个人想招揽他，上次没杀他也没带走伊丽莎也许就是给他考虑的时间。叶空这时反而有些不安了，他和那个人的实力差距实在太大，而且他还说过自己这些人是逃不出他的手掌心的，被这样一个人盯上了可不是好事。不过这些想法叶空都没有说出来，反正说了也没用，又何必让雷琪儿也跟他一起不安呢？\r\n    伊丽莎的情绪终于稍微好了一点，带着两人到了这宫殿的客房休息。伊丽莎一直找叶空陪她说话来缓解内心的焦虑，一直沉默不语的雷琪儿则独自走到一边。\r\n    雷琪儿一直在回想昨晚的战斗，她不知道仅比自己大五六岁的修究竟是怎么练到这一层境界的。她虽然知道自己与顶级高手还有遥不可及的距离，但她感觉自己已经很久没有进步过了，似乎现在的实力已经是她的极限了。难道真的就此为止了吗？她曾经对自己的成就比较满意了，但看过修以后，才知道自己还差得很远，她对自己的停滞不前很不甘心，所以一直在思考怎么突破极限让自己更上一层楼。\r\n    \r\n    午饭过后没多久，一位衣着华丽的魔法师袍、须发尽白、慈眉善目的老者带着几个随从来到了萨里特这里，伊丽莎、叶空和雷琪儿也被叫了进去。\r\n    萨里特恭谨地对老者说着：“艾维斯大人，这件事还请您多帮帮忙。丢失了徽章虽然是伊丽莎的错，但这么久以来一直都延续的做法我知道您也是并不认同，伊丽莎的性命就看您的了。”萨里特说完用眼示意了一下伊丽莎，伊丽莎也不笨，立即扑到艾维斯爷爷身上哭闹起来。艾维斯平时比萨里特更疼爱伊丽莎，当然拿她的哭闹没办法，连忙轻拍着她的肩膀安慰着，道：“别哭别哭，孩子你放心没事的，不会有事的。”艾维斯已经答应了帮忙，伊丽莎当然不能在无理取闹了。她慢慢停住哭声，静了下来。\r\n    叶空这才知道眼前这位老者竟然就是总揽了魔法帝国政治大权的水系大魔导士艾维斯，也正是他这次来雷萨之城要找的人。当老者注意到屋里的另两张新面孔时，他的目光看了看两人，然后移到了叶空身上，那目光虽温和，却有一种穿透力，似乎将叶空全部的底细看得一清二楚，叶空在那种目光的注视下说不出话来。艾维斯指了指叶空，笑着问萨里特：“这个小伙子是谁，你这里怎么会有个这么年轻的空间异能者？”一眼就看穿了隐藏在叶空体内的奇特能量，大魔导士的眼力和见识的确过人。 \r\n    没等萨里特回答，叶空自己主动答道：“艾维斯大人，我叫叶空。我的老师寒星叫我到雷萨城里来找您的，他说您这里有件重要的事要他参与，所以他派我代替他来的。”叶空说着就从衣服里找出了老师寒星的信交给了艾维斯。\r\n    艾维斯看了看信，又看了看叶空，温和地笑道：“原来你是寒星那小子的徒弟啊，怪不得我第一眼看到你时就感觉有点他的样子呢。他现在过得怎么样，我倒没想到他会放下魔法研究去接任菲尔德的位子。”\r\n    叶空道：“老师他过得很好，他也说十几年没见到您老人家了，叫我替他向您问好。”他说着又把话题转回去了，问：“艾维斯大人，伊丽莎真的没事吗？我听你们说得这么严重的样子。”\r\n    艾维斯笑道：“别叫得这么见外，你以后就叫我爷爷好了。本来我还有些担心的伊丽莎这事的，不过若你是代表寒星或者说菲尔德那一派的，就完全没问题了。我也正想将那个腐朽的规定改掉呢，你来得正好。”\r\n    艾维斯似乎觉得不需要再担心了，随口道：“萨里特，我先回去了。对了，叶空你有住处吗，需不需要我帮你安排一间？”\r\n    叶空还未回答，萨里特先道：“就不劳大人费心了，叶空和他朋友都是伊丽莎的朋友，今晚就住在我这里好了。”\r\n    艾维斯道：“也好，明天你们就一起到内殿来吧。要废除这条规定是必须要进行元老会会议的。”\r\n    艾维斯不久后就带着随从们离开了，萨里特也很快安排好了叶空和雷琪儿的住处，原本该回自己宫殿的伊丽莎也留了下来。夜色很快地降临了，明天的元老会会议究竟会是什么样子，叶空一点也不清楚。\r\n  \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n	第十章 皇家徽章			Paragraph	2021-05-30	30000549
31000134	111	2021-05-30	                           第十一章 元老会的决议\r\n    深夜，当叶空和伊丽莎等人都各自进入梦想之后，雷琪儿仍清醒着，而且还在庭院里漫步。她还在对思索着，到底怎么才能变得更强，怎么才能赶得上修。\r\n    不知不觉的，她竟然走进了殿内，又恰巧看到守护在萨里特办公的房间门口的修。萨里特的工作似乎多得做不完，这么晚了都还没有休息。\r\n    两个寡言少语的人都看到了对方，却都没有打招呼。静默地立了一阵后，雷琪儿直截了当的问道：“你是怎么达到现在这实力的？”\r\n    修当然听得明白她的意思，他的回答也很直白：“从学校里学来的，雷萨城的皇家剑士学院。”\r\n    这样一句简单明了的话却让雷琪儿十分惊讶，苦思冥想都得不到结果的答案竟然是这样，几年来全靠自修和实战磨练的她早已忘却了还有学校这种东西的存在。\r\n    带着惊讶站了一会儿，雷琪儿清醒之后，才又想到，自己苦练再三，又经历了无数生死大战，到头来居然还不如一个从学校里出来的人，还真是讽刺！\r\n    气苦的雷琪儿更不甘心了，她突然拔剑指向修道：“跟我决斗！”\r\n    修没想到她会这么做，他并没有拔剑，而是道：“一个像你这样的女孩子能练到现在这程度已经很不错了，女孩子本就不适合练剑的。”\r\n    修显然也不是个会说话的人，这话明显更刺激了雷琪儿，她冷声道：“拔你的剑！”\r\n    修没办法了，只得拔剑。\r\n    雷琪儿运起斗气攻向了修，用自己所能达到的最大速度挥动长剑。以往她对自己的快剑都是很有信心的，但此刻，修很轻松的接下了她的每一剑。三秒之后，挡开雷琪儿第十剑的修终于出手，他的剑没有任何悬念的抵在了雷琪儿的咽喉前。\r\n    这样的战斗根本不能称为决斗，雷琪儿几乎是没有丝毫还手之力的落败了。然而修还进一步刺激了她，他道：“你还是不要插手到这个阶层里来的好，女孩子不该插手到男人的世界里来，更何况帝国高层的这个世界里只允许强者存在。从皇家剑士学院里出来的人中比我优秀的还有很多，我也是全靠萨里特大人的提拔才能在这个地方活下来的。”\r\n    修当然是诚心在劝告她，但他并不清楚自己的话无疑将好强的雷琪儿贬得一文不值。他并没有看到背对着他离开的雷琪儿那不甘心的泪水。\r\n    \r\n    叶空并不知道这些事，第二天起床以后他想得最多的还是艾维斯所说的元老会会议的事。\r\n    吃过早饭没多久，萨里特就带着众人走向了皇宫深处的内殿，等着元老会会议的开始。主持会议的艾维斯更早就等在了那里，叶空到的时候艾维斯就让他站在了自己的身后。雷琪儿说对这个件事没兴趣所以没有来，虽然叶空从她还有泪痕的脸上看出她在说谎，可是他也没办法，惟有这种时候他想不出任何可以安慰雷琪儿的语言，说多了反而更刺激她，就像修的那些话一样，所以他只有装作没看见。\r\n    内殿是一个小型会场，原本是个审判重罪犯的审判室，后来更被用做了元老会会议室，任何大型决策都是帝国元老们在这里决定的。\r\n    一个圆形的受审台的四周有六个座位，分别是帝国的六位元老即六位大魔导士的座位。受审台上有强大的魔法禁制，无论什么人被置于其中都休想逃得出来，而整个内殿外侧也同样有魔法结界，以防旁人打扰审判或者会议的进行。\r\n    按照惯例伊丽莎要被送进审判台接受审判，虽然萨里特不停的安慰她让她放心、没事的，但她进了那个近乎鸟笼的禁制后焦虑的神色一点都没减少。\r\n    对伊丽莎来说，在这里边的等待是格外漫长的，在这漫长的等待当中，她开始胡思乱想起来。帝国的实权都掌握在几个元老手中，帝国里的任何事都是他们说了算，所谓的女皇也不过是他们的傀儡罢了。曾经伊丽莎被告知要她继承母亲的皇位时，她只是很无奈的感觉到自己以后的日子将完全没有自由了。但如今，她却感谢自己能够是皇位继承人，至少这个身份对于几个老怪物（她的心里当然除开了艾维斯的）还有用处，他们应该还不会要了自己的性命。这么想着，她的情绪终于平静下来，不在那么害怕了。\r\n    元老会会议终于要开始了，叶空仔细地观察着每一个到会的大魔导士，这些人还真是形象各异。慈眉善目的艾维斯可以不说了，在他左侧不远出的位子上坐的是火系大魔导士狄克麦德，一身戎装，胸前的徽章是一头在火焰中咆哮的狮子，再加上他高大魁梧的身体和那不可一世的神情，不认识他的人恐怕很难相信这个人是世界顶级的魔法师而不是骑士呢。实际上虽然已经初显老态了，但狄克麦德即便不使用魔法，大多数骑士也不会是他的对手。就如他的相貌所表现出的英武，他正是统揽帝国军务的军务大臣。\r\n    另外还有个老人也很特别，土系大魔导士埃德蒙和风系大魔导士基斯是整个大陆最复杂最庞大的魔法协会的双巨头，但两个人的性格差得很远。埃德蒙给叶空的映象就像墙壁，坚不可摧，没有一丝破绽。不过当叶空更仔细观察时，马上感觉到墙壁完全不能形容他的浑厚，他简直就是大地，或者说承载着整个世界的大地就像是他身体的一部分一样。而另一个人基斯则像空气，他身形话语甚至面容神情都像空气一样飘渺，叶空觉得即便不用风系法术，他那皮包骨头的身子也像要飘起来的样子。\r\n    另外两位元老并没有参加会议，叶空对那两位大魔导士也有所耳闻。雷系大魔导士拜伦不想插手政事，一直生活在故都。而另一位同样退出了帝国权力纷争的冰系大魔导士菲尔德则已经离开人世，接替他极地之城城主之位的正是叶空的老师寒星。\r\n    \r\n    看这样一群魔法界的顶级高手们的审判，连叶空也不仅紧张起来了。虽然这屋子里只有四个大魔导士、伊丽莎父子和他自己共七个人，但是每个人的分量都不轻，所以这内殿原本较大的空间也不觉得空旷了。\r\n    基斯首先用他那虚幻的声音道：“老艾，我听说你们那个未来女皇偷跑出去把皇家徽章给丢了呢，这可是不可更改的死罪呢，你得给个说法吧？”他一开始就用这种语气说话，叶空知道他显然不是站在艾维斯这方的了。\r\n    艾维斯笑着道：“不用说得这么难听吧，伊丽莎虽然的确犯了错，不过也不至于就要被处死吧。虽然亚特兰帝斯大帝曾经立下这条法律，但都已经是八百年前的事了，何必一定要做得这么绝呢，况且还是对即将接任女皇之位的伊丽莎呢。这条并不太英明的法律就让它到此为止吧。”\r\n    埃德蒙接口道：“怎么可以随意废止皇帝陛下留下来的法律呢？”\r\n    艾维斯虽然也曾想过埃德蒙可能会反对他，却没想到他态度这么坚决，他道：“毕竟这可是关乎人命的决定，你们就不想想那条先祖定下的法律让牺牲了多少优秀的皇族子弟和多少他们无辜的家人？”他说得有点激动，以至于忍不住咳嗽起来。\r\n    但埃德蒙还是没有松口，严肃的道：“不论这规定是否英明，一旦成了法律就不能轻易改动。若是这个先河一开，后边不知还要出多少事情。”\r\n    叶空正疑惑于这些人为什么这么执著于处死伊丽莎，很快看出了他的疑惑，悄悄地告诉了他：“伊丽莎和她母亲是我和狄克麦德扶持起来的，偏向于我们这方，所以他们并不希望伊丽莎继承皇位。”这话已经说得很明白了，叶空意识到不论哪个社会都会有利益冲突和争夺的，伊丽莎即便能活下来最终也不过是做个傀儡吧，不过还好有艾维斯和她父亲这些真正关心她的人。他想着又看向了艾维斯，虽然他只见过这个老人几面，但已经将他示为和劳伦斯爷爷一样可亲可敬的人了。\r\n    艾维斯知道这两位恐怕是不会再改口了，只得道：“那就只好来表决了。”元老会的表决很简单，少数服从多数。他说着站了起来，严肃地道：“今天的会议是为了决定对遗失了皇家徽章的皇位继承人的处分，要决定的事情有两件，第一是伊丽莎是否被处死，第二件事是伊丽莎如果不被处死还有没有资格继承皇位。”艾维斯故意把一件事说成两件，也是希望即便基斯和埃德蒙坚持与自己对立，至少也可以进一步保证伊丽莎的性命。他停了停，道：“那么请各位发表意见吧。”\r\n    埃德蒙却显然铁了心了，他首先道：“我认为这法律改不得，该怎么做就必须遵照执行，一改就会出乱子。”\r\n    第二个发表意见的是一直没有开口说话的狄克麦德，虽然平时他和艾维斯这两个军政双方的领袖经常意见不同，但这次他是支持艾维斯的：“我认为这孩子该继续继承皇位，若是频繁更换皇位继承人，那不仅会弄得皇族内部不稳定，整个帝国都可能陷入混乱。改个不适合时事的法律能出得了多大乱子，杀了她才更乱得麻烦。”狄克麦德和艾维斯私下里统一过意见，他显然也不想自己扶持的人被处死了，平添出麻烦来。\r\n    艾维斯明显是要包住伊丽莎的性命和皇位的，基斯则是和埃德蒙意见一致，结果这表决又成了二比二的情况。平时这时候都该由皇族的代表也就是萨里特投最后一票的，这也是为什么在内部决策中魔法协会总是输给军政两位大臣的原因，因为萨里特总是向着艾维斯的。正当萨里特想开口时，基斯抢先道：“这件事牵涉到他女儿，皇家那一票不该由他来决定。应该另选其他人来参与这个决议。”\r\n    这话也有几分道理，被这么一说，萨里特显然也不好意思在争辩了，他知道艾维斯会反对这个提议的。皇族之中最主要的派系原本有四个，但其中一个派系的领袖二三十年前因为弄丢了皇家徽章被处死了，这也是为什么艾维斯和萨里特都对丢失皇家徽章这件事这么重视的原因。而后，再除了伊丽莎这一系，另外的两系明显都是希望除掉伊丽莎让自己这方有机会继承皇位的。\r\n    正当艾维斯想站起来反对他的话时，狄克麦德先道：“这件事跟皇族关系太大，皇族不应该参与决议。”这样虽然断绝了萨里特这方面的帮住，但至少可以保证僵持下去。\r\n    基斯恼火的道：“那这样二比二的到底怎么决定？”他停了停，又道：“不如这样吧，艾维斯，我们一个让一步吧。让你那个小姑娘放弃当女皇，我们就不处死她这样好吧。”\r\n    这对于伊丽莎来说是个很不错的选择，基斯原以为艾维斯会答应的，不过狄克麦德又一次抢过话头：“不行，这件事本来就不是什么大事，有什么可讨论的，你们两个老东西就是没事找事。”他的火暴性格渐渐露出来了。\r\n    基斯显然并不赞同他的看法，不服地道：“那就去找拜伦好了，出身皇族的他站在我们这边的可能性还要高些呢。”\r\n    艾维斯不能冒险去试探拜伦的意见，他赶紧道：“不需要去找拜伦了，我们这里就有可以投最后一票的人。”\r\n    艾维斯这话一出，三位大魔导士都疑惑的看向了他，显然不明白他的意思。艾维斯以前也经常带人来参加这会议，所以几人都没有想到叶空身上来。\r\n    艾维斯看到其他几人都看向了自己这边，于是道：“除了拜伦我们不是还有一个人吗？”\r\n    基斯当然知道他说的是谁，他带点讥讽地语气道：“可是菲尔德不是早死了吗，难道你能把他的灵魂从冥界招到这里来？”\r\n    艾维斯笑道：“这我当然不能，我只是想说菲尔德那边有投一票的权力不是吗？你们也知道，自从菲尔德死了之后，极地城那边那一票一直都是寒星在发表意见，而且我们大家也都认同了，不是吗？”\r\n    基斯听他罗哩罗嗦的，不耐烦的道：“你到底想说什么，直接点好不？”\r\n    艾维斯将叶空拉到了身前，道：“这个孩子叫叶空，是寒星的徒弟。寒星那小子给我的信里说过了，需要他发表意见的事都交给这个少年，叶空的意思就是他的意思，而他的意思也已经可以说是菲尔德的意思了。”艾维斯停了停，向叶空问道：“那么现在，叶空你的意见呢？” \r\n    众人一时间都看向了叶空，被这些恐怖人物盯住的叶空浑身都不自在了，但还好他还没失去说话的勇气：“这个……伊丽莎的徽章丢失也有我的一分责任，虽然这种时候不能徇私的，不过我总不能让自己也被跟着处死吧。”他这话实在不是官场上该用的，不过却也勉强能够过得去。\r\n\r\n\r\n\r\n\r\n\r\n    \r\n	第十一章 元老会的决议			Paragraph	2021-05-30	30000549
31000135	112	2021-05-30	                           第十二章 奇特夫妇\r\n    元老会会议的结果就是，伊丽莎免于了被处死并且一个月之后就将继任皇位成为帝国新一任女皇。自此，这件事可以告一段落了。\r\n   会议结束后艾维斯曾挽留过叶空，问他是否想在自己这里做出点业绩。叶空当时忽然想起了曾经想招揽他的那个黑衣人，他忽然想到，那个随时可能出现的黑衣人实在令他担忧，不过若是能受艾维斯的庇护，自己一定不会有事。\r\n    然而他最终还是没有答应，习惯了流浪的他很难在一个地方呆太久的，至少他自己是这么想。至于那个黑衣人，叶空从未请求过别人保护的，这次也不想牵涉到他人。这段时间就尽量提升自己的实力好了，那个人若是出现了，就勇敢地去面对吧。\r\n    这一天回到住处后，伊丽莎是很乖巧的再也不敢有什么怪动作了，她感激的和叶空聊了一会儿，在叶空答应来看一个月后她的继位大典后，便乖乖地回到了自己的宫中。\r\n    叶空这一天原本是计划多完成几个实验的，不过看过雷琪儿的情绪状态后还是改变了注意，他硬拉着雷琪儿去逛街，想让她散散心。不过此时的雷琪儿心情的确很不好，不仅少见的反对叶空的决定，走在街上以后也心不在焉的对叶空的话爱理不理。以前的她至少还是很在乎自己的形象的，若是叶空说给她买衣服，她也会精挑细选半天的，可这次却完全没了兴趣，根本就不走进服饰店里去。 \r\n    叶空看着她丧气的样子，心里也有些难受，他走出店来，突然做了一个两人之间很少见的亲密动作：他的双手抓住了雷琪儿肩上，将脸靠到雷琪儿的脸跟前，由于两个人的身高相近，即便叶空不弯腰，两张脸也像要贴在一起的样子，他的双眼则直视着雷琪儿的水灵的眼睛，而嘴唇却差了一点才能合到一起。\r\n    若是换了别的任何一个人做出这种动作，在这动作做出来的同时，雷琪儿的剑恐怕也已经贯穿了对方的胸膛了吧。不过叶空显然是个例外，雷琪儿被他抓住的时候不但不觉得愤怒，反而立即觉得全身无力，几乎有些站立不稳了。她没想到叶空为什么会做出这么个姿势，一时脸红着嗔道：“你干什么，还不放开？这里人很多的。”这时大街上也的确有不少人朝这个方向看了过来。\r\n    叶空没有放开，更没有注意别人投来的目光，而是严肃的对她道：“你不要这么垂头丧气的嘛，你这个样子完全不像平时的你了。输给修又不是什么大不了的事，毕竟他也是个皇家剑士不是？我们明明知道自己的实力并不怎么样，为什么还要为输赢苦恼呢。最重要的是不服输，努力变强了赢回来不就好了吗？”他停了停，继续道：“如果你真的那么不甘心，我们现在就回去，请爱丽克丝师娘来训练你，好吗？”他说话的时候一直都直视着雷琪儿的眼睛，希望她不要逃避自己的眼神。雷琪儿原本不敢和他对视，但在他的笔直的眼神逼迫下，不得不保持着跟他对视的姿势。\r\n    听了他的话，雷琪儿知道自己的心事还是瞒不过他的。她静静地看着他，正要说话，却被远处一个很大的声音给打断了。远处一个惊艳的少妇正和旁边一个服饰店的老板讨价还价着，她忽然的一声大呼：“不行！”将路旁的行人吓了一跳，吸引了包括叶空、雷琪儿在内的众多行人的目光。\r\n    那少妇并没有在意旁人投来的疑惑的目光，激动地说道：“你怎么可以不守信用呢，不是明明说过要把衣服留给我的吗，怎么又卖给别人了呢？你怎么能这样见利忘义呢，老板？”\r\n    那店主没想到这女人居然如此霸道，居然想要把这种事宣扬得尽人皆知的样子，这不是要坏他的生意吗？他自己虽有些鬼迷心窍，为了讨好厄尔尼奥男爵，将已经许给这女人的衣服拿给厄尔尼奥家的小姐看了，而且还正好被那个女孩看中了。他本以为自己只要抬出男爵来，这女人就会乖乖离开了，没想到她却这么倔，就是不肯走。\r\n    店主也不敢当着这么多人的面发火，只得故做委屈的道：“我也是有苦衷的啊，谁叫厄尔尼奥家的小姐看上了这唯一的一件衣服呢，你又不是不知道厄尔尼奥男爵可是在萨里特大人手下听令的，我们这些人哪惹得起啊。你这么纠缠也没有用，难道你敢上男爵家里去抢衣服嘛？我看你还是算了吧，我这里其他的衣服不也很好吗，你还是另买一件吧。”他说话语气委婉，装得也像模像样，大多数人一听都知道这事完全是这漂亮少妇在无理取闹：贵族家抢买衣服是理所当然的事嘛，谁能计较？\r\n    虽然已经清楚这不过是件无聊的纠纷了，可围观过来的人却一个都没有走：留下来多看看这少妇也是好的，她那漂亮的脸蛋实在少见，而她那火暴的身材更即便是在这豪华的帝都生活了一辈子的人也很少有人见过。许多围观者看着那少妇的眼神里满是贪婪，要不是叶空的注意里都集中在少妇和店主身上，没准他还能看见一旁谗得流口水的人呢。\r\n    但这少妇却也不是个简单人物，她大声道：“我不管你什么男爵子爵的。我走的时候可是亲自叮嘱并看着你将衣服放进箱子里的，若不是你为了讨好那什么男爵，那衣服难道会主动跑出来让那小姑娘看见。分明是你自己鬼迷心窍做的蠢事，偏要做出无辜的样子，你都不害臊？”\r\n    这番话不管旁人信不信，店主都已经不可能不恼羞成怒的了。他恨恨的答道：“你别污蔑人，你以为我们做买卖的容易吗，上头那些贵族老爷惹不起，什么事都得听他们的，下面你们这些平头百姓又要求这要求那的，你的生意我不做了！你能怎么着，你要是敢乱来我就要治安队抓你进牢里去。”他这话说得虽狠了，却也是吓唬人的，他可没权力要治安队来管他这点小事。\r\n    而这店主倒霉的是，这女人似乎就是个天不怕地不怕的愣头青，她气愤的道：“别以为你吓得了我，我才不管什么男爵子爵的，反正你得赔我一件一模一样的衣服，要不然，要不然我摔了你的招牌、拆了你的店面！”她说着扶了扶纤细的手臂就向前走，似乎是真的要动手的样子。\r\n    这店主终于有些怕了，他可不想自己的店被拆了，赶紧走过来拦住这少妇，一边向旁边看热闹的人道：“你们看那，这野蛮的女人要拆我的店呐，这还有没有天理啊。你们还不来拉住她！”本来他是喊不动人的，谁也不能确定谁对谁错，更不会有旁人自找麻烦的来多管闲事。不过拉住那少妇也就意味要在她身上抓两下，这事情对一旁围观的多数男人来说可就是很大的诱惑了，所以老板的话一出，这些人就一拥而上，嘴里说着“别打了”“别拆啊”之类的话，心里可都打着歪主意。\r\n    不过却只有一个人抓到了那少妇的肩膀，这男人也很年轻，大约二十六七的样子，生得眉清目秀，白色的皮肤，黑色的瞳仁，一脸冷俊的神情，显然跟那些心里有意淫想法的围观者不同。而且奇怪的是，这男子原本并不站在观众的最前边，但直到他走慢慢走到那少妇身边以前，都没人碰到那少妇，这些人都觉得自己明明走了很多步却没有前进多远。\r\n    那个年轻男子应该就是这少妇的丈夫，他单手抓住了正要向前的少妇时，她疑惑的回过头来看他。这男子并没有说什么，而是将自己的目光向旁边一转，竟然直接落到了与他素不相识的叶空身上。那少妇的眼睛也随他的目光看了过来，不过她显然还没明白那男子的意思。年轻男子用最简短的语言道：“右手。”\r\n    少妇于是看向了叶空的右手。叶空的右手虽然稍微白了点，却也没什么特别的，唯一可以说是特别的便是，他手上带的那枚神奇的戒指。而这对奇特的夫妇，显然就是看上了这戒指。\r\n    雷琪儿和叶空刚才和其他人一起走过来看热闹，这时正站在围观者的最前排。他们俩都注意到了那夫妇的目光，脸色不由得严肃了起来。在过去的几年里，觊觎叶空那奇特戒指的大有人在，两人就曾因此几度陷入危机，现在察觉到这两人的目光，不由得就紧张了起来。\r\n    少妇与那男子交换了一下眼神，然后忽然转身向那老板道：“哎，算我倒霉，懒得在跟你计较了。以后我就叫邻居再也不到你这里买东西就是了。”走之前也想报复一把，这女人也的确不是个饶得人的人。\r\n    这个口口声声要摔招牌拆屋的女人突然要走了，店主当然是求之不得的了。虽然他自始至终都以为这女人也是虚张声势，不敢真干的，但只有她走了，店主才能真正安心。所以这时他根本不吭声，就盼着这灾星走得越远越好。\r\n    少妇回过头，正看到旁边刚走到她身边来想“劝架”的男人们，她不退不避，一声怒吼“走开”，就将一堆大男人给吓得退开了。即便是像雷琪儿这样有点“冷”的女子，被这么一大堆男人看着，也是要脸红的，而这个少妇却完全没感觉，简直蛮横的不像个女人。\r\n    人群被这么一吼就散开了，少妇和那男子则走向了叶空。雷琪儿剑不离身所以立即握住剑柄站到了叶空前边，眼神和语气都冷了下来，问：“你们想干什么？”正向四周散去的行人大半没有听到她的话，但有几个隔得近的却转过了头来。\r\n    在大街上握剑对立实在是太惹人注目了，那男子显然不想在这里说话，道：“换个地方说话。”他的话语语气投着一种不容置疑的威势，虽然不像萨里特那样具有王者风范，却也让叶空觉得不容小视。\r\n    曾经的几次经历让两人明白不能轻易答应到无人处去说话，至少对方应该不会在大街上胡作非为。（这小子显然忘记了刚才那女人就是在大街上胡作非为的。）叶空于是笑着道：“两位为什么要找我呢，有事我们不如就在这里说了吧。”他嘴上说话嘻嘻哈哈，暗地里却运起了空间之力，这两天他和雷琪儿都遇到了完全无法战胜的并且还无名（黑衣人）或不怎么出名（修）的人物，此刻在不清楚对方的实力前，不得不提高警惕了。\r\n    不过叶空的话音还未落，他就忽然感到一阵熟悉的空间传动，再下一刻，他和雷琪儿还有那对奇怪的夫妇已经到城郊一个空旷的草地上了。\r\n    群体的不接触人的瞬间移动！叶空脑袋里冒出这个念头的时候把自己都吓了一跳，这样高级的空间魔法莫说叶空不会，即便已经达到大魔导士水准的叶空的老师寒星也不可能像这男子这样根本不接触人就将对方同自己一起传送走的。叶空再次看向那男子时，第一个念头就是，这人到底还是不是人呢，即便以前是，现在恐怕也已经强得不是人了吧。\r\n    \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n    \r\n	第十二章 奇特夫妇			Paragraph	2021-05-30	30000549
31000136	113	2021-05-30	                           第十三章 远古结界\r\n    被瞬移到帝都城郊的叶空正惊讶于男子的力量时，忽然感到雷琪儿的向后撞到了自己身上，他仔细一看，雷琪儿闭着双眼、难受得站立不稳了。叶空立即反应过来将她抱住了。\r\n    从没经历过空间传送的人不适应传送时的异样感觉是很正常的，就像从没坐过船的人晕船一样，再加上刚才的她一直戒备着面前两人，完全没有被传送的准备，这一个突然变化当然就更令她难以承受了。\r\n    叶空扶着雷琪儿坐到地上，一边慢慢道：“轻轻坐下来，别动，就这么好好休息一下。”\r\n    另外两个被传送过来的人，那个男子自然没事，他的夫人那个身材火暴看似没什么实力的少妇居然也镇静自若，完全没因为被传送而感到不适。那少妇看着他们的样子，还打趣道：“哟，挺亲热的嘛，两个小家伙。”\r\n    叶空抬头看着这两个陌生人，严肃的问：“你们是什么人，我并不认识你们，带我们来这里到底是什么意思？”\r\n    那少妇笑道：“小家伙你用这么紧张，我们又不会吃了你。你说是不是啊，幽？”\r\n    那个叫幽的男子走向叶空，向他道：“我们跟你的确不熟，但是我却认得你手里的戒指。可否给我一看呢，这祭使之戒？”他说着伸出了左手，似乎确定叶空一定会给他的。\r\n    叶空当然不想给他，不过却不仅是因为这戒指是他的宝物。若是面前这人是邪恶之徒，那么这戒指落入他手中更会助长他的魔力，若是他并无恶念，这枚能够诱发人欲念的戒指也会让他堕落。但是如今的形势又很明显，叶空自己是绝对敌不过幽的，刚才那个瞬移魔法已经将他反抗的念头打消了。\r\n    这时正犹豫的叶空听到后边缓过气来的雷琪儿的声音，“给他。”雷琪儿当然见识过那枚戒指的厉害，除非是叶空这样心地善良不爱争斗的人，若换了其他任何人带上了它几乎就等于已经毁灭了一半了：即便他强大的精神力能够抵挡魔戒的反噬，但那日渐增长的欲望一定会将他带入毁灭。\r\n    叶空终于还是听她的话摘下了戒指，递给了幽。幽接过来拿在手上，静静地看着它。不过出乎雷琪儿意料的是，幽的眼神一直就如他的名字一般幽静，丝毫没有显露出任何带有欲望的神情，这让雷琪儿实在有些疑惑不解。幽似乎知道了雷琪儿的盘算，朝向她道：“你是不是以为我被它蛊惑？”他很快又自问自答的道：“只有修行不到家的人才会像你想的那样。”这话对于雷琪儿又是一种伤害了，她自己显然就是修行不到家的人，虽然这样子的人不止她一个。\r\n幽忽然有些惆怅的叹了口气，道：“我的却也想得到这枚戒指，曾经我也本应该拥有它的。你说是不是呢？”他最后这句竟然是在对着戒指说的，而更让叶空惊讶的是，戒指上忽然泛起银白色光辉似乎正回应着幽的话\r\n虽然叶空知道自己的雕龙银戒是有独立意识的，但这还是他第一次看到这戒指回应除他自己以外的人。看来眼前这人的确不简单，叶空隐约的知道自己这戒指应该是神器，只有实力接近神明的人才能发挥它真正的力量。叶空的直觉告诉自己，眼前这人应该就属于那个级别的人吧。\r\n戒指的银色光芒很快消失了，幽道：“不过，现在它的主人是你了，我对不属于自己的东西可没兴趣。”他说着将戒指丢还给了叶空，而后问：“小子，你知不知道给你戒指的人是谁，你又是否知道做这戒指的主人所要肩负的责任？”\r\n叶空坦白的答道：“这戒指大概在我还是婴儿的时候就戴在我身上了，我也不知道到底是谁给的，至于你说的什么责任我当然更不可能知道了。”\r\n幽略微惊讶了一下，随即自言自语似的道：“那家伙什么话都没留，这又是什么意思？”他略微低头凝视着比他矮了一个头的叶空，最后道：“不管他到底是怎么想的，他把戒指交给了你这件事总是没错的。看来我不得不给你补课了，你现在弱得这个样子，别说是负担那分责任了，若不是你运气好，早就被觊觎这戒指的人杀了。”被他批成脆弱不堪也没办法，叶空哪能跟他比呢。不过叶空却不知道他的“补课”是什么意思，难道这个素不相识的高人要教他魔法？\r\n幽却根本没有解释，只是指着西方道：“我们现在要向西走很长一段路到我的故乡去，如果没有异议现在就出发。”从他的语气里可以听出，他显然已不需要征求叶空的同意了。\r\n幽的话对于叶空和雷琪儿显然太过突然，已经缓和过来的雷琪儿冷声道：“我们根本就不认识你们，为什么要跟着你走？”\r\n幽道：“因为你们太过弱小，在这个世界里，弱者没有选择的权力。”\r\n有实力才有说话的权力，这话对于他们这些流浪者来说完全没错，只这一句就让渐渐知晓自己弱势的雷琪儿没办法反驳了。\r\n一旁的少妇看他们话说得这么僵，赶紧插话道：“小伙子、小姑娘你们别生气，大家好好说嘛。幽说话就这样不讲礼，你们别跟他计较。事情是这样的，你所戴的戒指是幽他们家族的，它原来的主人是我们的一个好友。我想他把是不得已才把这戒指给你的，因为它不但是件很厉害的神器，更代表着一种常人肩负不下的责任。但既然这戒指选择了你作为它的主人，这样的命运你恐怕是不能逃避的了。我们想带你去幽的故乡，让你了解一些关于这戒指的事，同时帮助你们增强实力以便应付将来的敌人。我们决没有恶意的，你们觉得怎么样？”她的语气和气得让叶空感到不可思议，温和的眼神，恬静的微笑，这真的是刚才骂街的那个火暴女人吗？\r\n叶空、雷琪儿对望了一眼，寻找这戒指的原主人本就是叶空的最大的目标，他是不可能反对的。而雷琪儿听说有机会变强，更不可能犹豫了。\r\n\r\n于是这一天叶空两人就跟着这对夫妇离开了皇都，走得太急甚至没来得及向萨里特大人辞行。\r\n幽和那叫艾维丽娜的少妇显然也经常到处旅行，一行人经过半个月的跋涉到了一个叶空曾经想要见识的地方。一堵光墙清楚的划定了这个世界的疆界：此处已是尽头，不允许任何异界妖魔的闯入，当然也不会让人类从这里出去进入扭曲空间。也许别的结界可能没有这样的界断世界的能力，但这远古结界却绝对能够，这可是集结了全世界大量魔法师贡献出的魔力，以无上的结印方法做成的结界，在结界完成后的几千年里，前前后后许多国家都曾组织魔法师团为结界注入魔力。自这结界形成开始的数千年来，这个世界再没有受过异界妖魔的入侵了。\r\n一行四人一直在向西前行，叶空本以为幽的家族在故都亚特兰帝斯里，毕竟帝国里能出幽这样的人物的恐怕也只有故都了。不过知道自己的猜想显然错了，幽的故乡在叶空无论如何也猜不到的地方，因为那个地方在他的观念里根本就不存在。\r\n当一行人到了远古结界边缘时，叶空疑惑的道：“幽大哥，你的故乡不会就是这里吧，人在这种地方真的能生活？”\r\n这片土地的确不是人甚至其他生命力更强悍的生物都没办法生活的。即使在正午，阳光射到这里时也已经如黄昏一样昏暗了，不过这一点倒可以解释幽那白得如纸的皮肤：严重的阳光不足。这里贫瘠得开裂的土地上寸草不声，万物也都好象走到尽头一般的虚弱无力。这里与刚才他们穿过的远古森林相差太大，完全像是被划了一道很明显的分界线似的：一边是茂密无比的原始森林，另一边则是毫无生机黑暗地带。这明显的层次感让叶空不仅想到，大概再过了这层死寂，就该是无尽的虚无了吧。\r\n幽指着那高大得遮蔽了天空和大地的光墙，道：“我的家乡还要在这个可笑的远古结界之外，真正守护这世界不受异界种族入侵的可不是这个结界，而是我们守护种族冥月一族。”他停了停，突然笑道：“你觉得为什么这里会这么死气沉沉的？”\r\n叶空如实答道：“也许是因为到了尽头，所以万物都开始凋零了吧。”\r\n幽带着点讽刺的语气道：“不对，这里寸草不生是因为这个结界，这结界里含有的能量太多太杂，乱得没办法。若不是结印的方式高明，这结界恐怕早就爆裂了。紊乱的能量散发出来，才导致了这片地区寸草不生的。若是不信，你就等着看好了。”\r\n幽独自走上前，从怀里摸出一块玉石，轻轻的将它放上光墙，然后默念起咒语。没过多久，他们面前的光墙竟然消失了一块，形成了能容一人通过的小门。叶空没想到居然连远古结界也是能够弄穿的，看来任何东西果然都没有绝对的界限的，世界尽头之外似乎也别有洞天呢。\r\n幽带头\r\n\r\n\r\n\r\n\r\n\r\n\r\n	第十三章 远古结界			Paragraph	2021-05-30	30000549
31000137	118	2021-05-30	                                                               第十八章 好人没好报\r\n    顺利的跋涉了六天，也就是距离继位大典也还有六天的时候，叶空和雷琪儿已经来到了魔法森林边缘。由于叶空两人是从西北的远古结界方向出发的，而被魔法森林团团围住的故都亚特兰帝斯却只有一条大路正东方向的大路通向森林之外，所以两人不得不穿越随时可能出现危险魔兽的魔法森林了。\r\n    只是，一直谨慎前行的两人没有遭到任何魔兽的攻击，却卷入了一场人类的战斗中。\r\n    在黄昏时候，随着魔法指针的指引慢慢向森林中心走的叶空和雷琪儿几乎是同时听到了远处传来的打斗声，两个人毫不犹豫的寻声过去，正好看到层次分明的两方人在一块小空地上对峙着。一边是个衣着贵族袍服的老头子带着暗杀服的、武者装甚至还有两个像很少见的狂战士的各种各样的人物，而另一边则清一色是黑衣蒙面，带头的竟正是叶空曾经见过的那个黑衣魔法师，虽然叶空自己用不了除空间之力外的任何元素能量，但是他却能看得出围绕着那魔法师的众多冰元素。\r\n    就在叶空刚看清那黑衣人时，双方已经打了起来。两个急噪的狂战士先动手了，两柄在空中旋了两圈，带着疾风直劈向最前边的两个黑衣人。不过即便是狂战士，如此大的动作也难免有间隙，两个黑衣人也都身手不凡，轻易的躲过了攻击，长剑分别刺向了各自的对手。狂战士不仅力大无比，动作也快得惊人，侧身避开的同时又是一计重斧出手。两个黑衣人的实力还要略胜狂战士一畴，但是令他们头痛的是，死缠不休的以命换命的攻击接踵而至。\r\n    一旁的贵族方的其他人见狂战士出手了，也都立即拥了上去，武器五花八门，攻击方式也各不相同。同时，黑衣人一方除了带头的那个冰系魔法师，其他人也都冲了过去，一场混战再所难免了。\r\n    隔得较远观战的叶空惊讶的发现，眼前的战士竟然都不算弱，根据幽讲的分阶法来看，黑衣人一方的除了冰系法师之外的七、八人都应该是六阶的战士，也就是和叶空他们在废气庄园遇到的荧雷剑士罗曼和他的三个同伴实力相近。而另外一方，除了那似乎手无缚鸡之力的贵族，其余近三十人有几个是六阶的，大部分的都是五阶中较强的，是以双方对战有的一对一，有的黑衣人一个挑四五个，基本上都打成了平手。\r\n    只是当叶空再仔细看时，贵族身边还有一个保镖没有出手，叶空直觉感到，这个人比前面战斗的那些人都高出一个档次。只是，到底是他与对面那冰系魔法师相比到底谁更厉害，就未可知了。叶空又仔细想了想，根据幽和寒星老师的话，只有筑就了魔法魂晶的魔法师才能在不靠魔杖或者其他辅助工具的情况下瞬间施法，而就叶空与他见面的那次经历，这个人看起来好象是个仅次于大魔导士的魔导士，也就是九阶的魔法师了。叶空听幽说，魔法师的强大之处在于破坏力，同阶的魔法师基本上没有可能击败同阶的战士，更不可能赢得了同阶射手，但是任何职业克制都超不过一阶的差距。由此看来，不论是七阶的异能者叶空，还是就快突破六阶达到七阶的雷琪儿，都是没有可能与这个黑衣人魔导士对抗的，幽曾说过，越阶挑战基本上是没什么悬念的。\r\n    就在叶空胡思乱想之际，战斗形势已经出现了变化。两个五阶的狂战士的攻击虽然猛烈而迅疾，但是两个在六阶中也不差的黑衣人凭着敏捷的身法和斗气的加持以沉稳的打法渐渐压制和击伤了两个狂战士，被激怒了的狂战士竟然不顾一切施展狂化的能力，在身体爆涨几分的同时，速度和力量大副提升，完全可以比拟比人类强壮数倍的兽人战士了。两个黑衣人还没有反应过来，就被更快速数倍的大斧劈中，其中一人当场毙命，另一人在最后一瞬避过要害，被击中后重伤惨呼一声飞了出去。\r\n    因为狂化而过度兴奋的狂战士禁不住见血的欲望，不分敌友的攻向四周的人，不论是友军还是敌人，都赶紧的退开了，都怕成了那疯狂斧击下的牺牲品。两个狂战士没能找到可以攻击的敌人，最终都看向了远处一直没有动过的黑衣魔导士。两个狂战士怒吼着冲了过去，大斧带着忽忽的风声劈下。然而结果却是，在斧刃到达静立不动的黑衣人身前时，两个狂战士已经成了两座冰雕，被一层厚厚的冰层包裹住了。\r\n    就在两个狂战士被冰封的瞬间，黑衣魔法师也动了，他的目标，正是那个贵族老头。而老头身边的保镖也直盯着黑衣魔法师，双方都知道对方实力不弱。 \r\n    黑衣魔法师随手一挥，十数支冰箭直向那保镖攻去。保镖抽出自己的武器，一把纯白色的钢爪，快速挥舞几下，将飞来的冰箭全数爪碎。这样一把只有最特别的杀手才会使用的武器让叶空想起了他的身份，这个人应该就是在帝国的地下活动中颇有名气的杀手“白骨魔爪”了，据说他以大白天在众目睽睽之下刺杀被重重保护的人而闻名，被杀者和他旁边的人在他出手时正好能看到白色的利爪被阳光映照闪亮得如同白骨。\r\n    能够招揽到这样一个杀手，这个贵族似乎也不简单了，只是叶空更为疑惑的是，这个人请来这么多或杀手、或佣兵、或流浪武者，他到底是要干什么呢？而黑衣魔法师怎么又会跟这些人打起来来呢？诸多疑问让他费解。\r\n    战斗仍在继续，众多黑衣人和佣兵、武者等都停了下来，他们知道黑衣魔法师和杀手白骨魔爪之间的战斗才是真正分胜负的一战，所以都目不转睛的看着两人的战斗。\r\n    若是论对攻杀人，杀手并不见得比黑衣魔法师弱，但是他的旁边偏偏有个天生傲慢天不怕地不怕的贵族老头就这么站着，完全不知闪躲。所以以快爪杀人的杀手只能守在雇主身边，挡下所有的攻击。最初的冰箭不管来多少杀手都不会觉得棘手，但是黑衣魔法师显然也抓住了他必须护卫雇主的弱点，由最初快速大量释放的冰箭渐渐变成了大块的冰球、冰块，再后来甚至用出了在地上蔓延的冰地龙、甚至还用上了领域魔法冰天雪地。杀手自己倒还没什么，虽然有些应接不暇，但还没有被大冰块或者从地下冒出来的冰龙撞上，只是他的雇主显然已经为自己的自大傲慢付出了代价，从远本比较温和的环境一下子进到了冰冷彻骨的雪地中，冷得这把老骨头直哆嗦。\r\n    叶空并不知道这群人是敌还是友，但他明白那黑衣魔法师应该是他迟早要面对的敌人，所以他决定要帮那个贵族了。交换了一下眼神，雷琪儿当然也知道曾经把自己逼到绝境的黑衣人一方是敌非友。叶空和雷琪儿几乎是同时出手了，叶空用他的空间撕裂之力将快要撞上杀手的冰快撕成两段，让那杀手有进攻的机会，而雷琪儿则冲向黑衣魔法师，虽然距离颇远，但在她瞬间爆发的斗气的加持下，她的速度之快远超从前，近两百米的距离四秒没到便已被她超越，双手握剑直刺向对方背部过去。然而黑衣魔法师的反应速度也不慢，在感知到身后袭击过来的敌人后，一面冰盾在一瞬间形成。利剑虽然最终破开了冰盾，但在剑身被盾阻的一点点时间里，黑衣魔法师已经闪到了一边。\r\n    \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n	第十八章 好人没好报			Paragraph	2021-05-30	30000549
31000123	101	2021-05-30	    1 纯银戒指， \r\n    这一夜，很静。雷琪儿听着叶空轻微的呼吸声，怎么也睡不着。佣兵、绑架、幕后黑手冰封了地窖想困死她的奇怪做法，雷琪儿翻来覆去总在想着这些事情，过了不知多久，她的思绪渐渐从这一天飘回到从前，想起了她自己的往事。她的出身，她的家庭，想起了她的母亲，而后突然意识到了自己活着的目标。她不由得问自己，这些两年来到底在做些什么呢？虽然的确每天都在练剑，但是自己每天都在想着见到叶空时该说什么话，即使练习的时候也总是心不在焉，这个样子要到什么时候才能超越那个人呢？雷琪儿偶尔能看到那个人显现一次实力，即便看不真切，她也知道自己即便苦练一百年也不一定能胜得过他，毕竟他也在努力提升着实力。到底该怎么办呢，到底怎样才有机会胜过他，雷琪儿胡思乱想了很久后，最后只想到了一个办法：她要离开这里，到外面的险恶的世界里去磨练自己！\r\n    雷琪儿是个想到就做并且说到做到的人，所以她决定，今晚就走。做这个决定的理由还有一个，虽然她自己不想承认，但是她知道自己的确不想面对面向叶空道别。\r\n    雷琪儿坐起身来，静静的看着睡得正香的叶空，忽然她做了一个连她自己都不敢相信的动作：她俯下身将嘴唇凑到了叶空面前想吻他的脸。\r\n    不过她的动作却被叶空的声音打断了，其实他一直都没有睡着，“你要到哪去？”他居然一语道破了雷琪儿的心事。\r\n    雷琪儿不由得惊讶着退开了两步，脸红的同时惊问：“你没睡？”\r\n    叶空睁开了眼睛，笑道：“若是我睡着了之后，你跑得不见踪影了，我该到哪里去找你？”\r\n    雷琪儿疑惑的道：“你怎么知道我要走？”\r\n    叶空慢悠悠的道：“总的来说，是因为雷琪儿你的心事很好猜。从我们出冰窖开始，你就有些心神不宁的样子，而且我也知道其实你并不想呆在学院里的。况且现在又有机会可以不回去了。”他说着又习惯性的摸起了脑袋，自言自语似的笑道：“不过这些好像推不出什么呢，结果还是因为直觉吧，也许是像爷爷说的那样我们两个很像吧。总之，爷爷要我照顾你，所以多注意你的行动总是好的。”\r\n    雷琪儿不知不觉的带着点娇气道：“我自己好好的，才不要你来照顾。反正我是决定走了，你拦不住我的。”\r\n    叶空笑道：“我为什么要拦你？我想去旅行的愿望不知比你强上多少倍呢。我想去魔法帝国去见那些大魔法师，听他们讲如何练习魔法；我想去荣耀帝国，看看天空之城到底是什么样子；我想到铁血帝国的东部大森林里去寻找龙族；还有光明教会的圣殿，远古结界，世界之树等等很多东西我都想见识，我想向传说中的强者肖那样走边天下。不过，我更想去寻找给我这个银戒指的人。”不管这些是否现实，叶空的思维很快的进入了梦想中的旅程，他看了看手上的银色雕龙戒指，兴奋的说着。他显然早已决定迟早要出去旅行闯荡的。\r\n    雷琪儿看着叶空那兴奋的样子，忍不住道：“你也不瞧瞧你现在的样子，你以为那些地方是普通人可以去的吗？别说是去十个人十个都回不来的龙谷，我看你连远古结界都去不了。”她停了停，忽然笑了：“不过，我们至少该去试试，开开眼界。恩，我们明天就出发。”她也是一副跃跃欲试的样子，不过才隔了一会儿，她忽然记起刚才的事，突然表情怪异的道：“空，你刚才什么都没看见，是不是？”她指的当然是刚才她自己想吻叶空的事。\r\n    叶空笑着答道：“恩，我什么都没看到。”他停了两秒，就在雷琪儿傻傻的要放下心来的时候，却道：“不过我什么都感觉到了。”他刚才闭着眼当然没看到，不过既然他能说话打断雷琪儿的动作，当然是知道究竟发生过什么事的。\r\n    雷琪儿一下子脸红了，急道：“你……”却没想到叶空做了一个更令她惊讶的动作，睡在左边的他用右手抓住雷琪儿的右肩，将原本坐着的她压倒睡到床上，一边笑道：“好了，好了，明天出发。今天就好好休息，好好休息。”\r\n    叶空本来没有别的意思，不过他的动作实在太大又太突然了。结果就是，第二天两人向主人家辞行的时候，叶空的脸上就多了两处淤青。主人家当然能看得出来昨晚发生了点事情，但他只是一笑带过，没多说什么。\r\n    两个人这一天就正式踏上了旅程，他们的第一个目的地就是魔法帝国。不过在此之前，叶空还有一件事要做。\r\n    \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n    \r\n	第一章 少年征程			Setting	2021-05-30	30000549
31000138	100	2021-05-30	序章\r\n第一章 少年征程\r\n第二章 黑暗祭祀\r\n第三章 教皇阴影\r\n第四章 毁灭之王\r\n第五章 龙族纷争\r\n第六章 封印之戒\r\n第七章 诸神黄昏	章节			Setting	2021-05-30	30000549
31000139	5	2021-05-30	主角转生为王子，有一个适应力超强的家庭，即使听说了世界将要被破坏神毁灭，也毫不动摇的做着自己的事情。\r\n父亲虽然是个喜欢开玩笑的嬉皮国王，但确实有履行自己率领和保护国民的责任，也意外受国民的尊敬。母亲则是个只关心花花草草的天然王后，偶尔会教训一下捣乱花丛的动物。身为公主的妹妹则是个爱照顾人的小女孩，志向是服侍主人的女仆。\r\n意外来到破坏神的庭院，主角与邋遢的破坏神交好，在其助手的解说下知道了这个世界将要毁灭的命运。而后主角交涉着有没有诺亚方舟那样的避难所，破坏神就说在自己的庭院里就是安全的，所以主角决定让自己的母亲和妹妹来这里避难，必经不可能带大量的人过来，而父亲以及交好的将军，则应该为保护自己的世界去奋战，刚好妹妹会照顾人，母亲也是天然呆，就让她们两人在这个神奇空间里避难吧。\r\n主角把她们骗到了这里，而后两人也接受了安排，回头去帮助父亲整理国家的主角，在告知父亲事情后父亲也很自然的接受了他的决定。真是群接受能力强大，在哪都能活下去的强人呢。\r\n	破坏神的庭院			Paragraph	2021-05-30	30000543
31000140	1000	2021-05-30	剑寒篇\r\n剑云篇\r\n剑凌篇\r\n剑烈篇\r\n总集篇：暗部来袭	第一部 极之阴影			Paragraph	2021-05-30	30000551
31000141	2000	2021-05-30	第一卷 外星来客.txt\r\n第二卷 星际先遣队.txt\r\n第三卷 初战告捷.txt\r\n第四卷 连连失利.txt\r\n第五卷 最后的突围.txt\r\n第六卷 极的真相.txt\r\n第七卷 疾驰的援军.txt\r\n第八卷 新的较量.txt\r\n第九卷 调虎离山.txt\r\n第十卷 地球的灾难.txt\r\n第十一卷 最后的挑战者.txt	第二部 星际之战			Paragraph	2021-05-30	30000551
31000142	3000	2021-05-30	\r\n\r\n\r\n镇魂曲\r\n    极影的声音，就是他们星球中人想出的，斩断仇恨连锁、消除无尽纷争的最终力量——镇魂曲。\r\n    而直到最后，才由从极影之星上传送过来的剑寒之手，展示了其完整音像，揭示了其真正含义。在那之前，却一直是不法者手中，毁灭一切的魔音。	第三部 十年纷争			Paragraph	2021-05-30	30000551
31000143	100	2021-05-30	目录：\r\n第一章:\r\n       魔法校园-第七学园-室友-试炼-金角火蟒\r\n       能力测试-擂台赛-冰女火女\r\n       新学舍-卡卡大少-砂国公主-书呆子的恋情\r\n       黑暗精灵-（银铃）-冰之少女\r\n       学院杯-意外的夺冠\r\n第二章：\r\n       远方来客-不能回避的挑战-战前准备\r\n       艰苦的第一站-险胜-席卷的狂风-败\r\n       钰音的能力-宿敌-雷鸣火爆与风精降临-平手\r\n       四女争夫-强势的第七学院\r\n第三章：\r\n       不速之客-神秘的藏书阁-仇人见面-暴走的琳娜\r\n       深藏不露的钰音-风平浪静的新学期-真正的万事通\r\n       独自努力的人-力量与生活-银与冰的试炼\r\n       突飞猛进的第七学院\r\n       苍穹之链-组合-争夺赛开幕-各擅胜场\r\n       拉锯战-明帮暗助-浮世三千-激战时刻\r\n       捡了便宜的后来者-成败定局\r\n第四章：\r\n       游学之旅-炎之国度-麻烦不断-火之都-皇帝\r\n       冰霜之星-淘气小丫头-冰封之牢-冰皇伽一\r\n       追索-冰雪之崖-七院对冰霜之星-再战冰皇\r\n       破魔剑幽帝-祭品-冰之圣龙-风雷动-烈炎之极-第四位公主\r\n第五章：\r\n       小委托人-音之牧笛-狂战佣兵团\r\n       圣剑持有者-意外的救援-四散-魔法剑白皇\r\n       双剑的往事-阻击-光明之子-冰霜的陷阱-冰魂结印\r\n第六章：\r\n       聚集-黑暗沼泽-暗渡明闯-全面开战\r\n       双剑对天剑-风雷齐鸣-冰雪女神-乐神与冰神\r\n       神器冰之-死战-生还-返校\r\n第七章：\r\n       忙碌的最后学年-时空之间-倾巢而出\r\n       黑袍法师再现-禁林深处-黑暗祭祀\r\n       圣剑再现-重重阻隔-援军无数-暗之圣女\r\n       众神之间-暗神复苏-无匹的神力\r\n       永生的乐神-魔法之旋律\r\n       暗流涌动的校园-学院的拥护者-霸气-重逢\r\n\r\n人物\r\n第七学院：\r\n钰音、老师、小学姐\r\n琳娜、砂国公主、大少爷、优等生、书呆子、暗影女\r\n\r\n风之国教学团：\r\n风魔导、风之女、炎王族、其他三个酱油\r\n\r\n\r\n\r\n狂战佣兵团：（冰霜之星）\r\n冰皇（副团长）、狂战士（团长）\r\n\r\n\r\n十神：\r\n光、水、月、土、冰\r\n暗、雷(火)、风、器、乐\r\n（另）雷\r\n\r\n\r\n第一卷：\r\n魔法校园：\r\n    长途跋涉的琳娜总算来到了位于三叶大陆中心的魔法学院三叶学院，这天正是新生报名的日子，许多家长陪伴着子女排在长列之中，其中衣饰华丽的贵族比平民还多，以致于从小流浪，身份地位还在平明之下的琳娜有种想避开的感觉。不过从来好强的她不是这么没用的人，独自上前，在他人惊讶的眼光中，将从所救的老婆婆的介绍信交给负责接待的魔法师，虽然心中的确有些不安和期待。在这个每人只有一系魔法力量的世界里，独自拥有雷、火两系魔法的琳娜，绝对是个奇特的存在。看着别的新生在那里用水晶球测试能力强弱，她也不禁升起了些孩子气的好胜心。接介绍信的是个年轻的很容易看懂的魔法师，最初对一身寒掺衣服的琳娜有些轻视，看到介绍信的封面后十分吃惊，立刻给她让坐，然而在看过内容后，又明显十分的疑惑和怀疑、然后跑去问自己的上官去了。一个中年魔法师告诉琳娜，她要加入的学院不在本院中，那是他也找不到地方的第七学院，中年人大致指了下路就进屋了。\r\n    琳娜受不了旁观者的视线，立刻沿着中年人所指的方向往所谓的禁林方向走，途中还遇到了两个女孩，一个年纪较大却十分慌张的女孩被另一个娇小可爱但语气老气横秋的女孩推着从琳娜身边走过，听话语两人是去接待新生的。琳娜继续前行，沿着一条小溪来到了一处水面仿佛镜面的魔法泉边，一个满头雪白长发的女孩正在这里洗澡。同为女性的琳娜竟然都被那雪白的背影所吸引，不由自主的走了上去。女子回过头来，眼神有些冷然淡漠。琳娜问起这里是否是第七学院，名叫钰音的女子用一字一顿仿佛机器人般的语言回答了，声音虽然有些沙哑而且略显中性，但其实挺好听的，。找不到话题的琳娜知道走到地方了，干脆自己也下去洗澡了，毕竟她也因为赶路而满身尘土了，而且这个看来清澈却无法透视的泉水似乎有特殊的魔力。\r\n    洗完澡先一步上岸的琳娜很快看到了曾经路遇的两个女孩，她们带着第七学院的新生们回来了，其中年纪大些但全无威严的女孩竟是第七学院唯一的老师，而另一个娇小的则是高琳娜等一个学年的学姐小梦。终于泡完澡上岸的钰音则是学院里另一个前辈，除此之外，只有今年才加入第七学院的六个新生了。一个人数只有个位数的学院，与其他多达五六百人的学院相比，着实让琳娜有些无语。\r\n    在第一学院的最初半个月，琳娜算是认识了自己学院的同学了。性格开朗一副花花公子样子却其实很照顾同伴的贵族大少爷卡卡，以及与他住在一起的总是戴着厚厚眼睛的书呆，样貌和性格都比较孩子气唯有说话老气横秋的小学姐，和她住一起的则是性格害羞、内向的漂亮女孩，姿容甚至可以跟钰音一比，她似乎几次暗示似的问琳娜，与钰音住在一起没有问题吗，琳娜倒没听懂什么意思。还有在这个完全不像学校的学院里仍然勤奋好学、承担班长职务的文静女孩，至于与她同住的那个服饰偏黑颇有些神秘的女孩琳娜到没怎么见过。最后就是与琳娜同住的钰音了。这学院竟然只有四栋相隔甚远的石屋作学生宿舍，上课的地方竟然也只是个露天的石台，开来很有些年头了。\r\n    除了认识这些人，这半个月中对琳娜最重要的事情只有一件，那是让她可以记恨一辈子的事。那天，如往常一般自己跑去陪钰音泡泉水的琳娜听到迦娜、小梦的声音了，于是大声叫她们过来。不料跑过来的迦娜一下子捂住了脸，而小梦也有些尴尬。钰音本就是那种说是男的理所当然、说是女的也并不奇怪的面容和身形，众人中也只有琳娜，在先入为主的观念中，以为他是女子。在小梦的解释和不远处仍独自泡泉水的钰音的肯定之后，琳娜一下子尴尬得，只见泉水中雷电乱串、火焰冲天。\r\n    之后琳娜就搬到迦娜和小梦的房间去跟迦娜挤了，另一边小梦则早就和老师挤着睡了。钰音似乎完全没有因为这个误会而烦恼，琳娜只能生气地想到，反正吃亏的不是他，但事实上，犯错的也并不是他。为了逃避尴尬，琳娜陪班长去询问关于开学季的大赛的事，然而得到的答案却是，要参加奖品丰厚的开学季的魔法比斗大会，需要展现学院实力的战绩，原本并不弱的雷系学院和水系学院就是因为没能成功狩猎到所寻找的魔兽而失去了比斗资格。在琳娜的死缠之下，负责运营大会的中年魔法师拿出火系学院所捕获的金角火蟒的角来，说如果她们第七学院能取下这个等级魔兽身上的宝物做证明，就能够参赛。\r\n    被小瞧了的琳娜生气地要独自去找魔兽，往禁林里探了一次，虽然危险，倒还真找到了一只金角火蟒。不过，以她的个人能力，完全没有击败一只接近龙种的魔兽。一个月的界限快到了，比较着急的琳娜和最终对大家坦白了的班长总算碰了次面，班长让她稍微等等，这次是整个第七学院前去讨伐火蟒。\r\n    \r\n    \r\n    \r\n    \r\n    \r\n    \r\n    \r\n    \r\n    \r\n    \r\n    \r\n    \r\n\r\n\r\n	目录			Paragraph	2021-05-30	30000552
31000144	101	2021-05-30	    阿拉蕾是块三叶草形的人口总数仅仅两百万的小型大陆，炎凌、流岚、砂三个帝国各统治者一片叶形的陆地。三大帝国都不甘心安于现状，前前后后出现过不少野心家和好战分子妄图达成统一阿拉蕾的野心，不过可笑的是，在三大帝国基本成型后的两百多年来，三国之间甚至没有发生过一次算得上战争的武力冲突。\r\n    由于阿拉蕾大陆四周的大海极度异常，暴流不断，常常有海啸飓风出现，天空中气流也异常混乱，海岸边完全不能住人，所以整个大陆的航海造船技术几乎没有。除了极少数冒险者，没人会去跟大海打交道。所以，阿拉蕾只有陆路交通。而在三叶草中心，三大帝国唯一的交汇点，伫立着令三方都不敢轻举妄动的，有着千年历史中的阿拉蕾学园。    \r\n    这一天，一个黑色短发、背着旅行包，一脸风尘的十五岁女孩来到了阿拉蕾学园的大门前。这一天正是新生报到的时间，熙熙攘攘的人群涌进学校。阿拉蕾学园可不止是历史悠久，她真正的实力在于她聚集了三个大陆最优秀的魔法老师，三大帝国大多数精英都师从于此。而这一天，为了让自己的孩子能在这里得到特殊照顾，在无论什么场合都难以聚集的三大帝国的贵族们纷纷来到了阿拉蕾学园。在纷乱的上流社会的人群里，原本颇为漂亮的女孩已经不再那么显眼了，再加上她那一身朴素到没办法的衣服，忙得不可开交的学校教员根本就没心思管她。\r\n    一个人生活惯了的女孩并没有失落，小心翼翼的穿过人群找寻着自己的报名地点。不同出身的人有不同的报名方式，有的是直接缴纳了超高昂的学费直接到自己想要去的学院的，这种人几乎都是大富豪家的无用子弟，根本没有魔法才能却要进这个学校来混的，他们的主要人物是多巴结权贵、精英，商人毕竟地位低下。大多数人依着自己的魔法能力，报考自己想要进入的学院，通过测试就能被录取。当然也有极少数大贵族根本不用测试，他们有的是来学习魔法的，但更多的则是来收聚人脉的，毕竟从这里出来的优秀学生回到本国可都是前途无量的年轻一代，正是这些未来掌权者最需要的。\r\n    而女孩自己，则是少数凭借推荐信来报考的，她其实还不能肯定自己是否能进入这学校，毕竟只是一封推荐信，她连给她推荐信的图拉婆婆的身份都不清楚。女孩曾经猜想她是这个学校的老师，不过就算是老师，也不一定能让她这么个没半点背景的普通孩子进这个大陆最好的学校吧。    \r\n    站进推荐报考的队列，女孩还是比较兴奋的，毕竟对自己的能力很有信心。\r\n    在这个世界上，并不是每个人都有魔法才能的，而且每个人最多只能使用一种魔法属性是常识，大多数人都是“水”“火”“风”“土”“光”这五个属性，甚至虽然“水”和“冰”同源，但是能使用“冰”的人水也使用不好，而拥有“雷”属性的魔法师更是完全不能运用“风”。\r\n    而女孩，或许是整个阿拉蕾大陆唯一一个拥有两种属性的人，她不仅能掌控火焰，还能操纵雷电，女孩自信在两种能力上她都是有超过一般学生的实力的。相信只要给那些老师展示了这两个能力，学校是不会不接纳她的。 \r\n    只是女孩也有所犹豫，她到底该加入哪个学院呢。阿拉蕾学园分为“水”“火”“风”“土”“光”“”六大学院，拥有火属性的就该加入“爆炎”学院，可是雷属性又隶属于“狂风”学院的“雷“分院。在来这里之前女孩就犹豫了很久了，到底加入哪个学院呢。听说“爆炎”与“狂风”还是水火不容的关系。\r\n    时不时的有些“大人物”越过队伍报了名，旁边的人纷纷小声抱怨或咒骂。但女孩没有抱怨，她知道抱怨除了破坏自己的好心情外，什么作用都起不了。其中一个一身耀眼的火红披风男孩或许听到了旁边不堪的话语，右手向无人处一举，“爆炎术!”一个大火球撞在水晶柱上，爆开四散了。抱怨声也随着这火焰消失了，剩下的只是少数人的窃窃私语。女孩也惊讶了，快速吟唱，这么高级的能力，可不该是魔法学徒的所能掌握的，而且其快速施展的爆炎术所凝聚的火球的大小，竟然与一向以来在魔力上远超旁人的自己的爆炎术不相上下，那么说男孩的火系能力明显在自己之上。精英汇聚之地果然不同凡响，原本充足的信心有些动摇了。女孩隐约听旁人说起，这个男孩叫麦亚。\r\n    漫长的等候过后终于轮到她了，教员是个中年人，从刚才的举动能看出是个比较势力的人。中年教员问：“姓名？”\r\n    “琳娜·雷奥。”\r\n    女孩颇为忐忑的递上推荐信，无论如何至少要争取到表现自己实力的机会。\r\n    中年教员看她是一个人来的，懒洋洋接过信，随手拆了一看，眼睛瞬间瞪直了，“嗖”的一下从凳子窜了起来，因为他一眼扫到了信件署名。\r\n    “真--真是抱歉，”中年教员声音都颤抖了，“真是抱歉我不知道您是她老人家要的人，我--我--我们应该会有人专程接待您啊，您没遇到？”\r\n    琳娜这就一头雾水了，难道看起来虚弱而慈祥的图拉婆婆是什么大人物？\r\n    这时后便的人群也骚动了，倒是很有些人知道教员的势力，不过能把他吓出汗的人物可不多，一时间看热闹的人越来越多了。\r\n    琳娜虽然感觉录取的希望大了有些欣喜，不过被那么多人在背后议论的滋味可不舒服，在中年教员不知所措的时候，主动问：“那我可以开始测试了吗？”说着指着眼前的帐篷，前面的人都是进入那里测试能力的：有的人兴高采烈的出来，一看就知道通过了；有的人则催头丧气，多半没希望了。\r\n    中年教员终于回过神来，结巴道：“不用测了！不用测了！她老人家推荐您入哪个学院我叫人送你过去！”\r\n    琳娜回答：“我也不知道，听图拉婆婆说她在信里写了的。”“图拉婆婆”一词一出口果然引来一大片惊异的眼神。\r\n    中年教员仔细看着信，眼神突然抖了抖，用比刚才惊讶时更沙哑的声音念道：“特殊能力学院。”\r\n    “特殊能力学院？”女孩可没听过阿拉蕾学园还有这么个学院。旁边的不少人也是很不解，纷纷左顾右盼，而少数知情的人已经嗤笑出声了。过了好一会儿，旁边的人一个传一个，笑声更大了。\r\n    琳娜虽然比普通孩子成熟得多，但却始终是个受不得嘲笑的女孩，她实在忍不住了，向还在木讷的教员问道：“可以告诉我我的学院在哪吗？我自己去找好了。”\r\n    “额。”教员把推荐信递回给琳娜，“上面写了学院地址和你的宿舍号的，你自己去找吧。老实说，我们这儿也没人找得到。”教员毕竟还没有明显嘲讽的意思，不过旁边的人已经忍不住笑了出来。\r\n    气恼的琳娜走得更快了。她转出人堆，朝信上写的森林走去时，正巧看见一个小女孩拖着个教师模样的大女孩从对面走来：“快走啦，好不容易能有几个新人来，要是人家找不到地方走了，我不就又得一个人对着墙发呆了吗？”\r\n    被小女孩拖得手忙脚乱的大女孩快哭出来了，“小希别拖我拉，我自己走好不好？”\r\n    --------------------------------------------------------------------\r\n    \r\n    琳娜虽然已经有心里准备了，可还是没想到自己的学院还真有够寒酸的。与学园中心那些完全紫水晶构架的魔法建筑相比，这里简直就不能住人了。在学园东边的树林边沿，稀稀落落的石砌矮房竟然就是她的学院的教学楼和宿舍楼。估计教学楼里什么研究设施都不会有的，宿舍则竟然分得很开。当她找到墙上写有“3”的那间她所要住的石屋时，就更加惊讶了；石砌的房间，装饰朴素都不算什么；窗台上攀着些古藤，房檐房顶还有不少鸟窝就有些过分了；更过分的是墙角有好几个洞，似乎随时都会有老鼠蟑螂蜘蛛什么的爬出来的样子。\r\n    还好琳娜也是过苦日子过惯了的，她很快调整心情，发现这个房子倒是真的很有自然气息。门前有小溪流淌，屋后的树林飘来阵阵香气。\r\n    屋子不大，两人间的，而琳娜的室友早已到了。那是个叫“钰音”的很有些奇怪的女孩，个子比琳娜高一些，身上总穿着一件修道士的白袍，皮肤白得出奇，头发也比琳娜还短很多，像个男孩子，一脸平静祥和，不爱说话，不过声音却挺好听的，虽然比较中性。更奇怪的是，不管是脸型还是声音，琳娜总有点儿怪怪的感觉。\r\n    琳娜原本是个挺健谈的人，可跟钰音在一起，总觉得找不到话说。虽然钰音友好的告诉她住在这里需要注意的事项，不过琳娜心底还是更希望跟一个能疯到一起的姐妹住在一起。\r\n    钰音似乎已经在这里住了很久了，她的床早已经跟房子一样老旧了，而琳娜这张床却是才搬过来的新床。琳娜好心让钰音跟她一起睡这样好床，她却总是拒绝，在那张随时可能有爬虫出现的旧床上睡得安稳得很。说来也奇怪，整个房间附近的小动物们都对钰音很友善。让琳娜有时突发奇想，钰音的“特殊能力”是不是就是跟动物交流。\r\n    有一次琳娜就直接问过她，钰音笑了笑：“只要你真心对它们好，它们就会真心对你的。”\r\n    琳娜隐隐约约能感觉到与钰音的一些距离，同时女孩，钰音却从没在她跟前换过衣服。矜持到几乎都不能跟她开玩笑，而且有时候显得特别不像个年轻女孩子，甚至不像个人，平时脸上几乎都没有表情。相反的琳娜却大气得多了，随便多了。第二天，琳娜看着小溪清澈，干脆就跳进去洗澡去了。\r\n    在宿舍呆了三天之后，琳娜和钰音终于迎来了本学院的开学典礼，直到此时她才知道为什么她们会被人嘲笑了。\r\n女老师伊蒂丝是刚刚从这个学院毕业的学生，胆子特别小，做事也有些天然呆，弄得琳娜只好随时在旁边帮忙。\r\n    当伊蒂丝提出选一位班长的时候，其余7个学生同时把目光转向琳娜，就她刚才表现出的威慑力，班长当然是非她莫属了。琳娜也不推辞，她的确比同龄的绝大多数人都能干。\t\r\n    琳娜陪着伊蒂丝忙碌了半天，带着一身疲惫回到了宿舍。钰音早已回来，正在换另一件修士袍。琳娜早就很奇怪，为什么钰音这么漂亮的女孩子怎么会只穿这种修士服，而且还是两套换着穿。琳娜一边脱去被汗打湿了的衣服，一边好奇地：“钰音，你不要总穿一身这么怪的衣服嘛，简直就是个男孩子。哎呀，说起来你倒真像个男孩子，看来真得好好检查一下，要不然我都怀疑自己跟一个男人睡在一个屋子里呢！嘿嘿！”说着她举起手作出要扑向钰音的样子，这还是她第一次跟钰音开玩笑。\r\n    不过钰音却没有笑，他平静的穿好修士袍，平静的说：“我倒觉得这套衣服没什么奇怪的，还挺适合我的。而且，我本来就是男人。”\r\n    钰音没再说话，琳娜呆住了，她知道钰音不像个会开玩笑的人。\r\n    过了一会儿，琳娜的脸烧红了。\r\n    又过了好一会儿，一股火焰冲天而起。\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n    六大学院每个学院几乎都有六、七百人，而她们这个名义上的第七学院“特殊能力学院”居然只有三个班总共24个人，老师也才3个。27个人站在一个小型塔亚石像面前，年代久远的石像已经有了不受裂缝，侵蚀得不成样子。塔亚是学院创始人和第一任院长，也是千年前神魔大战时期的英雄，不过估计他当年创立这个学院的时候所经历的艰难，也没有这个石像经历的磨难多。\r\n    开学典礼才开始，就有两个调皮的孩子捣乱起来。一个蓝头发蓝眼睛的小男孩摇晃着手，在空中召唤出一只装满面粉的大布袋，袋口一打开，漫天的面粉向众人撒来，猝不及防的老师学生一齐遭了殃。而另一个绿头发绿眼睛小男孩则趁着混乱拿出银币砸人，在他手里轻轻的银币砸到人身上时，却比砖块还重得多，一时间惨叫连连却不知道是谁干的。\r\n    带领琳娜这边8人的那个女老师估计还不到20岁，混乱中她比学生还恐慌。而另两个老师虽然知道是谁干的，却更知道这两个小家伙是流岚贵族法兰特家族的继承人蓝蓝·法兰特和优优·法兰特，自己这个小小教师可惹不得。\r\n    于是混乱越来越狠，一个布袋面粉撒完了，蓝蓝又招来一个。大多数学生用上自己的特殊能力想抵挡面粉，却只是让更多人遭遇麻烦。\r\n    琳娜首先想到的是别让钰音受到惊吓，尽力把她往旁边拖，还尽力帮她挡下大多数面粉。不过看似柔弱的钰音竟然完全没有慌乱，朝着琳娜笑了笑：“谢谢。”钰音的笑容总是那么温和，反而让琳娜急躁的心情冷静了下来。\r\n    “没什么。”琳娜回答，说着她回头看去，虽然面粉仍在下，不过琳娜还是看清了局面。三个老师居然都跟学生一样乱来。琳娜实在对自己这个学院失望透了。\r\n    实在看不下去的琳娜举起右手指向天上的布袋：“大自然最活跃最勇敢的火元素，请遵循契约显示与我身前----火球术！”火红色的元素能量聚向琳娜的手心，迅速形成一个一英尺宽大火球射向天空，轰的一声炸开，将布袋炸得粉碎，面粉也被爆炸所产生的气流带得很远。\r\n    爆炸声让所有人都静了下来，剩下的面粉飘飞落地之后，大家才看清了情况。好戏被人家破坏了的蓝蓝正想招个布袋直接砸琳娜，手正要动，琳娜的另一个小型火球已经飞了过去，在小孩身后不远处爆炸，气流把他推倒在地，呛了不少面粉。\r\n    而优优没想到竟然有人敢跟他们动手，手上银币直向琳娜砸来。看着琳娜左手伸出抓向银币，优优暗自得意，自己的银币岂是那么好接的。可正当他以为银币将打肿琳娜的手掌时，琳娜的左手突然闪现出蓝色闪电，闪电贯穿银币，银币还没有碰触琳娜的手就已经停了下来，悬在琳娜掌心上方。琳娜握住银币，顺手丢回，携带着雷电的银币流星般从优优耳边穿过，把他吓呆了。\r\n    身兼火焰、雷电两种属性的魔法师，两下就把无法无天的法兰特兄弟收拾了，在场的老师、学生都惊异的看着琳娜。虽然不想表现得太强势，但是这么个学院让琳娜也实在没办法了。她回头，沉声说：“站回队列，典礼继续吧。”然后走到自己班的女老师身边，帮她捡起典礼用的宣誓文件。\r\n    集体向塔亚石像宣誓要以正直态度学习、研究魔法的什么的一大段誓言后，典礼总算告一段落。此后各班各自来到自己的教室，开始开学事宜。\r\n\r\n\r\n\r\n	魔法校园			Paragraph	2021-05-30	30000552
31000145	102	2021-05-30	    琳娜这天晚上是在同学小希和克丽丝的房间度过的，但是她都不清楚自己是怎么走到这边来的。反正脑子一片空白的她也没给另外两个女孩子说清楚到底发生了什么事。\r\n    小希是班里最小的女孩，虽然她自称已经十三岁半了，不过因为太娇小，怎么看都是十岁不到。再加上小希的特殊能力是把“非常可爱”的东西具象化，变出熊宝宝、洋娃娃、气球锤子之类的东西，让她就更显“可爱”了。而克丽丝虽然既漂亮又很有气质，但却总是不引人注目。比起矜持，她更多的是害羞，特别是面对陌生人时，几乎都说不出话来。\r\n    小希她们的宿舍可就比琳娜的宿舍可爱多了，虽然同样是石屋。但是窗户地板可没有半点野生动植物的痕迹，而屋子里更是到处是可爱的娃娃玩具，软绵绵的枕头被子，整个房间都好像是粉红色的。虽然比琳娜比其他孩子更早直面生活，但是琳娜却也有喜欢可爱东西的天性，这点甚至胜过很多七、八岁的小孩子。琳娜边睡边想，这才像是女孩子的房间嘛，哪像那个钰音那个混蛋住的地方，对那里本来就不是女孩子住的地方，我怎么没早发觉呢！想着想着，她的脸又红透了，这三天完全没防备的跟一个男的住在一起，特别是那次在小溪里洗完澡之后什么都没穿就回屋了，就算钰音不特意看，那也是什么该看到的不该看到的都被看光了。\r\n    两个人收留了琳娜，好奇的小希左问右问总是问不出什么来，只好作罢。\r\n    第二天琳娜和小希、克丽丝一起来到教室，却正好碰到钰音和另外两个男学生若无其事的走过来。琳娜脸上又一阵火烧，怒气又来了。本来拥有火属性的人就比较容易发怒，而琳娜更是其中特别容易发怒的，如果不是生活的压迫让她学会了控制自己的情绪，还不知道会成为什么样的火爆脾气。几乎是本能的，琳娜没有吟唱，抬手一个小火球就砸了过去，目标正对着钰音。只是刚出手琳娜就后悔了，她还从没做过这么胡乱伤人的举动。\r\n    琳娜的举动把旁边的人都吓了一跳。两个男学生卡卡恩迪和凯文斯昨天可是见识了这位班长的脾气和实力，下意识的想往后跑，钰音却是视若无睹的继续向这边走，小希已经闭上眼睛，唯有克丽丝举起了双手。\r\n    火球在钰音身前爆炸，不过烟雾消散之后，钰音却丝毫无损。琳娜定睛一看，钰音面前竟然有一面光盾，琳娜下意识的看向旁边，克丽丝双手还没放下，这就是她的特殊能力。\r\n    克丽丝也转向琳娜，怯生生的说：“琳娜，这个，这个，钰音同学他不是坏人的。”克丽丝显然不知道琳娜和钰音之间发生了什么，不过昨天的琳娜给她留下的印象可是很强势的，生怕她还想伤人，都没敢解除防护盾。昨天琳娜帮着伊蒂丝老师忙活的时候，其他7个同学已经互相熟悉了，克丽丝对钰音的感觉还是挺好的。\r\n    琳娜冷笑：“他倒不是坏人，就是不是个人而已。”\r\n    此时唯有小希注意到，琳娜的脸又有些红了。嗅出了点八卦味道的小希笑嘻嘻的问琳娜：“他什么地方不是人啊？”     琳娜愣了愣：“他---他---他明明是个男的却假扮女孩子。”琳娜实在不知道说什么，总不能明明白白说自己跟他“同居”，什么都被看光了吧，可是不这么说又完全不能显得钰音的罪大恶极啊。\r\n    卡卡恩迪和凯文斯见班长不再发飙，终于敢过来了，两人奇怪的看向琳娜。卡卡恩迪奇莫名其妙的问：“钰音假扮女人？他不是一直都这么套不伦不类的修士袍吗？”克丽丝和小希也疑惑的看着琳娜，不明白她说什么。\r\n    琳娜的脸更红了，完全不知道说什么了。仔细想想，钰音也的确没说过自己是女的，只是自己有了室友肯定是女孩子的成见才会出现这样的结果。最气人的是，琳娜仔细看着钰音，他那张脸可真够中性的，以前以为他是女孩的时候，怎么看怎么像个文静的姑娘，可现在看来，又的确是个挺帅的小伙子了。还有他的声音也是，虽然好听，却分不清男女。\r\n    不过现实是琳娜明明吃了亏说不出口，还弄成了个好像仗势欺人的摸样。看着其他人投来的怪异的目光，琳娜更感觉委屈了，“这个---这个---”自从满了十岁以来从没哭过的琳娜此刻也感觉泪水在眼睛里打转了。\r\n    这时一直被忽略了的钰音终于开口了：“额，我和她之间有点儿误会。额，我后来想了想，的确是我的错。”\r\n    停了停，钰音站直了，很正式的向琳娜行了个礼：“对于我给您造成的困扰表示万分的抱歉。我为人比较迟钝，但是并没有恶意。还请您原谅。”\r\n    有个台阶可下，琳娜当然也想尽快摆脱这种尴尬局面。她点点头：“好吧，既然你已经认错那就既往必究了。”话一说完她转身就走，至少现在她可不想跟钰音呆在一块儿。虽然对于钰音的替自己解围还算满意，不过琳娜还是忍不住挑他的毛病：礼行得那么庄重，话又说得那么重，搞得其中隐情很多的样子，还真是“为人迟钝”呢。\r\n\r\n    -------------------------------------------------------------------\r\n\r\n    第一天的课程全都是基础魔法理论，这些东西早在琳娜初学魔法的时候就已经背的滚瓜烂熟了。听着这些，让她不由得想起了当初学习魔法的经过。\r\n    还记得当时村长安德雷德爷爷千辛万苦的招来魔法学院的老师来检测村里孩子们的魔法能力，可是一直都没有检测出哪怕一个有资格成为魔法师的小孩，安德雷德爷爷当时是多么失望。直到最后，魔法师再也不听爷爷的恳求，要收拾行李走人的时候，当时旁观的流浪街头当小乞丐的琳娜偷跑过去想摸摸检测水晶球时，异变发生了，水晶球一会儿变红一会儿边蓝，最后居然爆炸了。\r\n    后来琳娜才知道，检测水晶球一次只能容纳一种魔法能量，而且检测时一般都是由魔法师将孩子所具有的魔力引出来注入其中的。而琳娜无意识中自己就释放出了强大的魔法能量，而且还是两种，所以才会引发爆炸的。\r\n    还好当时那位魔法师还比较通情达理，看出琳娜特别的潜质，不仅没要求村子赔他水晶球的损失，还留下来教了琳娜些基本的魔法知识。不过由于学院的事务，魔法师不得不远行了。临走的时候魔法师给了琳娜几本魔法书，还说如果她努力学习，等他回来的时候就带她到学院去学习。\r\n    而自从知道琳娜有魔法才能之后，安德雷德爷爷不仅收留了琳娜，还天天把她当心肝宝贝一样宠着，什么好吃的都让她先吃，好东西宁可留给她备用自己也不用。那段日子，是父母早丧了、流落街头的琳娜最温馨也最体会到亲情的日子。\r\n    可惜好景不长，没等到魔法师回来，琳娜的村子就被来历不明的魔法师给毁了。成为火海的村子中，唯有拥有火属性的琳娜勉强活了下来，她甚至都不知道自己是怎么活下来的。只知道，当那些全身隐在黑色斗篷中的人们来到村子的时候，灾难就开始了。而当她再次清醒的时候，四周只剩下一片火海了。\r\n    一心想要报仇的琳娜到处找寻仇人的踪迹，然后才了解到了整个事件。\r\n    那些人是当时十分猖獗的黑袍法师会的人。这些常年来隐身在黑暗中邪教徒本身就已经十分残酷了。而当时他们中间还出现了叛徒，将邪教的总部所在地透露给了炎凌帝国皇族，帝国的军队一举拿下了他们的总部。这些邪教徒的残部听说叛徒藏在炎凌南部的游山附近，竟然采取最极端最残酷的方式报复，将游山左右的4、5个村子全部夷为平地，琳娜的村子也就因此遭受了无妄之灾。\r\n    琳娜什么也不顾的寻找黑袍法师会的人，好不容易找到一个落单的黑袍法师，可就凭她那点微薄的力量根本不是人家的对手。\r\n    从那黑袍法师的声音可以听出他很年轻，当时的琳娜那恐怕还达不到3级法师的魔力在人家面前半点作用都起不了。而黑袍法师只是一个最基本的黑暗元素凝聚成的魔法箭就打得她遍体鳞伤。\r\n    那个黑袍法师却没有杀她，在把她打得再也动弹不得之后，流下了几句话。\r\n    “现在的你既没有能力阻挡我，也没法成为我的助力。八年之后，我会来找你的，我们本来就是盟友的，为何要自相残杀呢？唉---不过以你这样冲动的性格，估计也很难活到那个时候了。唉，这也是雷忒奥力尔一族的悲哀啊。”\r\n    她说的话琳娜每个字都记得很清楚，可惜一句话都听不懂。虽然她知道火系魔法师因为比较暴躁而寿命通常叫短，但总不至于活不到二十岁的，而且虽然人们信奉的十大神明中有战神雷忒奥力尔，可雷忒奥力尔一族又是什么。总之现在想来是疑问甚多。\r\n    可当时琳娜在了解到实力差距之后，几乎设么都不想的开始锻炼自己。除了努力熟练使用魔法以外，不管是挣钱买还是用偷的，总之是想方设法的找高级魔法书和卷轴来学。\r\n    可更失败的是，黑袍法师会毕竟已经是最后的疯狂了，被黑袍法师击败后半年，还没等琳娜学到多少真本事，黑袍法师会就已经被炎凌帝国彻底清剿了。\r\n    失去了生活下去的唯一目标的琳娜完全的无所适从，那时的她唯一认识的人就是曾教她魔法的魔法师了。可是村里所有人都一致叫他“魔法师先生”，连琳娜都不知道他的名字，更别说他所在的魔法学院又是哪里了。 \r\n    就这么漫无目的的流浪了两年半，已经十五岁的琳娜遇到了图拉婆婆。图拉婆婆也是一副旅行者的装束，不过似乎病得不轻。琳娜于是和她结伴同行，多多少少也给她一些照顾。后来婆婆在流岚帝国的都城岚与琳娜分手，临别时就给了她一封推荐信，让她拿着信到阿拉蕾学园来上学，说对她一定能有所帮助的。\r\n    想到这里琳娜才灵光一闪，突然想到，自己这几天的尴尬处境全是图拉婆婆造成的。对，婆婆的信上连宿舍号都写好了，那分明就是让我跟那个早已经住在这里的钰音那个混蛋“同居”的嘛。恩，下次见到婆婆可要好好问清楚，这究竟是怎么一回事。可是怎么才能见到婆婆呢，这倒是个问题。对了，无论如何，先跟伊蒂丝老师商量一下让她给自己换个住处好了。    \r\n    想通了自己处境的缘由，琳娜的心情总算好点儿了。可她转头看了看其他人，心情又低落了些。\r\n    伊蒂丝老师拿着个课本一字不漏的念着，声音有些颤抖。后排的小希变出个气球棍，隔着座位去挑克丽丝的长裙，克丽丝双手按住裙子，急的快哭出来了，却又不敢发出声音。中间的卡卡恩迪趴在桌子上睡得正舒服，口水掉的长长的。而钰音虽然坐的端正，眼睛也直视前方，不过跟他相处了几天的琳娜知道，这家伙正处于走神或睡觉中，他就是那种睁着眼睛也能睡着的人。\r\n    还好前边还有两个好孩子在认真学习，那是凯文斯和卢娜。\r\n    凯文斯完全就是个书呆子摸样，戴着一副大得离谱厚得更离谱的眼睛。那眼睛估计比一根手指还宽呢，琳娜真怀疑他的鼻子是什么做的，居然没被压塌了。这种人一看就知道虽然学到的东西多，却用不到实际中。琳娜很了解，这类用不上的知识学了也是白学。凯文斯更适合当学者而不是魔法师。\r\n    卢娜上个不仅认真听讲，笔记也做得勤，一看就是个优等生的样子。琳娜看过她的资料，她的特殊能力是瞬移，虽然目前还只能瞬移一些细小的东西，笔、纸还有针之类的东西，不过如果运用得好，那可比那些华丽却不适用的大型魔法有效多了。而且琳娜也注意到，卢娜身边的小东西在时不时的换位，证明她一直在练习自己的能力。\r\n    琳娜忍不住感叹，还好自己身边还有个好学生，要不然自己都搞不清这里到底还时不时学校了。\r\n    半天的课程完结以后，琳娜就把伊蒂丝老师拉到一旁，向她说明了情况。\r\n    伊蒂丝老师却让她更没折了，伊蒂丝满脸笑容的说：“啊。原来你就是那个和音大---哦不是，是钰音住在一起的那个孩子啊。音大---哦不是，钰音可是个很好很温柔善良的人哦。要跟他好好相处哦。”\r\n    琳娜简直都没心情跟她解释了，只有满肚子抱怨：您真是个老师的话，男女同居这么严重的事好歹也管一管啊。\r\n\r\n\r\n\r\n\r\n	委屈			Paragraph	2021-05-30	30000552
31000146	103	2021-05-30	    不知不觉中，一个月很快就过去了。琳娜也和其他人混得很熟了。\r\n    虽然仍旧没有搬回自己的宿舍，还是跟小希、克丽丝挤在一起睡，不过琳娜这段时间已经没有再故意找钰音的麻烦了。琳娜自己也不知道到底有没有真的原谅他，不过现在的她还没有闲暇来考虑这件事，她还有更重要的事情要做。\r\n    在这一个月里，琳娜几乎逛遍了整个学园都市，然后总结出一个让她郁闷非常的结论：整个阿拉蕾学园都市所有有人住的房子，就属她们“第七学院”最原始最简陋了。教务中心区和其他六大学院当然不是她们能比的，魔法材料、器具齐全的教学楼、藏书丰富的图书馆、豪华而整洁的宿舍楼，还有很多琳娜不认识的、看起来很不错的建筑物。真正让琳娜郁闷的还是，连平民区甚至是魔法仆役们的地窖都比她们的石屋要精致得多。琳娜几乎想把自己的学院跟贫民窟相提并论了，却发现阿拉蕾根本就没有贫民窟这种有损形象的区域。\r\n    “不行！一个学院好歹得有个像样的教学楼才行！”这是琳娜想法，而她从来是想到就做。\r\n    不过事情似乎没有琳娜想像的那么简单。当她找到另外两个老师商量办法的时候，这两位不求上进的老师的回答竟然是：“没必要吧，反正我们也教不了学生什么东西，他们更是没想过要学。”在琳娜一次又一次叨扰之后，两人才无奈的说：“学园根本就不把我们学院当回事，要求配备教学楼那是不可能的。不过其实也不是完全没有办法，每学年初和年末各有一次能力等级测试，其后会有各等级学生的竞赛，学园会将新修的魔法建筑、高等魔法材料以及其他一些好东西奖励给获胜的学院。你要是真想试试我们也不反对，不过劝最好还是别去跟其他学院斗，那些个贵族子弟很危险的，小琳老师。”\r\n    由于伊蒂丝实在不适合当老师，这段时间来几乎都是琳娜在帮她忙着忙那的，结果学院其他班的人几乎都以为琳娜才是C班的老师呢，而“小琳老师”这个昵称在小希的宣传下更是流传甚广。\r\n    琳娜到处打听，详细地了解了今年的能力等级测试，惊喜的发现其实自己还是很有希望的获胜的。\r\n    阿拉蕾斯莫尔大陆的魔法师按实力总共分为10个等级，而魔法的等级基本上也和魔法师的等级一一对应，一般情况下魔法师不能越级使用高等魔法。1、2、3级的算是低级魔法师，能力有限，一般都只会些低级魔法，每个魔法都需要完全的吟唱咒语，个人战斗力实在有限。4、5、6级的中级魔法师，则已经是比较出色的魔法师了，既能使用杀伤力大的中级魔法，又能快速释放低等魔法以应付近身的敌人，不论是团队作战还是个人力量，都是不容小视的人物了。而7、8、9级的高阶魔法师，则已经是凤毛麟角了。即使强手如云的阿拉蕾学园里，达到了7级魔法师水准的学生也不到十人，这还是因为这几年的学生较以前更优秀了，这几人将来可都是各方的最高权威。而8级魔法师，已经可算是整个大陆魔法师的顶层了，整个大陆也才不到20人，除了阿拉蕾学园里的老师，剩下的几乎都是三大帝国的高层了。而9级魔法师，目前人们知道的仅有一位，那就是阿拉蕾学园的总督学欧萨克·德罗，学园里专门惩罚违反校规学生的老头子。在还没来学园以前，琳娜就听说过，早已有无数学生在这个老头子手里遭过殃了，毕竟谁都拿他没办法。\r\n    琳娜了解到，在经过了几乎不可能作弊也很难隐藏实力的能力测试，每个学员将得到魔法等级证明，然后每年会有不同的方式让各学院的学生们进行竞赛，优胜的学院会得到奖励。而今年，竞赛的方式正好是分等级的擂台赛。由于低等级的战斗是在没什么看头，所以学园规定4、5、6、7等级的学生们可以报名参加自己等级的比赛，每个等级比赛的最后胜利者所属的学院都能得到魔法设施、研究经费、珍贵材料等等各种奖励。\r\n    如果要跟其他学院比整体实力琳娜根本不会抱任何期望，不过如果是只是实战，最最特别的还是分了等级的擂台赛，那可就完全不同了。琳娜记得自己曾经做过一次能力测试，自己的火系能力是5级，而雷系能力则是4级，不过拥有两种能力而且实战经验丰富的她应该说即使遇上6级的魔法师也是不怕的。当然如果对上7级魔法师，琳娜还是不会奢望取胜的，不过照现在的规则，她应该只会对上5级的对手，那可是想不胜都难了。\r\n    满心欢喜的琳娜把这个消息告诉了班上的人，顺便问了问其他人有没有谁的能力是4级以上的，说起来她们这个学院的学生与其说是魔法师，倒不如说是能力者了。而且到现在为止琳娜都还没搞清楚其他人的能力。毕竟班上八个人的能力各不相同，可不像别的学院所有人都基本上一个样。\r\n    让琳娜欣喜的是竟然有两个人在以前的测试中能力达到了4级的。其中一个当然是卢娜，她的能力事实上有些奇怪，她既能用意念操纵物体让它们运动，还能将其瞬移，虽然现在所能移动的对象都是些小东西。\r\n    而另一个能力达到4级的竟然是卡卡恩迪，这些日子熟了之后，大家都叫他卡卡。卡卡看上去基本上是个少爷模样，有点儿爱耍帅，至少在琳娜面前。不过遗憾的是，但目前为止，琳娜只看到他出了几次丑。卡卡的能力倒也是瞬间移动，不过跟卢娜不一样的是，他虽然能够瞬移自己以及衣服之类的无生命物体，却不能很好的控制到达地点，比如明明想瞬移到阳台上，消失之后却出现在阳台外侧，没地方落脚。\r\n    虽然对他们这些特殊能力的等级判断比较不确定，不过只要有一分希望，琳娜就不会放过。她几乎是迫不及待的去向负责本次比赛的教员们打听情况。不过没想到是，事情并没有她想的那么简单。\r\n\r\n    -------------------------------------------------------------------------------\r\n    \r\n    虽然早已对自己学院的“知名度”有所了解了，但是连参加联合竞赛的资格都没有这点还是让琳娜很受了些打击。不过还好她不是个肯轻易服输的人，跟两个教员据理力争。\r\n    “我们学院既然也是一个学院，为什么没有资格参赛？”\r\n    “这个，这么多年来都这样了，你又何必呢？”\r\n    “就因为这么多年来都不合理，才更该啊！”\r\n    “就算参加了，以你们院的实力又能有什么作为呢？我好歹去你们院看过，没办法的。”\r\n    “不试试怎么知道，而且你又凭什么说我们没实力？” \r\n    …………  \r\n    终于年长的那个教员争不过她，直截了当的说：“好吧。其实其他学院要取得参赛资格也是必须通过试炼的。”说着他抚了抚胡须，从旁边的架子上取下一根金色的角，说：“你看吧，这就是‘火’学院学生们试炼的成果，金角火莽的角。我也不多说了，如果你们也能取下一只金角火莽的角，那我就允许你们学院参加五天后的比赛。”\r\n    “金角火莽，”琳娜迟疑了，这个好像不是她对付得了的怪物。\r\n    “不行的话就早早放弃吧，别在烦我了。”这老头子显然脾气比较大。\r\n    不巧的是，琳娜正是那种最受不得激将的人，老头子的话显然刺激到了她。琳娜一阵火气上冲，“不就是一条小蛇吗，我就抓给你看！”说着转身就走。\r\n    老头子摇了摇头，“现在的年轻人，脾气比我还大。”\r\n    旁边那个中年教员汉斯有点担心的说：“斯特格雷老师，您这个试炼是不是太过火了，要是那小姑娘真去找金角火莽，那可得多危险哪。再说了，金角火莽可是六大学院里实力最强的‘爆炎’学院竭尽全力才击杀的，让那个第七学院也接受这个试炼不是闹笑话吗？”\r\n    斯特格雷笑了笑，“放心吧，只要那小丫头问清楚金角火莽是什么，就不会异想天开的捉这条‘小蛇’了。”\r\n    汉斯想了想，说，“我还是觉得不放心，要不我去劝劝那小姑娘？”\r\n    斯特克雷又笑了笑，“这么五天，她到哪去找金角火莽啊？而且我也看得出，这小丫头底子不错，人也聪明，就是脾气大了点。让她受点挫折，认清自己也好。”\r\n    \r\n    -------------------------------------------------------------------------------\r\n\r\n    往回走的时候琳娜就后悔了，金角火莽她还是知道的，那可不是和低等的火蛇可以比拟的生物。可以说，金角火莽基本上可以称火龙了，相比之下，它们的实力与真正的龙的差距要比与火蛇的差距小得多。在几乎和魔法师的十个等级相对用的魔兽的等级中，一般的金角火莽可都是8级魔兽啊。在金角火莽面前，非火属性的魔法师基本撑不了10分钟，而火系魔法师对它的伤害有微乎极微。琳娜倒是很想知道‘火’学院那些学生是怎么击杀它的。\r\n    总之还是先告诉大家结果吧。\r\n    琳娜把事情说清之后，大家多多少少都有些失望。卢娜和卡卡固然失去了参赛的资格，却没有凯文斯失望，这个家伙梦寐以求的图书馆显然是没希望了。\r\n    “这也是没办法的事啊。这个---那个---”克丽丝努力想着安慰大家的话，却一句都没说清楚，“我们本来就没办法---这个---那个---而且肯定也找不到金角火莽啊？”\r\n    “找到了也对付不了。”卡卡加上了一句。\r\n    “大家安心学习吧。这件事是没办法了。”琳娜说，“我这几天出去走走。”\r\n    “你该不会是真的想去找金角火莽吧？”卡卡看着琳娜，严肃的问，那眼神好像看穿了她似地。\r\n    “这个，不是啦。我是想在想想其他办法。”琳娜回答，不过脸已经红了一半。\r\n    “如果是金角火莽的话，”平时总是沉默不语的钰音说道，“这个森林里倒是有一条。”\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n	试炼			Paragraph	2021-05-30	30000552
31000147	104	2021-05-30	    第二天天还没亮，琳娜已经悄悄起床收拾了一下，准备进学院背后的魔法森林了。说来也奇怪，琳娜此时又路过了钰音的石屋，看着没半点改变的屋子，她就纳闷了：记得钰音说他是男的那天，自己的火系能力的确是爆发了的，火焰冲天，别说是这么个石屋子了，就算是一栋防护齐全的魔法建筑，那也是没可能毫发无伤的。\r\n    不过她当然不会停下来想这种闲事。从来不会食言的她既然说过了要去找金角火莽的麻烦，那就绝不会退缩的。本来找不到还好，却不想附近就有那么一条。虽然明知是胜不过火莽的，琳娜自己都觉得只能寄望于那万分之一都不到的小概率事件，比如遇上幼年火莽啊，或者那条火莽受重伤了什么的。\r\n    当然琳娜也不会傻到不要命了，她自信虽然打不过，但还是跑得掉的。之所以不告诉其他人，一是不想让她们担心，二是本来就是自己意气用事接下的试炼，不能让她们也跟着冒险。一个月以来，琳娜和大家都相处得不错，她知道她们都不是坐视朋友冒险而不顾的人。\r\n    不过让她意外的事，刚走进森林她就看到了钰音。他背靠着一棵这附近不常见的梧桐树，正平静地仰望着树叶间朦胧的天空。\r\n    琳娜正想绕路，钰音已经转头看向她：“等等吧。”\r\n    “等什么？”\r\n    “小希总是会赖一会儿床，克丽丝是叫不醒她的。平时卡卡也比较慢。”看来他们几个是商量好了要跟琳娜一起去冒险的。琳娜知道，在自己忙这忙那的时候，他们几个在一起互相熟悉的时间更多些。 \r\n    “我等他们干什么，拖后腿？”琳娜当然并没有那个意思，不过跟钰音说话时总是比较冲。\r\n    钰音笑了：“没有我带路，你想平安的见到火莽恐怕不容易的。虽然从没有人给这片森林取个名字，可它却比所有知名的森林都危险得多。以前这里可是有名的试炼地，不过后来突发事故太多，才被列为禁林的。”钰音那优哉游哉的语气，让琳娜很不爽。不过说来这些天来的钰音渐渐的有些“人情味”了，已经不再像当初那么木讷了，偶尔也会跟她开个玩笑了。\r\n    “哦，那你倒是挺厉害的啊？把别人不敢进的禁林都转熟了。”琳娜语气怪怪的说，“我倒是还不知道你的能力是什么呢，几级的？”\r\n    “额，”钰音顿了顿，“我只是在这里生活得比较久而已。至于我的能力，大概，是1级吧。”\r\n    “1级哦，还真是‘低能’力者呢。我听说，学园里几乎都是1级能力者可是跟7级能力者一般稀有的哦。”琳娜还从来没嘲笑过别人的能力，不过就是对钰音比较特别。特别是看他一副无所谓的样子，琳娜就更有气了。\r\n    让琳娜有点意外的是，平时总是最慢的卡卡和凯文斯这一组竟然第一个到了。卡卡对琳娜的我行我素显然有些懊恼。而一向被昵称“斯文”的凯文斯倒是少有的有点激动，“为了图书馆，我也得努一分力了。”\r\n    第二个到达的是卢娜和她的室友凛子。琳娜本来觉得钰音已经是很没存在感的人了，然而这个凛子却更甚。明明就在一起上课，琳娜居然都看不到她在哪。说来琳娜还从没听她说过一句话。别的同学也说，好像只有室友卢娜能跟她说几句话。\r\n    最后是克丽丝拖着还昏昏欲睡的小希到了。\r\n\r\n\r\n——————————————\r\n\r\n    钰音带的路果然安全，麋鹿、白兔、各种飞鸟，一路上连一只有攻击性的动物都没有，亏得他还说这曾是试炼森林，琳娜忍不住小声嘟囔。不过另一个有些让琳娜意外的发现是，小希那个只能暂时创造可爱物件的特殊能力竟然这么实用。遇山架桥、遇水造船，原本翻不过的山涧、游不过去的河，都被她的奇妙想象力所化解，艰难的试炼简直变成了郊游。而事实上，钰音一路导游、解说，小希和爱丽丝一路欢闹，卡卡跟着起哄，还真是一副郊游景象。琳娜只能一边感叹他们的没紧张意识，一边配合卢娜警界着四周。\r\n    平安到达金角火蟒的洞穴旁，琳娜让大家停下，自己一个人先去试探。\r\n    火蟒的洞穴中是空的，琳娜紧张的心刚刚松下来的瞬间，失望的情绪都还来得及出现，就看到背后一个长条形的巨大阴影袭击过来。久经历练的她终于还是在黑影扑到身上前反应过来，用上了自己也不知道能否奏效的快速吟唱，“爆炎术！”火球在脚后方爆发，她乘着爆风向前飞出，堪堪躲过如重锤般砸下的蛇头。\r\n\r\n\r\n	火莽			Paragraph	2021-05-30	30000552
31000148	100	2021-05-30	目录：\r\n1.血族少女\r\n2.白狼之影\r\n3.世家隐秘\r\n4.夜盗（斗争伊始）\r\n5.幽魂巫师\r\n6.堕天使\r\n7.王座启动\r\n\r\n徐幻\r\n\r\n7.没想到，曾经所憧憬的爱恋之类的情境，也会发生在自己身上啊。可惜，却没有那个福气享受啊，自己，还有更重要的使命需要去履行。当人们都专注于这个多彩美妙的生活中时，我们这些在暗与影之中徘徊的人，也必须专注于自己的命运了。\r\n\r\n\r\n8.舍弃一切踏上必死之路。\r\n   “这样做活下来的可能性更高，”他说，“我只是做了这样的判断而已。”\r\n     不知道为什么，即使身边很亲近的人的生死，也不太那么在意。是因为薄情寡义？不知道。\r\n     舍弃一切，只向往着一个新的开始，为此而愿意牺牲一切？这么做到底有什么价值，当自己的理智无法掌握现状时，就全部交给直觉吧。\r\n\r\n\r\n9.虚弱的始祖之血与魂的继承者，已经完全生活在普通人的世界里。然而，意外遭遇到的高等血族，却将这份原该继续沉睡下去的黑暗唤醒，幸还是不幸，在没有假设没有如果的时间界面里，没人说得清楚。\r\n\r\n\r\n    在城市暗影中爆发的黑夜种族间的战争，围绕着神秘的夜之王座，血族、狼人、月神信徒、幽魂巫师、夜盗、暗精灵，种种势力纷争不休，都在寻找打开夜之王座的钥匙，又在相互阻挠。然而，他们不知道的是，纷争，才是夜之王座降临的唯一方法。\r\n    碰巧被卷进这场战争的稍微有些神经质的少年，无论面对什么样的敌人，都总不忘了将自己的直觉直白的说出来，即便吓得双腿打颤，却就是住不了嘴。如果不是因为初次遇到的是少不经事的血族少女的话，或许他还没唠叨上几句就被人家随手砍了。\r\n    跻身在两大魔法世家宅院中间的小房子里，时不时会被两边的火拼吵醒，然后蒙头继续睡，在面对危险时的素质倒还不错。这大概是他在这个夜间争端不断地城市里存活下来的最大凭借吧。然而他神经质般的自言自语以及其他一些非人的缺陷，却让周围的人不能理解。\r\n    血族少女与其他人一样，为了得到“夜之王座”，在不断地寻找中，既借助又妨害势力较大的世家和各个黑夜种族势力。碰巧得知少年的房子在两大世家之间，便理所当然住进了这个仆人家里，还顺手打发他去探探邻居的情报，完全没考虑过，一无所有的穷小子跟他的邻居们根本半点关系都没有。\r\n    被丢进宅院一番折腾，他还真跟  家的主事的大小姐说上了话，却又是被当了生死难料的诱饵。两人一明一暗的追寻着大小姐小时候憧憬的白狼的身影，结果发现了月神信徒的秘密，破坏了月神信徒的黑暗祭祀，报了她母亲的仇，却没能救回狼人的性命。\r\n    事件刚解决还没来得急闪人的猪脚，又被当做“大使”丢给另一世家。而原本听来简单的问题，却因为一个快包不住的秘密而成了死局，又上了另一条贼船，不得不跟这些人同进退了。既然被揭穿了必败无疑，那么又何不抢先出击，掌握主动呢，凭借宗家的余威震场，再抢先给意图不轨的首恶安插上叛逆的罪名，以最快速度掌控力量，肃清异己。而歪打正着的，叛乱者还真的借助了恶魔的力量，一番苦战总算消解了这场灭族微机。\r\n    而另一边，一直与他们作对的幽魂巫师，却总是避开与他之间的战斗。那种熟悉和亲近的感觉让他情不自禁却又必须强制抑制，因为，理智告诉他，知道真相也就意味着这份羁绊的消失，消失的不是自己，就是那个面无表情却其实心地善良的小女孩。 \r\n    夜盗频繁作案，大部分都知道他也是竞争者之一，但是谁都看不清他的计划和目的。他或许更像一个事件触发者，或者游戏管理者，负责制定和维护规则，修正错误，应对意外。看不懂他，是因为这些人，与曾经是夜之王座有力竞争者的他，有太大的差距。他们也渐渐发现，自己只不过是纷争最前线、最底层的基石。\r\n\r\n    随着黑夜纷争的继续，夜之王座的降临越来越近。少年自己也越来越不稳定。真祖的血渐渐苏醒，他也渐渐知道，自己不过是玻璃般透明的存在。（人工生命、虚假的存在）然而即使如此，他仍然在探寻自己的意志、争取自己的自由。\r\n    “或许自己受制于人更深一层，但是既然已经存在，既然还能思考，就当然不能放弃自己。”\r\n    夜之王座原本的主人随着纷争的扩大而复苏，而包括他的创造者在内的众多真正有实力的竞争者也被唤醒。以月神自居的伪神，魔法世家背后的黑手，为复仇和为生存奔波的暗精灵们，抢夺者，真正最纯粹的，恐怕要属从头开始就异常强大而清冷的幽魂巫师了。\r\n\r\n    然而，幽魂巫师的弱点则是，她所要保护的那些并不太可爱的玩偶。无意中闯入她领地的众人，发现原本强大无比的她，在自己的领域内，却反而柔弱不堪。\r\n    就在她们以为能消灭一个有力竞争者时，幻终于忍不住出来制止了。他请求或者几乎是恳求幽魂巫师立下放弃暗之王座的誓言，原本只是想通过言语的错觉让同伴们放过她，但是却没想到她那么随意的发下魔法真言，还那么轻易的将言灵交给了他。那深邃的眼瞳中的一丝微笑，到底有着怎样的情感呢？徐幻，几乎不敢想象。因为他此时又一次感觉到，如果知道了真相，自己或者她，有一方必将不复存在。\r\n\r\n    与堕天使的战斗中，原本已经无力阻止的仪式，竟被从一开始就被众人忽略的可说毫无战力的徐幻阻止了。对自己有绝对自信的堕天使无法容忍这样的失败，用尽全力要取他的性命，而其他人完全没有救援的可能。就在这时，他却笑了，不是慨然赴死，而是知道有一个人一定会救他——这个世界上第一个与他有所联系的人，幽魂巫师。\r\n\r\n    被幽魂巫师带出来的他，当然已经知道了自己的过去。在被她抚摸头顶时，他感觉一股舒适和飘忽的感觉，仿佛自己的灵魂都要消融一般的舒适感。然而，他轻轻抓住了她的手，“还，还不想变回去。毕竟，难得有了自己的人格和意志。”她注视着他严肃的目光，沉静的笑了。然后伏在他身前，将自己的生命之力分了一部分给他。\r\n\r\n    徐幻再一次出现时，已经不在是血族女孩和大小姐她们认识的他了。血族真祖的灵魂占据了他的身体，而幽魂巫师则远远的跟在他后边。作为夜之王座新的有力竞争者，他也加入到了这个越来越风起云涌的争斗漩涡之中。\r\n\r\n    至于最终血族真祖的真意，夜盗的指引，月神的毁灭，魔法世家的使命，血族女孩的心愿，以及徐幻所想要追求的自由，究竟有什么意义呢？也许直到一切结束以后，旁观者们还是无法看清，即便看清也无法理解，即便理解也难以认同。\r\n    唯一确定的是，最终的最终，谁也没能得到夜之王座，谁也不可能成为暗夜的统治者。\r\n\r\n\r\n人类：    \r\n魔法世家\r\n夜盗\r\n暗杀者\r\n幽魂巫师（魂）\r\n月神信徒\r\n\r\n\r\n黑夜种族：\r\n吸血鬼\r\n暗精灵\r\n\r\n狼人\r\n\r\n\r\nBoss:\r\n夜之王（）\r\n\r\n吸血鬼\r\n月神（狼人）\r\n大魔导师\r\n\r\n死神\r\n堕天使\r\n大恶魔\r\n\r\n\r\n夜之王座：\r\n    影之王，最有资格取代前代成为夜之王。在召唤出他的幽灵城堡中，他的战斗力无人可及，然而在这里他唯一的作为异世界存在的弱点也暴露无遗，可以被召唤而来，也就可以被反送回去。无法力敌的众人，在他的游戏中纷纷“落败”，然后暗中准备着反召唤他的仪式。最终走到他面前，陪他废话的，当然是一无是处的主角。当影之王发现他们的意图时，却已经再无力阻止他们了，最后关头想要取走眼前可恶小子性命时。一直处于中立的幽魂巫师，突然出现并挡在了他面前。\r\n    虽未被影之王所伤，但一路闯关过来，徐幻已经撑不住了。幽魂巫师扶着他坐了下来，仔细的端详着他的面容。徐也尽力保持着最后一丝清醒看着她，他曾经的主人。当她伸手去点徐幻眉心时，徐幻艰难的摇头，虽未有只言片语，她还是听懂了他的意愿。\r\n    大小姐赶过来时，正看到徐幻被阴魂不散的幽魂巫师抱在怀里，似乎正在吸取他的生命之力，她毫不犹豫的出手想将她赶开。然而，幽魂巫师完全没有注意大小姐的到来和她的攻击，她的额头抵在徐幻的眉心上，白皙的前额出现了一个泛着银辉的月亮标记，更宽广的银色光辉环绕着他们两人，而即使被大小姐的魔法球炸得面容尽毁，她的目光也没有丝毫动摇，只是温柔的注视着徐幻昏厥后苍白的面庞。那温柔的目光，让一向冷静的大小姐也忍不住嫉妒、羡慕交杂，一时间不知所措。\r\n    大小姐看出来她在向徐幻输送自己的生命力量，所以阻止了后赶到的世家女和血族少女，让他继续在幽魂巫师的怀中安睡。而不管来的人有多少，幽魂巫师始终不曾关注，她只是一心一意的将自己的生命分给徐幻。她的面容仍是刚才被大小姐炸毁后的样子，肌肤也渐渐老化，让陆续赶来的各方势力几乎认不出这个超然物外的boss级人物了。想趁机杀死她或俘获她的人跳了出来，大小姐则带着其他人反对，她在救的正是策划了这次行动，让大家免于灭顶之灾的徐幻。\r\n    正在紧张的关头，幽魂巫师站了起来，脸上的伤痕迅速恢复，老化的面貌也迅速复原，没有一丝瑕疵。重新变得不见丝毫表情的她，眼睛只是随意一扫，就将意图不轨的人群变得寂静，幽寂的环境让他们重新想到了恐惧。\r\n    在飘然离开之际，她在血族少女的耳边轻轻的说了一句话，留下了一个浅浅的笑容。只是这样一个微笑，竟然让同是女孩的血族少女也为之失神。\r\n    \r\n    一切尘埃落定时，他也重回了两大世家中间那栋小房子，带着魂和血族少女。魂先一步踏进家门，直接占据了楼上血族少女常住的阁楼，将她气得没办法，最后在徐幻的劝说下屈居了地下。两边世家的家主，大小姐和世家女都来串门。在跳脱生死，真的成人之后，徐幻以前那怪异的性格倒是变得圆滑了，虽然也会开些过分的玩笑，但毕竟知道分寸了。最后，徐在血族少女怂恿下，将自己的家办成了一个驱魔师的聚会点。\r\n    \t\r\n	目录人物			Setting	2021-05-30	30000553
31000150	0	2021-06-04	显隐二宗争斗，谈判，开会。无聊的等着去申报机票，手机上下载和修炼能够运气费飞行的程序。陪长者等待天明，他喜欢下棋，结果另外一宗的手下陪他下了，我就只好在旁边看着，翻来覆去，或者早一步跑去公司，先拿到新的程序再说。申报和开会都必须与对方手下一组进行，居然是买一送一。	公司申报和飞行app			Paragraph	2021-06-04	30000538
\.


--
-- Data for Name: collection_parent_bean_tags; Type: TABLE DATA; Schema: public; Owner: xiao
--

COPY public.collection_parent_bean_tags (collection_parent_bean_id, tag) FROM stdin;
30000001	经典
30000001	少女
30000001	校园
30000001	恋爱
30000002	经典
30000002	少女
30000002	校园
30000002	恋爱
30000003	童年
30000003	经典
30000003	校园
30000003	竞技
30000004	童年
30000004	经典
30000004	竞技
30000005	童年
30000005	经典
30000005	格斗
30000006	童年
30000006	经典
30000006	格斗
30000007	童年
30000007	经典
30000007	格斗
30000007	历史
30000008	童年
30000008	经典
30000008	格斗
30000009	童年
30000009	格斗
30000010	童年
30000010	经典
30000010	格斗
30000010	使魔
30000011	童年
30000011	经典
30000011	格斗
30000012	童年
30000012	异能
30000012	格斗
30000013	童年
30000013	异能
30000013	格斗
30000014	童年
30000014	经典
30000014	使魔
30000015	童年
30000015	经典
30000015	格斗
30000015	英雄
30000016	童年
30000016	经典
30000016	少女
30000016	格斗
30000017	童年
30000017	少女
30000017	竞技
30000017	使魔
30000018	童年
30000018	竞技
30000019	童年
30000019	竞技
30000020	经典
30000020	少女
30000020	校园
30000020	恋爱
30000020	竞技
30000020	科幻
30000021	经典
30000021	竞技
30000022	经典
30000022	竞技
30000023	经典
30000023	竞技
30000024	格斗
30000024	使魔
30000025	格斗
30000026	竞技
30000026	游戏
30000027	校园
30000027	恋爱
30000027	格斗
30000028	校园
30000028	格斗
30000029	格斗
30000029	历史
30000030	格斗
30000030	历史
30000031	童年
30000031	经典
30000031	校园
30000031	恋爱
30000031	竞技
30000031	侦探
30000031	英雄
30000031	文艺
30000031	都市
30000032	童年
30000032	侦探
30000032	都市
30000033	童年
30000033	少女
30000033	侦探
30000034	童年
30000034	英雄
30000035	少女
30000035	校园
30000035	侦探
30000035	历史
30000036	游戏
30000036	侦探
30000037	经典
30000037	游戏
30000037	异能
30000037	格斗
30000037	历史
30000037	使魔
30000037	英雄
30000037	都市
30000037	Fate系列
30000038	经典
30000038	游戏
30000038	异能
30000038	格斗
30000038	历史
30000038	使魔
30000038	都市
30000038	Fate系列
30000039	经典
30000039	游戏
30000039	异能
30000039	战争
30000039	格斗
30000039	历史
30000039	使魔
30000039	都市
30000039	Fate系列
30000040	侦探
30000040	异能
30000040	使魔
30000040	都市
30000040	Fate系列
30000041	校园
30000041	恋爱
30000041	异能
30000041	Fate系列
30000042	校园
30000042	恋爱
30000042	异能
30000042	Fate系列
30000043	童年
30000043	经典
30000043	少女
30000043	校园
30000043	恋爱
30000043	英雄
30000044	经典
30000044	少女
30000044	异能
30000044	英雄
30000045	经典
30000045	异能
30000045	格斗
30000045	旅行
30000046	经典
30000046	少女
30000046	校园
30000046	异能
30000046	格斗
30000047	少女
30000047	异能
30000047	格斗
30000048	少女
30000048	校园
30000048	恋爱
30000048	异能
30000048	格斗
30000048	英雄
30000049	异能
30000049	使魔
30000049	英雄
30000050	少女
30000050	校园
30000050	恋爱
30000050	异能
30000050	都市
30000051	经典
30000051	校园
30000051	恋爱
30000051	异能
30000051	英雄
30000051	都市
30000051	后宫
30000052	少女
30000052	校园
30000052	恋爱
30000052	异能
30000052	英雄
30000052	都市
30000053	校园
30000053	恋爱
30000053	异能
30000053	都市
30000053	后宫
30000054	侦探
30000054	异能
30000054	末世
30000054	格斗
30000054	旅行
30000055	侦探
30000055	灵鬼
30000055	旅行
30000056	校园
30000056	侦探
30000056	都市
30000057	校园
30000057	侦探
30000057	灵鬼
30000058	少女
30000058	侦探
30000058	灵鬼
30000059	校园
30000059	侦探
30000059	都市
30000060	校园
30000060	恋爱
30000060	侦探
30000061	灵鬼
30000061	旅行
30000062	校园
30000062	灵鬼
30000062	格斗
30000062	英雄
30000062	都市
30000063	校园
30000063	灵鬼
30000064	校园
30000064	恋爱
30000064	灵鬼
30000064	后宫
30000064	思维
30000065	侦探
30000065	思维
30000066	少女
30000066	校园
30000066	恋爱
30000066	灵鬼
30000067	侦探
30000067	异能
30000067	使魔
30000068	少女
30000068	恋爱
30000068	异能
30000069	少女
30000069	灵鬼
30000069	思维
30000070	少女
30000071	侦探
30000071	灵鬼
30000072	游戏
30000072	灵鬼
30000073	恋爱
30000073	侦探
30000073	异能
30000073	旅行
30000074	校园
30000074	恋爱
30000074	异能
30000075	末世
30000075	格斗
30000075	使魔
30000076	灵鬼
30000077	战争
30000077	格斗
30000078	搞笑
30000078	格斗
30000079	侦探
30000079	异能
30000080	异能
30000080	末世
30000080	格斗
30000080	旅行
30000081	校园
30000081	异能
30000081	格斗
30000081	后宫
30000082	校园
30000082	异能
30000082	使魔
30000082	后宫
30000083	校园
30000083	恋爱
30000083	格斗
30000083	后宫
30000084	校园
30000084	恋爱
30000084	异能
30000084	后宫
30000085	校园
30000085	恋爱
30000086	校园
30000086	恋爱
30000086	末世
30000086	格斗
30000087	校园
30000087	侦探
30000087	格斗
30000087	都市
30000088	异能
30000088	战争
30000088	旅行
30000089	校园
30000089	异能
30000090	异能
30000090	都市
30000091	侦探
30000091	都市
30000092	侦探
30000092	都市
30000093	异能
30000093	英雄
30000093	都市
30000094	校园
30000094	游戏
30000094	侦探
30000095	旅行
30000096	少女
30000096	校园
30000096	异能
30000096	格斗
30000097	少女
30000097	异能
30000097	格斗
30000098	童年
30000098	战争
30000098	机战
30000099	经典
30000099	校园
30000099	末世
30000099	思维
30000099	机战
30000100	经典
30000100	战争
30000100	机战
30000100	Gundam系列
30000101	战争
30000101	机战
30000101	Gundam系列
30000102	竞技
30000102	格斗
30000102	机战
30000102	Gundam系列
30000103	经典
30000103	战争
30000103	机战
30000103	Gundam系列
30000104	经典
30000104	战争
30000104	机战
30000104	Gundam系列
30000105	战争
30000105	机战
30000105	Gundam系列
30000106	机战
30000107	战争
30000107	机战
30000108	战争
30000108	英雄
30000108	科幻
30000108	机战
30000109	经典
30000109	恋爱
30000109	战争
30000109	异界
30000109	格斗
30000109	后宫
30000110	经典
30000110	战争
30000110	异界
30000110	格斗
30000110	后宫
30000111	经典
30000111	战争
30000111	机战
30000111	权谋
30000112	战争
30000112	娘化
30000113	校园
30000113	恋爱
30000113	末世
30000113	格斗
30000114	校园
30000114	战争
30000114	英雄
30000114	女主
30000115	经典
30000115	战争
30000115	历史
30000115	权谋
30000116	经典
30000116	剑与魔法
30000117	剑与魔法
30000118	校园
30000118	异能
30000119	剑与魔法
30000120	战争
30000120	星界
30000121	战争
30000121	星界
30000122	战争
30000122	星界
30000123	经典
30000123	旅行
30000123	修真
30000124	经典
30000124	仙缘
30000125	仙缘
30000126	异能
30000127	战争
30000127	历史
30000127	权谋
30000128	战争
30000128	历史
30000128	权谋
30000129	战争
30000129	历史
30000129	权谋
30000130	战争
30000130	历史
30000130	权谋
30000131	战争
30000131	历史
30000131	权谋
30000132	战争
30000132	历史
30000132	权谋
30000133	战争
30000133	历史
30000133	权谋
30000134	经典
30000134	恋爱
30000134	战争
30000134	历史
30000134	权谋
30000135	战争
30000135	历史
30000135	权谋
30000136	战争
30000136	历史
30000136	权谋
30000137	战争
30000137	历史
30000137	权谋
30000138	武侠
30000139	武侠
30000140	武侠
30000141	武侠
30000142	武侠
30000143	历史
30000143	武侠
30000144	武侠
30000145	武侠
30000146	武侠
30000147	武侠
30000148	武侠
30000149	武侠
30000150	武侠
30000151	武侠
30000152	武侠
30000153	武侠
30000154	异能
30000154	格斗
30000155	异能
30000155	格斗
30000156	异能
30000156	格斗
30000156	都市
30000157	游戏
30000157	异能
30000157	格斗
30000157	都市
30000158	异能
30000158	格斗
30000159	剑与魔法
30000160	异能
30000160	战争
30000160	格斗
30000161	校园
30000161	恋爱
30000161	竞技
\.


--
-- Data for Name: diary; Type: TABLE DATA; Schema: public; Owner: xiao
--

COPY public.diary (date, length, memo) FROM stdin;
2019-09-18	38	今天情绪特别高，特别想玩，静不下来做事，关键是这样会不会把学习规划破坏掉？\n
2019-09-16	28	Sleep well, sleep at 10 pm.\n
2019-09-14	18	没事干了，我要做的事情都没有头绪。\n
2019-09-13	54	Learn to fail, fail to learn, there is no other way ?\n
2019-09-12	35	想把事情放一边，真的好难。Health和Learn，应该合二为一了。\n
2019-08-13	77	A fast day, I know I should take my learning back, but done half of my plan.\n
2019-08-12	55	A busy day, wish I have always busy day in these days.\n
2019-08-10	50	Game and Novel, One day and a half has been past.\n
2019-08-06	11	不吃饭，饿的肚子痛。\n
2019-08-04	42	多少天没写日记了？\n把旅行算到language里了，这个很奇怪。但是确实没得地方装。
2019-07-13	46	A day of relax, but do I have time to relax ?\n
2019-07-09	58	Enjoy the process, I am learning to become more skillful.\n
2019-07-08	75	A day of learning, maybe the busy day of this month, so many things to do.\n
2019-07-07	24	A day of choice, maybe.\n
2019-07-05	144	\nPoint\n1.Rely on ritual. Won't get more self-discipline, so do things more rely on ritual, and take the limited self-discipline for real change.
2019-07-04	105	We all have enough discipline to make our life better, but we will not get more discipline than we have.\n
2019-07-03	192	Time for change, emotion, behavior, cognition.\nPoint\n1. Behavior is powerful than words. So if there is a dismatch of behavior and attitude, we ofen change the attitude to match the behavior. 
2019-07-01	108	A sleepy day, and warning by dan 3 times or even more.\nPoint \n1.Change factors, Affect, Behavior, Cognition.
2019-06-30	155	Go to network coffee, and finally come back home.\nForget my hand bag at the airport, a disaster after I cann't found my phone when get out of the airplane.
2019-06-29	67	More disadvantages that make me sake and think about living alone.\n
2019-06-28	36	A journey to find my disadvantages.\n
2019-06-27	176	Have none sense of the journey, forget my airplane ticket in the office.\nPoint\n1. Write and Analyze the negative event in journey, think and replay the positive event in mind. 
2019-06-26	166	\nPoint\n1.Cultivate Gratetitude. Appreciate the ordinary before extraordinary things happen.\n2.Write about appreciate things. The key to do this is maintain freshness.
2019-06-25	153	\nPoint\n7.Factors to Success. Hard work, passive, self-confidence. \n\n8.Imagine the success before do it. Visualize the journey as well as the destination.
2019-06-24	253	Doesn't sleep well. Sunday must sleep earlyer than other days, because I stored stress while weekend.\nPoint \n6.Learn to fail, or fail to learn. There is no other way to success. And then I will think that I'm a man with courage to try and self-esteem.\n\n
2019-06-23	101	\nPoint\n5.Beliefs as self-fulfilling prophecies. A positive situation will improves us with the role. 
2019-06-22	72	No time for diary, sleep first. My god, I play game for too many times.\n
2019-06-21	224	\nFall asleep when modify the game, and have a bad sleep, wake up many times after 5 o'clock, until 8 o'clock when I have to wake up for work.\n\nPoint \n4.Permission to be human. Rejecting our nature leads to worse performance.
2019-06-20	165	Good time of learning, Good time of life. May it be longger.\nPositive Psychology Point\n3.Study the best. The reason which the best succeed will benifit the average. 
2019-06-19	155	Continue to learn, and the word I try to remember can lead a good result.\nPositive Psychology : Point\n2.Ask the right question. Questions create reality.\n\n
2019-06-18	884	A course of happiness, or a course of change, "Harvard Open Course : Positive Psychology" may become the most important lecture of my life.\nIt's the time to approach western culture, as with my English learning. And the positive psychology is the particular stuff that I'm interested about. I'm always fail at my change, want to become extraordinary and ignored that I can't be so good before I take lots of time to overcome many of my defects. I have made so many wonderful plans that none of it worked well. So many fails, but this is the only way I can do, maybe.\nBut now, it's a good time to learn how to improve my ability to plan, and take time for those lectures, just like I have my college life again. This time, I should make it more effecial than ten years ago.\n\nPositive Psychology: Point 1\nTime aside is important, we need time to remember what we have just been through.
2019-06-17	289	Lots of things to learn, but if I continue to learn, there won't be lot of things left.\nProject :\n1. WebSite\n2. Python\n3. Andriod\n4. Unity\n5. AI\n6. OS/Linux\n7. cloud\n8. PLC\n\nLanguage : Japanese and English\nFantasy : Writing\nGame : game making\nAnimation : lovely characters\nBook : Stories\n\n
2019-06-16	1522	Finish what I what in the first place, if it is so good, I will try again with more detail.\nI finished "Yale Open Coures : Death". It may can be a good material for English learning, but I think finish one thing as soon as possible could set me free to do lots of other things. The worst thing is delay on those doesn't totally finish but I have little will to finish it, and refuse to do those new things just come into my mind. I'm living in today, present, have little reason to finish things the one living in yesterday decide in his day.\nThen the question of this course is, what should I end up with my life. When the end com, what should I possess, so I can say that my life is good enough. And then, just let it go. Maybe I should think hard in this subject, but now I may have little patience on it. But just one list of what come out of my mind.\n1.Character I always desire such as Discipline, Egoism, Sincerity. I wish I could have these as long as possible, but even for a short time, it's worth living. \n2.Dream to come true, even just for myself. Traveler, Hacker, Writer, I'm sure those roles is my dream for my whole life. Also it is not in my life plan, but if I have times to do something, those should be it. And I am sure that the rest of my life will full of free times. Just don't give up dreams, then I will make it some way or an other.\n3.Will there be other things I desire ? Cetainly not those responsility of family. It seems not much things I desire, when I am satisfied in present conditions.\n
2019-06-15	54	I will forget things I do, 10 years later, so record.\n
2019-06-14	11	No project\n
2019-06-12	254	A break of game\nLeave Dark Souls 3 for a while, and take other things.\nDownload Github and try to use it in VS, also I haven't done well in the Diary project, but I have at lease learned how to use Git in VS2012. It doesn't support many Functions of Git.
2019-06-11	33	Buy many kind of food for health\n
2019-06-10	36	A time for game ? A time for free ?\n
2019-06-09	27	Game and sleep, a lost day\n
2019-06-08	31	Fast time, many movie and game\n
2019-06-07	31	A day haven't finish one thing\n
2019-06-06	114	Finsh things left to be done\nWork is the point,\nlife is keep me in a normal status,\nplay is relax when I am tired.
2019-06-05	26	Finish one thing everyday\n
2019-06-04	21	No plan, no learning\n
2019-06-03	5	Miss\n
2019-06-02	52	A dream day, even I have something unlucky happened\n
2019-06-01	39	oneday at a time\n随遇而安，随性而行，出了问题也是一种新体验。
2019-05-31	21	No plan, No learning\n
2019-05-30	5	Miss\n
2019-05-29	5	Miss\n
2019-05-28	33	Too sleepy when I work, An alarm\n
2019-05-27	325	No idea what to do\nI am started living in English mode, but still I am not prepared for that. That will take all my time to do it. But now, I am in a mode of having funs. Eat junk food, drink cocktail, watch movies, and exercise, and asaoki, etc. And maybe I should pay more attention to my work, before I get a punishment.  
2019-05-26	30	Then the English season begin\n
2019-05-25	42	Don't want to do anything before the exam\n
2019-05-23	18	Nothing to write?\n
2019-05-22	13	没有计划，没有完成度啊。\n
2019-05-21	55	今天这状态，不好评价\n凌晨四点才睡，居然上班没有困，神奇。当然身体状态肯定是不好的。\n目标没有定，成果就不好。
2019-05-20	157	程序没写好之前，目标就写在这里\n今天的目标：\n1.好好上班，对应悬案，别太困\n2.改日记程序，这个最重要，目标是8工时完成，预计两天\n3.toeic单词，车上看\n4.asaoki，这个已经完成了，虽然迟到\n\n今天的成果：\n1.不好，很困很困\n2.现在改\n3.上班看了\n4.完成，虽然迟到\n5.权力的游戏看到凌晨4点
2019-05-19	9	一泊練成会二日目\n
2019-05-18	6	一泊練成会\n
2019-05-17	13	越没时间越玩，权力的游戏\n
2019-05-15	26	做梦，很长的梦，超级迟到，一不早起，就懒得没办法了\n
2019-05-14	23	更新签证，又是一年，应该是因为我没交健康保险\n
2019-05-13	21	上班无事写程序，下班回来不继续，只看小说\n
2019-05-12	10	训练会一天，母亲节\n
2019-05-11	12	基本不想什么，玩了一天\n
2019-05-10	11	为了早起，通宵玩游戏\n
2019-05-09	5	miss\n
2019-05-08	12	小说电影，时间过得很快\n
2019-05-07	92	过完一天，久违一梦\n好久没做过这样完整的梦了，虽然是加勒比海盗和三国的合成。\n放假的几天也天天睡到自然醒，但是也没有这么舒爽过。不过当然，松懈只有前几天感觉良好，过了之后就自然而然了。
2019-05-06	20	今天也玩过去了吗，感觉有点儿想改变了呢\n
2019-05-05	11	继续颓废，不好好吃饭\n
2019-05-04	12	不写日记，彻底颓废了吧\n
2019-05-03	26	睡了半天，改了半天卧龙吟。然后玩不够，看动漫不够。\n
2019-05-02	22	睡了半天，改了卧龙吟，然后看动漫，感觉不够\n
2019-05-01	9	旅行，看海，回家\n
2019-04-30	19	旅行最大的问题根本没想到，钱包丢了。\n
2019-04-29	29	半天日记，今天出发。\n去看海，不准备就跑了，闹出多少糟事。
2019-04-28	42	一到假期就懒，一坐在电脑前就松懈。人的各种天性，我的生活习惯，应该怎么应用和规避。\n
2019-04-27	269	提前写日记，计划。\n计划是什么呢?黄金周啊，十天啊，现在就该开始我想好的事情了啊。\n\n外出+英语考试+小说概要，十天很快就过去了，恐怕这三件事情也做不好。现在外出不行，考试不想动，小说就应该写了。不过有原稿要改，动笔也不是开心事。\n最现实的事情可能是完善三年总结，毕竟之前的连日记都没有翻，根本不全。\n另一件事情是写collection程序，修改diary程序。\n还有事情是，完善卧龙吟。\n这样看来，这十天就有六件事情想做了，加上29日早起会，就是七件了。\n\n可最终究竟能做几件事呢？值得思考。当然，本来不应该思考，而更该选择立即行动。\n
2019-04-26	23	原稿还是要写三个小时，还是有中文稿的情况下。\n
2019-04-25	15	有的没的看了很多，该记录下来\n
2019-04-24	17	今天开始又是一堆新东西，事件写多\n
2019-04-23	87	日记和总结，今天又过了\n今天写总结，然后好好睡一觉。工作、生活、娱乐，学习、思考。我需要做的事情还是很多的，就是没有好好规划，没有正式的开始和结束，所以缺乏成就感，缺乏自信。
2019-04-22	190	日记也开始懒了，这两天要写总结的。\n总结还是要写，尽量快点儿写完，毕竟还要完成29日原稿，那个不能再拖了。总结和计划，这计划也不太好写的说，本来就不能写太具体的计划，因为怎么都赶不上变化，现在想得好，到时候根本不做，不如不写，所以只能写方向，但只有方向又怎么能知道转折和提升呢。\n总之这一天的是总结，三年大概的，没有回顾日记的总结。之后该把日记翻一下，做出一个每月的日记记在月末。
2019-04-04	354	回首过去\n今天发现自己不知道该干什么了，为了不浪费时间，工作和车上都在找事情做。在车上看名著简介，《名人传》罗曼罗兰。\n回到家感觉应该查一查自己大学究竟干了些啥，看日记，初二开始的日记，到毕业不到10篇，高中也就最后高三的七个周最有印象。到大学之前的内容不到五分之一，或许是丢失了？看起来不像，不到七分之一。我晕。\n然后大学最初的篇章就是思考前路，然后其中有提到花三年赌一个可能，应该就是写小说，也就是说，我尝试了的，只是没成功，并非是无知无识的就浪费了大学时光。\n啊，9年前就想到了应该学编程、英语、日语，然后找不到方法，到现在还是在干同样的事情。这个刺激有点儿狠，大学以来的这十年，从日记上看我还是很努力的，但是我就觉得除了16年学会了日语，其他没有什么事情算是大的成就，我现在一样属于什么都不懂的阶段。
2019-04-21	515	搬家，空想不如行动，多走两趟什么都搞定了\n搬家其实用不了多少时间，在过程中浪费的更多。真的要搬的话，每样东西跑两趟，怎么都完了，一趟30分钟，根本不用花太多时间。反而是中间休息，考虑怎么办，以及收拾行李的时间，更多。\n做事情也是，做的时间少，前后的准备，心理准备，花的时间多得多。\n今天开始做三年总结，最好三天写完。真的用中文写一篇长论文，然后翻译成日语去演讲，翻译成英语自己联系演讲。\n果然，语言的使用最需要的就是写作和朗读，写是组织语言，组织出属于自己的一言一语，读是联系发生，将想到的语句通过喉咙，练习和测试喉咙，切实走完说话的最后一关。\n既然是新的开始，就一定要有新气象。\n比如想到就做，之前想了一个月都没去给自行车打气，今天去打气了。想了几次不知道楼下能否看到我的房间，马上去看了。\n又比如，丢掉多余行李和不必要的束缚，虽然今天最后失败了，最后一趟回来，两个空箱子变得沉重无比，勒得我手掌、胳膊生疼，不过这就是累赘的重量啊，用自己的亲身体验，来感受到生活所附加的束缚。我要有新的开始，就应该像才来日本那三个月一样，几乎与昨天的生活隔绝，只专注于现在，能丢开的累赘尽量都丢掉，即便以后回头再取或者重新去买，也没有任何关系。
2019-04-20	22	Python for Xiaotisong\n
2019-04-19	5	miss\n
2019-04-18	102	决定了的事情就不能更改,今天早上不ero\n上班无聊，想了许多卧龙吟的设计，结果回来什么也没干成，然后一困就睡了，起来，再睡。睡得倒挺舒服，早起会也不困。不过还是什么都没干成的一天。效率也低，上班和玩都是。
2019-04-17	17	no time to write\n
2019-04-16	5	miss\n
2019-04-15	39	After time, and no time to do anything\n
2019-04-14	450	Exercise and movie.\nHaving a exercise at the Shinkoiwa, but couldn't let my roomate join me. A exercise that haven't take since 9 months ago. Let my body move, and take the duty of subleader in Sound Exercise.\nI will have a new start after this week, a new house and new exercise. 4.29 asaoki, 5.12 exercise, 5.18 exercise and 5.26 Toeic Exam. I have no idea for those event at present, so I have to try a better and discipline action at this month.\n
2019-04-13	284	One day of nothing to do\n今天确实无所事事，早起会没有好好去，英语学习没有备考，看英语电影拉着过了，海贼王最新补了，赘婿补了，一拳超人新番，跟肖体松聊天，是时候具体计划给他办签证了。了解世界，越早越好嘛。\n好好计划，好好做事，好好整理自己，该变化一下了。本来每天都该变化，但是自己能给自己变化的，则是一个月一点点把。\n上个月早起会全勤，这个月的目标呢，已经过半了的说。这个月的目标是英语学习和日记，日记全勤也行，英语学习，恐怕就被放到一边去了。因为这个星期训练，下个星期搬家，怕是没什么精力去备考了。当然学还是要学得，下个月的目标就是英语备考。
2019-04-12	10	Animation\n
2019-04-11	19	No attend to write\n
2019-04-10	349	又显示自己没有自控能力的一天\n1.早上出发去办签证之前都没有好好计划，收入证明本来租房也需要的，结果只要了一份。\n2.下午回来就开始看动漫，本来我的自我控制应该让自己不看海贼王这样的长篇，但是不但看了，还看到晚上接近12点，第二天又早起，看来又是困得一天。顺便还有边看边吃，把自己吃撑死了难受，这也是一个难以表述的愚蠢了。\n3.谨慎了接近一个月，或许一个半月，开始松懈了。这几天该把显示diary各种时间表，时间表的页面做出来了。就算不做收藏，这个还是很需要的。\n4.听英语，电影原声的肖申克的救赎还不错，魔戒稍微差点儿。但总是知道剧情的，比听一些完全不懂的东西好一点儿。现在我还没有到，直接听然后接收知识的程度，听不懂的英语，只能增长一点点儿语感。应该只有对能理解的语言的记忆，才算是真正的学习。
2019-04-09	18	No time for Diary\n
2019-04-08	81	做事情，做事情，现在就是没怎么做事情\n时间不能拿来看动漫，特别是海贼这种超长篇，一开始就没得完了。小说当然更狠。总之现在需要接触新的东西，不能再来老的消磨时光了。
2019-04-07	292	这个月需要干的事情也不少。\n上个月底签了新合同，这个月需要做的事情也不少。\n1.办签证，需要区役所和入管局跑。\n2.租房，找房子，办手续，搬家，买家具。都不是想干的事情来着。\n3.toeic考试学习，这个月是该好好学一学了，还有模拟考。\n4.早起会，这个是会花很多时间的。还有练成会，以及自己该锻炼。\n5.整理收藏，也就是整理自己的爱好，游戏动漫小说。边理边看。\n6.名著浏览，电影大片，特别是英语的。\n7.游戏私服，特别是手游私服代替purikone。\n8.剩下的就是上班和生活了，想要规律，但又觉得无聊，太难平衡了。只有主动引起各种变化，让自己没心思去细想该做什么，有什么意义。\n
2019-04-06	20	\n昨天联系说4.6不去早起会，写错了。\n
2019-04-05	577	Good Morning, Nonesense\n今天思考得挺多的。工作学习生活，鉴于我现在感到无聊，我应该把所有事情都在一天里做了，这样我的这一天就是完满的，然后也不用在乎明天如何了。\n1.活在今天，意味着时间表里的每一项都应该去做，特别是学习、锻炼和娱乐，每样做一点儿，就会发现更多想做的事情。\n2.救火烈士，死亡也是一个归宿，人都要找自己的归宿，决定自己的终结。没有经历生死的人，总是理解不了残酷，学不会珍惜。痛苦，也是人生的必要因素。我尽量，选择对自己伤害较轻的痛苦吧。\n3.大肚子，这个冬天真的涨了不少，该锻炼身体了。当然锻炼也是没有用的，只是一种安慰。如果我下定决心节食，再加上为了训练自律性的每天锻炼，或许能够达到一个不错的效果。生于忧患死于安乐，我真的，活得太轻松。\n4.另一方面，我又活得太忧虑了。其实很多事情挺简单的，做和不做，只有两个选择。很多事情做不好，但细究起来，都是很小的方面没认真的原因。不过是学计算机、外语两门技能而已，哪有那么多事情。每次失败都是有原因的，如果去深究，总能找到改进的地方，或者甚至是焕然一新。我并没有考虑太多的改变，只是觉得自己活得太舒适的话，退一步是非常轻松的。我的自由，就是在只有50分的状态下，在平均20分的群体里悠然自得。自律锻炼，比上不比下，争取更好一点儿。自由娱乐，比下不比上，活着为一分开心。
2019-03-20	156	Forget to write\nI start to read the novel of sanguo, Zongbingduoding. And then let me lost the sleep time over night. But I have take on the Asaoki in time.
2019-04-03	444	Do nothing special but schedule\n完全没做什么特别的事情，特别的是，电车上居然没事可干。必须找到事情做，不然这样的时间浪费实在太不应该了。其实也不需要找，只是记单词就够了，把语音调到另外一个手机上，这边手机静音。这两天主要的事情就是，asaoki，toeic单词，哈利波特，nsreporter，プリコネ，洗澡刷牙，整理收藏。实在没做其他事情啊，除了吃饭睡觉，联系家里。\n其实这也是一件麻烦事情，整理收藏到底算不散一个event，感觉应该不算，他是一件事，但是没有特定的标题。但要说完全不是也不对，至少代表了一件我最重要的事情。在时间表上有体现，而时间表上有几件事情是直接跟某个事件关联的，或许并不需要记录事件。note对应日记和收藏，discipline对应早起会，ero代表ero，算起来都是我需要计数的事情，但是可以通过时间来计算，也就不是必须了。\n好吧，以后通过timetable把这些时间的计数显示出来就行，不用加ero了，而其他几个也没有问题。\n
2019-04-02	271	计划和收藏\n麻烦事情，我今年的目标可能会越来越多。然后大部分或许就像以前一样，不了了之了。不过单纯只是记录下来，也是一件事情重要事情，至少让我知道我进行了多少尝试，然后又失败了多少。\nCollection也算是事件吗？这个也是很麻烦的定义啊。写日记和整理收藏，到底算一件事情吗？\n19年整理收藏，我想把自己定义的分类去掉，只以表现形式分类，以时间排序。这样所有同类东西都放在一个文件夹里，或许不太好找自己想要的类型，但或许习惯了也没什么，因为东西从来也不会太多。然后目录该怎么写，总之最好的办法就是同步，然后直接复制粘贴，没有什么太多可想的。
2019-04-01	656	新年计划\n2016年来日本，工作+早起会是中心，2017年编程年，2018年游戏年，2019年就应该是英语年吧。总是需要一个主题的，如果今年一年时间真的能把英语提高到一个能够实用的地步，那就真的是不错的一年了。只是这恐怕很难。\n那么今年的计划也就清晰了，学习自律和英语。自律的体现就是日记，英语的体现当然在日记里。听力也好，单词也罢，总之每天都花时间在英语上。先记下现在预定好的事情吧。\n1.完善日记程序，可以更清晰的看到自己每个月以及一整年都做到了什么。重点是做到了，那些可有可无的事情就忽略掉吧，记了也没有意义。当然最重要的事情，就是坚持每天记录。当然也是最不容易的一件事。特别是一个月以后。以晚上睡觉前记录最好，不行也要保证早起会回来记录，当然不行，几天后补上是最后办法，不过也忘得差不多了吧。\n2.英语学习。\n（1）首先是有兴趣的听英语文学作品，特别是小说哈利波特。重复听，最后能记住，读出来，当然也可以看着原文把大部分单词弄懂。\n（2）其次是英语单词，毕竟不懂首先就是不懂单词，学习单词是最必要的事情。一个英美成年人的单词量是20000-35000，外国人能说英语的则是10000左右。我过了6级，大概有6000了吧，当然忘了不少，但离目标只差4000，每天20个，200天就能学到，虽然肯定记不牢。\n（3）接着英语考试，先测试一次Toeic，看看自己是什么水平，5月26考，到四月中应该开始模拟考试了，听力和阅读。有个目标，学习起来应该会更有目的性。\n目标不能立太多，总之现在就根据这两条行动吧。\n\n
2019-03-31	312	Last Day of 20190331\n第一段工作的结束，还是用中文写的比较好。\n\n这三年我来到日本，去了两个现场，在桑san公司干了三年，现在要换到汪san公司了。三年大概赚了，呃，不记得具体多少了，总之大概20万，房贷和还钱后还剩12万。其他的买电脑什么的花掉了。\n\n下一年工资涨了，每年应该能剩下到10万以上，然后就今年还清房贷，明年存10万，如果有合适的就回家结婚，没有就继续呆着，第三年再存10万。总之结婚和小孩出生这段时间的钱应该够了。\n\n我要求的也不高啊，本来，能不为钱发愁就最好了。然后就是尽量不担太重的责任，做个小人物就好。\n\n呃，完全不像一个年终总结。还是下次再好好写一个吧。然后明天写一下今年的计划。
2019-03-30	313	整理行李，我应该是个拎包就走的人\n整理了一个小时东西，结果没整理出个什么来。我本来是希望自己处于一个寄宿他乡的状态，一个行李箱，所有东西都可以拎走的那种状态。只有这样才算是一个旅行者吧。那么那些能够给我回忆的东西呢？干脆拍个照片收藏在电脑里吧。当然零散的几个小东西是能够带走的。\n主要是其他几类东西，应该整理出来，不要的全扔了。厚衣服明年冬天再买就是。床单被子也是，换洗的当然需要，但搬家时可以扔的。\n物品类别：\n1.证件：身份证件、银行卡、证书\n2.设备：电脑、硬盘、桌板\n3.书本：笔记本、合同、小说书籍杂志\n4.衣服：四西装两外套、两休闲、一大衣、衬衣内裤袜子若干、衣架\n5.食物：零食、饮料、食材\n6.家具：床、被、枕
2019-03-29	145	Pay attention to life, live the play.\nI should Pay attention to life, live the play in necessity minimum. Drink Plum wine mixed by milk, not bad.
2019-03-28	39	Not Content to write the diary on time\n
2019-03-27	544	The Day of Dahui and Off\nI cann't sleep all night. Go to bed at 11 pm, wake up at 1 am, and then still in mind all night. Half past two o'clock, I started to play san7, then go to the Dahui, return and sleep all afternoon, then cann't fall asleep in the night again.\nBut still, I know I must control myself not to get up and play games. So I rest the night and go to Asaoki the next morning, although I am late again by the unprotected sleep.\nI may make sure I take the note everyday after return from the Asaoki, if I haven't take it at night.
2019-03-26	17	Day before Dahui\n
2019-03-25	229	Drink and sleep\nDrink, Game, Sleep, And wake up early than usual. This is a miserable thing, drink make me sleep fast, but not really sleep well. Should I do this again ? \nIt may work well present, but destruct my body gradually.
2019-03-24	457	No will to write \nIf I have no will to write the diary, then how can I ensure I have to do this everyday ? First, I should chose a fixed time to write, and the time is related to my normal life, such as eat, sleep and asaoki. Second, I have to do this before I forget the timetable and event of this day. So, night or morning, which should I chose ? And the sleep time should count into today, or tomorrow ?\nLots of Questions, no answer. That is a bad mode.
2019-03-23	12	No Diary 02\n
2019-03-22	12	No Diary 01\n
2019-03-21	311	Holiday and Nothing but read novel\nI can only read novel this day, Zongbingduoding. Time is short and enjoyed, may be beyound my feeling. But there has really happy, I laughed at least. Then it should be shorter to finish the novel, maybe do not read to the end of the novel, it will have another time to do it.
2019-03-19	754	Nothing to do, or nothing want to do ?\nGo home and read the novel just a while, cook and take dinnner, then it's almost 10 o'clock PM. It is the time to sleep, but I haven't done nothing yet.\nToday I take the English practice, first Toeic words, then The stories of O.Henry, at last, the fairy tales such likes Cinderella, The Snow White, Aladdin's lamp, Alibaba, etc.\nSound like that I would go back to the children time, and read those famous book once again.\nThe stories of O.Henry is my favorite book of classic novel. Cultrual Perplexity in Agonized Travel, is also my favorite books. \nClassic books, and the old but classic culture, this is one of the things that I should learn, whether how old I am now. So, just do it. Just let it be in my life.
2019-03-18	600	Finish the Diary V1.0\nFinally, I have finished the Diary.exe, V1.0.How long had this simple program takes me? I make the plan of it over one year ago. Listenning the English Audiobook, write English diary, practice for the Toeic Exam. All these things may improve my English some how, but would I make the sense of speaking to the American people normally ? Or just use the English to work or for read. Would I make it useful ? \nIt will be answered only if I persist in the practice over two years. So It probably never be knowed because after two years, I will go back home and never use it again. \n
2019-03-14	279	\nI can't concentrate on my study, neither to English, nor to program. But I just won't lost my intention of learning some new skills. So I will modify the program next morning, after the meeting of asaokikai. Just do it because I promised to myself. It will be done. Good night. 
2019-03-13	173	\nI am bored about the audiobook of The lord of the rings. The speaker is really awful to me. I am continue to listen the application Ximalaya, continue the lesson from KoKo.
2019-03-12	648	\nI heard the audiobook of Lord of the rings for a while. But I found that was not clearly for me and I do not like the voice of the speaker. Then I tried Harry Potter while work time. \nAfter work, I searched audiobook for a while but do not get one book to read. But after that I found the app for audiobook, named ximalaya. So I will take the lessons from the application about the toeic exam and lessons about everyday expressions.\nI was supposed to rebuild the diary program but finally see a movie, Ralph 2. Then it is 10:30, I must go to sleep now, but even not take my shower. Why the time is always so quick, have no time to discuss my mind.
2019-03-11	312	\nI shall do my best to learn English, and take the advatange of my free life present, lead it to an achievment.\nThe point of learn a language is to practice everyday, not only hearing and reading, but also writing and speaking. Then I shall take some course of speaking practice, before it, is the exam of Toeic.
2020-08-01	45	http://appdetailh5.vivo.com.cn/detail/1898947
2020-08-07	144	https://zoom.us/j/93240441248?pwd=K21ZU0ZXVVNZRnlPSVFjckpNcGpIdz09\r\nhttp://www.acglala.net/dhxf/nujizhanduiH0EROS/down/1-1.html\r\n\r\n“；‘';\\r\\n<br>
2020-08-14	134	https://zoom.us/j/93294187626?pwd=MlR2Mk5WdUJydHNybGoySHZmOExrZz09\r\nhttps://zoom.us/j/92951618390?pwd=UTBzNGJBUWl2bVEwOUs0ck9rMjdyUT09
2020-08-21	132	https://zoom.us/j/7695846499?pwd=UnRLS3c3OHRodmZNMjdhMXJxUmdrUT09\r\nhttps://zoom.us/j/7695846499?pwd=UnRLS3c3OHRodmZNMjdhMXJxUmdrUT09
2020-09-08	181	IF(B1=＂＂,OFFSET($A$1,ALL(IF(COUNTIF($B$1:$B24,$A$1:$A$10)=1,999,ROW($A$1:$A$10)-1),ROW()-COUNTA(B:B)),0),VLOOKUP(B1,A:A,1,)) \r\n\r\n\r\n=INDEX(D:D,1+MATCH(,COUNTIF(F$1:F1,D$2:D$21),))&""
2020-11-03	272	今天有些感想，自己的人生路，是不是还在继续向前迷失呢，我不知道想要做成什么。将梦想作为职业的路几乎已经破灭，我总还是要继续往前走的。要么是被事情推着走，谈恋爱，结婚，带孩子，教育，赡养。要么就是自己去闯荡，日本本美国欧洲，IT语种网文，想要向前，总是有可能性的，但是真的没有那么强烈的想法了。\r\n三十岁了，虽然现在才说，所有能走的路都已经探过了，就看选那条路，有没有那个毅力和能力走下去了。\r\n\r\n不带手机出去走一趟，真轻松。小摊边的奥特曼玩具，图书馆看了几小时日本历史，近代时期的日本也挺艰难的，君主立宪反复，中日战争、二战基本被军部推着走。
2020-11-07	271	比较帅得行者一行来到一块领地，领主被领民们催债催得没有办法。国王长女爱笑，行者们因通行证发放问题被困在这里时，试图找他们帮忙办一件事。行者盲猜是假扮或替代求婚者，她带着行者走在领地上，甚至在一片废旧的广场上像个孩子般奔跑，被富商占据。但由于国家没有限制富商的法令，结果领主也拿为富不仁，从领民手里骗走钱财的富商没有办法。行者作为走过多个国家的有识之人，在找富商确认的途中，告诉众人每个国家有自己的法令，每个领地也会根据自身情况，以国家法令为基础追加一些规定的世界常识。这里的领主因为太老实了，才没有根据情况自己做主，这本来倒也不是太大的坏事。
2020-11-11	64	是不是该再启动一下了，好久没重装系统了，我这个人。现在三十岁，是应该重启一下，根据新得到的感受，选择做些现在力所能及的事情了呢。
2020-12-11	450	Everyday English：\r\nI should take memo everyday in English. Otherwise I cannot improve my English.\r\nI learned how to improve my Japanese, by write articles and read it in front of other people. I think it will work in English learning as well.\r\nThe only worry of this learning is that Will I persistent the practice everyday in a long term. It’s almost impossible only by my self-discipline.\r\nI need help from other people who can supervise my action.
2021-04-29	206	以女性角色的语气记录日记，如果是最近做的事情，应该会留下记录的，为什么没有呢。还是说纯粹只是梦里的印象呢。但似乎真的有那种印象啊。\r\n然后是梦里幻想，作为指挥官带领部队探索皇陵，搜寻皇帝留下的遗产。另外两个主角，世家公子和名望将军还在修养，因为互相支援而在海战、天灾之中受了重伤。类似于三战那样的诸侯，几个角色（账号）同心协力的扩展版图到了一定程度，但还有许多问题没有解决，一直处于探索新世界的冒险旅程之中。\r\n
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: xiao
--

COPY public.event (id, category, name, sorted, status) FROM stdin;
10000832	Animation	王-omo	Person	Finished
10000773	Game	三国志战略版	Collection	OnProcess
10000060	Movie	抖音	Event	Finished
10000522	Movie	电影-抖音短片	Event	Finished
10000802	Book	超人高中生们即使在异世界也能从容生存！	Collection	Finished
10000781	Communicate	王慧敏	Person	Finished
10000825	Animation	Dog Days	Collection	Finished
10000795	Animation	奇诺之旅	Collection	Complete
10000810	Book	游戏民国	Collection	GiveUp
10000048	Live	做饭	Event	Finished
10000833	Animation	骏河屋	Event	Finished
10000864	Account	证书盒	Event	Finished
10000740	Book	唐砖	Collection	Finished
10000872	Animation	buddy complex	Collection	Complete
10000877	Animation	Working	Collection	Complete
10000880	Project	VSCode	Event	Finished
10000881	Project	Aliyun的Postgresql连接问题	Event	GiveUp
10000826	Animation	回復術士のやり直し	Collection	GiveUp
10000856	Game	Fate Grand Order	Collection	GiveUp
10000015	Live	live	Event	Finished
10000080	Communicate	爸的生日	Event	Finished
10000055	Communicate	肖体松Python比赛	Event	Finished
10000092	Communicate	节日祝福	Event	Finished
10000111	Communicate	蹦迪	Event	Finished
10000125	Communicate	青年留宿	Event	Completed
10000104	Animation	4月新番	Event	Finished
10000078	Animation	MIX	Collection	Finished
10000030	Animation	animation	Event	Finished
10000074	Animation	盾之勇者成名录	Collection	Finished
10000050	Animation	一拳超人	Collection	Finished
10000084	Animation	刀使巫女	Collection	Finished
10000031	Animation	吸血鬼骑士	Collection	Finished
10000032	Animation	宅男腐女恋爱真难	Collection	Finished
10000085	Animation	心跳回忆OL	Collection	Finished
10000076	Animation	我们无法一起学习	Collection	Finished
10000038	Animation	火影忍者	Collection	Finished
10000054	Game	DNF	Collection	Finished
10000073	Animation	贤者之孙	Collection	Finished
10000072	Animation	钻石王牌	Collection	Finished
10000067	Book	Fate/Apocrypha	Collection	Finished
10000013	Book	book	Event	Finished
10000037	Book	名著简介	Event	Finished
10000049	Book	天行	Event	GiveUp
10000008	Book	纵兵夺鼎	Collection	Finished
10000087	Game	PS4-高达	Collection	Finished
10000027	TSSummit	TSSummit	Event	Finished
10000094	Game	Steam	Event	Finished
10000012	Game	game	Event	Finished
10000053	Game	卧龙吟	Collection	Finished
10000039	Game	大话西游	Collection	Finished
10000090	Game	梦塔防自走棋	Collection	Finished
10000124	Movie	movie	Event	Finished
10000107	Movie	众神之锤	Collection	Finished
10000065	Movie	剪刀手	Collection	Finished
10000052	Movie	功夫熊猫	Collection	Finished
10000062	Movie	加勒比海盗	Collection	Finished
10000036	Movie	宝贝老板	Collection	Finished
10000105	Movie	小鬼当家	Collection	Finished
10000109	Movie	少年斯派维的奇异旅行	Collection	Finished
10000071	Movie	抖音-他人生活	Event	Finished
10000063	Movie	抖音-武打	Event	Finished
10000114	Movie	换子疑云.Changeling	Collection	Finished
10000095	Movie	权力的游戏	Collection	Finished
10000045	Movie	电影原声	Event	Finished
10000025	Game	三国群英传7	Collection	Finished
10000024	Erotism	ero	Event	Finished
10000040	Project	DNF服务器	Achievement	Finished
10000010	Project	Diary.exe	Achievement	Finished
10000117	Project	Photoshop	Achievement	Finished
10000016	Project	project	Event	Finished
10000082	Project	卧龙吟服务器	Achievement	Finished
10000023	TSSummit	NSReporter	Achievement	Finished
10000018	TSSummit	business	Event	Finished
10000103	Language	A Song of Ice and Fire	Achievement	Finished
10000028	Language	Aesop's Fables	Achievement	Finished
10000021	Language	Grimm's fairy tales	Achievement	Finished
10000002	Language	Harry Potter	Achievement	Finished
10000006	Language	KoKo English	Achievement	Finished
10000007	Language	O.Henry	Achievement	Finished
10000029	Language	Summary of Famous Works	Event	Finished
10000120	Language	TOEIC 800	Achievement	Finished
10000022	Language	The Arabian Nights	Achievement	Finished
10000004	Language	The Lord of the Rings	Event	Finished
10000003	Language	Toeic	Achievement	Finished
10000005	Language	language	Event	Finished
10000047	Language	英语电影	Event	Finished
10000093	Language	英语网站	Event	Finished
10000068	Fantasy	圣剑传说-数据	Event	Finished
10000011	Note	diary	Event	Finished
10000102	Note	diary.exe	Event	Finished
10000771	Animation	弩级战队H×EROS	Collection	GiveUp
10000195	Game	英雄联盟-云顶之弈	Collection	OhnProcess
10000218	Game	英雄无敌3	Collection	Finished
10000790	TSSummit	劉丹奇	Person	Finished
10000796	Note	图书馆	Event	Finished
10000890	Exercise	室内锻炼	Event	Finished
10000824	Animation	裏世界ピクニック	Collection	GiveUp
10000789	Animation	记录的地平线	Collection	Finished
10000851	Animation	伪恋	Collection	GiveUp
10000079	Animation	关于我转生变成史莱姆这档事	Collection	Finished
10000051	Book	赘婿	Collection	Finished
10000009	Game	プリコネ	Collection	Finished
10000225	Erotism	琉璃神社	Event	Finished
10000130	Live	收拾房间	Event	Finished
10000811	Book	唐朝好舅子	Collection	GiveUp
10000827	Animation	遙かなる時空の中で～八葉抄～	Collection	GiveUp
10000841	Animation	竹剑少女	Collection	Complete
10000868	Live	冷冻披萨	Event	Finished
10000869	Live	红茶加奶	Event	Finished
10000873	Animation	纯洁的玛利亚	Collection	Complete
10000878	Animation	群居姐妹	Collection	Complete
10000882	Live	冷冻炒饭	Event	Finished
10000887	Live	方便面包-重庆小面	Event	Finished
10000847	Erotism	overflow	Event	Finished
10000885	Book	无职转生	Collection	Finished
10000886	Book	转生成蜘蛛又怎样！	Collection	Finished
10000834	Animation	神様になった日	Collection	GiveUp
10000774	Communicate	汪明立	Person	Finished
10000161	Live	Clean	Event	Finished
10000191	Live	收拾行李	Event	Finished
10000155	Live	看病——皮肤病	Event	Finished
10000204	Communicate	抖音	Event	Finished
10000240	Communicate	生日	Event	Finished
10000230	Communicate	联系家里	Event	Finished
10000157	Communicate	肖体松学日语	Event	Finished
10000196	Communicate	肖体松的初三毕业旅行	Event	Finished
10000213	Communicate	范小龙寄宿	Event	Finished
10000214	Communicate	飲み会	Event	Finished
10000168	Animation	Animation	Event	Finished
10000190	Animation	BEM	Collection	GiveUp
10000181	Animation	COP CRAFT	Collection	GiveUp
10000212	Animation	Fate	Event	Finished
10000183	Animation	君主·埃尔梅罗二世事件簿 魔眼收集列车 Grace not	Collection	Finished
10000182	Animation	在地下城寻求邂逅是否搞错了什么 第二季	Collection	GiveUp
10000205	Animation	埃尔梅罗二世事件簿	Collection	Finished
10000189	Animation	实况主的逃脱游戏	Collection	GiveUp
10000217	Animation	平凡职业造就最强	Collection	Finished
10000180	Animation	柯南	Collection	Finished
10000232	Animation	碧蓝幻想	Collection	Complete
10000170	Game	Game	Event	Finished
10000184	Animation	重来吧，魔王大人！	Event	GiveUp
10000169	Book	Book	Event	Finished
10000215	Book	回到明朝当王爷	Collection	Finished
10000197	Book	夜天子	Collection	Finished
10000206	Book	大宋北斗司	Collection	Finished
10000156	Book	天醒之路	Collection	GiveUp
10000154	Game	Sword.Art.Online.Fatal.Bullet	Collection	Finished
10000219	Book	步步生莲	Collection	Finished
10000176	Book	民国往事	Collection	GiveUp
10000126	Movie	卡萨布兰卡.Casablanca	Collection	Completed
10000145	Project	C# Basic	Achievement	Finished
10000138	Game	巫师3	Collection	Finished
10000146	Game	怪物猎人：世界	Collection	Finished
10000144	Game	找游戏	Event	Finished
10000132	Game	暗黑2	Collection	Finished
10000239	Game	游戏修改_满足欲望的设计	Event	Finished
10000229	Movie	游戏动画	Collection	Finished
10000127	Movie	狮子王.The.Lion.King.SP	Collection	Completed
10000136	Game	轮回之剑	Collection	Finished
10000241	Movie	英语电影	Event	Finished
10000129	Movie	闪灵.The.Shining	Collection	Completed
10000224	Book	平凡职业造就世界最强	Collection	Finished
10000233	Game	碧蓝幻想	Collection	Finished
10000164	Erotism	Erotism	Event	Finished
10000223	Erotism	买人偶	Event	Finished
10000172	Project	AWS_VPN	Event	Finished
10000134	Project	GitHub	Achievement	Finished
10000209	Project	LOLZiZouQi.exe	Achievement	Finished
10000165	Project	Project	Event	Finished
10000231	Project	Unity3D教学视频	Achievement	Finished
10000228	Project	Unity开发	Event	Finished
10000202	Project	日记程序	Event	Finished
10000142	Project	机器学习和数据挖掘	Event	Finished
10000141	Project	游戏编程_Unity	Event	Finished
10000173	TSSummit	Work	Event	Finished
10000198	TSSummit	回家拿出入证	Event	Finished
10000166	Language	Language	Event	Finished
10000210	Language	哈利波特	Collection	Finished
10000135	Language	耶鲁大学公开课	Event	Finished
10000140	Language	耶鲁大学公开课_古典音乐	Event	Finished
10000139	Language	耶鲁大学公开课_流行病	Event	Finished
10000177	Fantasy	Fantasy	Event	Finished
10000242	Fantasy	勇者召唤之风骑士	Achievement	Finished
10000238	Fantasy	幻想_勇者召唤	Achievement	Finished
10000167	Note	Note	Event	Finished
10000352	Note	Ego随想	Event	Finished
10000363	Note	梦记录	Achievement	Finished
10000813	Discipline	圣经学习会	Event	Finished
10000775	Game	三国志11	Collection	Finished
10000791	Animation	Tari Tari	Collection	Complete
10000812	Discipline	圣经讨论会	Event	Finished
10000828	Animation	哥布林杀手	Collection	Complete
10000842	Animation	風夏	Collection	GiveUp
10000853	Erotism	Joshi Ochi!	Event	Finished
10000866	Project	typeperf.exe	Achievement	Finished
10000208	Fantasy	城市恋曲	Achievement	Finished
10000820	Animation	魔术士欧菲流浪之旅	Collection	GiveUp
10000848	Animation	SHUFFLE!	Collection	Finished
10000857	Erotism	Erotica Books	Event	Finished
10000804	TSSummit	Sony支援	Event	Finished
10000852	Animation	无职转生	Collection	Finished
10000133	Language	极光单词	Achievement	Finished
10000835	Animation	王之逆袭:意志的继承者	Collection	GiveUp
10000865	TSSummit	任琼	Person	Finished
10000875	Live	焼肉弁当	Event	Finished
10000879	Live	スーパー・アコレ	Event	Finished
10000883	Animation	GATE自衛隊	Collection	Finished
10000870	Animation	Fate/stay night [Heaven's Feel]	Collection	Finished
10000782	TSSummit	统合DB_IF	Event	Finished
10000293	Note	note记录	Event	Finished
10000858	Live	嗑瓜子	Event	Finished
10000797	Note	梦幻想	Event	Finished
10000421	Communicate	婆婆	Person	Finished
10000874	TSSummit	cNS_IF_OracleEBS_Account.exe	Achievement	Finished
10000356	Live	发呆	Event	Finished
10000279	Live	坏肚子	Event	Finished
10000243	Communicate	微信	Event	Finished
10000314	Communicate	王文航	Person	Finished
10000289	Communicate	赫飞龙	Person	Finished
10000290	Communicate	李致国	Person	Finished
10000302	Animation	10月新番	Event	Finished
10000303	Animation	Assasin’s Pride	Collection	Finished
10000310	Animation	Fate Grand Order	Collection	Finished
10000280	Animation	Fate/Apocraphy	Collection	Finished
10000294	Animation	Kokoro Connect	Collection	Finished
10000270	Animation	mix	Collection	Finished
10000343	Animation	らき☆すた	Collection	Completed
10000322	Animation	传颂之物	Collection	Completed
10000347	Animation	初夏	Collection	GiveUp
10000345	Animation	初音岛	Collection	Completed
10000316	Animation	动漫音乐-网易云	Event	Finished
10000328	Animation	四叶游戏	Collection	Completed
10000315	Animation	天才麻将少女	Collection	Finished
10000283	Animation	宇宙的星路	Collection	Finished
10000349	Animation	干物妹	Collection	Finished
10000313	Animation	我，不是说了能力要平均值吗！	Collection	Finished
10000330	Project	swift编程	Achievement	Finished
10000245	Animation	Classroom☆Crisis	Collection	Finished
10000333	Book	历史知识	Event	Finished
10000351	Book	因为我是开武器店的大叔	Collection	GiveUp
10000323	Book	怪盗圣少女	Collection	Finished
10000329	Book	武则天	Event	Finished
10000251	Book	钢壳都市雷吉欧斯-小说	Collection	Finished
10000364	Game	卧龙吟_设计	Event	GiveUp
10000358	Game	找网吧-新大久保	Event	Finished
10000336	Movie	英语音乐	Event	Finished
10000246	Erotism	少女映畫	Event	Finished
10000337	Erotism	风月大陆	Event	Finished
10000357	Leisure	赖床	Event	Finished
10000300	Project	AWS	Achievement	Finished
10000340	Project	Angular	Achievement	GiveUp
10000301	Project	Mac OS	Achievement	Finished
10000367	Project	Mac的win10网卡驱动	Event	Finished
10000338	Project	VPN连接专网	Achievement	GiveUp
10000366	Project	WlyParser.exe	Achievement	Finished
10000267	Project	拆电脑	Event	Finished
10000277	Project	移动硬盘	Event	Finished
10000299	Project	阿里云日服	Achievement	Finished
10000324	TSSummit	Import_MarginCall.exe	Achievement	Finished
10000335	TSSummit	OpenSourceRisk	Event	GiveUp
10000295	TSSummit	SWIFT电文	Achievement	Finished
10000365	TSSummit	坐立不安	Event	Finished
10000317	TSSummit	定例会	Event	Finished
10000353	TSSummit	工作勤务	Event	Finished
10000311	TSSummit	貸金IF	Achievement	Finished
10000326	TSSummit	障害对应	Achievement	Finished
10000312	TSSummit	電文取込対応	Achievement	Finished
10000281	Neso	公司拿钥匙	Achievement	Finished
10000360	Neso	年末调整	Achievement	Finished
10000276	Language	励志英语	Event	Finished
10000259	Language	哲学课：死亡	Event	Finished
10000253	Language	喜马拉雅-英语听力	Achievement	Finished
10000260	Language	欧亨利小说	Event	Finished
10000284	Language	英语音乐	Event	Finished
10000261	Fantasy	幻兽传说	Achievement	Finished
10000308	Note	Account整理	Event	Finished
10000274	Note	做计划	Event	Finished
10000362	Note	历史知识	Event	Finished
10000282	Note	数据备份	Event	Finished
10000285	Note	日记	Event	Finished
10000325	Note	胡思乱想	Event	Finished
10000255	Note	逛中华街	Achievement	Finished
10000354	Discipline	巡回早起会	Achievement	Finished
10000250	Discipline	思考自我	Event	Finished
10000254	Discipline	早起会-大会	Achievement	Finished
10000355	Exercise	骑车逛街	Achievement	Finished
10000459	Exercise	旗手行進	Achievement	GiveUp
10000783	Account	配眼镜	Event	Finished
10000776	Neso	冯天鸿	Person	Finished
10000442	Animation	Re：从零开始的异世界生活	Collection	Finished
10000792	Animation	魔王学院的不合格者	Collection	GiveUp
10000805	Language	English Diary	Event	GiveUp
10000814	Animation	异世界的圣机师物语	Collection	Finished
10000387	Book	爱书的下克上	Collection	Finished
10000829	Animation	魔法科高中的劣等生	Collection	Finished
10000844	Animation	我的妹妹不可能那么可爱	Collection	Complete
10000854	TSSummit	环境构筑	Event	Finished
10000859	Live	宿舍-高岛平2-26-2 80X	Event	Finished
10000860	Live	DAISO	Event	Finished
10000861	Account	指甲刀	Event	Finished
10000266	Communicate	家人	Event	Finished
10000849	Animation	番剧回顾	Event	Finished
10000288	Communicate	妈	Person	Finished
10000278	Communicate	肖体松	Person	Finished
10000836	Animation	苍之骑士团	Collection	GiveUp
10000361	Exercise	散步	Event	Finished
10000391	Communicate	早起会-圣诞	Event	Finished
10000411	Communicate	江連孝文	Person	Finished
10000406	Communicate	社頭来喜	Person	Finished
10000434	Communicate	肖坤慧	Person	Finished
10000422	Communicate	肖坤杰	Person	Finished
10000433	Communicate	肖坤胜	Person	Finished
10000417	Communicate	肖舒妤	Person	Finished
10000418	Communicate	萧皓然	Person	Finished
10000477	Communicate	蒋思源	Person	Finished
10000369	Communicate	请客吃饭	Event	Finished
10000409	Communicate	阿曽田鷹茂	Event	Finished
10000408	Communicate	青年部忘年会	Event	Finished
10000416	Communicate	姻伯	Person	Finished
10000426	Communicate	幺舅	Person	Finished
10000488	Animation	凉宫春日的忧郁	Collection	Completed
10000429	Communicate	爸	Person	Finished
10000435	Communicate	肖月	Person	Finished
10000472	Communicate	肖光	Person	Finished
10000424	Communicate	谢三嬢	Person	Finished
10000425	Communicate	陆萍姐	Person	Finished
10000440	Animation	南家三姐妹	Collection	Completed
10000427	Communicate	李玟	Person	Finished
10000466	Animation	Fate/Zero	Collection	Finished
10000444	Animation	怕痛的我，把防御力点满就对了	Collection	GiveUp
10000397	Animation	战斗动画	Event	Finished
10000485	Animation	提亚拉之泪	Collection	Completed
10000394	Animation	斩赤红之瞳	Collection	Completed
10000454	Animation	无限系统树	Collection	GiveUp
10000445	Animation	某科学的超电磁炮	Collection	Finished
10000484	Animation	猎龙飞船	Collection	Finished
10000399	Book	皇帝圣印战记	Collection	Finished
10000405	Book	网络小说	Event	Finished
10000386	Book	美女班的男助教	Collection	Completed
10000395	Book	被卷入了勇者召唤事件却发现异世界很和平	Event	GiveUp
10000378	Book	谁与争锋	Collection	Finished
10000393	Book	轻小说目录	Event	Finished
10000447	Book	问题儿童来自异世界	Collection	Finished
10000480	Book	骑士&魔法	Collection	Finished
10000450	Book	魔弹之王与战姬	Collection	Finished
10000486	Game	ShadowVerse	Collection	Finished
10000375	Game	迅游加速器	Event	Finished
10000423	Movie	哪吒之魔童降世	Collection	Finished
10000380	Erotism	Konachan	Event	Finished
10000452	Erotism	ロマンスは剣の輝き	Event	Completed
10000487	Erotism	快播	Event	GiveUp
10000443	Erotism	风车动漫	Event	Finished
10000475	Leisure	日常蹲厕所	Event	Finished
10000371	Project	Git项目管理	Event	GiveUp
10000413	Project	XAML	Achievement	Finished
10000372	Project	c#后台程序	Event	GiveUp
10000489	TSSummit	DLine本番障害	Achievement	Finished
10000467	TSSummit	EUC帳票改修	Achievement	Finished
10000456	TSSummit	OIS対応	Achievement	Finished
10000377	TSSummit	SVRS程序重构	Achievement	Finished
10000390	TSSummit	上班无聊	Event	Finished
10000400	TSSummit	勤务	Event	Finished
10000403	TSSummit	安装新电脑	Event	Finished
10000469	TSSummit	席替え	Achievement	Finished
10000379	TSSummit	服务器管理	Achievement	Finished
10000446	Language	托业考试	Event	Finished
10000373	Language	英语考试听力	Event	Finished
10000376	Note	Win10整理	Event	Finished
10000462	Note	东京塔	Achievement	Finished
10000449	Note	收拾旧电脑	Event	Finished
10000368	Note	社会知识	Event	Finished
10000414	Note	飞机回国	Event	Finished
10000458	Discipline	室井一起	Person	Finished
10000460	Discipline	社頭来喜	Person	Finished
10000453	Exercise	健身房	Achievement	GiveUp
10000793	Language	The Dresden Files	Achievement	GiveUp
10000777	Communicate	裴浩	Person	Finished
10000778	Communicate	谢二嬢	Person	Finished
10000528	Exercise	室内运动	Event	GiveUp
10000575	Language	The Science of Well-Being	Event	GiveUp
10000546	Note	翻看日记	Achievement	Finished
10000576	Discipline	The Science of Well-Being	Achievement	GiveUp
10000494	Communicate	郭志南	Person	Finished
10000567	Book	我有一个恐怖屋	Collection	Finished
10000568	TSSummit	NSReporter新对应	Achievement	Finished
10000807	Fantasy	民国参谋	Achievement	Finished
10000822	Animation	この素晴らしい世界に祝福を！	Collection	Finished
10000582	Communicate	蒋禄红	Person	Finished
10000584	Communicate	肖坤财	Person	Finished
10000585	Communicate	二娘	Person	Finished
10000586	Communicate	肖影	Person	Finished
10000587	Communicate	五娘	Person	Finished
10000588	Communicate	肖晨晨	Person	Finished
10000589	Communicate	谭冽冽	Person	Finished
10000590	Communicate	肖诗言	Person	Finished
10000591	Communicate	肖盼盼	Person	Finished
10000592	Communicate	岡南佑樹	Person	Finished
10000593	Communicate	石原勲武	Person	Finished
10000830	Animation	トリニティセブン	Collection	GiveUp
10000519	Language	Harvard Open Course : Positive Psychology	Event	OnProcess
10000799	Note	整理收藏	Event	Finished
10000463	Erotism	Gelbooru	Event	Finished
10000594	Communicate	星克成	Person	Finished
10000511	Social	社会知识	Event	Finished
10000595	Communicate	栗原大樹	Person	Finished
10000596	Communicate	加藤大輝	Person	Finished
10000597	Communicate	志賀洸介	Person	Finished
10000598	Communicate	山下一成	Person	Finished
10000599	Communicate	桑辉	Person	Finished
10000600	Communicate	金莎	Person	Finished
10000601	Communicate	童力	Person	Finished
10000602	Communicate	王乃鹏	Person	Finished
10000603	Communicate	刘辉	Person	Finished
10000604	Communicate	余志力	Person	Finished
10000605	Communicate	张立欣	Person	Finished
10000606	Communicate	宋兆庆	Person	Finished
10000607	Communicate	刘扬	Person	Finished
10000381	Discipline	青年の集い	Event	Finished
10000608	Communicate	陈静	Person	Finished
10000609	Communicate	张淼	Person	Finished
10000610	Communicate	刘恋	Person	Finished
10000611	Communicate	张海成	Person	Finished
10000612	Communicate	高瑞	Person	Finished
10000549	Live	喝酒	Event	Finished
10000569	Account	电脑设备	Event	Finished
10000508	Communicate	王国泉	Person	Finished
10000552	Communicate	田Tina	Person	GiveUp
10000498	Animation	プリコネ	Collection	Finished
10000527	Animation	八男？别闹了！	Collection	Finished
10000530	Animation	动漫音乐ktv	Event	Finished
10000554	Animation	恶魔奶爸	Collection	Finished
10000563	Animation	暗杀教室	Collection	Finished
10000545	Book	抗战之重生雪豹周卫国	Collection	GiveUp
10000580	Book	欢迎来到实力至上主义的教室	Collection	GiveUp
10000560	Book	禁区之门-地狱黑客	Collection	Finished
10000558	Book	至尊无赖	Collection	Finished
10000564	Book	龙王的女婿	Collection	GiveUp
10000551	Game	Dota	Collection	Finished
10000490	Game	Johnny Trigger	Collection	Finished
10000562	Game	VR Game	Event	Finished
10000521	Game	徐老师来巡山	Collection	Finished
10000495	Game	曹操传Mode-岳飞传	Collection	Finished
10000493	Game	郭志南	Event	Finished
10000500	Game	魔兽世界	Collection	Finished
10000537	Movie	前任攻略	Collection	Finished
10000509	Movie	半路夫妻	Collection	Finished
10000526	Movie	周星驰	Collection	Finished
10000531	Movie	天下无诈	Collection	Finished
10000515	Movie	天地粮人	Collection	Finished
10000510	Movie	我是特种兵	Collection	Finished
10000525	Movie	我的团长我的团	Collection	Finished
10000507	Movie	流浪地球	Collection	Finished
10000517	Movie	海棠依旧	Collection	Finished
10000513	Movie	火蓝刀锋	Collection	Finished
10000566	Project	Excel	Achievement	Finished
10000555	Project	微信小程序-LiteStore	Achievement	GiveUp
10000547	Project	微信小程序-车票系统	Event	GiveUp
10000542	TSSummit	ETF对应	Achievement	Finished
10000504	TSSummit	FatPC	Event	Finished
10000518	TSSummit	VBA工数计算工具	Achievement	Finished
10000570	TSSummit	时价导入	Achievement	Finished
10000533	TSSummit	自动Assign	Achievement	Finished
10000506	TSSummit	自動NoAssign対応	Achievement	Finished
10000496	TSSummit	金融大学	Achievement	Finished
10000535	Neso	翟杰	Person	Finished
10000516	Social	周恩来	Person	Finished
10000497	Social	抖音	Event	Finished
10000529	Social	这就是中国	Achievement	GiveUp
10000561	Language	TikTok	Achievement	Finished
10000577	Language	美国动画	Event	Finished
10000512	Language	英语新闻	Event	Finished
10000613	Communicate	丸山さん	Person	Finished
10000614	Communicate	江口さん	Person	Finished
10000615	Communicate	金时哲	Person	Finished
10000616	Communicate	羽柴直子	Person	Finished
10000617	Communicate	中地和彦	Person	Finished
10000618	Communicate	四戸ゆうこ	Person	Finished
10000619	Communicate	龙浩	Person	Finished
10000620	Communicate	吴亚	Person	Finished
10000621	Communicate	罗希	Person	Finished
10000622	Communicate	张杨	Person	Finished
10000623	Communicate	燕丽琼	Person	Finished
10000624	Communicate	溪容梅	Person	Finished
10000625	Communicate	姜晓涵	Person	Finished
10000626	Communicate	干劲	Person	Finished
10000627	Communicate	刘勇	Person	Finished
10000628	Communicate	赵白	Person	Finished
10000629	Communicate	肖乾富	Person	Finished
10000631	Animation	足球小将	Collection	Finished
10000632	Animation	龙珠	Collection	Finished
10000633	Animation	圣斗士星矢	Collection	Finished
10000634	Animation	浪客剑心	Collection	Finished
10000635	Animation	幽游白书	Collection	Finished
10000636	Animation	乱马1/2	Collection	Finished
10000637	Animation	钢铁神兵	Collection	Finished
10000638	Animation	剑勇传说	Collection	Finished
10000639	Animation	烈火之炎	Collection	Finished
10000640	Animation	hunter x hunter	Collection	Finished
10000641	Animation	数码宝贝	Collection	Finished
10000642	Animation	奥特曼	Collection	Finished
10000643	Animation	美少女战士	Collection	Finished
10000644	Animation	天使领域	Collection	Finished
10000645	Animation	四驱兄弟	Collection	Finished
10000646	Animation	四驱小子	Collection	Finished
10000647	Animation	头文字D	Collection	Finished
10000648	Animation	网球王子	Collection	Finished
10000649	Animation	棒球英豪	Collection	Finished
10000574	Neso	陈琛	Person	Finished
10000650	Animation	武器种族传说	Collection	Finished
10000651	Animation	史上最强弟子兼一	Collection	Finished
10000652	Animation	植木的法则	Collection	Finished
10000653	Animation	一骑当千	Collection	Finished
10000654	Animation	刀语	Collection	Finished
10000655	Animation	虫奉行	Collection	Finished
10000656	Animation	名侦探柯南	Collection	Finished
10000657	Animation	城市猎人	Collection	Finished
10000658	Animation	天使怪盗	Collection	Finished
10000659	Animation	二十面相少女	Collection	Finished
10000660	Animation	死亡笔记	Collection	Finished
10000661	Animation	Fate/stay night	Collection	Finished
10000662	Animation	月姬	Collection	Finished
10000663	Animation	空之境界	Collection	Finished
10000664	Animation	魔卡少女樱	Collection	Finished
10000503	Discipline	青年部Skype	Achievement	Finished
10000666	Animation	舞-HIME	Collection	Finished
10000667	Animation	舞-乙HIME	Collection	Finished
10000668	Animation	风之圣痕	Collection	Finished
10000670	Animation	科学的超电磁炮	Collection	Finished
10000671	Animation	噬血狂袭	Collection	Finished
10000672	Animation	潘多拉之心	Collection	Finished
10000674	Animation	心灵侦探八云	Collection	Finished
10000675	Animation	奇幻贵公子	Collection	Finished
10000676	Animation	神的记事本	Collection	Finished
10000677	Animation	冰菓	Collection	Finished
10000678	Animation	滑头鬼之孙	Collection	Finished
10000679	Animation	结界师	Collection	Finished
10000680	Animation	化物语	Collection	Finished
10000681	Animation	全部成为F	Collection	Finished
10000682	Animation	魔法使借贷公司	Collection	Finished
10000683	Animation	蔷薇少女	Collection	Finished
10000684	Animation	死后文	Collection	Finished
10000685	Animation	妖精的旋律	Collection	Finished
10000686	Animation	红	Collection	Finished
10000687	Animation	Another	Collection	Finished
10000688	Animation	绝园的暴风雨	Collection	Finished
10000689	Animation	境界的彼方	Collection	Finished
10000690	Animation	漆黑的子弹	Collection	Finished
10000691	Animation	极黑的布伦希尔德	Collection	Finished
10000692	Animation	七大罪	Collection	Finished
10000693	Animation	六花的勇者	Collection	Finished
10000694	Animation	精灵使的剑舞	Collection	Finished
10000695	Animation	零之使魔	Collection	Finished
10000696	Animation	绯弹的亚里亚	Collection	Finished
10000697	Animation	11eyes -罪与罚与赎的少女	Collection	Finished
10000698	Animation	神曲奏界	Collection	Finished
10000699	Animation	罪恶王冠	Collection	Finished
10000700	Animation	K	Collection	Finished
10000701	Animation	传说的勇者的传说	Collection	Finished
10000702	Animation	暗夜魔法使	Collection	Finished
10000703	Animation	浜虎	Collection	Finished
10000704	Animation	91Days	Collection	Finished
10000705	Animation	永生之酒	Collection	Finished
10000706	Animation	苍色骑士	Collection	Finished
10000707	Animation	弹丸论破	Collection	Finished
10000708	Animation	信蜂	Collection	Finished
10000709	Animation	RWBY	Collection	Finished
10000710	Animation	刀使的巫女	Collection	Finished
10000711	Animation	机动战舰Nadesico	Collection	Finished
10000712	Animation	新世纪福音战士	Collection	Finished
10000713	Animation	Gundam W	Collection	Finished
10000714	Animation	Gundam X	Collection	Finished
10000715	Animation	Gundam G	Collection	Finished
10000716	Animation	Gundam Seed	Collection	Finished
10000630	Animation	ToHeart2	Collection	Complete
10000717	Animation	Gundam 0079	Collection	Finished
10000718	Animation	Gundam Unicon	Collection	Finished
10000719	Animation	苍穹的法芙娜	Collection	Finished
10000720	Animation	银色的奥林西斯	Collection	Finished
10000721	Animation	英雄时代	Collection	Finished
10000722	Animation	叛逆的鲁鲁修	Collection	Finished
10000723	Animation	苍蓝钢铁的琶音	Collection	Finished
10000724	Animation	钢壳都市雷吉欧斯	Collection	Finished
10000725	Animation	战场女武神	Collection	Finished
10000726	Book	三国演义	Collection	Finished
10000727	Book	魔法学徒	Collection	Finished
10000728	Book	佣兵天下	Collection	Finished
10000729	Book	微酸学园	Collection	Finished
10000730	Book	光之子	Collection	Finished
10000731	Book	飞云星志	Collection	Finished
10000732	Book	小兵传奇	Collection	Finished
10000733	Book	星际破坏神	Collection	Finished
10000734	Book	飘渺之旅	Collection	Finished
10000735	Book	诛仙	Collection	Finished
10000736	Book	尘缘	Collection	Finished
10000737	Book	汉末卫公子	Collection	Finished
10000738	Book	锦衣夜行	Collection	Finished
10000739	Book	霸宋西门庆	Collection	Finished
10000741	Book	农夫三国	Collection	Finished
10000742	Book	多情剑客无情剑	Collection	Finished
10000743	Book	绝代双骄	Collection	Finished
10000744	Book	楚留香传奇	Collection	Finished
10000745	Book	陆小凤传奇	Collection	Finished
10000746	Book	名剑风流	Collection	Finished
10000747	Book	天龙八部	Collection	Finished
10000748	Book	连城诀	Collection	Finished
10000749	Book	射雕英雄传	Collection	Finished
10000750	Book	鹿鼎记	Collection	Finished
10000751	Book	笑傲江湖	Collection	Finished
10000752	Book	神雕侠侣	Collection	Finished
10000753	Book	侠客行	Collection	Finished
10000754	Book	倚天屠龙记	Collection	Finished
10000755	Book	四大名捕	Collection	Finished
10000756	Book	大唐双龙传	Collection	Finished
10000757	Book	寻秦记	Collection	Finished
10000758	Book	空速星痕	Collection	Finished
10000759	Book	天魔神谭	Collection	Finished
10000760	Book	斗徒	Collection	Finished
10000761	Book	斗破苍穹	Collection	Finished
10000762	Book	贼之法师	Collection	Finished
10000763	Book	永夜君王	Collection	Finished
10000001	Note	Diary	Diary	Finished
10000767	Movie	我爱男保姆	Collection	GiveUp
10000779	Communicate	大舅	Person	Finished
10000119	Account	亚马逊测评		Finished
10000769	Animation	7月新番	Event	GiveUp
10000764	Leisure	下棋	Event	Finished
10000770	Account	特別定額給付金申請	Event	Finished
10000785	Account	尿道结石	Event	Finished
10000766	Neso	EB債クーポン計算	Achievement	Finished
10000768	Project	PHP	Achievement	GiveUp
10000800	Account	代购	Event	GiveUp
10000786	Exercise	Anytime Fitness	Achievement	Finished
10000862	Live	甜玉米	Event	Finished
10000816	Game	大航海时代4	Collection	Finished
10000034	Live	刷牙	Event	Finished
10000838	Exercise	す振り	Event	Finished
10000110	Live	剪头发	Event	Finished
10000415	Live	吃零食	Event	Finished
10000436	Live	感冒	Event	Finished
10000058	Live	搬家后熟悉环境	Event	Finished
10000420	Live	无聊	Event	Finished
10000035	Live	洗澡	Event	Regular
10000252	Live	皮肤病	Event	Finished
10000014	Live	睡眠	Event	Regular
10000248	Live	肚子痛	Event	Finished
10000291	Live	补衣服	Event	Completed
10000327	Live	购物	Event	Finished
10000122	Account	Hard Disk	Event	Finished
10000309	Account	NordVPN	Event	Finished
10000298	Account	OCN电话名义更改	Event	Finished
10000201	Account	Other	Event	Finished
10000203	Account	SoftBank契约	Event	Finished
10000269	Account	SoftBank解约	Event	Finished
10000064	Account	app排行-七麦数据	Event	Finished
10000043	Account	other	Event	Finished
10000272	Account	vpn	Event	Finished
10000151	Account	丢东西找东西	Event	Finished
10000112	Account	丢钥匙	Event	Finished
10000296	Account	买电脑	Event	Finished
10000256	Account	买衣服鞋子	Event	Finished
10000275	Account	二手货软件	Event	Finished
10000100	Account	亚马逊快递	Event	Finished
10000396	Account	体检	Event	Finished
10000476	Account	信用卡还款	Event	Finished
10000098	Account	入台手续	Event	Finished
10000046	Account	办签证	Event	Finished
10000321	Animation	Fate：绝对魔兽战线	Collection	GiveUp
10000571	Game	刺客信条	Collection	GiveUp
10000539	Game	宙斯	Collection	Finished
10000179	Game	英雄联盟——视频	Event	Finished
10000491	Movie	Harry Potter	Collection	Finished
10000772	Movie	只要平凡	Collection	Finished
10000331	Language	英语故事	Event	Finished
10000523	Erotism	EroGame	Event	Finished
10000470	Erotism	NiceMoe	Event	Finished
10000473	Social	新型冠状病毒	Achievement	Finished
10000559	Language	英语网课	Event	Finished
10000350	Fantasy	Fantasy随想	Event	Finished
10000439	Account	加湿器	Event	Finished
10000149	Account	取快递	Event	Finished
10000382	Account	定期券变更申请	Event	Finished
10000573	Account	定期券退款	Event	Finished
10000465	Account	强力胶	Event	Finished
10000455	Account	手机国际漫游	Event	Finished
10000236	Account	打钱回国	Event	Finished
10000187	Account	拿钥匙	Event	Finished
10000222	Account	挤电车	Event	Finished
10000257	Account	换钱	Event	Finished
10000389	Account	收别人的包裹	Event	Finished
10000318	Account	治疗皮肤痒	Event	Finished
10000273	Account	浪费时间	Event	Finished
10000249	Account	玩手机	Event	Finished
10000247	Account	电脑送修	Event	Finished
10000268	Account	电话卡取消	Event	Finished
10000041	Account	租房	Event	Finished
10000088	Account	签证	Event	Finished
10000200	Account	缴费	Event	Completed
10000099	Account	缴费-房租，医保	Event	Finished
10000061	Account	美国AppleId	Event	Finished
10000237	Account	考虑买苹果电脑	Event	Finished
10000319	Account	自行车打气	Event	Finished
10000432	Account	苹果电脑	Event	Finished
10000199	Account	补鞋、处理硬币	Event	Completed
10000502	Account	装电脑	Event	Finished
10000258	Account	购买Mac	Event	Finished
10000086	Account	购物	Event	Finished
10000572	Account	车票	Event	Finished
10000297	Account	邮局换钱	Event	Finished
10000137	Account	配钥匙	Event	Finished
10000162	Communicate	Communication	Event	Finished
10000370	Communicate	KTV	Event	Finished
10000026	Communicate	communication	Event	Finished
10000221	Communicate	刘洋来日旅游	Event	Finished
10000121	Communicate	卡拉OK.Karaoke	Event	Completed
10000419	Communicate	卢俊希	Person	Finished
10000271	Communicate	同学	Event	Finished
10000431	Communicate	吕叔叔	Person	Finished
10000430	Communicate	吕茹紫嫣	Person	Finished
10000392	Communicate	婆婆去世	Event	Finished
10000383	Live	日常	Event	Finished
10000808	TSSummit	刘丹奇	Person	Finished
10000410	Communicate	小倉さん	Person	Finished
10000407	Communicate	尾山たけし	Person	Finished
10000056	Communicate	平板锅阳台烤肉	Event	Finished
10000264	Animation	动漫音乐	Event	Finished
10000538	Animation	柯南剧场版	Collection	Finished
10000346	Animation	武装炼金	Collection	GiveUp
10000339	Animation	氷菓	Collection	Completed
10000548	Animation	灌篮高手	Collection	Finished
10000307	Animation	爱书的下克上：为了成为图书管理员不择手段！	Collection	Finished
10000492	Animation	番剧介绍	Event	Finished
10000398	Animation	皇帝圣印战记	Collection	Finished
10000305	Animation	碧蓝航线	Collection	GiveUp
10000578	Animation	终结的炽天使	Collection	Completed
10000437	Animation	虫师	Collection	Finished
10000304	Animation	超人高中生们即使在异世界也能从容生存！	Collection	Finished
10000556	Animation	路人女主	Collection	Finished
10000499	Animation	转生乙女破灭flag	Collection	Finished
10000306	Animation	这个勇者明明超强却过分谨慎	Collection	Finished
10000334	Animation	重装武器	Collection	Completed
10000341	Animation	钢之炼金术师	Collection	Completed
10000388	Animation	钢琴-动漫主题曲	Event	Finished
10000448	Animation	问题儿童来自异世界	Collection	Completed
10000332	Animation	食戟之灵	Collection	Finished
10000543	Animation	驱魔少年	Collection	Finished
10000263	Animation	高达seed	Collection	Finished
10000348	Animation	魂链	Collection	Finished
10000359	Animation	魔弹之王与战姬	Collection	Completed
10000765	Animation	死神	Collection	Finished
10000344	Animation	黑之契约者	Collection	Completed
10000553	Animation	黑子的篮球	Collection	Finished
10000131	Game	黑暗之魂3.DarkSoulsIII	Collection	Finished
10000116	Movie	楚门的世界.The.Truman.Show	Collection	Finished
10000069	Movie	海底总动员	Collection	Finished
10000536	Movie	爱情保卫战	Collection	GiveUp
10000541	Movie	牧马城市	Collection	Finished
10000123	Movie	王者少年.The.Kid.Who.Would.Be.King	Collection	GiveUp
10000108	Movie	盗梦空间	Collection	Finished
10000534	Movie	红歌	Event	Finished
10000115	Movie	终结者	Collection	Finished
10000113	Movie	绝命毒师	Collection	Finished
10000106	Movie	老友记	Collection	Finished
10000128	Movie	这个杀手不太冷.Leon.The.Professional	Collection	Finished
10000066	Movie	金刚	Collection	Finished
10000524	Movie	非正式会议	Collection	Finished
10000520	Movie	饥饿站台	Collection	Finished
10000070	Movie	黑客帝国	Collection	Finished
10000262	Erotism	喵绅士	Event	Finished
10000412	Erotism	異世界でハレム	Event	Finished
10000474	Leisure	不知道玩什么	Event	Finished
10000501	Leisure	小知识	Event	Finished
10000482	TSSummit	板仓新	Person	Finished
10000468	TSSummit	為替取引補完対応	Achievement	Finished
10000402	TSSummit	账票更新Fba工具开发	Achievement	Finished
10000441	Neso	CreateAccount.exe	Event	Finished
10000451	Neso	DXOClient	Achievement	Finished
10000514	Movie	音乐	Event	Finished
10000581	Account	手机音乐	Event	Finished
10000428	Account	助学贷款	Event	GiveUp
10000479	Neso	DXOClient编程	Event	Finished
10000385	Neso	neso忘年会	Achievement	Finished
10000483	Neso	周san	Person	Finished
10000464	Neso	张py	Person	Finished
10000478	Neso	田云峰	Person	Finished
10000544	Social	黑人抗议	Achievement	Finished
10000059	Note	三年总结	Event	Finished
10000216	Note	修理硬盘	Event	Finished
10000150	Note	台湾旅游	Achievement	Finished
10000152	Note	台湾网吧	Event	Finished
10000193	Note	坐飞机回东京	Event	Finished
10000227	Note	找文库	Event	Finished
10000244	Note	整理download	Event	Finished
10000081	Note	旅行-看海	Achievement	Finished
10000097	Note	野外炊事	Achievement	Finished
10000163	Discipline	Discipline	Event	Finished
10000017	Discipline	discipline	Event	Finished
10000033	Discipline	ユース会	Achievement	Finished
10000148	Discipline	座談会	Achievement	Finished
10000147	Discipline	早起会原稿	Achievement	Finished
10000091	Discipline	练成会	Achievement	Finished
10000192	Discipline	课题原稿	Achievement	Finished
10000096	Discipline	錬成	Achievement	Finished
10000158	Discipline	青年部	Event	Finished
10000118	Exercise	Diet Belt	Event	Finished
10000171	Exercise	Exercise	Event	Finished
10000044	Exercise	exercise	Event	Finished
10000220	Exercise	爬富士山	Achievement	Finished
10000101	Exercise	瘦身腰带	Achievement	Finished
10000207	Exercise	负重步行	Achievement	Finished
10000226	Exercise	跑步	Achievement	Finished
10000235	Exercise	跑步—>走路	Event	Finished
10000780	TSSummit	有津　拓	Person	Finished
10000788	Account	生日	Event	Finished
10000809	Game	拳皇97	Collection	Finished
10000831	Animation	吴冠宇	Person	Finished
10000845	Animation	星掠者	Collection	GiveUp
10000801	TSSummit	Lib管	Event	Finished
10000143	Discipline	Harvard Open Course : Positive Psychology	Achievement	Finished
10000075	Book	埃尔梅罗二世事件簿	Collection	Finished
10000871	Animation	异世界狂想曲	Collection	Finished
10000876	Animation	政宗	Collection	Complete
10000855	TSSummit	NSR内存调查	Event	Finished
10000892	TSSummit	Security教育	Event	Finished
10000896	TSSummit	曹瑞	Person	Finished
10000901	Communicate	五十嵐 克成	Person	Finished
10000900	Communicate	石松 俊文	Person	Finished
10000899	Communicate	陳 陽	Person	Finished
10000902	Communicate	日向 尋久	Person	Finished
10000906	Animation	初音岛2	Collection	Finished
10000910	Animation	玉子市场	Collection	Finished
10000911	Animation	秒速5厘米	Collection	Complete
10000912	Animation	白色相簿2	Collection	Complete
10000438	Animation	夏目友人帐	Collection	Complete
10000913	TSSummit	LineCounter.ps1	Achievement	GiveUp
10000914	Animation	银河冒险战记	Collection	Finished
10000915	Animation	骑士&魔法	Collection	Finished
10000819	Animation	半妖的夜叉姬	Collection	GiveUp
10000919	Animation	ShadowVerse	Collection	Finished
10000920	Live	すき家	Event	Finished
10000922	Animation	BiliBili	Event	Finished
10000020	Discipline	早起会-Line	Event	Finished
10000898	TSSummit	小林 正明	Person	Finished
10000895	Animation	中二病でも恋がしたい！	Collection	Finished
10000846	Animation	彼得·格里尔的贤者时间	Collection	GiveUp
10000905	Animation	銃皇無尽のファフニール	Collection	GiveUp
10000194	Book	民国投机者	Collection	Complete
10000893	Book	真の仲間じゃないと勇者のパーティーを追い出された	Collection	Finished
10000457	Game	炎龙骑士团2	Collection	Finished
10000077	Game	英雄联盟	Collection	Finished
10000404	Game	英雄联盟-大哥	Event	Finished
10000787	Game	金庸群侠传	Collection	GiveUp
10000891	Movie	百度视频-小动物系列	Event	Finished
10000924	Exercise	山登り-高野山	Event	Finished
10000925	Exercise	温泉	Event	Finished
10000894	TSSummit	Surface SysErr	Event	Finished
10000815	TSSummit	时价导入Ph3	Event	Finished
10000794	TSSummit	時価取込対応	Event	Finished
10000908	Language	韩语-令和讲座	Event	GiveUp
10000926	TSSummit	王亮	Person	Finished
10000931	Live	クレープ	Event	Finished
10000932	Live	汉堡	Event	Finished
10000933	Account	赡养费	Event	Finished
10000929	Animation	ダンジョンに出会いを求めるのは間違っているだろうか	Collection	Finished
10000940	Account	印章	Event	Finished
10000941	Animation	エロマンガ先生	Collection	Finished
10000942	Project	Aliyun账号转移	Event	Finished
10000939	Book	町人Aは悪役令嬢をどうしても救いたい	Collection	GiveUp
10000944	Animation	今日の５の２	Collection	Finished
10000461	Exercise	杨罡	Person	Finished
10000946	Exercise	鍋割山	Achievement	Finished
10000947	Animation	異能バトルは日常系のなかで	Collection	Finished
10000918	Erotism	その古城に勇者砲あり！	Event	Finished
10000949	Game	金山游戏	Collection	Finished
10000540	Animation	某魔法的禁书目录	Collection	Finished
10000850	Animation	樱花庄的宠物女孩	Collection	Finished
10000909	Live	火锅面	Event	Finished
10000840	Animation	長門有希ちゃんの消失	Collection	Finished
10000916	Book	修真聊天群	Collection	Finished
10000803	Book	关于邻家的天使大人	Collection	Finished
10000863	Live	せい家	Event	Finished
10000945	Animation	はたらく魔王さま！	Collection	Finished
10000952	Animation	刀剑神域	Collection	Finished
10000953	Animation	棺姫のチャイカ	Collection	Finished
10000956	Animation	守护甜心	Collection	GiveUp
10000960	Animation	蜂蜜与四叶草	Collection	Complete
10000951	Live	划伤脚	Event	Finished
10000798	Movie	百度视频	Event	Finished
10000784	TSSummit	NSReporter本体	Achievement	Finished
10000957	Animation	蒼の彼方のフォーリズム	Collection	Finished
10000959	Animation	七星のスバル	Collection	GiveUp
10000938	TSSummit	DataModel	Event	GiveUp
10000907	TSSummit	LIBOR廃止	Event	Finished
10000867	TSSummit	cNS_IF_OracleEBS_TRN.exe	Achievement	Finished
10000954	Live	水饺	Event	Finished
10000936	Communicate	老照片	Collection	Finished
10000904	Animation	うちの娘の為ならば	Collection	GiveUp
10000884	Animation	異世界チート魔術師	Collection	GiveUp
10000958	Game	CheatingEngine	Collection	Finished
10000930	TSSummit	DBUpgrade	Event	Finished
10000937	Live	时间浪费	Event	Finished
10000962	TSSummit	NSML	Achievement	Finished
10000921	Neso	Zoom讨论会	Event	Finished
10000963	Live	ファミレス‐サイゼリヤ	Event	Finished
10000950	Live	中华料理-和唐	Event	Finished
10000943	Book	ループ7回目の悪役令嬢	Collection	Finished
10000903	Book	小説家になろう	Event	Finished
10000889	TSSummit	VersionUp	Event	Finished
10000897	TSSummit	李勝鵬	Person	Finished
10000935	TSSummit	赖兴涛	Person	Finished
10000961	Animation	エスカ&ロジーのアトリエ	Collection	GiveUp
10000843	Animation	キミと僕の最後の戦場、あるいは世界が始まる聖戦	Collection	GiveUp
10000837	Animation	五等分の花嫁	Collection	GiveUp
10000823	Animation	俺だけ入れる隠しダンジョン	Collection	Finished
10000817	Animation	好比是最终迷宫前的少年到新手村生活一般的故事	Collection	Finished
10000818	Animation	弱势角色友崎君	Collection	Finished
10000839	Animation	彼女、お借りします	Collection	Finished
10000342	Animation	灼眼的夏娜	Collection	Complete
10000955	Animation	神之塔	Collection	Finished
10000928	Animation	魔法使いの嫁	Collection	Finished
10000806	Book	FairyTale	Collection	Finished
10000557	Book	我能看见状态栏	Collection	GiveUp
10000934	Book	某魔法的禁书目录	Collection	GiveUp
10000917	Book	神秘让我强大	Collection	GiveUp
10000565	Erotism	AV	Event	Finished
10000471	Erotism	EroHonn	Event	Finished
10000964	Animation	無彩限のファントム・ワールド	Collection	Finished
10000965	Animation	罗德岛战记	Collection	GiveUp
10000673	Animation	无头骑士异闻录	Collection	Finished
10000966	Animation	魔法少女伊莉雅	Collection	Finished
10000969	Animation	天使の3P！	Collection	Finished
10000970	Animation	灰与幻想的格林姆迦尔	Collection	Finished
10000972	Erotism	LastIsland	Event	GiveUp
10000973	Live	ファミレス‐ガスト	Event	Finished
10000083	Live	洗衣服	Event	Finished
10000967	Animation	クオリディア・コード	Collection	Finished
10000974	TSSummit	MarketData_Update.xlsm	Event	Finished
10000286	Project	note	Achievement	OnProcess
10000927	Neso	陈阳	Person	Finished
10000976	Exercise	横滨cosmo_world	Event	Finished
10000977	Note	拉面博物馆	Event	Finished
10000979	Erotism	金麟岂是池中物	Event	Finished
10000980	Note	人生	Event	Finished
10000975	Animation	異世界魔王と召喚少女の奴隷魔術	Collection	Finished
10000981	Animation	轻音少女	Collection	Finished
10000971	Book	灰与幻想的格林姆迦尔	Collection	Finished
10000982	TSSummit	石松俊文	Person	Finished
10000983	Live	汤圆	Event	Finished
10000821	Animation	转生成蜘蛛又怎样！	Collection	Finished
10000984	Neso	徐超	Person	Finished
10000985	Animation	星舰领航员	Collection	Finished
10000986	Animation	あかね色に染まる坂	Collection	Finished
10000987	Erotism	Useful_Website_100	Event	Finished
10000988	Note	US_Websites	Event	Finished
10000989	TSSummit	Oracle_TableSpace	Event	Finished
10000990	TSSummit	高水駿典	Person	Finished
10000019	Note	note	Achievement	Finished
10000991	Fantasy	幻想：魔幻战斗考试	Event	Finished
10000992	Live	烧烤	Event	Finished
10000993	Fantasy	幻想：领主纪事之新世界探索	Event	Finished
10000978	TSSummit	STD_Migration	Event	Finished
10000374	TSSummit	上班耗时间	Event	Finished
10000481	TSSummit	会议，勤务	Achievement	Finished
10000384	TSSummit	悬案调查	Achievement	Finished
10000505	Leisure	时间丢失	Event	Finished
10000994	Fantasy	幻想：平民女孩挣嫁妆	Event	Finished
10000995	Animation	あっちこっち	Collection	Finished
10000996	Animation	あの日見た花の名前を僕達はまだ知らない。	Collection	Finished
10001002	Communicate	陆爷	Person	Complete
10001006	Communicate	沈兵	Person	Finished
10001009	Communicate	沈小蝶	Person	Finished
10001004	Communicate	沈文	Person	Finished
10001007	Communicate	沈浩	Person	Finished
10001003	Communicate	沈爷	Person	Finished
10001008	Communicate	沈立	Person	Finished
10001005	Communicate	沈静	Person	Finished
10001000	Communicate	聂哥	Person	Finished
10001001	Communicate	聂梦秋	Person	Finished
10001010	Communicate	谢光华	Person	Finished
10001011	Communicate	谢川	Person	Finished
10000998	Communicate	邓清丽	Person	Finished
10000999	Communicate	陆川	Person	Finished
10001012	Communicate	大舅娘	Person	Finished
10001013	Communicate	幺舅娘	Person	Finished
10001014	Communicate	谢四孃	Person	Complete
10001015	Communicate	杨爷	Person	Finished
10001016	Communicate	四孃女儿	Person	Finished
10001017	Communicate	谢八孃	Person	Finished
10001018	Communicate	李红姐	Person	Finished
10001019	Communicate	李红姐丈夫	Person	Finished
10001020	Communicate	李红姐弟弟	Person	Finished
10001021	Communicate	三姨婆	Person	Finished
10001022	Communicate	谢光英	Person	Finished
10001023	Communicate	杨启航	Person	Finished
10001024	Communicate	杨哥	Person	Finished
10001025	Communicate	蒋禄申	Person	Finished
10001027	Account	警察署取件	Event	GiveUp
10001028	Animation	罗小黑战记	Collection	Finished
10000997	Discipline	闭眼走路	Event	Finished
10001033	Communicate	蒋叔叔	Person	Finished
10001034	Communicate	谭骊咧	Person	Finished
10001035	Communicate	大婆婆	Person	Finished
10001036	Communicate	大公家大大	Person	Finished
10001037	Communicate	大五爷	Person	Finished
10001038	Communicate	肖阳	Person	Finished
10001039	Communicate	大幺幺	Person	Finished
10001040	Communicate	幺娘	Person	Finished
10001041	Communicate	肖川	Person	Finished
10001042	Communicate	三公	Person	Finished
10001043	Communicate	三婆	Person	Finished
10001044	Communicate	肖雨	Person	Finished
10001045	Communicate	五公	Person	Finished
10001046	Communicate	五婆	Person	Finished
10001048	Communicate	保保丈夫	Person	Finished
10001049	Communicate	萧晗	Person	Finished
10001050	Communicate	大二爷	Person	Finished
10001047	Communicate	保保	Person	Finished
10001051	Communicate	幺公	Person	Finished
10001052	Communicate	幺婆	Person	Finished
10001053	Communicate	琴孃	Person	Finished
10001054	Communicate	琴孃丈夫	Person	Finished
10001055	Communicate	小二爷	Person	Finished
10001056	Communicate	三哥妻子	Person	Finished
10001059	Animation	口水三国	Collection	Finished
10001057	Communicate	肖劲余	Person	Finished
10001061	Communicate	肖颖丈夫	Person	Finished
10001062	Communicate	李梦都	Person	Finished
10001063	Communicate	刘航	Person	Finished
10001064	Communicate	曹华（不确定）	Person	Finished
10001065	Communicate	吕政法	Person	Finished
10001066	Communicate	杨颺	Person	Finished
10001067	Communicate	苏扬	Person	Finished
10001068	Communicate	陈怡然	Person	Finished
10001069	Communicate	燕翔羽	Person	Finished
10001070	Communicate	金建华	Person	Finished
10001071	Communicate	石秋月	Person	Finished
10001030	Note	那兔	Collection	Finished
10001032	Animation	吞噬星空	Collection	Finished
10001026	Live	中华料理-楼兰	Event	Finished
10000401	TSSummit	段波	Person	OnProcess
10001060	Communicate	双胞胎哥哥	Person	Finished
10000968	TSSummit	VUP_Compile	Event	Finished
10000175	Game	魔兽争霸3	Collection	OnProcess
10001029	TSSummit	Migration手順書	Event	Current
10001072	Communicate	石佑迁	Person	Finished
10001073	Communicate	杨开星	Person	Finished
10001074	Communicate	张海燕	Person	Finished
10001076	Communicate	李光灿	Person	Finished
10001077	Communicate	刘洋洋	Person	Finished
10001078	Communicate	刘学竹	Person	Finished
10001079	Communicate	罗星星	Person	Finished
10001080	Communicate	朱师佳	Person	Finished
10001081	Communicate	彭晟	Person	Finished
10001082	Communicate	苏愉婷	Person	Finished
10001083	Communicate	刘鸣峰	Person	Finished
10001084	Communicate	田甜	Person	Finished
10001085	Communicate	陈清	Person	Finished
10001086	Communicate	周游	Person	Finished
10001087	Communicate	谭甲莲	Person	Finished
10001088	Communicate	蔡曌宇	Person	Finished
10001089	Communicate	罗家明	Person	Finished
10001090	Communicate	蒋崇碧	Person	Finished
10001091	Communicate	李界	Person	Finished
10001092	Erotism	Toraburu_3D	Event	Finished
10001075	Communicate	万薇	Person	Finished
10001031	Animation	四海鲸骑	Event	Finished
10001058	Book	我的贴身校花	Collection	GiveUp
10001093	Book	万族之劫	Collection	Finished
10001097	TSSummit	週次定例会	Event	Finished
10001098	Account	整理搬家行李	Event	Finished
10001100	Account	退房手续	Event	Finished
10001096	Movie	雪山凶灵	Event	Finished
10001102	Communicate	杨罡	Person	Finished
10001103	Live	炸鸡翅	Event	Finished
10001104	Live	野菜橙汁	Event	Finished
10001099	Account	租房合同	Event	Finished
10001105	Fantasy	梦记录	Achievement	Finished
10001106	Live	らめん	Event	Finished
10001094	Book	魔临	Collection	Finished
10001108	Communicate	杨阳	Person	Finished
10001109	Communicate	秦川	Person	Finished
10001110	Communicate	师父-石	Person	Finished
10001111	Communicate	师娘	Person	Finished
10001112	Communicate	师兄-杨	Person	Finished
10001113	Communicate	师姐-陈	Person	Finished
10001114	Movie	百度新闻	Event	Finished
10001116	TSSummit	山本大寛	Person	Finished
10001117	TSSummit	河村高道	Person	Finished
10001118	TSSummit	大八木隆平	Person	Finished
10000160	Live	吃饭	Event	Regular
10000948	Book	我的治愈系游戏	Collection	Finished
10001101	Book	大唐捉妖师	Collection	Finished
10001119	Animation	我家大师兄脑子有坑	Collection	Finished
10001120	Animation	山河剑心	Collection	GiveUp
10001121	Game	百度-星际争霸	Event	Finished
10000665	Animation	魔法少女奈叶	Collection	Finished
10000888	Game	百度-魔兽争霸3	Event	Finished
10000287	Communicate	大哥	Person	OnProcess
10001128	Game	数读	Event	Finished
10001129	Account	QQ账号密保手机	Event	Finished
10001130	Communicate	俞文洋	Person	Finished
10001131	Communicate	胡雅博	Person	Finished
10001132	Communicate	吴宇佳	Person	Finished
10001133	Communicate	双胞胎弟弟	Person	Finished
10001134	Communicate	吕小川	Person	Finished
10001135	Book	翻小说	Event	Finished
10001107	TSSummit	VUP_Migration_UT式样书	Event	Finished
10001123	TSSummit	EUC障害調査＿0510残高なし	Event	Finished
10001138	Live	梅酒	Event	Finished
10001124	TSSummit	NSML_src_mng	Event	Finished
10001141	TSSummit	RoleAdmin権限問題の確認	Event	Finished
10001095	TSSummit	BoAction悬案	Event	Finished
10001156	TSSummit	SDL单体	Event	Finished
10001126	TSSummit	SSIUpdate调查	Event	Finished
10001137	TSSummit	DBImport_Tablespace不足	Event	Finished
10001142	TSSummit	VUP_WBS	Event	Finished
10001143	TSSummit	日向 尋久	Person	Finished
10001144	Account	搬家	Event	OnProcess
10001136	TSSummit	Migration_V6.2.14.0	Event	Finished
10001146	Social	袁隆平	Person	Finished
10001148	TSSummit	STD单体测试	Event	OnProcess
10001151	TSSummit	月末勤务表	Event	Finished
10001152	TSSummit	clientapi_debug	Event	Finished
10001153	TSSummit	cAcct_LoadLibrary	Event	Current
10001149	Fantasy	风之骑士	Event	Finished
10001155	Erotism	もっと！孕ませ！炎のおっぱい異世界エロ魔法学園	Event	Finished
10001157	TSSummit	Summit修改环境变量后启动失败	Event	Current
10001158	TSSummit	小林正明	Event	Finished
10001154	Fantasy	勇者传说	Achievement	OnProcess
10001125	TSSummit	cDocExplode実行方法調査	Event	Finished
10001127	TSSummit	REPO、CSD画面Design修正	Event	Current
10001162	TSSummit	账票出力问题	Event	OnProcess
10001164	Account	水电气解约	Event	Finished
10001166	Movie	猫和老鼠	Collection	Finished
10001163	Erotism	异世界酒馆	Event	Finished
10001168	Fantasy	幻想	Achievement	OnProcess
10001161	TSSummit	DBK文件夹src确认更新	Event	Finished
10001172	Social	百度-历史	Event	OnProcess
10001173	Erotism	TreasureChestCorps	Event	Finished
10001174	Erotism	konorori	Event	Finished
10001175	Fantasy	宇宙音符	Achievement	Finished
10001176	Fantasy	魔法旋律	Achievement	OnProcess
10001177	Fantasy	圣杯——暗与影的徘徊	Achievement	Finished
10001179	Erotism	salve_project	Event	Finished
10001180	Erotism	クリクリバトル with Mちゃん	Event	Finished
10001122	Book	我真的长生不老	Collection	GiveUp
10001167	Animation	龍ヶ嬢七々々の埋蔵金	Collection	GiveUp
10001139	TSSummit	画面SpreadSheet问题	Event	Finished
10001181	TSSummit	Mattermost更新	Event	Finished
10001182	TSSummit	VPN切换	Event	Finished
10001183	TSSummit	V6.2.14.0编译	Event	Current
10001145	TSSummit	V6.2.14.0_STD调查	Event	Finished
10001159	TSSummit	搭建NSML环境2个	Event	Finished
10001115	TSSummit	cCcyBasis_Calc_Utl.exe	Event	Finished
10001147	TSSummit	NSML本番成果物	Event	Finished
10001150	TSSummit	V6.2_Acct_Debug	Event	Finished
10001165	Account	softbank解約	Event	Finished
10000265	Fantasy	旅者之歌	Achievement	Finished
10001169	Fantasy	旅者之歌前传：冥月之心	Achievement	Finished
10000042	Animation	海贼王	Collection	Finished
10001140	TSSummit	sRptBase_初期化失败	Event	Current
10001160	TSSummit	2810_CLSNetting画面	Event	Current
10001184	TSSummit	SWLコンパイルエラー	Event	Finished
10001185	TSSummit	BondDefinition画面	Event	Finished
10001186	TSSummit	GenericReport文件传送	Event	OnProcess
10001187	Neso	李鑫	Event	OnProcess
10001189	TSSummit	SSI画面Design	Event	OnProcess
10001171	Fantasy	旅者之歌战记：圣战诗篇	Achievement	Finished
10001170	Fantasy	旅者之歌后记：双龙之戒	Achievement	Finished
10001178	Fantasy	圣杯——纷乱的旋律	Achievement	Finished
10001190	TSSummit	Back画面修改	Event	Finished
10001191	TSSummit	NMSL_GNMPROD	Event	Finished
10001192	TSSummit	LIBOR_数据ini	Event	OnProcess
10001188	TSSummit	NSML_STAG01_V60	Event	Finished
10000923	Book	恶魔奶爸	Collection	Finished
10001193	Account	大師	Event	OnProcess
10000211	Book	醉枕江山	Collection	Finished
\.


--
-- Data for Name: event_item; Type: TABLE DATA; Schema: public; Owner: xiao
--

COPY public.event_item (id, date, memo, "time", parent_id) FROM stdin;
11000001	2019-09-18		0.029999999999999999	10000001
11000002	2019-09-16		0.02	10000001
11000003	2019-09-14		0.01	10000001
11000004	2019-09-13		0.040000000000000001	10000001
11000005	2019-09-12		0.02	10000001
11000006	2019-08-13		0	10000001
11000007	2019-08-12		0	10000001
11000008	2019-08-10		0	10000001
11000009	2019-08-06		0.01	10000001
11000010	2019-08-04		0.029999999999999999	10000001
11000011	2019-07-13		0.029999999999999999	10000001
11000012	2019-07-09		0.040000000000000001	10000001
11000013	2019-07-08		0.050000000000000003	10000001
11000014	2019-07-07		0.02	10000001
11000015	2019-07-05		0.10000000000000001	10000001
11000016	2019-07-04		0.070000000000000007	10000001
11000017	2019-07-03		0.13	10000001
11000018	2019-07-01		0.070000000000000007	10000001
11000019	2019-06-30		0.10000000000000001	10000001
11000020	2019-06-29		0.040000000000000001	10000001
11000021	2019-06-28		0.02	10000001
11000022	2019-06-27		0.12	10000001
11000023	2019-06-26		0.11	10000001
11000024	2019-06-25		0.10000000000000001	10000001
11000025	2019-06-24		0.17000000000000001	10000001
11000026	2019-06-23		0.070000000000000007	10000001
11000027	2019-06-22		0.050000000000000003	10000001
11000028	2019-06-21		0.14999999999999999	10000001
11000029	2019-06-20		0.11	10000001
11000030	2019-06-19		0.10000000000000001	10000001
11000031	2019-06-18		0.58999999999999997	10000001
11000032	2019-06-17		0.19	10000001
11000033	2019-06-16		1.01	10000001
11000034	2019-06-15		0.040000000000000001	10000001
11000035	2019-06-14		0.01	10000001
11000036	2019-06-12		0.17000000000000001	10000001
11000037	2019-06-11		0.02	10000001
11000038	2019-06-10		0.02	10000001
11000039	2019-06-09		0.02	10000001
11000040	2019-06-08		0.02	10000001
11000041	2019-06-07		0.02	10000001
11000042	2019-06-06		0.080000000000000002	10000001
11000043	2019-06-05		0.02	10000001
11000044	2019-06-04		0.01	10000001
11000045	2019-06-03		0	10000001
11000046	2019-06-02		0.029999999999999999	10000001
11000047	2019-06-01		0.029999999999999999	10000001
11000048	2019-05-31		0.01	10000001
11000049	2019-05-30		0	10000001
11000050	2019-05-29		0	10000001
11000051	2019-05-28		0.02	10000001
11000052	2019-05-27		0.22	10000001
11000053	2019-05-26		0.02	10000001
11000054	2019-05-25		0.029999999999999999	10000001
11000055	2019-05-23		0.01	10000001
11000056	2019-05-22		0.01	10000001
11000057	2019-05-21		0.040000000000000001	10000001
11000058	2019-05-20		0.10000000000000001	10000001
11000059	2019-05-19		0.01	10000001
11000060	2019-05-18		0	10000001
11000061	2019-05-17		0.01	10000001
11000062	2019-05-15		0.02	10000001
11000063	2019-05-14		0.02	10000001
11000064	2019-05-13		0.01	10000001
11000065	2019-05-12		0.01	10000001
11000066	2019-05-11		0.01	10000001
11000067	2019-05-10		0.01	10000001
11000068	2019-05-09		0	10000001
11000069	2019-05-08		0.01	10000001
11000070	2019-05-07		0.059999999999999998	10000001
11000071	2019-05-06		0.01	10000001
11000072	2019-05-05		0.01	10000001
11000073	2019-05-04		0.01	10000001
11000074	2019-05-03		0.02	10000001
11000075	2019-05-02		0.01	10000001
11000076	2019-05-01		0.01	10000001
11000077	2019-04-30		0.01	10000001
11000078	2019-04-29		0.02	10000001
11000079	2019-04-28		0.029999999999999999	10000001
11000080	2019-04-27		0.17999999999999999	10000001
11000081	2019-04-26		0.02	10000001
11000082	2019-04-25		0.01	10000001
11000083	2019-04-24		0.01	10000001
11000084	2019-04-23		0.059999999999999998	10000001
11000085	2019-04-22		0.13	10000001
11000086	2019-04-21		0.34000000000000002	10000001
11000087	2019-04-20		0.01	10000001
11000088	2019-04-19		0	10000001
11000089	2019-04-18		0.070000000000000007	10000001
11000090	2019-04-17		0.01	10000001
11000091	2019-04-16		0	10000001
11000092	2019-04-15		0.029999999999999999	10000001
11000093	2019-04-14		0.29999999999999999	10000001
11000094	2019-04-13		0.19	10000001
11000095	2019-04-12		0.01	10000001
11000096	2019-04-11		0.01	10000001
11000097	2019-04-10		0.23000000000000001	10000001
11000098	2019-04-09		0.01	10000001
11000099	2019-04-08		0.050000000000000003	10000001
11000100	2019-04-07		0.19	10000001
11000101	2019-04-06		0.01	10000001
11000102	2019-04-05		0.38	10000001
11000103	2019-04-04		0.23999999999999999	10000001
11000104	2019-04-03		0.29999999999999999	10000001
11000105	2019-04-02		0.17999999999999999	10000001
11000106	2019-04-01		0.44	10000001
11000107	2019-03-31		0.20999999999999999	10000001
11000108	2019-03-30		0.20999999999999999	10000001
11000109	2019-03-29		0.10000000000000001	10000001
11000110	2019-03-28		0.029999999999999999	10000001
11000111	2019-03-27		0.35999999999999999	10000001
11000112	2019-03-26		0.01	10000001
11000113	2019-03-25		0.14999999999999999	10000001
11000114	2019-03-24		0.29999999999999999	10000001
11000115	2019-03-23		0.01	10000001
11000116	2019-03-22		0.01	10000001
11000117	2019-03-21		0.20999999999999999	10000001
11000118	2019-03-20		0.10000000000000001	10000001
11000119	2019-03-19		0.5	10000001
11000120	2019-03-18		0.40000000000000002	10000001
11000121	2019-03-14		0.19	10000001
11000122	2019-03-13		0.12	10000001
11000123	2019-03-12		0.42999999999999999	10000001
11000124	2019-03-11		0.20999999999999999	10000001
11000125	2019-03-11		0	10000002
11000126	2019-03-11		0	10000003
11000127	2019-03-12		0	10000002
11000128	2019-03-12		3	10000005
11000129	2019-03-12		0	10000004
11000130	2019-03-13		0	10000006
11000131	2019-03-13		2	10000005
11000132	2019-03-18		0	10000010
11000133	2019-03-18		0	10000009
11000134	2019-03-18		0.5	10000011
11000135	2019-03-18		4	10000018
11000136	2019-03-18		0.5	10000019
11000137	2019-03-18		5.5	10000014
11000138	2019-03-18		4	10000005
11000139	2019-03-18		1	10000013
11000140	2019-03-18		0.5	10000017
11000141	2019-03-18		0	10000007
11000142	2019-03-18		0	10000002
11000143	2019-03-18		0	10000008
11000144	2019-03-18		3	10000016
11000145	2019-03-18		2	10000015
11000146	2019-03-18		1	10000012
11000147	2019-03-19		0.5	10000019
11000148	2019-03-19		4	10000018
11000149	2019-03-19		0	10000020
11000150	2019-03-19		0.5	10000017
11000151	2019-03-19		0	10000022
11000152	2019-03-19		6.5	10000014
11000153	2019-03-19		0.5	10000011
11000154	2019-03-19		0	10000003
11000155	2019-03-19		0	10000010
11000156	2019-03-19		4	10000005
11000157	2019-03-19		0	10000007
11000158	2019-03-19		0	10000008
11000159	2019-03-19		0.5	10000016
11000160	2019-03-19		2	10000015
11000161	2019-03-19		0	10000021
11000162	2019-03-19		0	10000023
11000163	2019-03-19		0	10000009
11000164	2019-03-19		2	10000013
11000165	2019-03-19		0.5	10000012
11000166	2019-03-19		0.5	10000024
11000167	2019-03-20		0	10000008
11000168	2019-03-20		7.5	10000014
11000169	2019-03-20		0.5	10000017
11000170	2019-03-20		0	10000022
11000171	2019-03-20		0	10000021
11000172	2019-03-20		0	10000020
11000173	2019-03-20		4	10000013
11000174	2019-03-20		5	10000018
11000175	2019-03-20		0	10000023
11000176	2019-03-20		0	10000002
11000177	2019-03-20		0.5	10000024
11000178	2019-03-20		0	10000003
11000179	2019-03-20		1	10000015
11000180	2019-03-20		1.5	10000012
11000181	2019-03-20		4	10000005
11000182	2019-03-20		0	10000009
11000183	2019-03-21		0	10000008
11000184	2019-03-21		7	10000014
11000185	2019-03-21		10.5	10000013
11000186	2019-03-21		0.5	10000024
11000187	2019-03-21		1.5	10000017
11000188	2019-03-21		0	10000003
11000189	2019-03-21		2	10000015
11000190	2019-03-21		0	10000002
11000191	2019-03-21		1.5	10000005
11000192	2019-03-21		1	10000012
11000193	2019-03-22		4	10000005
11000194	2019-03-22		0	10000008
11000195	2019-03-22		6.5	10000013
11000196	2019-03-22		6	10000014
11000197	2019-03-22		0.5	10000017
11000198	2019-03-22		2	10000015
11000199	2019-03-22		0	10000002
11000200	2019-03-22		5	10000018
11000201	2019-03-22		0	10000020
11000202	2019-03-22		0	10000009
11000203	2019-03-23		6.5	10000012
11000204	2019-03-23		0	10000020
11000205	2019-03-23		1	10000026
11000206	2019-03-23		0	10000025
11000207	2019-03-23		4	10000013
11000208	2019-03-23		2	10000015
11000209	2019-03-23		0	10000008
11000210	2019-03-23		0	10000009
11000211	2019-03-23		2	10000005
11000212	2019-03-23		7	10000014
11000213	2019-03-23		0	10000002
11000214	2019-03-23		1.5	10000017
11000215	2019-03-24		0	10000010
11000216	2019-03-24		2	10000026
11000217	2019-03-24		3.5	10000013
11000218	2019-03-24		4	10000016
11000219	2019-03-24		0	10000020
11000220	2019-03-24		0	10000008
11000221	2019-03-24		0.5	10000024
11000222	2019-03-24		9	10000014
11000223	2019-03-24		0	10000009
11000224	2019-03-24		0	10000025
11000225	2019-03-24		1	10000019
11000226	2019-03-24		1	10000005
11000227	2019-03-24		1	10000015
11000228	2019-03-24		0	10000002
11000229	2019-03-24		2	10000018
11000230	2019-03-25		0	10000008
11000231	2019-03-25		0	10000023
11000232	2019-03-25		2	10000005
11000233	2019-03-25		2	10000015
11000234	2019-03-25		0	10000002
11000235	2019-03-25		0	10000003
11000236	2019-03-25		6	10000018
11000237	2019-03-25		0.5	10000017
11000238	2019-03-25		7.5	10000014
11000239	2019-03-25		0	10000027
11000240	2019-03-25		0	10000020
11000241	2019-03-25		0	10000025
11000242	2019-03-25		1	10000013
11000243	2019-03-25		0	10000009
11000244	2019-03-25		5	10000012
11000245	2019-03-26		0	10000007
11000246	2019-03-26		3	10000005
11000247	2019-03-26		0	10000008
11000248	2019-03-26		0.5	10000024
11000249	2019-03-26		0	10000002
11000250	2019-03-26		5	10000018
11000251	2019-03-26		0	10000020
11000252	2019-03-26		4	10000012
11000253	2019-03-26		0	10000003
11000254	2019-03-26		0	10000023
11000255	2019-03-26		2	10000015
11000256	2019-03-26		1	10000013
11000257	2019-03-26		0	10000025
11000258	2019-03-26		7.5	10000014
11000259	2019-03-26		0	10000029
11000260	2019-03-26		0	10000009
11000261	2019-03-26		1	10000017
11000262	2019-03-26		0	10000028
11000263	2019-03-27		5.5	10000012
11000264	2019-03-27		0	10000020
11000265	2019-03-27		6	10000017
11000266	2019-03-27		0.5	10000015
11000267	2019-03-27		1	10000026
11000268	2019-03-27		3	10000005
11000269	2019-03-27		0	10000007
11000270	2019-03-27		7.5	10000014
11000271	2019-03-27		0	10000009
11000272	2019-03-27		0	10000025
11000273	2019-03-27		0.5	10000024
11000274	2019-03-27		0	10000002
11000275	2019-03-28		1	10000015
11000276	2019-03-28		0	10000029
11000277	2019-03-28		0	10000007
11000278	2019-03-28		0	10000028
11000279	2019-03-28		7	10000014
11000280	2019-03-28		0	10000002
11000281	2019-03-28		0	10000020
11000282	2019-03-28		0.5	10000024
11000283	2019-03-28		3	10000005
11000284	2019-03-28		1	10000017
11000285	2019-03-28		0	10000003
11000286	2019-03-28		0	10000009
11000287	2019-03-28		0	10000025
11000288	2019-03-28		5.5	10000012
11000289	2019-03-28		0	10000023
11000290	2019-03-28		1	10000026
11000291	2019-03-28		5	10000018
11000292	2019-03-29		0	10000029
11000293	2019-03-29		0	10000025
11000294	2019-03-29		4	10000012
11000295	2019-03-29		0	10000023
11000296	2019-03-29		0	10000006
11000297	2019-03-29		0.5	10000019
11000298	2019-03-29		1	10000015
11000299	2019-03-29		0	10000003
11000300	2019-03-29		5	10000018
11000301	2019-03-29		0.5	10000024
11000302	2019-03-29		0.5	10000026
11000303	2019-03-29		0	10000020
11000304	2019-03-29		0	10000007
11000305	2019-03-29		1	10000017
11000306	2019-03-29		3	10000005
11000307	2019-03-29		0	10000009
11000308	2019-03-29		7	10000014
11000309	2019-03-29		0	10000002
11000310	2019-03-30		0	10000003
11000311	2019-03-30		1	10000005
11000312	2019-03-30		2.5	10000015
11000313	2019-03-30		2	10000030
11000314	2019-03-30		1	10000019
11000315	2019-03-30		0	10000020
11000316	2019-03-30		0	10000009
11000317	2019-03-30		2	10000012
11000318	2019-03-30		1	10000024
11000319	2019-03-30		0	10000025
11000320	2019-03-30		1	10000017
11000321	2019-03-30		0	10000010
11000322	2019-03-30		2	10000026
11000323	2019-03-30		0	10000002
11000324	2019-03-30		9.5	10000014
11000325	2019-03-30		2	10000016
11000326	2019-03-31		6	10000014
11000327	2019-03-31		0	10000009
11000328	2019-03-31		5	10000026
11000329	2019-03-31		0	10000025
11000330	2019-03-31		0.5	10000024
11000331	2019-03-31		0	10000035
11000332	2019-03-31		1.5	10000017
11000333	2019-03-31		2	10000015
11000334	2019-03-31		0	10000007
11000335	2019-03-31		2	10000005
11000336	2019-03-31		0	10000020
11000337	2019-03-31		3	10000012
11000338	2019-03-31		0	10000002
11000339	2019-03-31		0	10000034
11000340	2019-03-31		4	10000030
11000341	2019-03-31		0	10000031
11000342	2019-03-31		0	10000032
11000343	2019-03-31		0	10000033
11000344	2019-04-01		5	10000014
11000345	2019-04-01		1	10000012
11000346	2019-04-01		0	10000009
11000347	2019-04-01		4	10000018
11000348	2019-04-01		1.5	10000017
11000349	2019-04-01		0	10000023
11000350	2019-04-01		2	10000019
11000351	2019-04-01		0	10000034
11000352	2019-04-01		0	10000035
11000353	2019-04-01		0	10000020
11000354	2019-04-01		1	10000030
11000355	2019-04-01		0	10000002
11000356	2019-04-01		2	10000005
11000357	2019-04-01		2	10000015
11000358	2019-04-02		2	10000019
11000359	2019-04-02		0	10000002
11000360	2019-04-02		0	10000023
11000361	2019-04-02		4	10000018
11000362	2019-04-02		0	10000020
11000363	2019-04-02		1.5	10000012
11000364	2019-04-02		0	10000003
11000365	2019-04-02		2.5	10000015
11000366	2019-04-02		0	10000035
11000367	2019-04-02		2	10000005
11000368	2019-04-02		0.5	10000016
11000369	2019-04-02		0	10000034
11000370	2019-04-02		0	10000009
11000371	2019-04-02		1	10000017
11000372	2019-04-02		7.5	10000014
11000373	2019-04-02		0.5	10000026
11000374	2019-04-03		0	10000020
11000375	2019-04-03		0	10000002
11000376	2019-04-03		0.5	10000024
11000377	2019-04-03		2	10000005
11000378	2019-04-03		0	10000034
11000379	2019-04-03		0	10000003
11000380	2019-04-03		0	10000035
11000381	2019-04-03		1	10000017
11000382	2019-04-03		3	10000019
11000383	2019-04-03		0	10000023
11000384	2019-04-03		0	10000009
11000385	2019-04-03		5	10000018
11000386	2019-04-03		2.5	10000015
11000387	2019-04-03		1	10000012
11000388	2019-04-03		7.5	10000014
11000389	2019-04-04		0	10000035
11000390	2019-04-04		0	10000009
11000391	2019-04-04		0	10000034
11000392	2019-04-04		1	10000012
11000393	2019-04-04		0	10000037
11000394	2019-04-04		0	10000036
11000395	2019-04-04		1	10000013
11000396	2019-04-04		3.5	10000026
11000397	2019-04-04		0	10000020
11000398	2019-04-04		0	10000003
11000399	2019-04-04		3	10000018
11000400	2019-04-04		1	10000016
11000401	2019-04-04		2	10000019
11000402	2019-04-04		0	10000002
11000403	2019-04-04		1	10000017
11000404	2019-04-04		0	10000023
11000405	2019-04-04		2	10000015
11000406	2019-04-04		0.5	10000024
11000407	2019-04-04		3	10000005
11000408	2019-04-04		7.5	10000014
11000409	2019-04-05		4	10000018
11000410	2019-04-05		2.5	10000015
11000411	2019-04-05		0	10000002
11000412	2019-04-05		0	10000003
11000413	2019-04-05		0	10000009
11000414	2019-04-05		2	10000005
11000415	2019-04-05		1	10000019
11000416	2019-04-05		6.5	10000014
11000417	2019-04-05		0	10000023
11000418	2019-04-06		0	10000040
11000419	2019-04-06		1	10000015
11000420	2019-04-06		1	10000024
11000421	2019-04-06		0	10000038
11000422	2019-04-06		2	10000016
11000423	2019-04-06		1.5	10000017
11000424	2019-04-06		0	10000035
11000425	2019-04-06		0	10000034
11000426	2019-04-06		1	10000005
11000427	2019-04-06		3	10000030
11000428	2019-04-06		0	10000039
11000429	2019-04-06		0	10000009
11000430	2019-04-06		6	10000014
11000431	2019-04-06		0	10000002
11000432	2019-04-06		2	10000019
11000433	2019-04-06		1	10000026
11000434	2019-04-06		4	10000012
11000435	2019-04-07		0	10000009
11000436	2019-04-07		1	10000024
11000437	2019-04-07		1	10000005
11000438	2019-04-07		0	10000020
11000439	2019-04-07		2	10000030
11000440	2019-04-07		1.5	10000017
11000441	2019-04-07		0	10000002
11000442	2019-04-07		2	10000019
11000443	2019-04-07		4	10000016
11000444	2019-04-07		2	10000015
11000445	2019-04-07		0	10000040
11000446	2019-04-07		2	10000026
11000447	2019-04-07		0.5	10000044
11000448	2019-04-07		5	10000014
11000449	2019-04-07		0	10000042
11000450	2019-04-07		2	10000043
11000451	2019-04-07		0	10000041
11000452	2019-04-07		2	10000012
11000453	2019-04-08		2	10000015
11000454	2019-04-08		0.5	10000024
11000455	2019-04-08		7	10000014
11000456	2019-04-08		0	10000034
11000457	2019-04-08		2.5	10000030
11000458	2019-04-08		0	10000002
11000459	2019-04-08		1	10000005
11000460	2019-04-08		0	10000035
11000461	2019-04-08		0	10000023
11000462	2019-04-08		0.5	10000044
11000463	2019-04-08		0	10000042
11000464	2019-04-08		2	10000019
11000465	2019-04-08		3	10000018
11000466	2019-04-08		1.5	10000012
11000467	2019-04-09		0	10000035
11000468	2019-04-09		5	10000018
11000469	2019-04-09		0.5	10000044
11000470	2019-04-09		0	10000002
11000471	2019-04-09		1	10000019
11000472	2019-04-09		0	10000020
11000473	2019-04-09		1	10000012
11000474	2019-04-09		0	10000042
11000475	2019-04-09		0	10000034
11000476	2019-04-09		0.5	10000017
11000477	2019-04-09		3	10000030
11000478	2019-04-09		2	10000015
11000479	2019-04-09		2	10000005
11000480	2019-04-09		6.5	10000014
11000481	2019-04-09		0	10000023
11000482	2019-04-09		0	10000009
11000483	2019-04-09		0.5	10000026
11000484	2019-04-10		3	10000005
11000485	2019-04-10		0	10000009
11000486	2019-04-10		0.5	10000012
11000487	2019-04-10		1	10000015
11000488	2019-04-10		3	10000018
11000489	2019-04-10		5	10000014
11000490	2019-04-10		0	10000046
11000491	2019-04-10		0	10000042
11000492	2019-04-10		0.5	10000024
11000493	2019-04-10		0	10000020
11000494	2019-04-10		7	10000030
11000495	2019-04-10		0	10000045
11000496	2019-04-11		0	10000042
11000497	2019-04-11		2	10000005
11000498	2019-04-11		5	10000014
11000499	2019-04-11		0	10000023
11000500	2019-04-11		0.5	10000024
11000501	2019-04-11		0	10000020
11000502	2019-04-11		1	10000013
11000503	2019-04-11		1	10000012
11000504	2019-04-11		2	10000015
11000505	2019-04-11		0	10000047
11000506	2019-04-11		0.5	10000017
11000507	2019-04-11		5	10000030
11000508	2019-04-11		5	10000018
11000509	2019-04-12		0	10000041
11000510	2019-04-12		4	10000014
11000511	2019-04-12		0.5	10000017
11000512	2019-04-12		0	10000020
11000513	2019-04-12		1	10000005
11000514	2019-04-12		0	10000047
11000515	2019-04-12		12	10000030
11000516	2019-04-12		1	10000015
11000517	2019-04-12		0	10000042
11000518	2019-04-13		0	10000041
11000519	2019-04-13		3	10000030
11000520	2019-04-13		0	10000035
11000521	2019-04-13		8	10000014
11000522	2019-04-13		2	10000026
11000523	2019-04-13		0	10000051
11000524	2019-04-13		0	10000050
11000525	2019-04-13		0	10000049
11000526	2019-04-13		1	10000015
11000527	2019-04-13		0	10000042
11000528	2019-04-13		0	10000048
11000529	2019-04-13		2	10000024
11000530	2019-04-13		0	10000047
11000531	2019-04-13		0.5	10000017
11000532	2019-04-13		2	10000013
11000533	2019-04-13		1	10000016
11000534	2019-04-13		2	10000005
11000535	2019-04-13		0	10000020
11000536	2019-04-14		0.5	10000026
11000537	2019-04-14		2	10000005
11000538	2019-04-14		0	10000035
11000539	2019-04-14		9	10000014
11000540	2019-04-14		1	10000013
11000541	2019-04-14		0.5	10000024
11000542	2019-04-14		0	10000020
11000543	2019-04-14		0	10000009
11000544	2019-04-14		4	10000030
11000545	2019-04-14		0	10000047
11000546	2019-04-14		2	10000017
11000547	2019-04-14		0	10000049
11000548	2019-04-14		0	10000052
11000549	2019-04-14		2	10000044
11000550	2019-04-14		1	10000012
11000551	2019-04-15		5	10000014
11000552	2019-04-15		1.5	10000017
11000553	2019-04-15		7	10000018
11000554	2019-04-15		2	10000012
11000555	2019-04-15		0	10000009
11000556	2019-04-15		0	10000020
11000557	2019-04-15		0.5	10000024
11000558	2019-04-15		0.5	10000013
11000559	2019-04-15		0	10000023
11000560	2019-04-15		1.5	10000015
11000561	2019-04-15		2	10000005
11000562	2019-04-15		0	10000049
11000563	2019-04-16		1	10000016
11000564	2019-04-16		0	10000020
11000565	2019-04-16		2	10000015
11000566	2019-04-16		0	10000041
11000567	2019-04-16		0	10000049
11000568	2019-04-16		0.5	10000024
11000569	2019-04-16		0	10000023
11000570	2019-04-16		6	10000014
11000571	2019-04-16		0	10000053
11000572	2019-04-16		0	10000054
11000573	2019-04-16		4	10000018
11000574	2019-04-16		2	10000013
11000575	2019-04-16		0	10000035
11000576	2019-04-16		0	10000009
11000577	2019-04-16		2	10000005
11000578	2019-04-16		4	10000012
11000579	2019-04-17		0.5	10000026
11000580	2019-04-17		0	10000009
11000581	2019-04-17		0	10000053
11000582	2019-04-17		4	10000018
11000583	2019-04-17		4	10000012
11000584	2019-04-17		0	10000054
11000585	2019-04-17		1	10000024
11000586	2019-04-17		1	10000015
11000587	2019-04-17		0	10000023
11000588	2019-04-17		0	10000020
11000589	2019-04-17		2	10000005
11000590	2019-04-17		0	10000041
11000591	2019-04-17		0.5	10000017
11000592	2019-04-17		6	10000014
11000593	2019-04-17		1	10000016
11000594	2019-04-18		0	10000020
11000595	2019-04-18		1.5	10000015
11000596	2019-04-18		4.5	10000012
11000597	2019-04-18		0	10000053
11000598	2019-04-18		0.5	10000024
11000599	2019-04-18		2	10000005
11000600	2019-04-18		3	10000018
11000601	2019-04-18		0	10000009
11000602	2019-04-18		0.5	10000026
11000603	2019-04-18		0	10000023
11000604	2019-04-18		0	10000035
11000605	2019-04-18		6	10000014
11000606	2019-04-18		0.5	10000017
11000607	2019-04-19		8	10000014
11000608	2019-04-19		0.5	10000024
11000609	2019-04-19		4	10000012
11000610	2019-04-19		0	10000020
11000611	2019-04-19		0	10000009
11000612	2019-04-19		2	10000015
11000613	2019-04-19		0	10000023
11000614	2019-04-19		4	10000018
11000615	2019-04-19		0	10000035
11000616	2019-04-19		0.5	10000017
11000617	2019-04-19		2	10000005
11000618	2019-04-19		0	10000053
11000619	2019-04-20		6	10000014
11000620	2019-04-20		2	10000026
11000621	2019-04-20		1	10000005
11000622	2019-04-20		0	10000041
11000623	2019-04-20		0	10000055
11000624	2019-04-20		6	10000015
11000625	2019-04-20		0	10000053
11000626	2019-04-20		1.5	10000017
11000627	2019-04-20		1	10000030
11000628	2019-04-20		0.5	10000024
11000629	2019-04-20		0	10000009
11000630	2019-04-20		6	10000012
11000631	2019-04-20		0	10000020
11000632	2019-04-21		0	10000009
11000633	2019-04-21		0.5	10000012
11000634	2019-04-21		0	10000056
11000636	2019-04-21		0	10000020
11000637	2019-04-21		6	10000014
11000638	2019-04-21		2	10000019
11000639	2019-04-21		0	10000041
11000640	2019-04-21		0	10000035
11000641	2019-04-21		1	10000043
11000642	2019-04-21		8	10000015
11000643	2019-04-21		1	10000017
11000644	2019-04-21		0.5	10000024
11000645	2019-04-21		3	10000030
11000646	2019-04-22		0	10000059
11000647	2019-04-22		0	10000035
11000649	2019-04-22		0	10000058
11000650	2019-04-22		3	10000015
11000651	2019-04-22		2	10000019
11000652	2019-04-22		0	10000009
11000653	2019-04-22		0.5	10000026
11000654	2019-04-22		5	10000018
11000655	2019-04-22		1.5	10000030
11000656	2019-04-22		0.5	10000017
11000657	2019-04-22		0.5	10000024
11000658	2019-04-22		0	10000020
11000659	2019-04-22		0.5	10000012
11000660	2019-04-22		7	10000014
11000661	2019-04-23		2.5	10000005
11000662	2019-04-23		0	10000059
11000663	2019-04-23		0	10000060
11000664	2019-04-23		6	10000018
11000665	2019-04-23		0	10000061
11000666	2019-04-23		2	10000019
11000667	2019-04-23		0.5	10000017
11000668	2019-04-23		2.5	10000015
11000669	2019-04-23		0.5	10000030
11000670	2019-04-23		7	10000014
11000671	2019-04-23		0.5	10000012
11000672	2019-04-23		0	10000020
11000673	2019-04-23		0	10000035
11000674	2019-04-23		0	10000009
11000675	2019-04-24		0	10000003
11000676	2019-04-24		0	10000060
11000677	2019-04-24		0	10000064
11000678	2019-04-24		0	10000020
11000679	2019-04-24		0	10000062
11000680	2019-04-24		0	10000063
11000681	2019-04-24		0	10000065
11000682	2019-04-24		0	10000066
11000683	2019-04-24		0	10000009
11000684	2019-04-25		0.5	10000012
11000685	2019-04-25		1	10000026
11000686	2019-04-25		4	10000030
11000687	2019-04-25		1	10000024
11000688	2019-04-25		7	10000014
11000689	2019-04-25		0	10000035
11000690	2019-04-25		0	10000020
11000691	2019-04-25		0	10000023
11000692	2019-04-25		4	10000018
11000693	2019-04-25		1	10000005
11000694	2019-04-25		0	10000041
11000695	2019-04-25		1	10000015
11000696	2019-04-25		0	10000009
11000697	2019-04-25		2	10000016
11000698	2019-04-25		0	10000060
11000699	2019-04-25		0	10000070
11000700	2019-04-25		0	10000069
11000701	2019-04-25		0	10000068
11000702	2019-04-25		0.5	10000017
11000703	2019-04-25		0	10000067
11000704	2019-04-26		0.5	10000026
11000705	2019-04-26		0.5	10000024
11000706	2019-04-26		2	10000016
11000707	2019-04-26		1	10000015
11000708	2019-04-26		0	10000003
11000709	2019-04-26		3.5	10000017
11000710	2019-04-26		0.5	10000013
11000711	2019-04-26		6	10000014
11000712	2019-04-26		1.5	10000030
11000713	2019-04-26		0	10000023
11000714	2019-04-26		0	10000049
11000715	2019-04-26		0	10000067
11000716	2019-04-26		0	10000020
11000717	2019-04-26		2	10000005
11000718	2019-04-26		3	10000018
11000719	2019-04-26		0	10000071
11000720	2019-04-27		0	10000077
11000721	2019-04-27		0	10000042
11000722	2019-04-27		0.5	10000005
11000723	2019-04-27		1	10000015
11000724	2019-04-27		0	10000067
11000725	2019-04-27		1	10000024
11000726	2019-04-27		6	10000014
11000727	2019-04-27		0	10000074
11000728	2019-04-27		0	10000075
11000729	2019-04-27		2.5	10000017
11000730	2019-04-27		0	10000076
11000731	2019-04-27		0.5	10000026
11000732	2019-04-27		9	10000030
11000733	2019-04-27		0	10000020
11000734	2019-04-27		0	10000072
11000735	2019-04-27		0	10000073
11000736	2019-04-27		0	10000071
11000737	2019-04-27		2	10000012
11000738	2019-04-28		0	10000076
11000739	2019-04-28		0	10000020
11000740	2019-04-28		7	10000030
11000741	2019-04-28		0	10000078
11000742	2019-04-28		0	10000079
11000743	2019-04-28		0	10000010
11000744	2019-04-28		0	10000041
11000745	2019-04-28		7	10000014
11000746	2019-04-28		2	10000016
11000747	2019-04-28		2.5	10000044
11000748	2019-04-28		1	10000012
11000749	2019-04-28		1	10000024
11000750	2019-04-28		2	10000015
11000751	2019-04-28		0	10000071
11000752	2019-04-29		9	10000014
11000753	2019-04-29		1	10000015
11000754	2019-04-29		0	10000076
11000755	2019-04-29		1	10000026
11000756	2019-04-29		2	10000016
11000757	2019-04-29		0	10000010
11000758	2019-04-29		8	10000044
11000759	2019-04-29		2	10000017
11000760	2019-04-29		0	10000081
11000761	2019-04-29		0	10000071
11000762	2019-04-29		1	10000030
11000763	2019-04-29		0	10000020
11000764	2019-04-29		0	10000080
11000765	2019-04-30		11	10000044
11000766	2019-04-30		5	10000015
11000767	2019-04-30		0	10000081
11000768	2019-04-30		6	10000014
11000769	2019-05-01		0	10000035
11000770	2019-05-01		4	10000015
11000771	2019-05-01		6	10000014
11000772	2019-05-01		12	10000044
11000773	2019-05-01		0	10000081
11000774	2019-05-02		0	10000009
11000775	2019-05-02		0	10000053
11000776	2019-05-02		1	10000024
11000777	2019-05-02		0	10000050
11000778	2019-05-02		4	10000016
11000779	2019-05-02		0	10000082
11000780	2019-05-02		9	10000014
11000781	2019-05-02		2	10000015
11000782	2019-05-02		2	10000012
11000783	2019-05-02		3	10000030
11000784	2019-05-03		4	10000012
11000785	2019-05-03		0	10000050
11000786	2019-05-03		4	10000030
11000787	2019-05-03		0	10000053
11000788	2019-05-03		2	10000015
11000789	2019-05-03		4	10000016
11000790	2019-05-03		10	10000014
11000791	2019-05-03		0	10000082
11000792	2019-05-04		1	10000024
11000793	2019-05-04		9	10000014
11000794	2019-05-04		2	10000012
11000795	2019-05-04		3	10000030
11000796	2019-05-04		0	10000075
11000797	2019-05-04		0	10000009
11000798	2019-05-04		8	10000013
11000799	2019-05-05		0	10000077
11000800	2019-05-05		0	10000075
11000801	2019-05-05		3	10000012
11000802	2019-05-05		0	10000009
11000803	2019-05-05		2	10000024
11000804	2019-05-05		0	10000083
11000805	2019-05-05		2	10000015
11000806	2019-05-05		1	10000017
11000807	2019-05-05		6	10000013
11000808	2019-05-05		7	10000014
11000809	2019-05-06		2	10000012
11000810	2019-05-06		5	10000013
11000811	2019-05-06		2	10000015
11000812	2019-05-06		0	10000086
11000813	2019-05-06		0	10000079
11000814	2019-05-06		8	10000014
11000815	2019-05-06		0	10000077
11000816	2019-05-06		0	10000084
11000817	2019-05-06		1	10000024
11000818	2019-05-06		6	10000030
11000819	2019-05-06		0	10000085
11000820	2019-05-06		0	10000009
11000821	2019-05-07		0.5	10000044
11000822	2019-05-07		0	10000009
11000823	2019-05-07		0	10000027
11000824	2019-05-07		0	10000062
11000825	2019-05-07		0	10000023
11000826	2019-05-07		0	10000020
11000827	2019-05-07		0.5	10000026
11000828	2019-05-07		1.5	10000017
11000829	2019-05-07		2	10000012
11000830	2019-05-07		5	10000018
11000831	2019-05-07		2	10000013
11000832	2019-05-07		0	10000079
11000833	2019-05-07		5.5	10000014
11000834	2019-05-07		1	10000005
11000835	2019-05-07		0	10000002
11000836	2019-05-07		0	10000087
11000837	2019-05-07		3	10000015
11000838	2019-05-07		2	10000030
11000839	2019-05-08		0	10000002
11000840	2019-05-08		7.5	10000014
11000841	2019-05-08		1	10000005
11000842	2019-05-08		0	10000062
11000843	2019-05-08		2	10000015
11000844	2019-05-08		0	10000027
11000845	2019-05-08		0.5	10000012
11000846	2019-05-08		2	10000013
11000847	2019-05-08		0	10000020
11000848	2019-05-08		5	10000018
11000849	2019-05-08		4	10000030
11000850	2019-05-09		0	10000062
11000851	2019-05-09		2	10000015
11000852	2019-05-09		7.5	10000014
11000853	2019-05-09		0	10000002
11000854	2019-05-09		0	10000079
11000855	2019-05-09		5	10000018
11000856	2019-05-09		1	10000005
11000857	2019-05-09		4	10000030
11000858	2019-05-09		0.5	10000012
11000859	2019-05-09		2	10000013
11000860	2019-05-09		0	10000027
11000861	2019-05-10		5	10000018
11000862	2019-05-10		4	10000030
11000863	2019-05-10		7	10000013
11000864	2019-05-10		0	10000023
11000865	2019-05-10		0	10000002
11000866	2019-05-10		4	10000014
11000867	2019-05-10		0	10000079
11000868	2019-05-10		1	10000005
11000869	2019-05-10		0	10000088
11000871	2019-05-10		2	10000015
11000872	2019-05-11		6	10000013
11000873	2019-05-11		1	10000015
11000874	2019-05-11		3	10000012
11000875	2019-05-11		2	10000017
11000876	2019-05-11		1	10000026
11000878	2019-05-11		4	10000014
11000879	2019-05-11		0	10000079
11000880	2019-05-11		0	10000090
11000881	2019-05-11		0	10000020
11000882	2019-05-12		6	10000017
11000883	2019-05-12		6	10000014
11000884	2019-05-12		0.5	10000030
11000885	2019-05-12		0.5	10000024
11000886	2019-05-12		2	10000015
11000887	2019-05-12		2	10000026
11000888	2019-05-12		0	10000092
11000889	2019-05-12		2	10000044
11000890	2019-05-12		0	10000091
11000891	2019-05-12		1	10000012
11000893	2019-05-12		0	10000090
11000894	2019-05-12		0	10000020
11000895	2019-05-13		0	10000020
11000896	2019-05-13		4	10000018
11000897	2019-05-13		1	10000016
11000898	2019-05-13		0	10000079
11000899	2019-05-13		0	10000023
11000900	2019-05-13		0	10000090
11000901	2019-05-13		1.5	10000017
11000902	2019-05-13		0	10000027
11000903	2019-05-13		1	10000012
11000904	2019-05-13		0	10000093
11000905	2019-05-13		1	10000015
11000906	2019-05-13		1	10000005
11000907	2019-05-13		0	10000002
11000908	2019-05-13		5	10000013
11000909	2019-05-13		5.5	10000014
11000910	2019-05-13		0.5	10000024
11000911	2019-05-14		0	10000093
11000912	2019-05-14		0	10000002
11000913	2019-05-14		0	10000079
11000914	2019-05-14		0.5	10000026
11000916	2019-05-14		4	10000012
11000917	2019-05-14		1	10000013
11000918	2019-05-14		1	10000015
11000919	2019-05-14		2	10000005
11000920	2019-05-14		0	10000088
11000921	2019-05-14		9	10000014
11000922	2019-05-14		2	10000018
11000923	2019-05-14		1	10000030
11000924	2019-05-14		0.5	10000024
11000925	2019-05-15		1	10000005
11000926	2019-05-15		0	10000079
11000927	2019-05-15		0	10000023
11000928	2019-05-15		0	10000094
11000929	2019-05-15		8	10000014
11000930	2019-05-15		0	10000002
11000931	2019-05-15		1	10000015
11000932	2019-05-15		3	10000013
11000933	2019-05-15		2	10000012
11000934	2019-05-15		5	10000018
11000935	2019-05-15		1	10000030
11000936	2019-05-17		8	10000014
11000937	2019-05-17		0	10000023
11000938	2019-05-17		0	10000095
11000939	2019-05-17		2	10000013
11000940	2019-05-17		0.5	10000024
11000941	2019-05-17		1	10000005
11000942	2019-05-17		0	10000079
11000943	2019-05-17		0	10000002
11000944	2019-05-17		4	10000030
11000946	2019-05-17		5	10000018
11000947	2019-05-17		2	10000015
11000948	2019-05-17		1	10000012
11000949	2019-05-18		6	10000017
11000950	2019-05-18		2	10000026
11000951	2019-05-18		0	10000097
11000952	2019-05-18		3	10000015
11000953	2019-05-18		5	10000014
11000954	2019-05-18		0	10000096
11000955	2019-05-18		2	10000044
11000956	2019-05-18		2	10000043
11000957	2019-05-18		1	10000005
11000958	2019-05-19		4	10000017
11000959	2019-05-19		1	10000044
11000960	2019-05-19		1	10000026
11000961	2019-05-19		0	10000095
11000962	2019-05-19		0	10000096
11000963	2019-05-19		5	10000014
11000964	2019-05-19		5	10000015
11000965	2019-05-19		1	10000016
11000966	2019-05-19		3	10000030
11000967	2019-05-20		0	10000095
11000968	2019-05-20		0	10000003
11000969	2019-05-20		5.5	10000030
11000970	2019-05-20		1	10000017
11000971	2019-05-20		1	10000015
11000972	2019-05-20		0	10000009
11000973	2019-05-20		5	10000018
11000974	2019-05-20		0.5	10000024
11000975	2019-05-20		6.5	10000014
11000976	2019-05-20		1	10000005
11000977	2019-05-20		1.5	10000012
11000978	2019-05-20		0	10000079
11000979	2019-05-20		2	10000016
11000980	2019-05-20		0	10000020
11000981	2019-05-21		5	10000030
11000982	2019-05-21		6	10000018
11000983	2019-05-21		3.5	10000014
11000984	2019-05-21		0	10000003
11000985	2019-05-21		1	10000012
11000986	2019-05-21		1	10000015
11000987	2019-05-21		0	10000023
11000988	2019-05-21		0	10000009
11000989	2019-05-21		0	10000095
11000990	2019-05-21		0.5	10000005
11000991	2019-05-21		0	10000098
11000992	2019-05-22		1	10000013
11000993	2019-05-22		1	10000005
11000994	2019-05-22		2	10000012
11000995	2019-05-22		0	10000010
11000996	2019-05-22		3	10000015
11000997	2019-05-22		1	10000016
11000998	2019-05-22		3	10000018
11000999	2019-05-22		0	10000023
11001000	2019-05-22		0	10000098
11001001	2019-05-22		4	10000030
11001002	2019-05-22		6	10000014
11001003	2019-05-22		0	10000003
11001004	2019-05-22		0	10000009
11001005	2019-05-22		0	10000095
11001006	2019-05-23		0	10000003
11001007	2019-05-23		8.5	10000014
11001008	2019-05-23		0	10000009
11001009	2019-05-23		1	10000005
11001010	2019-05-23		5	10000018
11001011	2019-05-23		0.5	10000013
11001012	2019-05-23		0	10000095
11001013	2019-05-23		2	10000015
11001014	2019-05-23		1	10000012
11001015	2019-05-23		5	10000030
11001016	2019-05-23		0	10000023
11001017	2019-05-24		0	10000099
11001018	2019-05-24		0	10000095
11001019	2019-05-24		5	10000018
11001020	2019-05-24		5	10000030
11001021	2019-05-24		7.5	10000014
11001022	2019-05-24		2	10000005
11001023	2019-05-24		1	10000016
11001024	2019-05-24		0	10000023
11001025	2019-05-24		0	10000003
11001026	2019-05-24		0	10000009
11001027	2019-05-24		2	10000015
11001028	2019-05-25		0	10000003
11001029	2019-05-25		2	10000005
11001030	2019-05-25		1	10000012
11001031	2019-05-25		0	10000101
11001032	2019-05-25		9	10000014
11001033	2019-05-25		0	10000102
11001034	2019-05-25		0.5	10000019
11001035	2019-05-25		3	10000015
11001036	2019-05-25		1	10000044
11001037	2019-05-25		1	10000016
11001038	2019-05-25		1	10000026
11001039	2019-05-25		4	10000030
11001040	2019-05-25		0	10000100
11001041	2019-05-25		1	10000024
11001042	2019-05-26		0	10000105
11001043	2019-05-26		0	10000104
11001044	2019-05-26		2	10000015
11001045	2019-05-26		0	10000103
11001046	2019-05-26		4	10000030
11001047	2019-05-26		1	10000012
11001048	2019-05-26		1	10000026
11001049	2019-05-26		1	10000013
11001050	2019-05-26		1	10000016
11001051	2019-05-26		0	10000010
11001052	2019-05-26		1	10000024
11001053	2019-05-26		0	10000003
11001054	2019-05-26		9	10000014
11001055	2019-05-26		4	10000005
11001056	2019-05-27		0	10000010
11001057	2019-05-27		6.5	10000014
11001058	2019-05-27		4	10000030
11001059	2019-05-27		0.5	10000044
11001060	2019-05-27		3	10000015
11001061	2019-05-27		0	10000020
11001062	2019-05-27		0.5	10000017
11001063	2019-05-27		0	10000023
11001064	2019-05-27		1	10000013
11001065	2019-05-27		0	10000106
11001066	2019-05-27		0	10000103
11001067	2019-05-27		1	10000012
11001068	2019-05-27		5	10000018
11001069	2019-05-27		0	10000098
11001070	2019-05-27		0	10000009
11001071	2019-05-27		1	10000005
11001072	2019-05-28		0	10000020
11001073	2019-05-28		0.5	10000024
11001074	2019-05-28		0	10000103
11001075	2019-05-28		2	10000015
11001076	2019-05-28		0	10000023
11001077	2019-05-28		0.5	10000044
11001078	2019-05-28		1	10000005
11001079	2019-05-28		0	10000109
11001080	2019-05-28		0	10000107
11001081	2019-05-28		5	10000018
11001082	2019-05-28		1	10000012
11001083	2019-05-28		6.5	10000014
11001084	2019-05-28		0	10000009
11001085	2019-05-28		1	10000013
11001086	2019-05-28		4	10000030
11001087	2019-05-28		0	10000108
11001088	2019-05-28		0.5	10000017
11001089	2019-05-29		0.5	10000024
11001090	2019-05-29		8	10000018
11001091	2019-05-29		0	10000023
11001092	2019-05-29		6.5	10000014
11001093	2019-05-29		1	10000013
11001094	2019-05-29		2	10000015
11001095	2019-05-29		0.5	10000017
11001096	2019-05-29		1	10000005
11001097	2019-05-29		0.5	10000044
11001098	2019-05-29		0	10000009
11001099	2019-05-29		3	10000012
11001100	2019-05-29		1	10000030
11001102	2019-05-29		0	10000020
11001103	2019-05-29		0	10000103
11001104	2019-05-30		2.5	10000015
11001105	2019-05-30		1	10000005
11001106	2019-05-30		8.5	10000018
11001107	2019-05-30		1	10000013
11001108	2019-05-30		0	10000023
11001109	2019-05-30		0	10000009
11001110	2019-05-30		6	10000014
11001111	2019-05-30		4	10000012
11001112	2019-05-30		0	10000103
11001113	2019-05-30		1	10000030
11001115	2019-05-31		0	10000023
11001116	2019-05-31		0.5	10000024
11001117	2019-05-31		1	10000005
11001118	2019-05-31		1	10000013
11001119	2019-05-31		0	10000009
11001120	2019-05-31		7.5	10000014
11001121	2019-05-31		0	10000103
11001122	2019-05-31		2	10000015
11001124	2019-05-31		8	10000018
11001125	2019-05-31		4	10000012
11001126	2019-06-01		1	10000026
11001127	2019-06-01		0	10000103
11001128	2019-06-01		4	10000043
11001129	2019-06-01		4	10000012
11001130	2019-06-01		6	10000014
11001131	2019-06-01		1	10000024
11001133	2019-06-01		0	10000110
11001134	2019-06-01		0	10000111
11001135	2019-06-01		5	10000015
11001136	2019-06-01		0	10000112
11001137	2019-06-01		1	10000013
11001138	2019-06-01		1	10000017
11001139	2019-06-01		0	10000020
11001140	2019-06-01		0	10000009
11001141	2019-06-01		1	10000030
11001142	2019-06-02		0	10000009
11001143	2019-06-02		1	10000005
11001144	2019-06-02		0	10000115
11001145	2019-06-02		1	10000013
11001146	2019-06-02		5	10000015
11001147	2019-06-02		5	10000030
11001148	2019-06-02		8	10000014
11001149	2019-06-02		0	10000077
11001150	2019-06-02		0	10000103
11001151	2019-06-02		3	10000012
11001152	2019-06-02		0	10000112
11001153	2019-06-02		0	10000113
11001154	2019-06-02		0	10000114
11001155	2019-06-02		1	10000024
11001156	2019-06-03		1	10000013
11001157	2019-06-03		0	10000023
11001159	2019-06-03		0	10000116
11001160	2019-06-03		3	10000012
11001161	2019-06-03		2	10000030
11001162	2019-06-03		0	10000009
11001163	2019-06-03		6	10000014
11001164	2019-06-03		9.5	10000018
11001165	2019-06-03		1	10000005
11001166	2019-06-03		2	10000015
11001167	2019-06-03		0	10000115
11001168	2019-06-03		0.5	10000024
11001169	2019-06-04		7.5	10000018
11001170	2019-06-04		1	10000013
11001171	2019-06-04		0	10000072
11001172	2019-06-04		1.5	10000015
11001173	2019-06-04		4	10000012
11001175	2019-06-04		1.5	10000030
11001176	2019-06-04		6	10000014
11001177	2019-06-04		0	10000009
11001178	2019-06-04		0	10000023
11001179	2019-06-04		0.5	10000024
11001180	2019-06-04		1	10000005
11001181	2019-06-05		0	10000117
11001182	2019-06-05		0.5	10000005
11001183	2019-06-05		8.5	10000018
11001184	2019-06-05		1	10000013
11001185	2019-06-05		0	10000113
11001186	2019-06-05		0	10000103
11001187	2019-06-05		0.5	10000016
11001188	2019-06-05		4.5	10000030
11001189	2019-06-05		8	10000014
11001190	2019-06-05		0.5	10000044
11001191	2019-06-05		2	10000015
11001192	2019-06-05		0	10000023
11001193	2019-06-06		0	10000120
11001194	2019-06-06		0.5	10000012
11001195	2019-06-06		0	10000106
11001196	2019-06-06		0	10000023
11001197	2019-06-06		3	10000030
11001198	2019-06-06		0	10000035
11001199	2019-06-06		0	10000103
11001200	2019-06-06		0.20000000000000001	10000026
11001201	2019-06-06		0	10000119
11001202	2019-06-06		7	10000014
11001203	2019-06-06		0.29999999999999999	10000044
11001204	2019-06-06		1	10000013
11001205	2019-06-06		2.5	10000015
11001206	2019-06-06		7.5	10000018
11001207	2019-06-06		2	10000005
11001208	2019-06-06		0.5	10000017
11001209	2019-06-06		0	10000118
11001210	2019-06-07		0.5	10000013
11001211	2019-06-07		0	10000121
11001212	2019-06-07		0	10000106
11001213	2019-06-07		1.5	10000015
11001214	2019-06-07		0	10000023
11001215	2019-06-07		3.5	10000043
11001216	2019-06-07		0.5	10000012
11001217	2019-06-07		8	10000018
11001218	2019-06-07		2.5	10000044
11001219	2019-06-07		0	10000010
11001220	2019-06-07		1	10000124
11001221	2019-06-07		0	10000009
11001222	2019-06-07		6	10000014
11001223	2019-06-07		1	10000016
11001224	2019-06-07		0	10000122
11001225	2019-06-07		0	10000123
11001226	2019-06-07		1	10000026
11001227	2019-06-07		1	10000005
11001228	2019-06-08		0	10000106
11001229	2019-06-08		0	10000009
11001230	2019-06-08		1	10000005
11001231	2019-06-08		0	10000077
11001232	2019-06-08		2	10000017
11001233	2019-06-08		3	10000015
11001234	2019-06-08		0	10000020
11001235	2019-06-08		0	10000129
11001236	2019-06-08		0	10000128
11001237	2019-06-08		0	10000127
11001238	2019-06-08		0	10000126
11001239	2019-06-08		0	10000125
11001240	2019-06-08		0.5	10000024
11001241	2019-06-08		0.5	10000044
11001242	2019-06-08		0	10000010
11001243	2019-06-08		0	10000130
11001244	2019-06-08		0	10000131
11001245	2019-06-08		7	10000014
11001246	2019-06-08		1	10000016
11001247	2019-06-08		4	10000124
11001248	2019-06-08		2	10000026
11001249	2019-06-08		5	10000012
11001250	2019-06-08		0	10000122
11001251	2019-06-08		0	10000035
11001252	2019-06-08		0.5	10000030
11001253	2019-06-09		6	10000014
11001254	2019-06-09		0	10000125
11001255	2019-06-09		0	10000106
11001256	2019-06-09		0	10000020
11001257	2019-06-09		0	10000131
11001258	2019-06-09		2.5	10000124
11001259	2019-06-09		1	10000015
11001260	2019-06-09		5.5	10000012
11001261	2019-06-09		3	10000017
11001262	2019-06-09		2	10000026
11001263	2019-06-09		0	10000132
11001264	2019-06-10		1	10000005
11001265	2019-06-10		0	10000132
11001266	2019-06-10		8	10000018
11001267	2019-06-10		7	10000014
11001268	2019-06-10		0.5	10000013
11001269	2019-06-10		0	10000009
11001270	2019-06-10		0	10000023
11001271	2019-06-10		1.5	10000015
11001272	2019-06-10		0	10000131
11001273	2019-06-10		0.5	10000026
11001274	2019-06-10		5.5	10000012
11001275	2019-06-11		0.5	10000030
11001276	2019-06-11		0	10000009
11001277	2019-06-11		0	10000023
11001278	2019-06-11		0	10000133
11001279	2019-06-11		8.5	10000012
11001280	2019-06-11		0	10000131
11001281	2019-06-11		1.5	10000005
11001282	2019-06-11		0	10000132
11001283	2019-06-11		0	10000072
11001284	2019-06-11		2	10000015
11001285	2019-06-11		6.5	10000014
11001286	2019-06-11		5	10000018
11001287	2019-06-12		0	10000134
11001288	2019-06-12		2	10000015
11001289	2019-06-12		0	10000133
11001290	2019-06-12		1.5	10000016
11001291	2019-06-12		0	10000118
11001292	2019-06-12		8	10000018
11001293	2019-06-12		0	10000009
11001294	2019-06-12		1	10000005
11001295	2019-06-12		0.25	10000044
11001296	2019-06-12		7.5	10000014
11001297	2019-06-12		2.25	10000012
11001298	2019-06-12		0.5	10000013
11001299	2019-06-12		0	10000023
11001300	2019-06-12		0	10000077
11001301	2019-06-12		0	10000103
11001302	2019-06-13		8.5	10000018
11001303	2019-06-13		1	10000005
11001304	2019-06-13		0	10000078
11001305	2019-06-13		0	10000132
11001306	2019-06-13		1.5	10000015
11001307	2019-06-13		0	10000009
11001308	2019-06-13		0.25	10000044
11001309	2019-06-13		1.5	10000017
11001310	2019-06-13		8	10000014
11001311	2019-06-13		0	10000023
11001312	2019-06-13		0	10000133
11001313	2019-06-13		1	10000016
11001314	2019-06-13		0	10000135
11001315	2019-06-13		1.5	10000012
11001316	2019-06-13		1	10000030
11001317	2019-06-13		0	10000134
11001318	2019-06-14		1.5	10000015
11001319	2019-06-14		0.25	10000024
11001320	2019-06-14		0.5	10000017
11001321	2019-06-14		2	10000005
11001322	2019-06-14		0	10000132
11001323	2019-06-14		0.25	10000044
11001324	2019-06-14		0	10000023
11001325	2019-06-14		8	10000018
11001326	2019-06-14		5	10000030
11001327	2019-06-14		7.5	10000014
11001328	2019-06-14		0	10000131
11001329	2019-06-14		0	10000135
11001330	2019-06-14		0	10000133
11001331	2019-06-15		0	10000133
11001332	2019-06-15		0	10000009
11001333	2019-06-15		1	10000030
11001334	2019-06-15		0.5	10000019
11001335	2019-06-15		4	10000014
11001336	2019-06-15		1	10000005
11001337	2019-06-15		0	10000086
11001338	2019-06-15		0	10000020
11001339	2019-06-15		8	10000012
11001340	2019-06-15		0.5	10000024
11001341	2019-06-15		3	10000015
11001342	2019-06-15		1	10000017
11001343	2019-06-15		0	10000106
11001344	2019-06-15		0	10000138
11001345	2019-06-15		0	10000132
11001346	2019-06-15		0	10000136
11001347	2019-06-15		2	10000124
11001348	2019-06-15		0	10000131
11001349	2019-06-15		0	10000137
11001350	2019-06-16		0.5	10000016
11001351	2019-06-16		1	10000030
11001352	2019-06-16		0	10000133
11001353	2019-06-16		1	10000005
11001354	2019-06-16		1.5	10000015
11001355	2019-06-16		11	10000014
11001356	2019-06-16		0	10000077
11001357	2019-06-16		0	10000020
11001358	2019-06-16		0	10000042
11001359	2019-06-16		4	10000017
11001360	2019-06-16		5	10000012
11001361	2019-06-17		3.5	10000012
11001362	2019-06-17		0	10000131
11001363	2019-06-17		8.5	10000014
11001364	2019-06-17	课程好长	0	10000142
11001365	2019-06-17	是不是应该学？	0	10000141
11001366	2019-06-17		0	10000133
11001367	2019-06-17		0	10000140
11001368	2019-06-17		2	10000005
11001369	2019-06-17		1	10000017
11001370	2019-06-17		0	10000023
11001371	2019-06-17		7.5	10000018
11001372	2019-06-17		0.25	10000024
11001373	2019-06-17		1.5	10000015
11001374	2019-06-17		0	10000139
11001375	2019-06-17		0.5	10000016
11001376	2019-06-18		0	10000133
11001377	2019-06-18		0	10000023
11001378	2019-06-18		4	10000012
11001379	2019-06-18		0.5	10000030
11001380	2019-06-18		2	10000017
11001381	2019-06-18		0	10000131
11001382	2019-06-18		0.5	10000024
11001383	2019-06-18		0	10000144
11001384	2019-06-18		0	10000143
11001385	2019-06-18		6	10000014
11001386	2019-06-18		1	10000015
11001387	2019-06-18		2	10000005
11001388	2019-06-18		8	10000018
11001389	2019-06-19		2	10000017
11001390	2019-06-19		7.25	10000014
11001391	2019-06-19		1	10000015
11001392	2019-06-19		3.5	10000012
11001393	2019-06-19		6	10000018
11001394	2019-06-19		0	10000146
11001395	2019-06-19		0.5	10000024
11001396	2019-06-19		2	10000005
11001397	2019-06-19		0	10000133
11001398	2019-06-19		0	10000143
11001399	2019-06-19		0	10000145
11001400	2019-06-19		0	10000023
11001401	2019-06-19		1.5	10000016
11001402	2019-06-19		0.25	10000044
11001403	2019-06-20		0	10000023
11001404	2019-06-20		0	10000143
11001405	2019-06-20		3.75	10000017
11001406	2019-06-20		0	10000146
11001407	2019-06-20		0	10000133
11001408	2019-06-20		8	10000018
11001409	2019-06-20		6.5	10000014
11001410	2019-06-20		0.5	10000024
11001411	2019-06-20		1	10000015
11001412	2019-06-20		2	10000005
11001413	2019-06-20		0	10000020
11001414	2019-06-20		0.25	10000044
11001415	2019-06-20		3.5	10000012
11001416	2019-06-21		2	10000005
11001417	2019-06-21		0	10000133
11001418	2019-06-21		0	10000143
11001419	2019-06-21		2.5	10000015
11001420	2019-06-21		2	10000017
11001421	2019-06-21		7.5	10000014
11001422	2019-06-21		6.5	10000018
11001423	2019-06-21		0	10000146
11001424	2019-06-21		0	10000023
11001425	2019-06-21		0.25	10000026
11001426	2019-06-22		0	10000133
11001427	2019-06-22		5.5	10000014
11001428	2019-06-22		5.5	10000017
11001429	2019-06-22		0	10000146
11001430	2019-06-22		1.5	10000015
11001431	2019-06-22		10.5	10000012
11001432	2019-06-22		0	10000147
11001433	2019-06-23		0	10000148
11001434	2019-06-23		0	10000077
11001435	2019-06-23		0	10000143
11001436	2019-06-23		0	10000133
11001437	2019-06-23		0	10000146
11001438	2019-06-23		7	10000017
11001439	2019-06-23		1	10000005
11001440	2019-06-23		5.5	10000014
11001441	2019-06-23		5.5	10000012
11001442	2019-06-23		1	10000015
11001443	2019-06-24		1	10000015
11001444	2019-06-24		2	10000017
11001445	2019-06-24		0	10000143
11001446	2019-06-24		0	10000146
11001447	2019-06-24		0	10000133
11001448	2019-06-24		7	10000014
11001449	2019-06-24		3.5	10000012
11001450	2019-06-24		5.5	10000018
11001451	2019-06-24		2	10000005
11001452	2019-06-24		0	10000023
11001453	2019-06-25		0	10000133
11001454	2019-06-25		7	10000014
11001455	2019-06-25		0	10000146
11001456	2019-06-25		4	10000012
11001457	2019-06-25		0	10000149
11001458	2019-06-25		0.25	10000044
11001459	2019-06-25		0.25	10000124
11001460	2019-06-25		1.5	10000015
11001461	2019-06-25		0	10000143
11001462	2019-06-25		2	10000017
11001463	2019-06-25		0	10000023
11001464	2019-06-25		2	10000005
11001465	2019-06-25		8.5	10000018
11001466	2019-06-26		2	10000017
11001467	2019-06-26		6	10000014
11001468	2019-06-26		0	10000143
11001469	2019-06-26		0	10000146
11001470	2019-06-26		8.5	10000018
11001471	2019-06-26		0	10000133
11001472	2019-06-26		0	10000023
11001473	2019-06-26		1	10000005
11001474	2019-06-27		2.5	10000015
11001475	2019-06-27		6	10000014
11001476	2019-06-27		0	10000143
11001477	2019-06-27		2	10000012
11001478	2019-06-27		2	10000005
11001479	2019-06-27		8.5	10000018
11001480	2019-06-27		1	10000017
11001481	2019-06-27		0	10000023
11001482	2019-06-27		0	10000146
11001483	2019-06-27		0	10000133
11001484	2019-06-28		6	10000015
11001485	2019-06-28		2.5	10000005
11001486	2019-06-28		0	10000133
11001487	2019-06-28		6	10000014
11001488	2019-06-28		1	10000124
11001489	2019-06-28		6	10000026
11001490	2019-06-28		0	10000150
11001491	2019-06-29		0	10000150
11001492	2019-06-29		8	10000014
11001493	2019-06-29		1.5	10000017
11001494	2019-06-29		3	10000005
11001495	2019-06-29		0	10000133
11001496	2019-06-29		6	10000015
11001497	2019-06-29		6	10000026
11001498	2019-06-29		1.5	10000044
11001499	2019-06-30		0	10000150
11001500	2019-06-30		1	10000017
11001501	2019-06-30		6	10000014
11001502	2019-06-30		2	10000026
11001503	2019-06-30		6	10000015
11001504	2019-06-30		2	10000005
11001505	2019-06-30		2	10000012
11001506	2019-06-30		0	10000152
11001507	2019-06-30		0	10000151
11001508	2019-06-30		1	10000044
11001509	2019-06-30		0	10000133
11001510	2019-07-01		3	10000015
11001511	2019-07-01		6	10000014
11001512	2019-07-01		8.5	10000018
11001513	2019-07-01		1	10000017
11001514	2019-07-01		0	10000023
11001515	2019-07-01		0	10000143
11001517	2019-07-01		0.5	10000005
11001518	2019-07-01		3	10000012
11001519	2019-07-01		1	10000013
11001520	2019-07-01		0	10000133
11001521	2019-07-02		7	10000018
11001522	2019-07-02		0	10000156
11001523	2019-07-02		8	10000014
11001524	2019-07-02		0	10000133
11001525	2019-07-02		0	10000083
11001526	2019-07-02		0	10000155
11001527	2019-07-02		0	10000154
11001528	2019-07-02		1.5	10000013
11001529	2019-07-02		0	10000023
11001530	2019-07-02		1	10000012
11001531	2019-07-02		0.5	10000024
11001532	2019-07-02		0.5	10000005
11001533	2019-07-02		3	10000015
11001534	2019-07-03		0	10000023
11001535	2019-07-03		0	10000133
11001536	2019-07-03		0.5	10000005
11001537	2019-07-03		8.5	10000018
11001538	2019-07-03		0.5	10000026
11001539	2019-07-03		0	10000156
11001540	2019-07-03		1	10000013
11001541	2019-07-03		7.5	10000014
11001542	2019-07-03		2.5	10000015
11001543	2019-07-03		1	10000017
11001544	2019-07-04		0.5	10000017
11001545	2019-07-04		0	10000156
11001546	2019-07-04		0.5	10000005
11001547	2019-07-04		0	10000157
11001548	2019-07-04		1.5	10000016
11001549	2019-07-04		0	10000023
11001550	2019-07-04		0	10000133
11001551	2019-07-04		0	10000010
11001552	2019-07-04		2	10000015
11001553	2019-07-04		1	10000026
11001554	2019-07-04		0	10000143
11001555	2019-07-04		1.5	10000013
11001556	2019-07-04		9.5	10000014
11001557	2019-07-04		9.5	10000018
11001558	2019-07-04		0	10000035
11001559	2019-07-05		0.20000000000000001	10000005
11001560	2019-07-05		2	10000015
11001561	2019-07-05		0.80000000000000004	10000026
11001562	2019-07-05		2	10000013
11001563	2019-07-05		7.5	10000014
11001564	2019-07-05		0	10000133
11001565	2019-07-05		0	10000157
11001566	2019-07-05		1	10000017
11001567	2019-07-05		8	10000018
11001568	2019-07-05		0	10000023
11001569	2019-07-05		0	10000143
11001570	2019-07-06		5	10000014
11001571	2019-07-06		5	10000012
11001572	2019-07-06		5	10000013
11001573	2019-07-06		0	10000020
11001574	2019-07-06		2	10000015
11001575	2019-07-06		0	10000156
11001576	2019-07-06		1	10000005
11001577	2019-07-06		0	10000158
11001578	2019-07-06		0	10000143
11001579	2019-07-06		4	10000017
11001580	2019-07-06		0	10000133
11001582	2019-07-07		5.5	10000163
11001583	2019-07-07		1	10000160
11001584	2019-07-07		0.5	10000169
11001585	2019-07-07		0.5	10000164
11001586	2019-07-07		4	10000170
11001587	2019-07-07		0.5	10000166
11001588	2019-07-07		0.5	10000167
11001589	2019-07-07		0.5	10000168
11001590	2019-07-07		0	10000077
11001591	2019-07-07		0	10000133
11001592	2019-07-07		0.5	10000171
11001593	2019-07-07		0	10000143
11001594	2019-07-07		4	10000165
11001595	2019-07-07		1	10000162
11001596	2019-07-07		0	10000010
11001597	2019-07-07		0.5	10000161
11001598	2019-07-07		0	10000158
11001599	2019-07-07		7	10000014
11001600	2019-07-07		0	10000156
11001601	2019-07-08		0	10000172
11001602	2019-07-08		0.25	10000171
11001603	2019-07-08		7.5	10000014
11001604	2019-07-08		0.5	10000170
11001605	2019-07-08		1.25	10000160
11001606	2019-07-08		0.5	10000162
11001607	2019-07-08		0	10000133
11001608	2019-07-08		1.5	10000163
11001609	2019-07-08		0	10000077
11001610	2019-07-08		0	10000143
11001611	2019-07-08		8	10000173
11001612	2019-07-08		2.5	10000165
11001613	2019-07-08		1.5	10000166
11001614	2019-07-08		1	10000167
11001615	2019-07-08		0	10000023
11001616	2019-07-08		0.5	10000164
11001617	2019-07-09		0.5	10000164
11001618	2019-07-09		0	10000077
11001619	2019-07-09		1	10000165
11001620	2019-07-09		0.5	10000161
11001621	2019-07-09		0	10000143
11001622	2019-07-09		2	10000170
11001623	2019-07-09		0.5	10000171
11001624	2019-07-09		7.5	10000014
11001625	2019-07-09		0.5	10000162
11001626	2019-07-09		0	10000172
11001627	2019-07-09		0	10000133
11001628	2019-07-09		1	10000160
11001629	2019-07-09		9	10000173
11001630	2019-07-09		0.5	10000166
11001631	2019-07-09		0	10000023
11001632	2019-07-09		1	10000163
11001633	2019-07-10		0.5	10000166
11001634	2019-07-10		0	10000051
11001635	2019-07-10		3	10000160
11001636	2019-07-10		7.5	10000014
11001637	2019-07-10		0.25	10000164
11001638	2019-07-10		0	10000077
11001639	2019-07-10		0.5	10000171
11001640	2019-07-10		0	10000023
11001641	2019-07-10		0.25	10000162
11001642	2019-07-10		0	10000133
11001643	2019-07-10		8.5	10000173
11001645	2019-07-10		2	10000169
11001646	2019-07-10		1	10000170
11001647	2019-07-11		1.5	10000160
11001648	2019-07-11		0	10000072
11001649	2019-07-11		0	10000133
11001650	2019-07-11		2	10000169
11001651	2019-07-11		0.5	10000168
11001652	2019-07-11		0	10000023
11001653	2019-07-11		0.25	10000166
11001654	2019-07-11		7	10000014
11001655	2019-07-11	惘然孤行	0	10000176
11001656	2019-07-11		0	10000172
11001657	2019-07-11		1	10000165
11001658	2019-07-11		1.75	10000170
11001659	2019-07-11		0.5	10000171
11001660	2019-07-11		9	10000173
11001662	2019-07-11		0.5	10000161
11001663	2019-07-11	曹操传，人族无敌	0	10000175
11001664	2019-07-12		0.5	10000162
11001665	2019-07-12	曹操传，人族无敌,冰封王座，10英雄,大地裂缝	0	10000175
11001666	2019-07-12		9	10000173
11001667	2019-07-12		0	10000133
11001668	2019-07-12		1.5	10000160
11001669	2019-07-12		7.5	10000014
11001670	2019-07-12		1	10000169
11001671	2019-07-12		0	10000023
11001672	2019-07-12	惘然孤行	0	10000176
11001673	2019-07-12		0.5	10000177
11001674	2019-07-12		4	10000170
11001675	2019-07-12		0	10000073
11001676	2019-07-12		0.5	10000166
11001677	2019-07-12		0.5	10000168
11001678	2019-07-12		0	10000077
11001679	2019-07-13		0	10000180
11001680	2019-07-13		0	10000172
11001682	2019-07-13		0	10000073
11001683	2019-07-13	曹操传，人族无敌,冰封王座，10英雄,大地裂缝	0	10000175
11001684	2019-07-13	洲际赛IGvsSKT	0	10000179
11001685	2019-07-13		0	10000133
11001686	2019-07-13		7	10000170
11001687	2019-07-13		0	10000077
11001688	2019-07-13		1	10000164
11001689	2019-07-13		4	10000168
11001690	2019-07-13		1	10000165
11001691	2019-07-13		0.5	10000162
11001692	2019-07-13		0.5	10000160
11001693	2019-07-13		0.5	10000161
11001694	2019-07-13		9.5	10000014
11001695	2019-07-14		0	10000077
11001696	2019-07-14		9	10000170
11001697	2019-07-14		0	10000187
11001698	2019-07-14		6	10000014
11001699	2019-07-14		1	10000161
11001700	2019-07-14	洲际赛IGvsSKT	0	10000179
11001701	2019-07-14		0	10000181
11001702	2019-07-14		0	10000182
11001703	2019-07-14		0	10000183
11001704	2019-07-14		0	10000184
11001707	2019-07-14		2	10000168
11001708	2019-07-14		0.5	10000164
11001710	2019-07-14		1.5	10000160
11001711	2019-07-14		0.5	10000169
11001712	2019-07-14		0	10000078
11001713	2019-07-14		0	10000133
11001714	2019-07-15		0	10000189
11001715	2019-07-15		8.5	10000014
11001716	2019-07-15		0	10000020
11001717	2019-07-15		1	10000163
11001718	2019-07-15		5	10000170
11001719	2019-07-15		0	10000190
11001720	2019-07-15		2	10000168
11001722	2019-07-16		0.5	10000166
11001723	2019-07-16		0	10000077
11001724	2019-07-16		1	10000160
11001726	2019-07-16		1	10000163
11001727	2019-07-16		0	10000020
11001728	2019-07-16		0	10000133
11001729	2019-07-16		6.5	10000014
11001730	2019-07-16		5.5	10000170
11001731	2019-07-16		0	10000023
11001732	2019-07-16		8.5	10000173
11001733	2019-07-17		8.5	10000173
11001734	2019-07-17		1	10000160
11001735	2019-07-17		0.5	10000161
11001736	2019-07-17		0	10000077
11001737	2019-07-17		0	10000133
11001738	2019-07-17		0	10000020
11001739	2019-07-17		0	10000083
11001740	2019-07-17		7.75	10000170
11001741	2019-07-17		0	10000023
11001742	2019-07-17		0.25	10000166
11001744	2019-07-17		6.5	10000014
11001745	2019-07-18		0.5	10000166
11001746	2019-07-18		9	10000173
11001747	2019-07-18		0	10000020
11001748	2019-07-18		0	10000023
11001749	2019-07-18		5.5	10000014
11001750	2019-07-18		0	10000192
11001752	2019-07-18		0	10000191
11001753	2019-07-18		0.5	10000161
11001754	2019-07-18		4	10000163
11001755	2019-07-18		4.5	10000170
11001756	2019-07-18		1	10000160
11001757	2019-07-18		0	10000133
11001758	2019-08-04		2	10000160
11001759	2019-08-04		1	10000162
11001760	2019-08-04		0	10000078
11001761	2019-08-04		6	10000014
11001762	2019-08-04		0	10000077
11001763	2019-08-04		1	10000075
11001681	2019-07-13		0	10000074
11001705	2019-07-14		0	10000224
11001709	2019-07-14		0	10000009
11001706	2019-07-14		0	10000195
11001764	2019-08-04		0	10000193
11001765	2019-08-04		2	10000169
11001766	2019-08-04		3	10000166
11001767	2019-08-04		1	10000161
11001768	2019-08-04		6	10000170
11001769	2019-08-04		0	10000194
11001770	2019-08-04		3	10000168
11001771	2019-08-04		0	10000195
11001772	2019-08-04		0	10000196
11001773	2019-08-05		0	10000023
11001774	2019-08-05		0	10000194
11001775	2019-08-05		0	10000077
11001776	2019-08-05		0	10000195
11001777	2019-08-05		0	10000020
11001778	2019-08-05		1.5	10000160
11001779	2019-08-05		3	10000169
11001780	2019-08-05		8	10000173
11001781	2019-08-05		1	10000162
11001782	2019-08-05		3	10000170
11001783	2019-08-05		6	10000014
11001784	2019-08-05		1	10000168
11001785	2019-08-05		0.5	10000164
11001786	2019-08-06		0.5	10000161
11001787	2019-08-06		3	10000170
11001788	2019-08-06		0	10000195
11001789	2019-08-06		1	10000020
11001790	2019-08-06		0	10000194
11001791	2019-08-06		0	10000023
11001792	2019-08-06		0	10000197
11001793	2019-08-06		5	10000014
11001794	2019-08-06		4	10000169
11001795	2019-08-06		0	10000077
11001796	2019-08-06		8.5	10000173
11001797	2019-08-06		1.5	10000160
11001798	2019-08-06		1.5	10000163
11001799	2019-08-07		4	10000169
11001800	2019-08-07		0	10000197
11001801	2019-08-07		0	10000195
11001802	2019-08-07		2	10000170
11001803	2019-08-07		5	10000014
11001804	2019-08-07		0	10000023
11001805	2019-08-07		8	10000173
11001806	2019-08-07		1.5	10000160
11001807	2019-08-08		5	10000170
11001808	2019-08-08		0	10000198
11001809	2019-08-08		3	10000169
11001810	2019-08-08		0	10000195
11001811	2019-08-08		1	10000161
11001812	2019-08-08		2	10000160
11001813	2019-08-08		0	10000197
11001814	2019-08-08		8.5	10000173
11001815	2019-08-08		6	10000014
11001816	2019-08-08		0	10000023
11001817	2019-08-09		0	10000195
11001818	2019-08-09		2	10000168
11001819	2019-08-09		1	10000160
11001820	2019-08-09		0.5	10000161
11001821	2019-08-09		5	10000014
11001822	2019-08-09		7.5	10000173
11001823	2019-08-09		0	10000023
11001824	2019-08-09		5	10000170
11001825	2019-08-09		0	10000197
11001826	2019-08-09		3	10000169
11001827	2019-08-10		1	10000168
11001828	2019-08-10		0	10000078
11001829	2019-08-10		0	10000195
11001830	2019-08-10		6	10000169
11001831	2019-08-10		0	10000197
11001832	2019-08-10		7	10000014
11001833	2019-08-10		11	10000170
11001834	2019-08-11		2	10000163
11001835	2019-08-11		0	10000083
11001836	2019-08-11		1	10000161
11001837	2019-08-11		1.5	10000201
11001838	2019-08-11		0.20000000000000001	10000166
11001839	2019-08-11		1	10000168
11001840	2019-08-11		8	10000170
11001841	2019-08-11		0	10000195
11001842	2019-08-11		0	10000199
11001843	2019-08-11		6	10000014
11001844	2019-08-11		1.5	10000160
11001845	2019-08-11		0	10000020
11001846	2019-08-11		0	10000200
11001847	2019-08-11		0	10000133
11001848	2019-08-12		0	10000203
11001849	2019-08-12		1	10000201
11001850	2019-08-12		0	10000202
11001851	2019-08-12		0	10000020
11001852	2019-08-12		0	10000130
11001853	2019-08-12		1	10000163
11001854	2019-08-12		0	10000205
11001855	2019-08-12		0.5	10000164
11001857	2019-08-12		1	10000168
11001858	2019-08-12		5	10000161
11001859	2019-08-12		6	10000170
11001860	2019-08-12		1	10000162
11001861	2019-08-12		1.5	10000160
11001862	2019-08-12		3	10000165
11001863	2019-08-12		0	10000195
11001864	2019-08-12		5.5	10000014
11001865	2019-08-12		0	10000133
11001866	2019-08-12		0	10000204
11001867	2019-08-13		0	10000027
11001868	2019-08-13		0.5	10000168
11001869	2019-08-13		0	10000207
11001870	2019-08-13		0.5	10000171
11001871	2019-08-13		0	10000208
11001872	2019-08-13		1.5	10000160
11001873	2019-08-13		7	10000173
11001874	2019-08-13		0.5	10000161
11001875	2019-08-13		0	10000072
11001876	2019-08-13		0	10000023
11001877	2019-08-13		1	10000165
11001878	2019-08-13		7	10000014
11001879	2019-08-13		0	10000210
11001880	2019-08-13		0	10000209
11001881	2019-08-13		0.25	10000166
11001882	2019-08-13		0	10000206
11001883	2019-08-13		3	10000169
11001884	2019-08-13		0.5	10000177
11001885	2019-08-14		7	10000014
11001886	2019-08-14		0.5	10000171
11001887	2019-08-14		1.5	10000169
11001888	2019-08-14		8	10000173
11001889	2019-08-14		0.5	10000163
11001890	2019-08-14		1.5	10000160
11001891	2019-08-14	cSetMatchRec.exe	0	10000027
11001892	2019-08-14		0	10000195
11001893	2019-08-14		1	10000165
11001894	2019-08-14		0	10000209
11001895	2019-08-14		2.5	10000170
11001896	2019-08-14		0	10000023
11001897	2019-08-14		0	10000207
11001898	2019-08-14		0	10000206
11001899	2019-08-14		0.5	10000161
11001900	2019-08-14		0	10000143
11001901	2019-08-15		0.5	10000163
11001902	2019-08-15		1.5	10000169
11001903	2019-08-15		0	10000207
11001904	2019-08-15		8	10000173
11001905	2019-08-15		0.5	10000161
11001906	2019-08-15	cSetMatchRec.exe	0	10000027
11001907	2019-08-15		6.5	10000014
11001908	2019-08-15		0	10000143
11001909	2019-08-15		0.5	10000171
11001910	2019-08-15		0	10000211
11001911	2019-08-15		0.5	10000164
11001912	2019-08-15		2.5	10000170
11001913	2019-08-15		0	10000195
11001914	2019-08-15		1	10000160
11001915	2019-08-15		0	10000209
11001916	2019-08-15		1.5	10000165
11001917	2019-08-16		0	10000211
11001918	2019-08-16		2	10000165
11001919	2019-08-16		0	10000209
11001920	2019-08-16		0	10000207
11001921	2019-08-16		0.5	10000161
11001922	2019-08-16		2.5	10000169
11001923	2019-08-16		0.5	10000163
11001924	2019-08-16		1.5	10000160
11001925	2019-08-16		8	10000173
11001926	2019-08-16	cSetMatchRec.exe	0	10000027
11001927	2019-08-16		0	10000143
11001928	2019-08-16		0.5	10000171
11001929	2019-08-16		1.5	10000170
11001930	2019-08-16		0	10000195
11001931	2019-08-16		5.5	10000014
11001932	2019-08-17		7	10000169
11001933	2019-08-17		9	10000014
11001934	2019-08-17		0	10000211
11001935	2019-08-17		7	10000170
11001936	2019-08-17		0.5	10000164
11001937	2019-08-17		0	10000195
11001938	2019-08-17		0.5	10000160
11001939	2019-08-18		0.5	10000161
11001940	2019-08-18		0	10000147
11001941	2019-08-18		0	10000042
11001942	2019-08-18		6	10000170
11001943	2019-08-18		2	10000163
11001944	2019-08-18		1	10000160
11001945	2019-08-18		0	10000212
11001946	2019-08-18		0	10000195
11001947	2019-08-18		0	10000211
11001948	2019-08-18		0	10000078
11001949	2019-08-18		6	10000014
11001950	2019-08-18		0.5	10000164
11001951	2019-08-18		3	10000168
11001952	2019-08-18		5	10000169
11001953	2019-08-19		1	10000160
11001954	2019-08-19		8	10000173
11001955	2019-08-19		0	10000211
11001956	2019-08-19	cSetMatchRec.exe	0	10000027
11001957	2019-08-19		2	10000170
11001958	2019-08-19		4	10000169
11001959	2019-08-19		0.5	10000163
11001960	2019-08-19		7	10000014
11001961	2019-08-19		0	10000143
11001962	2019-08-19		0	10000195
11001963	2019-08-20		0.5	10000163
11001964	2019-08-20		0.5	10000161
11001965	2019-08-20		8	10000173
11001966	2019-08-20		0	10000195
11001967	2019-08-20		0	10000143
11001968	2019-08-20		2	10000170
11001969	2019-08-20		0	10000211
11001970	2019-08-20		7	10000169
11001971	2019-08-20		5	10000014
11001972	2019-08-20		1	10000160
11001973	2019-08-20	cSetMatchRec.exe	0	10000027
11001974	2019-08-21		8	10000014
11001975	2019-08-21		0.5	10000164
11001976	2019-08-21		0.5	10000163
11001977	2019-08-21		4	10000169
11001978	2019-08-21	cSetMatchRec.exe	0	10000027
11001979	2019-08-21		1	10000160
11001980	2019-08-21		0	10000211
11001981	2019-08-21		0	10000143
11001982	2019-08-21		8	10000173
11001983	2019-08-22		0.5	10000163
11001984	2019-08-22		0	10000211
11001985	2019-08-22		0	10000143
11001986	2019-08-22		2	10000170
11001987	2019-08-22		1	10000160
11001988	2019-08-22		0	10000195
11001989	2019-08-22		5.5	10000014
11001990	2019-08-22	cSetMatchRec.exe	0	10000027
11001991	2019-08-22		8	10000173
11001992	2019-08-22		4	10000169
11001993	2019-08-23		0	10000143
11001994	2019-08-23		8	10000173
11001995	2019-08-23		0	10000213
11001996	2019-08-23		0	10000211
11001997	2019-08-23	cSetMatchRec.exe	0	10000027
11001998	2019-08-23		0	10000195
11001999	2019-08-23		3	10000170
11002000	2019-08-23		2	10000162
11002001	2019-08-23		6	10000169
11002002	2019-08-23		5	10000014
11002003	2019-08-23		1	10000160
11002004	2019-08-24		0	10000195
11002005	2019-08-24		3	10000170
11002006	2019-08-24		0	10000203
11002007	2019-08-24		2	10000162
11002008	2019-08-24		0	10000211
11002009	2019-08-24		6	10000014
11002010	2019-08-24		0	10000213
11002011	2019-08-24		6	10000169
11002012	2019-08-24		2	10000201
11002013	2019-08-25		7	10000014
11002014	2019-08-25		0	10000211
11002015	2019-08-25		0.5	10000161
11002016	2019-08-25		3	10000170
11002017	2019-08-25		0	10000020
11002018	2019-08-25		1	10000163
11002019	2019-08-25		0	10000195
11002020	2019-08-25		12	10000169
11002021	2019-08-26		0	10000211
11002022	2019-08-26		7	10000014
11002023	2019-08-26		5	10000169
11002024	2019-08-26		1.5	10000160
11002025	2019-08-26		3	10000170
11002026	2019-08-26	cSetMatchRec.exe	0	10000027
11002027	2019-08-26		8	10000173
11002028	2019-08-27		7.5	10000014
11002029	2019-08-27		0.5	10000133
11002030	2019-08-27		0.5	10000203
11002031	2019-08-27		1.5	10000195
11002032	2019-08-27		1.5	10000160
11002033	2019-08-27		0.5	10000164
11002034	2019-08-27		0.5	10000035
11002035	2019-08-27		1.5	10000143
11002036	2019-08-27	cSetMatchRec.exe	8	10000027
11002037	2019-08-27		1.5	10000211
11002038	2019-08-28	cSetMatchRec.exe	8	10000027
11002039	2019-08-28		7.5	10000014
11002040	2019-08-28		1.5	10000143
11002041	2019-08-28		4	10000214
11002042	2019-08-28		1.5	10000195
11002043	2019-08-29		7.5	10000014
11002044	2019-08-29	cSetMatchRec.exe	8	10000027
11002045	2019-08-29		1.5	10000143
11002046	2019-08-30		7.5	10000014
11002047	2019-08-30		0.5	10000164
11002048	2019-08-30	cSetMatchRec.exe	8	10000027
11002049	2019-08-30		2	10000215
11002050	2019-08-30		0.5	10000035
11002051	2019-08-31		2	10000215
11002052	2019-08-31		1	10000160
11002053	2019-08-31		2	10000216
11002054	2019-08-31		1	10000078
11002055	2019-08-31		1	10000212
11002056	2019-08-31		1.5	10000195
11002057	2019-08-31		1	10000164
11002058	2019-08-31		7.5	10000014
11002059	2019-08-31		2	10000077
11002060	2019-08-31		0.5	10000035
11002061	2019-09-01		7.5	10000014
11002062	2019-09-01		2	10000215
11002063	2019-09-01		1	10000160
11002064	2019-09-01		3	10000217
11002065	2019-09-01		0.5	10000164
11002066	2019-09-01		1	10000020
11002067	2019-09-01		3	10000175
11002068	2019-09-01		1.5	10000218
11002069	2019-09-01		1.5	10000195
11002070	2019-09-01		2	10000077
11002071	2019-09-02		1	10000160
11002072	2019-09-02		8.5	10000027
11002073	2019-09-02		2.5	10000219
11002074	2019-09-02		0.5	10000035
11002075	2019-09-02		1	10000207
11002076	2019-09-02		2	10000010
11002077	2019-09-02		6	10000014
11002078	2019-09-03		8	10000027
11002079	2019-09-03		0.5	10000195
11002080	2019-09-03		2.5	10000219
11002081	2019-09-03		7.5	10000014
11002082	2019-09-03		1	10000160
11002083	2019-09-03		2	10000218
11002084	2019-09-03		0.5	10000035
11002085	2019-09-03		1.5	10000207
11002086	2019-09-04		0.5	10000195
11002087	2019-09-04		8.5	10000027
11002088	2019-09-04		7.5	10000014
11002089	2019-09-04		1	10000143
11002090	2019-09-04		1	10000160
11002091	2019-09-04		0.5	10000035
11002092	2019-09-04		2.5	10000219
11002093	2019-09-04		2	10000218
11002094	2019-09-05		0.5	10000035
11002095	2019-09-05		1	10000218
11002096	2019-09-05		7.5	10000014
11002097	2019-09-05		1.5	10000207
11002098	2019-09-05		9.5	10000027
11002099	2019-09-05		3	10000219
11002100	2019-09-05		3	10000195
11002101	2019-09-05		1	10000160
11002102	2019-09-06		0.5	10000009
11002103	2019-09-06		2	10000219
11002104	2019-09-06		1	10000143
11002105	2019-09-06		1	10000160
11002106	2019-09-06		5.5	10000014
11002107	2019-09-06		2	10000147
11002108	2019-09-06		0.5	10000035
11002109	2019-09-06		8.5	10000027
11002110	2019-09-07		4	10000219
11002111	2019-09-07		1	10000221
11002112	2019-09-07		1	10000195
11002113	2019-09-07		5.5	10000014
11002114	2019-09-07		0.5	10000035
11002115	2019-09-07		2	10000160
11002116	2019-09-07		8	10000220
11002117	2019-09-07		1.5	10000020
11002118	2019-09-08		2	10000218
11002119	2019-09-08		2	10000160
11002120	2019-09-08		0.5	10000035
11002121	2019-09-08		8	10000221
11002122	2019-09-08		7.5	10000014
11002123	2019-09-08		3	10000219
11002124	2019-09-09		2	10000221
11002125	2019-09-09		2	10000218
11002126	2019-09-09		0.5	10000035
11002127	2019-09-09		0.5	10000222
11002128	2019-09-09		2	10000160
11002129	2019-09-09		3	10000219
11002130	2019-09-09		7.5	10000014
11002131	2019-09-09		5.5	10000027
11002132	2019-09-10		8.5	10000027
11002133	2019-09-10		3	10000219
11002134	2019-09-10		7.5	10000014
11002135	2019-09-10		0.5	10000035
11002136	2019-09-10		1.5	10000195
11002137	2019-09-10		0.5	10000083
11002138	2019-09-10		1	10000160
11002139	2019-09-11		0.5	10000035
11002140	2019-09-11		1	10000207
11002141	2019-09-11		1	10000223
11002142	2019-09-11		0.5	10000224
11002143	2019-09-11		1	10000143
11002144	2019-09-11		1	10000160
11002145	2019-09-11		7.5	10000014
11002146	2019-09-11		7.5	10000027
11002147	2019-09-11		3	10000195
11002148	2019-09-11		0.5	10000225
11002149	2019-09-11		0.5	10000133
11002150	2019-09-12		1.5	10000143
11002151	2019-09-12		0.5	10000224
11002152	2019-09-12		0.5	10000035
11002153	2019-09-12		1	10000160
11002154	2019-09-12		1.5	10000133
11002155	2019-09-12		6.5	10000014
11002156	2019-09-12		1.5	10000195
11002157	2019-09-12		0.5	10000112
11002158	2019-09-12		8.5	10000027
11002159	2019-09-13		2	10000010
11002160	2019-09-13		2	10000143
11002161	2019-09-13		0.5	10000224
11002162	2019-09-13		0.5	10000207
11002163	2019-09-13		1	10000160
11002164	2019-09-13		9	10000014
11002165	2019-09-13		0.5	10000133
11002166	2019-09-13		1.5	10000223
11002167	2019-09-13		7	10000027
11002168	2019-09-13		0.5	10000035
11002169	2019-09-14		3	10000224
11002170	2019-09-14		0.5	10000207
11002171	2019-09-14		0.5	10000204
11002172	2019-09-14		1	10000230
11002173	2019-09-14		0.5	10000227
11002174	2019-09-14		0.5	10000228
11002175	2019-09-14		0.5	10000051
11002176	2019-09-14		0.5	10000226
11002177	2019-09-14		7	10000014
11002178	2019-09-14		0.5	10000078
11002179	2019-09-14		4	10000195
11002180	2019-09-14		0.20000000000000001	10000225
11002181	2019-09-14	战锤	0.5	10000229
11002182	2019-09-14		0.5	10000072
11002183	2019-09-14		0.5	10000223
11002184	2019-09-14		1	10000106
11002185	2019-09-14	寸寸头，剪过头了	0.5	10000110
11002186	2019-09-14		1.5	10000020
11002187	2019-09-14		0.5	10000160
11002188	2019-09-14		1.3	10000133
11002189	2019-09-15		0.5	10000143
11002190	2019-09-15		2	10000231
11002191	2019-09-15		3	10000195
11002192	2019-09-15		2	10000233
11002193	2019-09-15		1.5	10000020
11002194	2019-09-15		0.69999999999999996	10000133
11002195	2019-09-15		0.5	10000035
11002196	2019-09-15		1	10000160
11002197	2019-09-15		1	10000183
11002198	2019-09-15		7.5	10000014
11002199	2019-09-15		3	10000224
11002200	2019-09-15		1	10000232
11002201	2019-09-16		5	10000195
11002202	2019-09-16		0.5	10000231
11002203	2019-09-16		0.5	10000083
11002204	2019-09-16		0.5	10000101
11002205	2019-09-16		1.5	10000160
11002206	2019-09-16		6.5	10000014
11002207	2019-09-16		1.5	10000133
11002208	2019-09-16		1	10000236
11002209	2019-09-16		0.5	10000225
11002211	2019-09-16		0.5	10000224
11002212	2019-09-16		0.5	10000035
11002213	2019-09-16		0.5	10000235
11002214	2019-09-16		0.5	10000020
11002215	2019-09-16		2	10000143
11002216	2019-09-17		1	10000231
11002217	2019-09-17		0.5	10000035
11002218	2019-09-17		9.5	10000014
11002219	2019-09-17		7	10000027
11002220	2019-09-17		1	10000143
11002221	2019-09-17		1.5	10000160
11002222	2019-09-17		1.5	10000133
11002223	2019-09-17	绑不好	0.5	10000207
11002224	2019-09-17		1	10000218
11002225	2019-09-17		0.5	10000237
11002226	2019-09-18		1	10000224
11002227	2019-09-18		1	10000160
11002228	2019-09-18		2	10000218
11002229	2019-09-18		2.5	10000231
11002230	2019-09-18		1.5	10000143
11002231	2019-09-18		0.5	10000035
11002232	2019-09-18		1.5	10000238
11002233	2019-09-18		1	10000239
11002234	2019-09-18		4	10000027
11002235	2019-09-18		1.5	10000133
11002236	2019-09-18		7.5	10000014
11002237	2019-09-19		8.5	10000014
11002238	2019-09-19	绑不好	0.5	10000207
11002239	2019-09-19		0.5	10000072
11002240	2019-09-19		0.5	10000035
11002241	2019-09-19		1	10000238
11002242	2019-09-19		1.5	10000231
11002243	2019-09-19		1	10000224
11002244	2019-09-19		0.5	10000010
11002245	2019-09-19		1.5	10000160
11002246	2019-09-19		7	10000027
11002247	2019-09-19		0.5	10000240
11002248	2019-09-19		1.5	10000133
11002249	2019-09-20		6.5	10000027
11002250	2019-09-20		1	10000231
11002251	2019-09-20		0.5	10000133
11002252	2019-09-20		1.5	10000143
11002253	2019-09-20		1.5	10000238
11002254	2019-09-20		0.5	10000218
11002255	2019-09-20		1	10000224
11002256	2019-09-20		0.5	10000160
11002257	2019-09-20	海底总动员等	2	10000241
11002258	2019-09-20		8.5	10000014
11002259	2019-09-21		0.5	10000243
11002260	2019-09-21		1	10000244
11002261	2019-09-21		3.5	10000242
11002262	2019-09-21		1	10000160
11002263	2019-09-21		2	10000245
11002264	2019-09-21		1	10000224
11002265	2019-09-21		0.5	10000218
11002266	2019-09-21		0.5	10000035
11002267	2019-09-21		0.5	10000133
11002268	2019-09-21		1	10000231
11002269	2019-09-21		2.5	10000077
11002270	2019-09-21	及其他恐怖电影，小岛惊魂	3	10000108
11002271	2019-09-21		0.5	10000020
11002272	2019-09-21		6.5	10000014
11002273	2019-09-21		2	10000195
11002274	2019-09-22		4	10000224
11002275	2019-09-22		1.5	10000175
11002276	2019-09-22		4	10000195
11002277	2019-09-22		2	10000245
11002278	2019-09-22		0.5	10000246
11002279	2019-09-22		0.25	10000133
11002280	2019-09-22		4	10000218
11002281	2019-09-22		7	10000014
11002282	2019-09-23		2	10000133
11002283	2019-09-23		0.5	10000083
11002284	2019-09-23		0.5	10000235
11002285	2019-09-23		1	10000020
11002286	2019-09-23		10	10000224
11002287	2019-09-23		1.5	10000160
11002288	2019-09-23		1	10000035
11002289	2019-09-23		3	10000247
11002290	2019-09-23		0.5	10000248
11002291	2019-09-23		7	10000014
11002292	2019-09-24		7.5	10000014
11002293	2019-09-24		2	10000133
11002294	2019-09-24		1	10000207
11002295	2019-09-24		4	10000027
11002296	2019-09-24		1	10000160
11002297	2019-09-24		0.5	10000035
11002298	2019-09-24		3	10000250
11002299	2019-09-24		1	10000251
11002300	2019-09-24		1	10000249
11002301	2019-09-25		0.5	10000035
11002302	2019-09-25		1	10000160
11002303	2019-09-25		1	10000251
11002304	2019-09-25		4	10000027
11002305	2019-09-25		2	10000133
11002306	2019-09-25		0.5	10000253
11002307	2019-09-25		0.5	10000252
11002308	2019-09-25		2.5	10000255
11002309	2019-09-25		1	10000256
11002310	2019-09-25		0.5	10000257
11002311	2019-09-25		6.5	10000014
11002312	2019-09-25		3	10000254
11002313	2019-09-26		8.5	10000014
11002314	2019-09-26		6.5	10000027
11002315	2019-09-26		1	10000160
11002316	2019-09-26		0.5	10000035
11002317	2019-09-26	不修了	0.5	10000247
11002318	2019-09-26		1.5	10000133
11002319	2019-09-26		2	10000251
11002320	2019-09-26		0.5	10000258
11002321	2019-09-26		1	10000259
11002322	2019-09-26	听不懂	0.5	10000260
11002323	2019-09-27		1	10000160
11002324	2019-09-27		5	10000251
11002325	2019-09-27		1	10000133
11002326	2019-09-27		7	10000027
11002327	2019-09-27		10	10000014
11002328	2019-09-27		1	10000259
11002329	2019-09-27		1	10000207
11002330	2019-09-27		0.5	10000261
11002331	2019-09-27		0.5	10000035
11002332	2019-09-28		5.5	10000014
11002333	2019-09-28		1	10000020
11002334	2019-09-28		0.5	10000072
11002335	2019-09-28		1	10000258
11002336	2019-09-28		1	10000133
11002337	2019-09-28		1.5	10000160
11002338	2019-09-28		1	10000259
11002339	2019-09-28		1	10000262
11002340	2019-09-28		5	10000251
11002341	2019-09-28		1.5	10000267
11002342	2019-09-28		0.5	10000266
11002343	2019-09-28		0.5	10000035
11002344	2019-09-28		0.5	10000265
11002345	2019-09-28		2	10000264
11002346	2019-09-28	走向和自毁倾向？	0.5	10000250
11002347	2019-09-28		1	10000263
11002348	2019-09-29		0.5	10000020
11002349	2019-09-29		1	10000160
11002350	2019-09-29		0.5	10000133
11002351	2019-09-29	又被坑1万	1	10000269
11002352	2019-09-29		1	10000060
11002353	2019-09-29		0.5	10000205
11002354	2019-09-29		0.5	10000130
11002355	2019-09-29		0.5	10000035
11002356	2019-09-29		4.5	10000251
11002357	2019-09-29		0.5	10000264
11002358	2019-09-29		1.5	10000268
11002359	2019-09-29		0.5	10000270
11002360	2019-09-29	李洪乐	0.5	10000271
11002361	2019-09-29		6.5	10000014
11002362	2019-09-29		0.5	10000272
11002363	2019-09-30		0.5	10000277
11002364	2019-09-30		10.5	10000014
11002365	2019-09-30		1.5	10000133
11002366	2019-09-30		0.5	10000274
11002367	2019-09-30		1	10000251
11002368	2019-09-30		0.5	10000276
11002369	2019-09-30		0.5	10000035
11002370	2019-09-30		1	10000278
11002371	2019-09-30	merukari	0.5	10000275
11002372	2019-09-30	记它作甚	0.5	10000273
11002373	2019-09-30		1	10000160
11002374	2019-09-30		7	10000027
11002375	2019-10-01		1.5	10000279
11002376	2019-10-01		1.5	10000133
11002377	2019-10-01		0.5	10000035
11002378	2019-10-01		1	10000160
11002379	2019-10-01		1	10000251
11002380	2019-10-01		0.5	10000276
11002381	2019-10-01		2	10000027
11002382	2019-10-01		4	10000010
11002383	2019-10-01		0.5	10000262
11002384	2019-10-01		1	10000207
11002385	2019-10-01		8.5	10000014
11002386	2019-10-01		0.5	10000280
11002387	2019-10-01		1	10000278
11002388	2019-10-02		1.5	10000276
11002389	2019-10-02		0.5	10000251
11002390	2019-10-02		0.5	10000035
11002391	2019-10-02		1	10000160
11002392	2019-10-02		4	10000027
11002393	2019-10-02		1.5	10000133
11002394	2019-10-02		3.5	10000010
11002395	2019-10-02		0.5	10000262
11002396	2019-10-02		1	10000280
11002397	2019-10-02		8	10000014
11002398	2019-10-02		0.5	10000281
11002399	2019-10-03		3	10000010
11002400	2019-10-03		0.5	10000262
11002401	2019-10-03		0.5	10000264
11002402	2019-10-03		1	10000285
11002403	2019-10-03		0.5	10000284
11002404	2019-10-03		8.5	10000014
11002405	2019-10-03		1	10000283
11002406	2019-10-03		4	10000027
11002407	2019-10-03		0.5	10000035
11002408	2019-10-03		1	10000133
11002409	2019-10-03		1	10000282
11002410	2019-10-03		1.5	10000160
11002411	2019-10-03		1	10000276
11002412	2019-10-04		0.5	10000035
11002413	2019-10-04		3	10000010
11002414	2019-10-04		0.5	10000261
11002415	2019-10-04		1	10000160
11002416	2019-10-04		1	10000283
11002417	2019-10-04		5	10000027
11002418	2019-10-04		7.5	10000014
11002419	2019-10-04		2	10000147
11002420	2019-10-04		1.5	10000276
11002421	2019-10-04		1	10000133
11002422	2019-10-05		3	10000258
11002423	2019-10-05		0.5	10000035
11002424	2019-10-05		1.5	10000160
11002425	2019-10-05		1.5	10000133
11002426	2019-10-05		0.5	10000288
11002427	2019-10-05		1	10000278
11002428	2019-10-05		1	10000020
11002429	2019-10-05		1.5	10000276
11002430	2019-10-05		7	10000014
11002431	2019-10-05		7	10000286
11002432	2019-10-05		1	10000287
11002433	2019-10-06	Windows	5	10000286
11002434	2019-10-06		1	10000133
11002435	2019-10-06		1.5	10000160
11002436	2019-10-06		0.5	10000020
11002437	2019-10-06		5	10000014
11002438	2019-10-06	车上改，改得一团花。回家联系，读不顺。	1.5	10000147
11002439	2019-10-06		0.5	10000276
11002440	2019-10-06	今天微信打不通，但还是通过文字把自己想表达的传达过去了。不该因为对方不能满足自己的需求，就把该自己主动做的事情给拖延了。做好自己，这就是人际交往最基本的要求。	0.10000000000000001	10000243
11002441	2019-10-06		0.5	10000035
11002442	2019-10-06	打不通，发信息说了换钱回去的事，买房子能用。	0.10000000000000001	10000287
11002443	2019-10-06		0.5	10000130
11002445	2019-10-06		1	10000283
11002446	2019-10-06		0.5	10000291
11002447	2019-10-06	包饺子	1.5	10000290
11002448	2019-10-06	现场不会干	1.5	10000289
11002449	2019-10-06		1	10000293
11002555	2019-10-15		0.5	10000035
11002556	2019-10-16		8.5	10000014
11002450	2019-10-06	初三学习紧张的话题，让我也感到自己该更努力一些了。率直的传达这件事，想给他一个自己的行为会自然而然影响他人的概念。但收到微信的是邓阿姨，也不知道该说好还是不好。	0.10000000000000001	10000278
11002451	2019-10-06		0.5	10000083
11002452	2019-10-07	SWIFT電文取込対応、sRptBase研究	7.5	10000027
11002453	2019-10-07	啊，托福单词好难。	1	10000133
11002454	2019-10-07	又忘自行车，跑步去，演讲完就走了	1	10000020
11002455	2019-10-07	清水霖、文萱，简单描述一个人，半个小时很愉快。	0.5	10000208
11002456	2019-10-07		1	10000283
11002457	2019-10-07		0.5	10000035
11002458	2019-10-07	半途冷醒了	6.5	10000014
11002459	2019-10-07	花了几个小时的memo貌似不需要了。Description该改成Memo。	3.5	10000286
11002460	2019-10-07		1	10000276
11002461	2019-10-07		1	10000160
11002462	2019-10-07		0.5	10000262
11002463	2019-10-08	Category好复杂。	3.5	10000286
11002464	2019-10-08		1	10000283
11002465	2019-10-08		0.5	10000262
11002466	2019-10-08		9	10000014
11002467	2019-10-08		0.5	10000133
11002468	2019-10-08	DB扩张好麻烦，	6.5	10000027
11002469	2019-10-08		0.5	10000294
11002470	2019-10-08		1	10000160
11002471	2019-10-08		0.5	10000276
11002472	2019-10-08		0.5	10000035
11002473	2019-10-08		0.5	10000265
11002474	2019-10-09		0.5	10000276
11002475	2019-10-09		8	10000014
11002476	2019-10-09		1	10000130
11002477	2019-10-09	第一阶段完成，该决定前进方向了。整合还是个别处理。\n现在觉得，应该从实用入手，力求最简单的输入，然后再考虑用记录下的数据，显示出5个功能的详细程度。	3	10000286
11002478	2019-10-09	忘了，连十分钟都没学到	0.10000000000000001	10000133
11002479	2019-10-09		1	10000294
11002480	2019-10-09	装电脑，各种不习惯，但目标就是去习惯。	1.5	10000301
11002481	2019-10-09		1	10000283
11002482	2019-10-09		0.5	10000160
11002483	2019-10-09		0.5	10000035
11002484	2019-10-09	xiaojianhan16@gmail.com/Xiao2019	0.20000000000000001	10000300
11002485	2019-10-09	xiaojianhan16@gmail.com/Xiao2019	0.20000000000000001	10000299
11002486	2019-10-09		0.5	10000298
11002487	2019-10-09		0.5	10000297
11002488	2019-10-09		4.5	10000295
11002489	2019-10-09		0.5	10000296
11002490	2019-10-10	好难理解，太多逻辑揉合在一起，简直就是噩梦，其中还有一半是我加进去的。	8	10000295
11002491	2019-10-10		0.5	10000133
11002492	2019-10-10		1	10000276
11002493	2019-10-10		1	10000160
11002494	2019-10-10		0.5	10000035
11002495	2019-10-10		8	10000014
11002496	2019-10-10	数据迁移，居然干到我回不了家了，第一次在公司过夜。	4.5	10000286
11002497	2019-10-11	Xcode第一次安装	1.5	10000301
11002498	2019-10-11		6.5	10000014
11002499	2019-10-11		1.5	10000143
11002500	2019-10-11		1	10000302
11002501	2019-10-11		0.20000000000000001	10000133
11002502	2019-10-11	上班一直在幻象，人物个性和事件时间表，最后希望能把时间长度定在二十年。	4	10000208
11002503	2019-10-11		2.5	10000286
11002504	2019-10-11		0.5	10000035
11002505	2019-10-11		4	10000295
11002506	2019-10-11		1.5	10000160
11002507	2019-10-12		1	10000143
11002508	2019-10-12	中国武术，中国神话	1.5	10000060
11002509	2019-10-12		1	10000308
11002510	2019-10-12		1	10000225
11002511	2019-10-12	很不错，异世界日常。果然还是女性番细腻得多。	1	10000307
11002512	2019-10-12		1	10000306
11002513	2019-10-12	设计，但在家干不下去啊。半天写几个字。	1	10000286
11002514	2019-10-12		0.20000000000000001	10000305
11002515	2019-10-12		0.5	10000304
11002516	2019-10-12		0.5	10000303
11002517	2019-10-12		4	10000294
11002518	2019-10-12		0.5	10000133
11002519	2019-10-12		8	10000014
11002520	2019-10-12	各种软件，密码，好像也没有什么特别的。	1	10000301
11002521	2019-10-12	烧水洗澡，好久不见。	0.5	10000035
11002522	2019-10-12	台风休息	1	10000020
11002523	2019-10-12		1	10000160
11002524	2019-10-13		1.5	10000133
11002525	2019-10-13		0.5	10000035
11002526	2019-10-13		0.5	10000072
11002527	2019-10-13		1.5	10000143
11002528	2019-10-13		0.5	10000160
11002529	2019-10-13	装双系统，结果windows10又没有网卡驱动。系统共享也麻烦，好像直接输共享地址能行。	2.5	10000301
11002530	2019-10-13		4	10000286
11002531	2019-10-13	又一季啊，可惜一个画面就带过了我最想看的邪龙百年战争。	0.5	10000310
11002532	2019-10-13	不好用	0.5	10000309
11002533	2019-10-13	第二季	1	10000232
11002534	2019-10-13		10	10000014
11002535	2019-10-14		9.5	10000286
11002536	2019-10-14		0.5	10000035
11002537	2019-10-14		1	10000076
11002538	2019-10-14		0.5	10000072
11002539	2019-10-14	装Win10，总算基本完成了。	1	10000301
11002540	2019-10-14		1.5	10000143
11002541	2019-10-14		0.5	10000133
11002542	2019-10-14		1	10000160
11002543	2019-10-14		7.5	10000014
11002544	2019-10-15		0.5	10000160
11002545	2019-10-15		4	10000295
11002546	2019-10-15		0.5	10000313
11002547	2019-10-15		2.5	10000312
11002548	2019-10-15		0.5	10000072
11002549	2019-10-15		1	10000133
11002550	2019-10-15		1	10000311
11002551	2019-10-15		3.5	10000286
11002552	2019-10-15		8	10000014
11002553	2019-10-15		1.5	10000143
11002554	2019-10-15		1	10000208
11002557	2019-10-16		5	10000295
11002558	2019-10-16	圣魔，三宗	1	10000208
11002559	2019-10-16		0.5	10000035
11002560	2019-10-16		1	10000207
11002561	2019-10-16		1.5	10000286
11002562	2019-10-16		0.5	10000133
11002563	2019-10-16		0.5	10000315
11002564	2019-10-16	教excel，开发流程	1	10000314
11002565	2019-10-16		1	10000311
11002566	2019-10-16		1	10000160
11002567	2019-10-16		1.5	10000143
11002568	2019-10-17	考虑数据结构，或许总算闹明白了。	3.5	10000286
11002569	2019-10-17	半夜睡不着，美服下载。	0.5	10000077
11002570	2019-10-17		0.5	10000035
11002571	2019-10-17		7	10000014
11002572	2019-10-17		0.5	10000312
11002573	2019-10-17	开不了机，差点以为电脑坏了，太坑了。数据同步然后被删了，又是坑。	2	10000301
11002574	2019-10-17		1	10000160
11002575	2019-10-17		1	10000311
11002576	2019-10-17		1.5	10000316
11002577	2019-10-17		0.5	10000133
11002578	2019-10-17	还在先锋局,得再等两年	1	10000315
11002579	2019-10-17		5	10000295
11002580	2019-10-17		1.5	10000143
11002581	2019-10-18	美服开始	2	10000077
11002582	2019-10-18		3	10000286
11002583	2019-10-18		0.5	10000035
11002584	2019-10-18		2	10000143
11002585	2019-10-18		1	10000160
11002586	2019-10-18		7	10000014
11002587	2019-10-18		1	10000317
11002588	2019-10-18		5	10000311
11002589	2019-10-18		1	10000208
11002590	2019-10-18		0.25	10000133
11002591	2019-10-19		0.5	10000262
11002592	2019-10-19		2	10000009
11002593	2019-10-19	顺便买零食，然后不吃，去公司。	1	10000319
11002594	2019-10-19		0.5	10000035
11002595	2019-10-19		6.5	10000014
11002596	2019-10-19	终于去诊所给看了，希望能根除掉吧，就像牙疼一样。	1	10000318
11002597	2019-10-19		0.5	10000307
11002598	2019-10-19		2	10000195
11002599	2019-10-19		1	10000143
11002600	2019-10-19		1	10000133
11002601	2019-10-19		0.5	10000304
11002602	2019-10-19		0.5	10000020
11002603	2019-10-19		4.5	10000286
11002604	2019-10-19		1	10000077
11002605	2019-10-19		0.5	10000160
11002606	2019-10-20		0.5	10000133
11002607	2019-10-20		1	10000143
11002608	2019-10-20	没有好好睡，也补不好。	7.5	10000014
11002609	2019-10-20		2.5	10000020
11002610	2019-10-20		2	10000195
11002612	2019-10-20		1	10000160
11002613	2019-10-20		1.5	10000009
11002614	2019-10-20		0.5	10000035
11002615	2019-10-20		7.5	10000286
11002616	2019-10-20		0.5	10000303
11002617	2019-10-20		0.5	10000262
11002618	2019-10-21		0.5	10000035
11002619	2019-10-21		1	10000133
11002620	2019-10-21		2	10000195
11002621	2019-10-21		2.5	10000286
11002622	2019-10-21		5.5	10000014
11002623	2019-10-21		7.5	10000311
11002624	2019-10-21	想了想旧故事	0.5	10000208
11002625	2019-10-21		1	10000160
11002626	2019-10-21		0.25	10000318
11002627	2019-10-21		0.5	10000313
11002628	2019-10-21	开刷	1	10000009
11002629	2019-10-22		6.5	10000014
11002630	2019-10-22		0.25	10000160
11002631	2019-10-22		5	10000195
11002632	2019-10-22		0.25	10000318
11002633	2019-10-22		0.5	10000323
11002634	2019-10-22		1.5	10000321
11002635	2019-10-22		0.5	10000035
11002636	2019-10-22		6	10000077
11002637	2019-10-22		0.10000000000000001	10000009
11002638	2019-10-22		2	10000322
11002639	2019-10-22		0.10000000000000001	10000133
11002640	2019-10-22		1	10000051
11002641	2019-10-22		0.5	10000225
11002642	2019-10-23		3	10000324
11002643	2019-10-23		0.5	10000160
11002644	2019-10-23		2.5	10000051
11002645	2019-10-23		0.5	10000035
11002646	2019-10-23		1	10000009
11002647	2019-10-23		5	10000311
11002648	2019-10-23		0.5	10000072
11002649	2019-10-23		7	10000014
11002650	2019-10-23	MyNote写出来了，虽然只是win版，但可以记录了。到时间把以前的记录转过来了。	1.5	10000293
11002651	2019-10-23		0.20000000000000001	10000133
11002652	2019-10-23	还有好多bug需要改，这可麻烦了，改完collection，还有fantasy。	1.5	10000286
11002653	2019-10-23		1.5	10000143
11002654	2019-10-23		1	10000322
11002655	2019-10-24	上班也该擦药啊	0.20000000000000001	10000318
11002656	2019-10-24	到晚上网速就不行了。	1.5	10000322
11002657	2019-10-24		2	10000325
11002658	2019-10-24		1	10000160
11002659	2019-10-24		5	10000326
11002660	2019-10-24		0.80000000000000004	10000133
11002661	2019-10-24		6.5	10000014
11002662	2019-10-24		3	10000311
11002663	2019-10-24		1	10000009
11002664	2019-10-24		0.5	10000307
11002665	2019-10-24	银龙的黎明，终于想起来了。这个能记住，空速星痕却彻底忘了。	0.5	10000262
11002666	2019-10-24		1	10000143
11002667	2019-10-25		3	10000326
11002668	2019-10-25		1	10000317
11002669	2019-10-25		1	10000143
11002670	2019-10-25		1	10000160
11002671	2019-10-25		0.5	10000304
11002672	2019-10-25		4	10000311
11002673	2019-10-25	中奖的2万5购物券，还没用完呢。	0.5	10000327
11002674	2019-10-25		0.5	10000035
11002675	2019-10-25		7.5	10000014
11002676	2019-10-25	现在肠胃好弱，随便吃点儿第二天准厕所。	0.5	10000279
11002677	2019-10-25		1	10000009
11002678	2019-10-25		1	10000133
11002679	2019-10-26		0.5	10000020
11002680	2019-10-26		0.10000000000000001	10000318
11002681	2019-10-26		4	10000077
11002682	2019-10-26		0.5	10000035
11002683	2019-10-26		0.25	10000303
11002684	2019-10-26		1	10000264
11002685	2019-10-26	windows版完成，第一次做出了ios的helloworld程序。	2	10000286
11002687	2019-10-26		1	10000160
11002688	2019-10-26		6.5	10000014
11002689	2019-10-26		2	10000143
11002690	2019-10-26		3.5	10000293
11002691	2019-10-26	大哥	0.5	10000243
11002692	2019-10-26		1	10000009
11002693	2019-10-26		1	10000133
11002694	2019-10-27		0.20000000000000001	10000133
11002695	2019-10-27		1	10000276
11002696	2019-10-27		0.5	10000330
11002697	2019-10-27		1	10000009
11002698	2019-10-27	补番了啊,墙对面不知道干啥，凌晨不睡觉。	3	10000332
11002699	2019-10-27		8.5	10000014
11002700	2019-10-27		0.29999999999999999	10000331
11002701	2019-10-27		2	10000293
11002702	2019-10-27		5	10000328
11002703	2019-10-27		0.5	10000035
11002704	2019-10-27		0.10000000000000001	10000318
11002705	2019-10-27		3.5	10000077
11002706	2019-10-27		0.5	10000160
11002707	2019-10-27		0.5	10000232
11002708	2019-10-27	历史上因为自毁长城，对我来说她就已经是罪人了。	0.5	10000329
11002709	2019-10-28		0.10000000000000001	10000318
11002710	2019-10-28		4	10000295
11002711	2019-10-28		0.29999999999999999	10000133
11002712	2019-10-28	烤鸡放太久了，真的不能吃了,怕吃出病来。	1	10000160
11002713	2019-10-28		0.5	10000035
11002714	2019-10-28		4	10000332
11002715	2019-10-28	困，不过吃了口香糖，基本醒了。	6	10000014
11002716	2019-10-28	朝代灭亡原因	0.5	10000333
11002717	2019-10-28		0.5	10000331
11002718	2019-10-28		3.5	10000334
11002719	2019-10-28		1.5	10000330
11002720	2019-10-28		1	10000009
11002721	2019-10-28		1.5	10000311
11002722	2019-10-29	名字写错了，是db不是if	2	10000311
11002723	2019-10-29		1.5	10000331
11002724	2019-10-29		2	10000335
11002725	2019-10-29		0.5	10000313
11002726	2019-10-29	6星升级还挺难	1	10000009
11002727	2019-10-29		1.5	10000330
11002728	2019-10-29	再想一想数据结构，这个是程序的基础。	1	10000286
11002729	2019-10-29		0.5	10000194
11002730	2019-10-29		1	10000160
11002731	2019-10-29		2	10000077
11002732	2019-10-29	回想故事，有好多我可以幻构的地方。或者该去看下小说的。	0.5	10000334
11002733	2019-10-29		2	10000324
11002734	2019-10-29		0.5	10000035
11002735	2019-10-29		5.5	10000014
11002736	2019-10-29		0.5	10000072
11002737	2019-10-30		0.5	10000337
11002738	2019-10-30		1	10000339
11002739	2019-10-30		0.5	10000336
11002740	2019-10-30	睡了这么久还是困	6.5	10000014
11002741	2019-10-30		0.5	10000338
11002742	2019-10-30		5	10000326
11002743	2019-10-30		2	10000311
11002744	2019-10-30		1.5	10000009
11002745	2019-10-30		1	10000330
11002746	2019-10-30		1	10000194
11002747	2019-10-30		1	10000160
11002748	2019-10-30		1	10000133
11002749	2019-10-30		0.5	10000035
11002750	2019-10-31	躲在厕所里干了啥,忘了.	7.5	10000326
11002751	2019-10-31		1	10000336
11002752	2019-10-31		0.5	10000307
11002753	2019-10-31		1	10000160
11002754	2019-10-31		8	10000014
11002755	2019-10-31	又暂时玩完了，新出的6星不想要。	0.5	10000009
11002756	2019-10-31		0.5	10000133
11002757	2019-10-31		1.5	10000194
11002758	2019-10-31		0.5	10000035
11002759	2019-11-01	还是要洗澡的，时间不是问题。	0.5	10000035
11002760	2019-11-01	Review好累，特别是大八木这样认真的人。	8	10000326
11002761	2019-11-01		1.5	10000009
11002762	2019-11-01	羞耻，拉过去。	0.25	10000304
11002763	2019-11-01	简单，拉过去。	0.25	10000303
11002764	2019-11-01		0.5	10000336
11002765	2019-11-01		0.5	10000339
11002766	2019-11-01	真的没人玩，等好久。	2	10000077
11002767	2019-11-01		1	10000194
11002768	2019-11-01		1	10000020
11002769	2019-11-01		0.5	10000160
11002770	2019-11-01		0.5	10000133
11002771	2019-11-01		6.5	10000014
11002772	2019-11-02		0.5	10000160
11002773	2019-11-02		0.5	10000020
11002774	2019-11-02		5.5	10000014
11002775	2019-11-02	回看一遍，126集	11	10000072
11002776	2019-11-02		1	10000009
11002777	2019-11-02	等着寄材料	1	10000298
11002778	2019-11-02		5	10000077
11002779	2019-11-02		0.5	10000035
11002780	2019-11-03		0.5	10000083
11002781	2019-11-03		0.5	10000035
11002782	2019-11-03		0.20000000000000001	10000133
11002783	2019-11-03		0.5	10000340
11002784	2019-11-03		0.5	10000336
11002785	2019-11-03		0.5	10000160
11002786	2019-11-03		1	10000009
11002787	2019-11-03	没有其他好事情可做呢。	1	10000143
11002788	2019-11-03	又回头玩这个了，虽然还是被电脑追得满街跑。	2	10000218
11002789	2019-11-03		8	10000014
11002790	2019-11-03		0.5	10000327
11002791	2019-11-03		0.5	10000343
11002792	2019-11-03	回顾动漫结局	1	10000342
11002793	2019-11-03	回顾动漫结局	0.5	10000341
11002794	2019-11-03		6	10000077
11002795	2019-11-04		0.5	10000343
11002796	2019-11-04		3	10000077
11002797	2019-11-04		0.5	10000264
11002798	2019-11-04	没开门，明天还得去。	0.29999999999999999	10000318
11002799	2019-11-04		0.5	10000009
11002800	2019-11-04		1.5	10000020
11002801	2019-11-04		2	10000344
11002802	2019-11-04		0.5	10000346
11002803	2019-11-04		0.5	10000345
11002804	2019-11-04		7	10000014
11002805	2019-11-04		1	10000160
11002806	2019-11-04		1	10000349
11002807	2019-11-04		0.5	10000348
11002808	2019-11-04	当年没看的正统后宫动漫。	0.5	10000347
11002809	2019-11-04		3	10000218
11002810	2019-11-05		0.5	10000009
11002811	2019-11-05		3.5	10000218
11002812	2019-11-05		0.5	10000331
11002813	2019-11-05		0.5	10000133
11002814	2019-11-05	女性代表角色，好多想要整理的东西，但是又没做。	0.5	10000350
11002815	2019-11-05		0.10000000000000001	10000318
11002816	2019-11-05	移行工具，干得一天坐立不安。	7	10000311
11002817	2019-11-05	没有看完的，该不该补呢，很花时间。	1	10000351
11002818	2019-11-05		0.5	10000035
11002819	2019-11-05		0.5	10000232
11002820	2019-11-05		1	10000160
11002821	2019-11-05	只有这个最有兴趣听	0.5	10000143
11002822	2019-11-05		8.5	10000014
11002823	2019-11-06		3	10000311
11002824	2019-11-06		1	10000133
11002825	2019-11-06		0.5	10000313
11002826	2019-11-06		1	10000160
11002827	2019-11-06		0.5	10000009
11002828	2019-11-06		0.5	10000352
11002829	2019-11-06		0.5	10000351
11002830	2019-11-06		7.5	10000014
11002831	2019-11-06		0.5	10000035
11002832	2019-11-06		2	10000218
11002833	2019-11-06		0.5	10000350
11002834	2019-11-06		2	10000143
11002835	2019-11-06	图表	0.5	10000286
11002836	2019-11-06		0.5	10000072
11002837	2019-11-06		3	10000340
11002838	2019-11-07		2	10000143
11002839	2019-11-07		2	10000340
11002840	2019-11-07		2	10000311
11002841	2019-11-07		1	10000133
11002842	2019-11-07		1	10000160
11002843	2019-11-07		0.5	10000009
11002844	2019-11-07		0.5	10000035
11002845	2019-11-07		0.5	10000020
11002846	2019-11-07		1	10000207
11002847	2019-11-07		6.5	10000014
11002848	2019-11-07		3	10000326
11002849	2019-11-07		4	10000286
11002850	2019-11-08		0.5	10000262
11002851	2019-11-08		0.5	10000009
11002852	2019-11-08		2	10000239
11002853	2019-11-08		0.5	10000160
11002854	2019-11-08		3	10000147
11002855	2019-11-08		1.5	10000353
11002856	2019-11-08		1.5	10000143
11002857	2019-11-08	完全不够，特别是早起，记单词，学习之后去上班。	7	10000014
11002858	2019-11-08	数据分析	2	10000293
11002859	2019-11-08		0.5	10000207
11002860	2019-11-08		3	10000311
11002861	2019-11-08		1.5	10000133
11002862	2019-11-08		0.5	10000035
11002863	2019-11-09		0.5	10000232
11002864	2019-11-09		1	10000143
11002865	2019-11-09	新宿	3.5	10000354
11002866	2019-11-09		2	10000298
11002867	2019-11-09		0.5	10000307
11002868	2019-11-09		0.5	10000160
11002869	2019-11-09		0.5	10000304
11002870	2019-11-09		0.5	10000303
11002871	2019-11-09		1	10000286
11002872	2019-11-09	该到处走走，拍点东西。	1	10000355
11002873	2019-11-09		0.5	10000293
11002874	2019-11-09	再拿药	0.5	10000318
11002875	2019-11-09		0.5	10000035
11002876	2019-11-09		7	10000014
11002877	2019-11-09		0.5	10000133
11002878	2019-11-09		1	10000009
11002879	2019-11-10		7	10000014
11002880	2019-11-10	好久没自己做饭了，辣椒放多了。	1.5	10000160
11002881	2019-11-10		2	10000020
11002882	2019-11-10		1	10000195
11002883	2019-11-10	手机没电了，只能听这个。	1	10000143
11002884	2019-11-10	不想去公司，没什么具体的目标可干。	1	10000356
11002885	2019-11-10		1	10000357
11002886	2019-11-10	新大久保好几个，但是好贵啊，1小时500日元，办会员会减半，但没确定好以后去哪。	1.5	10000358
11002887	2019-11-10		1	10000359
11002888	2019-11-10		0.5	10000133
11002889	2019-11-10	剧情看完了，结果还是没什么大进展。	3	10000009
11002890	2019-11-10		0.5	10000293
11002891	2019-11-10	网吧玩，好吵，但是鼠标键盘好用。	2	10000077
11002892	2019-11-11		3	10000311
11002893	2019-11-11		0.69999999999999996	10000160
11002894	2019-11-11		1	10000009
11002895	2019-11-11		4	10000326
11002896	2019-11-11	清朝战败等	0.5	10000333
11002897	2019-11-11		0.5	10000340
11002898	2019-11-11		0.5	10000035
11002899	2019-11-11	还是武术，军事，已经记住我得偏好了。。	0.5	10000060
11002900	2019-11-11	还是这个能起床。	0.75	10000262
11002901	2019-11-11		1	10000143
11002902	2019-11-11		0.75	10000133
11002903	2019-11-11	这睡得久，或许的确需要更多睡眠，但单纯懒床也很久。	11	10000014
11002904	2019-11-11		0.20000000000000001	10000286
11002905	2019-11-11	暂时没得做	0.10000000000000001	10000335
11002906	2019-11-12		3	10000340
11002907	2019-11-12		1	10000133
11002908	2019-11-12		8	10000014
11002909	2019-11-12		0.75	10000160
11002910	2019-11-12	要出荷了，还在改式样	4	10000023
11002911	2019-11-12		2	10000311
11002912	2019-11-12		0.5	10000143
11002913	2019-11-12		0.5	10000360
11002914	2019-11-12		0.25	10000293
11002915	2019-11-12		0.5	10000009
11002916	2019-11-13		1.5	10000143
11002917	2019-11-13	保险单还没到	0.5	10000360
11002918	2019-11-13		0.5	10000236
11002919	2019-11-13		3	10000311
11002920	2019-11-13		1.5	10000009
11002921	2019-11-13	要出荷了，还在改，紧张啊。	5	10000023
11002922	2019-11-13		1	10000160
11002923	2019-11-13	又想玩了，几个游戏循环来。	0.5	10000053
11002924	2019-11-13	做梦记不住，浪费了啊。	9	10000014
11002925	2019-11-13		0.5	10000035
11002926	2019-11-13		1	10000133
11002927	2019-11-14		2	10000023
11002928	2019-11-14		3.25	10000009
11002929	2019-11-14		0.5	10000035
11002930	2019-11-14		0.5	10000133
11002931	2019-11-14	上班学很久，不知道效果怎么样，总之是在学吧。但是其他人已经开始用了，我又落后了，或许又会跟不上趟。	6	10000340
11002932	2019-11-14	民国沦陷区，三分之一个中国，还有三分之一是少数民族区，或许剩下一条线。	0.5	10000362
11002933	2019-11-14		6.5	10000014
11002934	2019-11-14		0.5	10000311
11002935	2019-11-14		0.5	10000326
11002936	2019-11-14		1.25	10000143
11002937	2019-11-14	手机没电了，走一走路。	0.5	10000361
11002938	2019-11-14		1	10000160
11002939	2019-11-15		0.5	10000317
11002940	2019-11-15		0.25	10000293
11002941	2019-11-15		2	10000364
11002942	2019-11-15		1.5	10000365
11002943	2019-11-15		0.5	10000288
11002944	2019-11-15		2	10000366
11002945	2019-11-15		0.25	10000363
11002946	2019-11-15		0.5	10000035
11002947	2019-11-15	晚上空腹睡不着，还是起来吃了。	1	10000160
11002948	2019-11-15		3	10000053
11002949	2019-11-15		9	10000014
11002950	2019-11-15		0.5	10000143
11002951	2019-11-15		3.5	10000311
11002952	2019-11-15		1.5	10000009
11002953	2019-11-16		0.5	10000035
11002954	2019-11-16		1.5	10000020
11002955	2019-11-16		3	10000195
11002956	2019-11-16		1.5	10000143
11002957	2019-11-16		0.25	10000304
11002958	2019-11-16		2	10000009
11002959	2019-11-16	水煮牛肉	1	10000160
11002960	2019-11-16	账号设定错了	0.5	10000236
11002961	2019-11-16		0.5	10000053
11002962	2019-11-16		0.5	10000366
11002963	2019-11-16		0.25	10000313
11002964	2019-11-16	终于把网络问题解决了。	1.5	10000367
11002965	2019-11-16		0.5	10000307
11002966	2019-11-16	要学习马上就困了。	5.5	10000014
11002967	2019-11-16	香港问题，香港人和大陆人的互相歧视和互相不信任，确实有一些麻烦。然后，从我的角度看，黑衣抗议者就是一群喜欢生存游戏的玩家。	1	10000368
11002968	2019-11-16		0.5	10000133
11002969	2019-11-16	又把游戏安上了，好快。	5	10000077
11002970	2019-11-16		1	10000262
11002971	2019-11-16		0.5	10000072
11002972	2019-11-17	跟杨罡唱歌，两个人唱了一堆日语歌，笑得挺开心，或许这一幕会记很久吧。	3	10000370
11002973	2019-11-17	跟杨罡吃饭，没有预约果然去不了，下次还是预约吧，去另一家吃得倒也挺不错。	1.5	10000369
11002974	2019-11-17		0.25	10000293
11002975	2019-11-17	香港问题，普选，香港意志和北京意志。	0.5	10000368
11002976	2019-11-17		0.5	10000160
11002977	2019-11-17		0.5	10000009
11002978	2019-11-17		0	10000286
11002979	2019-11-17		1	10000133
11002980	2019-11-17	跟杨罡和他朋友玩游戏，四连加网上一个，就赢了一把，不过还挺不错的，玩得,有一把算拯救世界，一把被人偷家了。	4.5	10000358
11002981	2019-11-17	公司楼点检	0.5	10000281
11002982	2019-11-17	太麻烦，早起会不去了。睡懒觉。	9.5	10000014
11002983	2019-11-17		1	10000143
11002984	2019-11-17	手机带进来放音乐	0.5	10000035
11002985	2019-11-17	VSCode,环境设定。	0.5	10000340
11002986	2019-11-17		0.25	10000194
11002987	2019-11-18		1.25	10000133
11002988	2019-11-18		0.25	10000293
11002989	2019-11-18		0.5	10000373
11002990	2019-11-18		0.25	10000331
11002991	2019-11-18		0.5	10000083
11002992	2019-11-18		1.5	10000374
11002993	2019-11-18	虽然框架弄出来了，但想做出前后端程序还是有点儿难。	5	10000340
11002994	2019-11-18		3	10000077
11002995	2019-11-18		5.5	10000014
11002996	2019-11-18		0.25	10000262
11002997	2019-11-18		1.5	10000371
11002998	2019-11-18		0.25	10000363
11002999	2019-11-18	洗碗。	1	10000160
11003000	2019-11-18	研究NSReporter源码，看不明白，还是自己上网搜得简易server更实用。	2.5	10000372
11003001	2019-11-18		0.25	10000035
11003002	2019-11-18		1	10000020
11003003	2019-11-18		0.5	10000009
11003004	2019-11-18		0.5	10000303
11003005	2019-11-19	好多没玩过的游戏，还是单机欺负欺负电脑最适合我，可是要找游戏也挺难。而且，妄想把游戏玩完，动漫看完，这就是太过头的目标了。明明在能力方面只求一技之长。	2	10000144
11003006	2019-11-19		2	10000009
11003007	2019-11-19	好难受，吃辣的，特别是昨天那包辣条，真的要节制，不吃牛奶、辣条了。	2	10000279
11003008	2019-11-19		0.25	10000293
11003009	2019-11-19		0.25	10000035
11003010	2019-11-19	该好好整理一下了吗。	1	10000264
11003011	2019-11-19		0.25	10000363
11003012	2019-11-19		0.25	10000133
11003013	2019-11-19		0.5	10000313
11003014	2019-11-19		8	10000077
11003015	2019-11-19		6.5	10000014
11003016	2019-11-19		0.5	10000160
11003017	2019-11-19		0.5	10000236
11003018	2019-11-19	总算	0.5	10000200
11003019	2019-11-20	总算弄通get了，但post不通。	2.5	10000372
11003020	2019-11-20		9	10000014
11003021	2019-11-20	不要d盘了	0.5	10000376
11003022	2019-11-20	一顿好挤	1	10000222
11003023	2019-11-20	时间是花了，效率可能不高	3.5	10000340
11003024	2019-11-20		0.25	10000331
11003025	2019-11-20		0.5	10000072
11003026	2019-11-20		1	10000374
11003027	2019-11-20		0.5	10000225
11003028	2019-11-20		0.5	10000009
11003029	2019-11-20		0.25	10000293
11003030	2019-11-20		0.25	10000035
11003031	2019-11-20		0.5	10000133
11003032	2019-11-20		1	10000143
11003033	2019-11-20		1	10000160
11003034	2019-11-20	民国参谋	0.5	10000350
11003035	2019-11-20	买了一年的	0.25	10000375
11003036	2019-11-21		2.5	10000077
11003037	2019-11-21		0.5	10000331
11003038	2019-11-21		0.5	10000307
11003039	2019-11-21	搞不明白了	2	10000372
11003040	2019-11-21		9	10000014
11003041	2019-11-21		0.5	10000373
11003042	2019-11-21		0.25	10000360
11003043	2019-11-21	做了很多梦，没记全	0.5	10000363
11003044	2019-11-21		0.5	10000009
11003045	2019-11-21		3	10000374
11003046	2019-11-21		0.5	10000133
11003047	2019-11-21		0.5	10000160
11003048	2019-11-21		2.5	10000377
11003049	2019-11-21		1.5	10000378
11003050	2019-11-21		0.25	10000035
11003051	2019-11-22		7	10000014
11003052	2019-11-22		0.5	10000331
11003053	2019-11-22	maven建项目就一上午	3.8999999999999999	10000377
11003054	2019-11-22	放弃	0.10000000000000001	10000372
11003055	2019-11-22		2.25	10000378
11003056	2019-11-22	完全不知道哪里的问题，连summit都开不起。	3.5	10000379
11003057	2019-11-22	感觉良好输的很惨，高端局的感觉。	3.75	10000077
11003058	2019-11-22		1	10000130
11003059	2019-11-22	越来越尬	0.25	10000304
11003060	2019-11-22		0.75	10000160
11003061	2019-11-22		2	10000125
11003062	2019-11-22		0.25	10000035
11003063	2019-11-22		0.25	10000009
11003064	2019-11-22		0.5	10000133
11003065	2019-11-23		9	10000077
11003066	2019-11-23		2.5	10000378
11003067	2019-11-23		0.5	10000232
11003068	2019-11-23		6	10000014
11003069	2019-11-23		0.25	10000160
11003070	2019-11-23		0.5	10000035
11003071	2019-11-23		0.5	10000332
11003072	2019-11-23	S9看了，有一个lpl队伍夺冠，很好啊。比奥运会好看多了。	5	10000179
11003073	2019-11-23		1.5	10000020
11003074	2019-11-23		0.25	10000303
11003075	2019-11-24		0.5	10000035
11003076	2019-11-24		0.5	10000160
11003077	2019-11-24		7	10000014
11003078	2019-11-24		1	10000380
11003079	2019-11-24		9	10000077
11003080	2019-11-24		4	10000378
11003081	2019-11-25		6	10000377
11003082	2019-11-25		7	10000014
11003083	2019-11-25		0.10000000000000001	10000331
11003084	2019-11-25		0.25	10000009
11003085	2019-11-25		1.5	10000326
11003086	2019-11-25		0.25	10000035
11003087	2019-11-25		3	10000378
11003088	2019-11-25		0.40000000000000002	10000373
11003089	2019-11-25		3	10000077
11003090	2019-11-25		1	10000160
11003091	2019-11-26		1	10000360
11003092	2019-11-26		0.5	10000009
11003093	2019-11-26		0.5	10000143
11003094	2019-11-26		2	10000378
11003095	2019-11-26		1	10000160
11003096	2019-11-26		0.5	10000313
11003097	2019-11-26		0.5	10000035
11003098	2019-11-26		0.5	10000262
11003099	2019-11-26		6.5	10000014
11003100	2019-11-26		2	10000326
11003101	2019-11-26		5	10000377
11003102	2019-11-26		4	10000077
11003103	2019-11-27		7.5	10000014
11003104	2019-11-27		0.5	10000143
11003105	2019-11-27		2.5	10000378
11003106	2019-11-27		6	10000077
11003107	2019-11-27		0.25	10000009
11003108	2019-11-27		3	10000377
11003109	2019-11-27		0.5	10000133
11003110	2019-11-27		0.5	10000160
11003111	2019-11-27		4	10000326
11003112	2019-11-27		0.5	10000360
11003113	2019-11-28		4.5	10000077
11003114	2019-11-28		3	10000326
11003115	2019-11-28		0.5	10000133
11003116	2019-11-28		4.5	10000377
11003117	2019-11-28		1	10000143
11003118	2019-11-28		5.5	10000014
11003119	2019-11-28		2.5	10000378
11003120	2019-11-28		1	10000160
11003121	2019-11-28		0.5	10000035
11003122	2019-11-29		0.5	10000276
11003123	2019-11-29		0.5	10000133
11003124	2019-11-29		0.5	10000035
11003125	2019-11-29		6	10000377
11003126	2019-11-29		2	10000326
11003127	2019-11-29		1	10000160
11003128	2019-11-29		6.5	10000014
11003129	2019-11-29		4	10000077
11003130	2019-11-29		0.25	10000009
11003131	2019-11-29		1	10000143
11003132	2019-11-30		6.5	10000014
11003133	2019-11-30		1	10000327
11003134	2019-11-30		0.5	10000083
11003135	2019-11-30		10	10000077
11003136	2019-11-30		1.5	10000147
11003137	2019-11-30		1	10000009
11003138	2019-11-30		2	10000378
11003139	2019-11-30		1	10000160
11003140	2019-11-30		0.5	10000035
11003141	2019-12-01		6.75	10000014
11003142	2019-12-01		0.5	10000035
11003143	2019-12-01	真的再也不吃卫龙辣条了。	1	10000279
11003144	2019-12-01		0.5	10000179
11003145	2019-12-01	一緒にやった方がよかった。	3	10000381
11003146	2019-12-01		6	10000077
11003147	2019-12-01	乱改稿子，紧张得要死，果然还是做不到水到渠成。	1.5	10000020
11003148	2019-12-01		0.25	10000133
11003149	2019-12-01		4	10000378
11003150	2019-12-01		0.5	10000293
11003151	2019-12-02		7.5	10000377
11003152	2019-12-02		1.5	10000378
11003153	2019-12-02		0.5	10000382
11003154	2019-12-02		1.5	10000133
11003155	2019-12-02		2.5	10000077
11003156	2019-12-02		1.25	10000160
11003157	2019-12-02		6	10000014
11003158	2019-12-02		1	10000179
11003159	2019-12-02		0.5	10000383
11003160	2019-12-02	该取消掉了，还有一个半月。	0.5	10000082
11003161	2019-12-02		1	10000276
11003162	2019-12-02		0.25	10000035
11003163	2019-12-03		5	10000377
11003164	2019-12-03		0.25	10000035
11003165	2019-12-03		0.5	10000336
11003166	2019-12-03		0.5	10000133
11003167	2019-12-03		0.5	10000262
11003168	2019-12-03		0.5	10000383
11003169	2019-12-03		2.5	10000378
11003170	2019-12-03		2	10000384
11003171	2019-12-03		1.5	10000179
11003172	2019-12-03		3	10000077
11003173	2019-12-03		0.75	10000160
11003174	2019-12-03		7	10000014
11003175	2019-12-04		0.5	10000160
11003176	2019-12-04		3	10000377
11003177	2019-12-04		5.5	10000077
11003178	2019-12-04		3	10000384
11003179	2019-12-04		1.5	10000133
11003180	2019-12-04		1.5	10000179
11003181	2019-12-04		8	10000014
11003182	2019-12-04		0.5	10000276
11003183	2019-12-04		0.5	10000035
11003184	2019-12-05		1	10000077
11003185	2019-12-05		4	10000377
11003186	2019-12-05		1	10000133
11003187	2019-12-05		0.75	10000160
11003188	2019-12-05		0.25	10000293
11003189	2019-12-05		1	10000276
11003190	2019-12-05		8	10000014
11003191	2019-12-05		0.5	10000179
11003192	2019-12-05	蹲厕所睡觉	2	10000383
11003193	2019-12-05		2	10000009
11003194	2019-12-05		3	10000384
11003195	2019-12-05		0.5	10000035
11003196	2019-12-06	随手又翻来看，真的比其他yy小说好太多了，即便同样是yy。	1.5	10000386
11003197	2019-12-06		0.5	10000262
11003198	2019-12-06		0.5	10000276
11003199	2019-12-06		1	10000317
11003200	2019-12-06		1.5	10000009
11003201	2019-12-06		1	10000133
11003202	2019-12-06		0.5	10000383
11003203	2019-12-06		0.5	10000160
11003204	2019-12-06	睡不着啊，晚上。	9	10000014
11003205	2019-12-06		5	10000377
11003206	2019-12-06	今年特别无聊，在海边风景好的地方吃西餐，吃不饱，聊不起来，很快就回了。	3	10000385
11003207	2019-12-07	7日，人挺不少，我是没赶上开头，然后也没带笔，发呆了。	1	10000020
11003208	2019-12-07		0.25	10000035
11003209	2019-12-07		1.25	10000160
11003210	2019-12-07	抖音内容是真杂，搞笑，励志，明星，社会问题，今天看的最重要的，应该是演员的故事。西游记的拍摄，什么都没有的情况下一群演员们艰苦奋斗创作出来的杰作，跟现在的片酬小鲜肉流量什么的，真的是鲜明的对比。吴京的战狼，自己当导演、制作什么都兼任，简直是一种修行了。什么是演员，需要社会去思考啊。	2	10000060
11003211	2019-12-07	闹钟又没注意到，已经习惯性忽略了。	7.5	10000014
11003212	2019-12-07	人家不用看都知道是什么病，真的该早去找医生。	0.5	10000318
11003213	2019-12-07		0.5	10000293
11003214	2019-12-07		1.5	10000009
11003215	2019-12-07		0.5	10000307
11003216	2019-12-07		0.5	10000304
11003217	2019-12-07		0.5	10000332
11003218	2019-12-07	高考大纲单词，好遥远啊，总算到最后30个了。	1	10000133
11003219	2019-12-07		0.5	10000383
11003220	2019-12-07		0.5	10000232
11003221	2019-12-07		0.5	10000262
11003222	2019-12-07		5.5	10000077
11003223	2019-12-08		0.75	10000160
11003224	2019-12-08		0.25	10000035
11003225	2019-12-08		0.5	10000288
11003226	2019-12-08		3	10000387
11003227	2019-12-08	睡了好久，赖床，做梦，没去早起会。	11	10000014
11003228	2019-12-08	高考大纲单词终于完了，好难啊。	1.5	10000133
11003229	2019-12-08		0	10000373
11003230	2019-12-08		1	10000110
11003231	2019-12-08		0.5	10000383
11003232	2019-12-08		0.5	10000009
11003233	2019-12-08		1	10000388
11003234	2019-12-08		4	10000077
11003355	2019-12-20		0.5	10000077
11003235	2019-12-09	看小说又看过头了，这生活调整又难了。	5.75	10000387
11003236	2019-12-09		0.25	10000035
11003237	2019-12-09		1	10000383
11003238	2019-12-09		7.75	10000014
11003239	2019-12-09	范小龙	0.5	10000389
11003240	2019-12-09		0.75	10000133
11003241	2019-12-09		7	10000377
11003242	2019-12-09		1	10000160
11003243	2019-12-10		0.5	10000160
11003244	2019-12-10		0.25	10000293
11003245	2019-12-10		7	10000377
11003246	2019-12-10		0.25	10000133
11003247	2019-12-10		7.25	10000387
11003248	2019-12-10		0.25	10000389
11003249	2019-12-10		0.25	10000318
11003250	2019-12-10		0.75	10000383
11003251	2019-12-10		7	10000014
11003252	2019-12-10		0.5	10000035
11003253	2019-12-11		1	10000383
11003254	2019-12-11		5	10000377
11003255	2019-12-11		0.5	10000160
11003256	2019-12-11		8	10000014
11003257	2019-12-11	网页版准备要开始做了	1	10000286
11003258	2019-12-11		0.25	10000035
11003259	2019-12-11		2	10000390
11003260	2019-12-11		0.25	10000293
11003261	2019-12-11		6	10000387
11003262	2019-12-12		0.25	10000035
11003263	2019-12-12		2	10000390
11003264	2019-12-12	夜宵，方便面干吃	1.25	10000160
11003265	2019-12-12		6.75	10000387
11003266	2019-12-12		0.25	10000293
11003267	2019-12-12		2	10000286
11003268	2019-12-12		7	10000014
11003269	2019-12-12		0.5	10000383
11003270	2019-12-12	完全没干劲	4	10000377
11003271	2019-12-13	结果带不出来，出了点小错。以后真的尽量别乱来了，宁愿做两遍，正好学习。	1	10000286
11003272	2019-12-13		6	10000387
11003273	2019-12-13		6	10000014
11003274	2019-12-13		1	10000160
11003275	2019-12-13		2	10000390
11003276	2019-12-13		0.5	10000317
11003277	2019-12-13	买吃的，买钱包，真的该换新了。	1	10000327
11003278	2019-12-13		0.5	10000383
11003279	2019-12-13		0.5	10000035
11003280	2019-12-13		3	10000384
11003281	2019-12-13		2	10000377
11003282	2019-12-13	没下载好，该好好整理出来的。	0.5	10000316
11003283	2019-12-14		3.25	10000077
11003284	2019-12-14		0.5	10000160
11003285	2019-12-14		0.5	10000383
11003286	2019-12-14		5	10000014
11003287	2019-12-14		0.5	10000225
11003288	2019-12-14		0.25	10000035
11003289	2019-12-14		3	10000391
11003290	2019-12-14		1.5	10000020
11003291	2019-12-14		9.5	10000387
11003292	2019-12-15		5.5	10000014
11003293	2019-12-15		5	10000077
11003294	2019-12-15		0.5	10000072
11003295	2019-12-15		7	10000387
11003296	2019-12-15		1	10000020
11003297	2019-12-15	元旦买票回家	3	10000392
11003298	2019-12-15		1	10000160
11003299	2019-12-15		0.25	10000383
11003300	2019-12-15		0.5	10000302
11003301	2019-12-15		0.25	10000035
11003302	2019-12-16	测速，结果卡拉曼达最好	3.25	10000077
11003303	2019-12-16		0.5	10000316
11003304	2019-12-16		1.25	10000133
11003305	2019-12-16		2	10000051
11003306	2019-12-16		1.5	10000384
11003307	2019-12-16		0.5	10000009
11003308	2019-12-16		7.5	10000014
11003309	2019-12-16		6	10000286
11003310	2019-12-16		1	10000160
11003311	2019-12-16		0.5	10000383
11003312	2019-12-17		0.25	10000133
11003313	2019-12-17		0.5	10000383
11003314	2019-12-17	总算把event最基本的逻辑写出来了。	6	10000286
11003315	2019-12-17		6.5	10000014
11003316	2019-12-17		0.5	10000306
11003317	2019-12-17		0.25	10000035
11003318	2019-12-17		2	10000390
11003319	2019-12-17	果然有些小说完全不行，看了白天没开始。男的重生女好多。	3	10000393
11003320	2019-12-17		0.5	10000225
11003321	2019-12-17		4	10000077
11003322	2019-12-17		0.5	10000072
11003323	2019-12-17		0.5	10000316
11003324	2019-12-18		0.5	10000395
11003325	2019-12-18	4格漫画	0.5	10000009
11003326	2019-12-18	乐园追放，高达出场	0.5	10000397
11003327	2019-12-18		7	10000014
11003328	2019-12-18	人生该进入下个阶段了，毕竟出门已经十年了。	0.5	10000352
11003329	2019-12-18		0.5	10000390
11003330	2019-12-18		0.25	10000035
11003331	2019-12-18		1	10000316
11003332	2019-12-18		1	10000306
11003333	2019-12-18		0.5	10000383
11003334	2019-12-18	乱七八糟看一通，人文关怀和社会现象，军人，武术，萌	1	10000060
11003335	2019-12-18	忘带材料，还得回家拿，真的好不关心。坐在那想了许多，或者真的该改变了，出门10年了。	2.5	10000396
11003336	2019-12-18		1.25	10000394
11003337	2019-12-18		0.5	10000393
11003338	2019-12-18		0.5	10000160
11003339	2019-12-18		2.5	10000286
11003340	2019-12-18		3.5	10000077
11003341	2019-12-19		1	10000390
11003342	2019-12-19	聊框架怎么用，该找工具来编程。	2	10000401
11003343	2019-12-19		1	10000264
11003344	2019-12-19		0.5	10000383
11003345	2019-12-19		1	10000400
11003346	2019-12-19		2	10000399
11003347	2019-12-19		6.5	10000014
11003348	2019-12-19		4	10000398
11003349	2019-12-19	想了半天，还是该改c#版的来用。	1	10000286
11003350	2019-12-19		2	10000377
11003351	2019-12-19		0.75	10000160
11003352	2019-12-19		0.25	10000035
11003353	2019-12-20		4	10000398
11003354	2019-12-20		0.5	10000262
11003356	2019-12-20		0.5	10000264
11003357	2019-12-20		1	10000020
11003358	2019-12-20		2	10000399
11003359	2019-12-20		2	10000402
11003360	2019-12-20		2	10000403
11003361	2019-12-20		3	10000390
11003362	2019-12-20		0.5	10000304
11003363	2019-12-20		1	10000286
11003364	2019-12-20		0.5	10000303
11003365	2019-12-20	睡不着	2	10000383
11003366	2019-12-20	好困好困	5.5	10000014
11003367	2019-12-20		0.5	10000160
11003368	2019-12-21	起不来，早起会又没去。	10.5	10000014
11003369	2019-12-21		0.5	10000077
11003370	2019-12-21		3	10000394
11003371	2019-12-21		0.5	10000383
11003372	2019-12-21		4	10000404
11003373	2019-12-21		0.75	10000160
11003374	2019-12-21		0.5	10000405
11003375	2019-12-21		1.5	10000009
11003376	2019-12-21		1.5	10000303
11003377	2019-12-21		0.25	10000035
11003378	2019-12-22		0.25	10000293
11003379	2019-12-22		1	10000009
11003588	2020-01-09		0.14999999999999999	10000443
11003380	2019-12-22	皆が久しぶりと言いました。感謝のカード、届けるかな、羽柴さんに。	2	10000033
11003381	2019-12-22		0.5	10000133
11003382	2019-12-22		2	10000408
11003383	2019-12-22	ユース会引率者は、様になりました。倉澤君とコンビ、青年部新しい世代。	0.5	10000406
11003384	2019-12-22	東京、カラオケで私が歌える曲を選びました。	1	10000407
11003385	2019-12-22		0.25	10000035
11003386	2019-12-22	本会がいつも受けりれる、戻って良い。	0.5	10000410
11003387	2019-12-22		1	10000399
11003388	2019-12-22	色々と話を聞いてもらいました。仕事で親会社と合流、他の作物を作る、	1	10000411
11003389	2019-12-22		0.5	10000383
11003390	2019-12-22		0.5	10000316
11003391	2019-12-22	ゲームの話をいろいろ。	3	10000409
11003392	2019-12-22		8	10000014
11003393	2019-12-23		6	10000014
11003394	2019-12-23		1	10000412
11003395	2019-12-23		0.75	10000160
11003396	2019-12-23		1	10000146
11003397	2019-12-23		1	10000020
11003398	2019-12-23		1	10000316
11003399	2019-12-23		3	10000402
11003400	2019-12-23		2	10000399
11003401	2019-12-23		2	10000009
11003402	2019-12-23		1	10000131
11003403	2019-12-23	困得受不了	2.5	10000390
11003404	2019-12-23		0.5	10000383
11003405	2019-12-23		0.25	10000035
11003406	2019-12-23	5连败	4	10000077
11003407	2019-12-24		0.5	10000286
11003408	2019-12-24		0.5	10000316
11003409	2019-12-24		1.5	10000390
11003410	2019-12-24		2.5	10000399
11003411	2019-12-24		8.5	10000014
11003412	2019-12-24		1	10000160
11003413	2019-12-24		1	10000130
11003414	2019-12-24		0.5	10000383
11003415	2019-12-24		0.25	10000133
11003416	2019-12-24		6	10000402
11003417	2019-12-24		1	10000009
11003418	2019-12-24		0.5	10000083
11003419	2019-12-24		0.25	10000293
11003420	2019-12-25		0.25	10000179
11003421	2019-12-25		0.5	10000133
11003422	2019-12-25		1.5	10000009
11003423	2019-12-25		0.5	10000160
11003424	2019-12-25	结果发现不能数据迁移，麻烦。	2	10000286
11003425	2019-12-25		0.5	10000316
11003426	2019-12-25		8	10000014
11003427	2019-12-25		3	10000390
11003428	2019-12-25		1.5	10000399
11003429	2019-12-25		0.5	10000072
11003430	2019-12-25		2.25	10000077
11003431	2019-12-25	真的很麻烦了，我究竟怎么才能把精力用到正确的地方。烦闷的时候总是玩过去了，而不满正是改变的原动力啊。	0.5	10000352
11003432	2019-12-25		1	10000383
11003433	2019-12-25		2	10000402
11003434	2019-12-26		0.25	10000035
11003435	2019-12-26		0.5	10000133
11003436	2019-12-26		2.5	10000179
11003437	2019-12-26		1	10000009
11003438	2019-12-26	今年最后一次，有得聊。我则在想自己，真的到了年龄，开始从只做想做的转变成做适合自己的了。	1.5	10000317
11003439	2019-12-26		0.5	10000383
11003440	2019-12-26		0.75	10000160
11003441	2019-12-26		1	10000399
11003442	2019-12-26		8	10000014
11003443	2019-12-26		0.5	10000316
11003444	2019-12-26		1.5	10000390
11003445	2019-12-26	好多东西装不好，vscode，vs2019	5	10000403
11003446	2019-12-27		0.5	10000383
11003447	2019-12-27		2	10000403
11003448	2019-12-27		1.5	10000399
11003449	2019-12-27		4	10000413
11003450	2019-12-27		0.5	10000133
11003451	2019-12-27		0.25	10000035
11003452	2019-12-27		2.5	10000077
11003453	2019-12-27	一年又过去了	1	10000390
11003454	2019-12-27		1	10000262
11003455	2019-12-27		7	10000014
11003456	2019-12-27		0.25	10000009
11003457	2019-12-27		0.5	10000307
11003458	2019-12-27		2	10000179
11003459	2019-12-27	排队好累	1	10000160
11003460	2019-12-28		0.25	10000035
11003461	2019-12-28		1.5	10000020
11003462	2019-12-28	思考人生和自我的目标，总是在一种梦想和绝望的极端状态间反复，结果无所成就。	1	10000352
11003463	2019-12-28	完全睡不够	5.5	10000014
11003464	2019-12-28	完结撒花	1	10000306
11003465	2019-12-28		1.25	10000191
11003466	2019-12-28		1.5	10000179
11003467	2019-12-28		3.5	10000399
11003468	2019-12-28	零食吃一堆。	0.5	10000160
11003469	2019-12-28	昏昏欲睡。	1	10000383
11003470	2019-12-28		4	10000077
11003564	2020-01-05		3	10000437
11003471	2019-12-28	必须提前3小时到，排队都排课1个半小时，差点儿赶不上趟了。	3	10000414
11003472	2019-12-29		1	10000278
11003473	2019-12-29		2	10000399
11003474	2019-12-29		0.5	10000416
11003475	2019-12-29	带小家伙，第一天不认识。	1	10000417
11003476	2019-12-29		0.5	10000383
11003477	2019-12-29	好久没洗碗了	2	10000160
11003478	2019-12-29		0.5	10000035
11003479	2019-12-29		1	10000288
11003480	2019-12-29	机场大巴,继续睡	3	10000414
11003481	2019-12-29		1	10000216
11003482	2019-12-29	守到做作业，不然马上注意力涣散。	1.5	10000418
11003483	2019-12-29		1	10000419
11003484	2019-12-29	根本睡不好，冷。机场外边，找错地方了。	4	10000014
11003485	2019-12-29	跟大哥一起打	1	10000132
11003486	2019-12-29	吃嗝了，难受。	2	10000415
11003487	2019-12-29	胡思乱想。	2	10000352
11003488	2019-12-30		1.5	10000288
11003589	2020-01-09		1	10000160
11003590	2020-01-09		0.5	10000383
11003489	2019-12-30	接放学，买了张包游戏王的卡，两个孩子正着看。守着做作业，真难。睡觉就聊天。	3	10000418
11003490	2019-12-30	认识了，能带了。眶睡觉好难。	2	10000417
11003491	2019-12-30		0.5	10000383
11003492	2019-12-30	很少跟五爷交流呢，一起吃个饭，喝酒只陪着喝了一杯，回来的车上就晕了。	2	10000422
11003493	2019-12-30	回青草坝拜坟。	3	10000421
11003494	2019-12-30		1	10000420
11003495	2019-12-30		1	10000419
11003496	2019-12-30		1	10000132
11003497	2019-12-30	睡不好	6.5	10000014
11003498	2019-12-30		1	10000160
11003499	2019-12-31	带着，一个瓶盖就能玩半天。	2.5	10000417
11003500	2019-12-31	完全没睡好，打喷嚏，半夜醒。萧皓然更没睡好。	8	10000014
11003501	2019-12-31		1	10000051
11003502	2019-12-31		2	10000423
11003503	2019-12-31		0.5	10000427
11003504	2019-12-31		0.5	10000426
11003505	2019-12-31		0.5	10000425
11003506	2019-12-31		0.5	10000424
11003507	2019-12-31		0.5	10000160
11003508	2019-12-31	连输	1.5	10000077
11003509	2019-12-31		1	10000288
11003510	2019-12-31		2	10000132
11003511	2019-12-31	送上学，聊大学的事情。	0.5	10000419
11003512	2019-12-31	买药	0.5	10000416
11003513	2019-12-31	送上学，聊大学的事情。	1.5	10000418
11003514	2020-01-01		0.5	10000417
11003515	2020-01-01		1.5	10000415
11003516	2020-01-01		3	10000051
11003517	2020-01-01		1	10000160
11003518	2020-01-01	看他怎么拖延，拖延做作业，然后没得玩游戏。	5	10000418
11003519	2020-01-01		8	10000014
11003520	2020-01-01	这边作业多得吓人。	1	10000419
11003521	2020-01-01	多聊一聊，看他有些什么想法。推荐给他一些动漫，看了两部，我能推荐的也就那些了，他或许会看看赘婿，	4	10000278
11003522	2020-01-01	又搞错了，真惨。	0.5	10000428
11003523	2020-01-01		0.5	10000383
11003524	2020-01-02		0.5	10000035
11003525	2020-01-02		1	10000419
11003526	2020-01-02	又买了一大堆，但是没机会吃了。	1	10000415
11003527	2020-01-02		0	10000288
11003528	2020-01-02	又出错了,钱转过去，得确认到结束才真的总结掉这条。	1	10000428
11003529	2020-01-02	跟老汉聊时事，还是很能聊的。可惜最终并不能做到什么事情。真的难得会回来看一次了。出去吃酒，也是跟一群不认识的人聊，只能聊日本的事情。	3	10000429
11003530	2020-01-02	带小家伙也或许是最后一次了。	1.5	10000417
11003531	2020-01-02		2	10000051
11003532	2020-01-02	小姑娘不知道为什么会粘我，真奇怪，就像当年肖体松。有时间当然想陪她玩。	1	10000430
11003533	2020-01-02	该当父辈，问候一下的，只是基本流于形式了。	1	10000431
11003534	2020-01-02		0.5	10000383
11003535	2020-01-02	带着两个家伙放学，买东西，抽卡。童年时光。	2	10000418
11003536	2020-01-02		6	10000014
11003537	2020-01-02		0.5	10000160
11003538	2020-01-03		0.5	10000288
11003539	2020-01-03	没得可教的了，让他自己玩。	1	10000278
11003540	2020-01-03		2	10000132
11003541	2020-01-03		1	10000216
11003542	2020-01-03		7	10000014
11003543	2020-01-03		0.5	10000419
11003544	2020-01-03		2	10000051
11003545	2020-01-03	回家给婆婆烧37,顺便在家里露个脸。因为自己小辈坐一桌，甚至都没有露脸说话。	2	10000421
11003546	2020-01-03	聊些日本话题。	0.5	10000424
11003547	2020-01-03	下次见面不知道会长多大了。	1	10000430
11003548	2020-01-03	也容易出问题呢，win10系统莫名其妙进入修复。	0.5	10000432
11003549	2020-01-03	最后一天，还想玩游戏，被大哥说了。要讨嫌。	1	10000418
11003550	2020-01-03	三嬢说的不多，反正让我们自己省钱。	1	10000434
11003551	2020-01-03	还是闷葫芦，不知道他的想法。	1	10000435
11003552	2020-01-03	跟幺幺理论，但是没有用处，不该这么激动。没有选择读研，就是一种我必须承担责任的选择。	1	10000433
11003553	2020-01-04		0.5	10000383
11003554	2020-01-04	各种绕远路，房费时间。	5	10000193
11003555	2020-01-04		0.5	10000035
11003556	2020-01-04		0.5	10000225
11003557	2020-01-04	吞个口水呛到了，再睡个午觉，就不舒服了。	1	10000436
11003558	2020-01-04	机场吃小面好贵	1.5	10000160
11003559	2020-01-04		7	10000051
11003560	2020-01-04		0.5	10000232
11003561	2020-01-04	还是睡半天醒一次。	6.5	10000014
11003562	2020-01-05		5.5	10000014
11003563	2020-01-05	休息什么都干不了，好麻烦。发烧37.9,去医院好贵。	5	10000436
11003565	2020-01-05		3	10000051
11003566	2020-01-05		1	10000438
11003567	2020-01-05		1.5	10000020
11003568	2020-01-06		12	10000014
11003569	2020-01-06		4	10000436
11003570	2020-01-06		4	10000051
11003571	2020-01-06		4	10000440
11003572	2020-01-07		6	10000436
11003573	2020-01-07		1.5	10000160
11003574	2020-01-07		12	10000014
11003575	2020-01-07	头晕目眩，困成狗	3	10000413
11003576	2020-01-07		0.5	10000035
11003577	2020-01-08		12	10000014
11003578	2020-01-08		1	10000160
11003579	2020-01-08		4	10000436
11003580	2020-01-08		3	10000384
11003581	2020-01-08		1	10000439
11003582	2020-01-08		3	10000413
11003583	2020-01-08		1	10000383
11003584	2020-01-09		9	10000014
11003585	2020-01-09		0.25	10000444
11003586	2020-01-09	过一天就好了，这bug又没找到。	0.10000000000000001	10000286
11003587	2020-01-09		1	10000051
11003591	2020-01-09		0.5	10000442
11003592	2020-01-09		0.5	10000420
11003593	2020-01-09	又记错，诊所周四关门，去医院，发现初诊高费。	4.5	10000436
11003594	2020-01-09		0.75	10000035
11003595	2020-01-09		6	10000441
11003596	2020-01-10		2	10000436
11003597	2020-01-10		0.5	10000035
11003598	2020-01-10		8	10000014
11003599	2020-01-10		2	10000420
11003600	2020-01-10		4	10000051
11003601	2020-01-10		6	10000441
11003602	2020-01-10		1	10000160
11003603	2020-01-11		0.5	10000160
11003604	2020-01-11		9	10000014
11003605	2020-01-11		1	10000020
11003606	2020-01-11		0.5	10000445
11003607	2020-01-11		0.5	10000441
11003608	2020-01-11		7	10000051
11003609	2020-01-12		0.5	10000160
11003610	2020-01-12		8	10000014
11003611	2020-01-12		4	10000051
11003612	2020-01-12		0.5	10000035
11003613	2020-01-12		5	10000446
11003614	2020-01-13		0.5	10000035
11003615	2020-01-13		8	10000014
11003616	2020-01-13		7	10000051
11003617	2020-01-13		1	10000160
11003618	2020-01-14		3	10000441
11003619	2020-01-14		2	10000420
11003620	2020-01-14		3	10000051
11003621	2020-01-14		8	10000014
11003622	2020-01-14		3	10000377
11003623	2020-01-15		0.5	10000035
11003624	2020-01-15	放寒假了	0.5	10000278
11003625	2020-01-15		7	10000014
11003626	2020-01-15		5	10000377
11003627	2020-01-15		4	10000441
11003628	2020-01-15		1	10000160
11003629	2020-01-15		3	10000448
11003630	2020-01-16		0	10000444
11003631	2020-01-16		8	10000014
11003632	2020-01-16		2	10000387
11003633	2020-01-16		5	10000377
11003634	2020-01-16	改洗头了	0.25	10000035
11003635	2020-01-16		0.5	10000383
11003636	2020-01-16		1	10000160
11003637	2020-01-16		0	10000420
11003638	2020-01-16		0.25	10000133
11003639	2020-01-16	电脑上的东西，又该整理了。网盘比自己的硬盘可靠，主要是手机也能访问。	1	10000449
11003640	2020-01-16		1	10000447
11003641	2020-01-16	居然没下载下来，现在下架了，哭	0.5	10000143
11003642	2020-01-16		1	10000278
11003643	2020-01-16		0.5	10000130
11003644	2020-01-16		4	10000441
11003645	2020-01-17		0.5	10000278
11003646	2020-01-17		0.5	10000133
11003647	2020-01-17		7	10000014
11003648	2020-01-17		0.5	10000449
11003649	2020-01-17		0.5	10000383
11003650	2020-01-17		1	10000077
11003651	2020-01-17		4	10000420
11003652	2020-01-17		2	10000377
11003653	2020-01-17		3	10000451
11003654	2020-01-17		0.5	10000387
11003655	2020-01-17		1	10000160
11003656	2020-01-17		2.5	10000450
11003657	2020-01-18		2	10000449
11003658	2020-01-18		8	10000450
11003659	2020-01-18		3	10000077
11003660	2020-01-18	真的没去找饭吃	0.5	10000160
11003661	2020-01-18		0.25	10000035
11003662	2020-01-18	晚上睡不着	3	10000218
11003663	2020-01-18		0.5	10000143
11003664	2020-01-18		0.5	10000452
11003665	2020-01-18		1	10000278
11003666	2020-01-18	熬到4点了,没去早起会	6	10000014
11003667	2020-01-19		0.5	10000278
11003668	2020-01-19		1.5	10000160
11003669	2020-01-19		0.5	10000454
11003670	2020-01-19		0.5	10000445
11003671	2020-01-19	只有在外边走的时候能够思考，能够想到自己想做的事情，一旦在屋里坐下来，就没那心情做事了。这样的惰性，真的好吗。还是该坚持早起，每天做点儿事情吧？	0.5	10000352
11003672	2020-01-19		0.25	10000035
11003673	2020-01-19	就是不想去早起会	5.5	10000014
11003674	2020-01-19	好贵，3个月后再考虑。	0.5	10000453
11003675	2020-01-19	终于看完了	7.5	10000450
11003676	2020-01-19		3	10000451
11003677	2020-01-19		0.5	10000024
11003678	2020-01-19		0.25	10000130
11003679	2020-01-20	大学生交换女友,居然在百度小说里有	0.5	10000024
11003680	2020-01-20		0.25	10000035
11003681	2020-01-20	今天又进步，Jquery用法，date转换	3	10000286
11003682	2020-01-20	浪费时间，dbdump	3	10000377
11003683	2020-01-20	还是开通失败	0.5	10000455
11003684	2020-01-20	早睡睡不好，而且冷，该加衣服的。	8.5	10000014
11003685	2020-01-20		1	10000160
11003686	2020-01-20	日常犯困，还是浪费时间。吃完饭散步。	1	10000383
11003687	2020-01-20		1.5	10000020
11003688	2020-01-20		1	10000451
11003689	2020-01-20		0.5	10000133
11003690	2020-01-20	外传	2.5	10000450
11003691	2020-01-21		4	10000456
11003692	2020-01-21		0.5	10000383
11003693	2020-01-21	旗手行进	0.5	10000458
11003694	2020-01-21		2	10000457
11003695	2020-01-21		1	10000420
11003696	2020-01-21		3	10000450
11003697	2020-01-21		3	10000377
11003698	2020-01-21		8.5	10000014
11003699	2020-01-21		1	10000451
11003700	2020-01-21		0.5	10000160
11003701	2020-01-22		0.5	10000420
11003702	2020-01-22		3	10000456
11003703	2020-01-22		3	10000450
11003704	2020-01-22		8.5	10000014
11003705	2020-01-22		1.5	10000459
11003706	2020-01-22		0.25	10000383
11003707	2020-01-22		1	10000377
11003708	2020-01-22		2	10000286
11003709	2020-01-22		2	10000457
11003710	2020-01-22		1.5	10000160
11003711	2020-01-22	リーダ養成会の話、ガスト、温泉。。。	0.5	10000460
11003712	2020-01-22		0.25	10000035
11003713	2020-01-23		1.5	10000451
11003714	2020-01-23		2	10000286
11003715	2020-01-23		0.25	10000035
11003716	2020-01-23		1	10000160
11003717	2020-01-23		3.5	10000457
11003718	2020-01-23		7.5	10000014
11003719	2020-01-23		0.65000000000000002	10000383
11003720	2020-01-23		0.10000000000000001	10000133
11003721	2020-01-23		4	10000456
11003722	2020-01-23		2.5	10000450
11003723	2020-01-24		1.75	10000450
11003724	2020-01-24	吃饭找不到地方	1.5	10000160
11003725	2020-01-24		7.5	10000014
11003726	2020-01-24		0.5	10000383
11003727	2020-01-24		0.5	10000420
11003728	2020-01-24	东京塔	2	10000461
11003729	2020-01-24		1.5	10000326
11003730	2020-01-24		2	10000462
11003731	2020-01-24		1	10000317
11003732	2020-01-24		3	10000456
11003733	2020-01-24		0.25	10000035
11003734	2020-01-24		0.5	10000286
11003735	2020-01-24	上班时想了很多，12点到家后玩了三个半小时	5.5	10000457
11003736	2020-01-25		0.25	10000293
11003737	2020-01-25		5.5	10000451
11003738	2020-01-25		1	10000160
11003739	2020-01-25		0.25	10000119
11003740	2020-01-25		3	10000457
11003741	2020-01-25		0.5	10000143
11003742	2020-01-25		1.25	10000450
11003743	2020-01-25	肺炎，来日手续	1	10000278
11003744	2020-01-25	做梦，犯罪，逃狱，称王，好神奇的展开。	5	10000014
11003745	2020-01-25		0.5	10000445
11003746	2020-01-25		0.25	10000133
11003747	2020-01-25		1	10000463
11003748	2020-01-25		1	10000464
11003749	2020-01-25		0.5	10000465
11003750	2020-01-25	聊小说	1	10000287
11003751	2020-01-26	回顾，战斗场面	0.5	10000466
11003752	2020-01-26		0.25	10000293
11003753	2020-01-26		1	10000450
11003754	2020-01-26		0.25	10000463
11003755	2020-01-26	回顾，战斗场面	0.5	10000038
11003756	2020-01-26		1	10000322
11003757	2020-01-26		0.5	10000160
11003758	2020-01-26		1	10000287
11003759	2020-01-26		5	10000457
11003760	2020-01-26	早起会不去了，青年会不去了，在家睡觉玩游戏。	9	10000014
11003761	2020-01-26		0.25	10000035
11003762	2020-01-26		0.25	10000447
11003763	2020-01-26		0.5	10000264
11003764	2020-01-26		4	10000451
11003765	2020-01-27		8	10000014
11003766	2020-01-27		2	10000467
11003767	2020-01-27		1	10000451
11003768	2020-01-27		6	10000286
11003769	2020-01-27		0.5	10000257
11003770	2020-01-27		0.25	10000264
11003771	2020-01-27		0.25	10000463
11003772	2020-01-27		0.25	10000316
11003773	2020-01-27		2	10000447
11003774	2020-01-27		2.5	10000457
11003775	2020-01-27		2	10000038
11003776	2020-01-27		0.75	10000160
11003777	2020-01-28		0.5	10000316
11003778	2020-01-28		1.5	10000457
11003779	2020-01-28		6.5	10000014
11003780	2020-01-28		0.5	10000420
11003781	2020-01-28		2	10000447
11003782	2020-01-28		0.25	10000133
11003783	2020-01-28		0.5	10000035
11003784	2020-01-28		2	10000038
11003785	2020-01-28		5	10000286
11003786	2020-01-28		0.5	10000463
11003787	2020-01-28		4	10000467
11003788	2020-01-28		1.5	10000160
11003789	2020-01-28		0.25	10000264
11003790	2020-01-29		1.5	10000451
11003791	2020-01-29		1.5	10000447
11003792	2020-01-29		0.5	10000293
11003793	2020-01-29		0.5	10000051
11003794	2020-01-29		0.5	10000072
11003795	2020-01-29		0.5	10000133
11003796	2020-01-29		0.5	10000035
11003797	2020-01-29		2	10000457
11003798	2020-01-29		4	10000286
11003799	2020-01-29		0.5	10000264
11003800	2020-01-29		6	10000014
11003801	2020-01-29		3	10000467
11003802	2020-01-29		0.5	10000383
11003803	2020-01-29		1	10000160
11003804	2020-01-30		0.5	10000035
11003805	2020-01-30		0	10000467
11003806	2020-01-30		0.5	10000264
11003807	2020-01-30		0	10000451
11003808	2020-01-30		1	10000160
11003809	2020-01-30		0	10000072
11003810	2020-01-30		1	10000383
11003811	2020-01-30		1.5	10000447
11003812	2020-01-30		2	10000457
11003813	2020-01-30		0	10000293
11003814	2020-01-30		6.5	10000014
11003815	2020-01-30		0.5	10000133
11003816	2020-01-30	效率不高，目标不明确	4	10000286
11003817	2020-01-30		4	10000456
11003818	2020-01-30		0	10000051
11003819	2020-01-30		1.5	10000420
11003820	2020-01-31		1.5	10000447
11003821	2020-01-31		0.5	10000133
11003822	2020-01-31		2	10000457
11003823	2020-01-31		1	10000160
11003824	2020-01-31		2	10000456
11003825	2020-01-31		0.5	10000420
11003826	2020-01-31	作为工作项目的期间结束了吧,发回家里自己做,准备两周内上线.	3	10000286
11003827	2020-01-31		0.5	10000035
11003828	2020-01-31		1	10000467
11003829	2020-01-31	睡下后起来玩游戏，果然还是该尽量避免了。	2	10000077
11003830	2020-01-31		1	10000451
11003831	2020-01-31		0.5	10000383
11003832	2020-01-31		3	10000468
11003833	2020-01-31		6.5	10000014
11003834	2020-02-01		1.5	10000020
11003835	2020-02-01		0.5	10000035
11003836	2020-02-01		4.5	10000457
11003837	2020-02-01	还是睡过了,要养成习惯难了啊	4.5	10000014
11003838	2020-02-01		0.75	10000133
11003839	2020-02-01		0.5	10000464
11003840	2020-02-01		2	10000447
11003841	2020-02-01		0.5	10000383
11003842	2020-02-01		7	10000451
11003843	2020-02-01		0.5	10000264
11003844	2020-02-01		0.75	10000160
11003845	2020-02-02	忘了洗的衣服，坐车来回错过。	0.5	10000383
11003846	2020-02-02		0.5	10000278
11003847	2020-02-02		2.5	10000457
11003848	2020-02-02		0.5	10000083
11003849	2020-02-02		1.5	10000020
11003850	2020-02-02		0.25	10000133
11003851	2020-02-02	打翻水壶醒了	6	10000014
11003852	2020-02-02		2.25	10000038
11003853	2020-02-02		0.75	10000160
11003854	2020-02-02		2.5	10000447
11003855	2020-02-02		0.25	10000035
11003856	2020-02-02		7	10000451
11003857	2020-02-03	不是无聊，只是做事很慢，浪费了时间	1.5	10000390
11003858	2020-02-03	补了三次觉，根本睡不够	7	10000014
11003859	2020-02-03		0.5	10000469
11003860	2020-02-03		0.75	10000447
11003861	2020-02-03		5	10000468
11003862	2020-02-03		0.25	10000035
11003863	2020-02-03		1	10000020
11003864	2020-02-03		0.75	10000160
11003865	2020-02-03		1.5	10000133
11003866	2020-02-03		0.25	10000264
11003867	2020-02-03		0.5	10000383
11003868	2020-02-03		3	10000451
11003869	2020-02-03		0.40000000000000002	10000445
11003870	2020-02-03		0.10000000000000001	10000463
11003871	2020-02-04		0.25	10000293
11003872	2020-02-04		0.75	10000160
11003873	2020-02-04		0.25	10000035
11003874	2020-02-04	效率特别低	5	10000468
11003875	2020-02-04		0.5	10000383
11003876	2020-02-04		1	10000451
11003877	2020-02-04	还是困	2.5	10000390
11003878	2020-02-04	形成习惯睡眠短，半夜醒，不是好事。然后是尝试去公司干活后，睡一个小时。	7.75	10000014
11003879	2020-02-04	准备玩半个小时。	2.5	10000457
11003880	2020-02-04	又一个资源网站	0.5	10000470
11003881	2020-02-04		1.25	10000447
11003882	2020-02-04		1.25	10000133
11003883	2020-02-04	主要就是路上，起床加来回。	1	10000020
11003884	2020-02-05		0.5	10000457
11003885	2020-02-05		3	10000456
11003886	2020-02-05	洗头结果打喷嚏，鼻子堵了	0.5	10000035
11003887	2020-02-05		0.75	10000160
11003888	2020-02-05		0.5	10000077
11003889	2020-02-05	超级漫不经心，当然困也是主要原因。	2	10000468
11003890	2020-02-05		0.25	10000133
11003891	2020-02-05		0.25	10000471
11003892	2020-02-05	帮买口罩，结果还是没买成。感觉很生疏了。	0.5	10000472
11003893	2020-02-05		2.25	10000447
11003894	2020-02-05		3	10000451
11003895	2020-02-05		2.5	10000390
11003896	2020-02-05		1	10000020
11003897	2020-02-05		1	10000383
11003898	2020-02-05	睡眠还不错,但是超级困，补觉不够。	6.75	10000014
11003899	2020-02-05		0.25	10000293
11003900	2020-02-06		1	10000133
11003901	2020-02-06		0.25	10000293
11003902	2020-02-06		1.25	10000020
11003903	2020-02-06		0.75	10000160
11003904	2020-02-06	居然看完了，又没事干了，记单词把。	1.5	10000447
11003905	2020-02-06		4	10000468
11003906	2020-02-06		3	10000451
11003907	2020-02-06		0.75	10000383
11003908	2020-02-06		0.5	10000035
11003909	2020-02-06		0.75	10000390
11003910	2020-02-06		6.25	10000014
11003911	2020-02-06		2.5	10000456
11003912	2020-02-06	炎龙	0.5	10000287
11003913	2020-02-06		1	10000457
11003914	2020-02-07		0.5	10000035
11003915	2020-02-07	补觉不习惯，根本睡不着。	6.75	10000014
11003916	2020-02-07		3	10000467
11003917	2020-02-07		1	10000020
11003918	2020-02-07		1.25	10000457
11003919	2020-02-07		0.5	10000264
11003920	2020-02-07		1	10000468
11003921	2020-02-07		3	10000456
11003922	2020-02-07		0.5	10000383
11003923	2020-02-07		1	10000133
11003924	2020-02-07		0.5	10000471
11003925	2020-02-07		0.75	10000160
11003926	2020-02-07		3.5	10000451
11003927	2020-02-07		0.5	10000390
11003928	2020-02-07	也就查查进展	0.25	10000473
11003929	2020-02-08		1	10000133
11003930	2020-02-08		2.5	10000457
11003931	2020-02-08		8	10000451
11003932	2020-02-08		0.5	10000009
11003933	2020-02-08		0.25	10000035
11003934	2020-02-08		0.5	10000264
11003935	2020-02-08		0.75	10000160
11003936	2020-02-08	Tradegy of losing my commit source.	2	10000134
11003937	2020-02-08	红十字会事件,感觉还是谣传多于实际.张文亮医生,这个就比较纠结了.	1	10000473
11003938	2020-02-08		1	10000020
11003939	2020-02-08		6.5	10000014
11003940	2020-02-08		0.5	10000470
11003941	2020-02-09		2	10000457
11003942	2020-02-09		8	10000451
11003943	2020-02-09		0.75	10000160
11003944	2020-02-09		6	10000014
11003945	2020-02-09		0.25	10000264
11003946	2020-02-09	最惨主角	0.5	10000442
11003947	2020-02-09		0.5	10000051
11003948	2020-02-09		0.25	10000133
11003949	2020-02-09	聊冠状病毒	1	10000287
11003950	2020-02-09		0.25	10000293
11003951	2020-02-09	不知道玩什么就该睡觉，但是不想睡，等找到事情做了，又耽误睡眠了。	0.75	10000474
11003952	2020-02-09		0.25	10000473
11003953	2020-02-09		0.5	10000470
11003954	2020-02-09		1.5	10000020
11003955	2020-02-09		0.25	10000288
11003956	2020-02-09		0.5	10000072
11003957	2020-02-09		0.5	10000035
11003958	2020-02-09		0.25	10000009
11003959	2020-02-09		0.5	10000077
11003960	2020-02-10	还是困得受不了	7	10000014
11003961	2020-02-10	虽然很困，但确实在干事。	9	10000456
11003962	2020-02-10		0.25	10000383
11003963	2020-02-10		0.5	10000009
11003964	2020-02-10		0.25	10000442
11003965	2020-02-10		1	10000451
11003966	2020-02-10		0.5	10000147
11003967	2020-02-10		0.5	10000133
11003968	2020-02-10		0.5	10000476
11003969	2020-02-10		0.5	10000475
11003970	2020-02-10		1	10000020
11003971	2020-02-10		2	10000457
11003972	2020-02-10		0.75	10000160
11003973	2020-02-11		0.25	10000293
11003974	2020-02-11	买switch	1	10000477
11003975	2020-02-11		0.25	10000264
11003976	2020-02-11		0.5	10000383
11003977	2020-02-11	电车补觉，根本没睡好。	6	10000014
11003978	2020-02-11		0.25	10000133
11003979	2020-02-11		0.5	10000072
11003980	2020-02-11		0.5	10000038
11003981	2020-02-11		3.5	10000457
11003982	2020-02-11		0.5	10000035
11003983	2020-02-11		0.5	10000464
11003984	2020-02-11		0.75	10000160
11003985	2020-02-11	src改重了,冯和张两人.	6.5	10000451
11003986	2020-02-11	下载下来有问题，弄了半天	1.5	10000225
11003987	2020-02-11		1.5	10000020
11003988	2020-02-12		0.5	10000383
11003989	2020-02-12		0.75	10000160
11003990	2020-02-12		0.5	10000264
11003991	2020-02-12		0.25	10000035
11003992	2020-02-12		0.5	10000133
11003993	2020-02-12	5.5 + 2	8	10000014
11003994	2020-02-12		2	10000457
11003995	2020-02-12		0.5	10000475
11003996	2020-02-12	买switch,结果还是没买.该问下学英语的小说和方法。	1	10000477
11003997	2020-02-12		1	10000451
11003998	2020-02-12	dont know I ever finished the work.	2	10000390
11003999	2020-02-12		1	10000020
11004000	2020-02-12	review 3 hours	6	10000467
11004001	2020-02-13		1.5	10000156
11004002	2020-02-13		1	10000468
11004003	2020-02-13		0.25	10000293
11004004	2020-02-13		3	10000390
11004005	2020-02-13		1	10000451
11004006	2020-02-13		0.75	10000160
11004007	2020-02-13		7.25	10000014
11004008	2020-02-13		2	10000457
11004009	2020-02-13		0.25	10000331
11004010	2020-02-13		0.5	10000470
11004011	2020-02-13	dont know what else to do	4.5	10000467
11004012	2020-02-13		0.25	10000035
11004013	2020-02-13		0.5	10000133
11004014	2020-02-13		1	10000020
11004015	2020-02-13		0.25	10000478
11004016	2020-02-14		0.5	10000264
11004017	2020-02-14		7	10000014
11004018	2020-02-14		1.5	10000457
11004019	2020-02-14		1	10000390
11004020	2020-02-14		1.5	10000451
11004021	2020-02-14		2	10000156
11004022	2020-02-14		0.5	10000383
11004023	2020-02-14		1	10000020
11004024	2020-02-14		7	10000456
11004025	2020-02-15		4	10000156
11004026	2020-02-15		3.5	10000457
11004027	2020-02-15		1	10000020
11004028	2020-02-15		5	10000451
11004029	2020-02-15		0.5	10000383
11004030	2020-02-15		6	10000014
11004031	2020-02-15		1	10000470
11004032	2020-02-15	熬通宵	4.5	10000038
11004033	2020-02-15		0.5	10000160
11004034	2020-02-16	难受死	1.5	10000020
11004035	2020-02-16		0.5	10000130
11004036	2020-02-16		0.5	10000445
11004037	2020-02-16		0.5	10000035
11004038	2020-02-16		0.5	10000160
11004039	2020-02-16	三把劣势翻盘局，爽	2.5	10000077
11004040	2020-02-16		0.5	10000383
11004041	2020-02-16		1	10000287
11004042	2020-02-16		1.5	10000457
11004043	2020-02-16		4	10000014
11004044	2020-02-16		0.5	10000225
11004045	2020-02-16	根本没翻到想看的	2.5	10000038
11004046	2020-02-16		1	10000156
11004047	2020-02-17		0.75	10000160
11004048	2020-02-17		8	10000456
11004049	2020-02-17		0.25	10000009
11004050	2020-02-17		0.25	10000133
11004051	2020-02-17		0.5	10000264
11004052	2020-02-17		1.5	10000451
11004053	2020-02-17		1	10000020
11004054	2020-02-17		2	10000156
11004055	2020-02-17		1.5	10000147
11004056	2020-02-17		0.25	10000035
11004057	2020-02-17		0.25	10000470
11004058	2020-02-17		7.5	10000014
11004059	2020-02-18		0.25	10000133
11004060	2020-02-18		0.5	10000264
11004061	2020-02-18		2.5	10000156
11004062	2020-02-18		1	10000160
11004063	2020-02-18		2	10000451
11004064	2020-02-18		1	10000020
11004065	2020-02-18		1	10000384
11004066	2020-02-18		0.5	10000383
11004067	2020-02-18		0.5	10000390
11004068	2020-02-18	靠，5天没有写，早就记不起来了。	0.5	10000293
11004069	2020-02-18		0.25	10000083
11004070	2020-02-18		7	10000014
11004071	2020-02-18		7	10000456
11004072	2020-02-19		1.5	10000451
11004073	2020-02-19		0.5	10000160
11004074	2020-02-19		1.5	10000390
11004075	2020-02-19		0.5	10000383
11004076	2020-02-19		2	10000023
11004077	2020-02-19		1.5	10000156
11004078	2020-02-19		8	10000014
11004079	2020-02-19		1.5	10000020
11004080	2020-02-19		4.5	10000456
11004081	2020-02-20		1	10000175
11004082	2020-02-20		1.5	10000020
11004083	2020-02-20		0.75	10000160
11004084	2020-02-20		5.5	10000014
11004085	2020-02-20	3连败	2	10000077
11004086	2020-02-20	太他妈浪费时间了	4	10000023
11004087	2020-02-20		0.25	10000035
11004088	2020-02-20		3	10000156
11004089	2020-02-20		2.5	10000390
11004090	2020-02-20		1.5	10000377
11004091	2020-02-20		4	10000451
11004092	2020-02-21		0.5	10000020
11004093	2020-02-21		0.75	10000160
11004094	2020-02-21	winsw, 居然成功了，之前的尝试和苦恼到底算什么呢	3	10000377
11004095	2020-02-21		0.25	10000035
11004096	2020-02-21		2	10000023
11004097	2020-02-21		2	10000390
11004098	2020-02-21		2	10000175
11004099	2020-02-21	windows update， 看源码	3.5	10000451
11004100	2020-02-21		6.5	10000014
11004101	2020-02-21		3.5	10000156
11004102	2020-02-22		1.25	10000160
11004103	2020-02-22		0.5	10000175
11004104	2020-02-22		0.5	10000020
11004105	2020-02-22		0.5	10000287
11004106	2020-02-22		0.25	10000035
11004107	2020-02-22		7	10000451
11004108	2020-02-22		2.5	10000156
11004109	2020-02-22		0.5	10000480
11004110	2020-02-22		3	10000077
11004111	2020-02-22		2	10000479
11004112	2020-02-22		5.5	10000014
11004113	2020-02-23		0.5	10000195
11004114	2020-02-23		1	10000132
11004115	2020-02-23		0.5	10000480
11004116	2020-02-23		0.5	10000160
11004117	2020-02-23	败了不爽，通宵，继续败	5	10000077
11004118	2020-02-23		0.5	10000383
11004119	2020-02-23		5.5	10000014
11004120	2020-02-23	手机没电,东张西望	1	10000474
11004121	2020-02-23		4	10000479
11004122	2020-02-23		1	10000020
11004123	2020-02-23		0.5	10000287
11004124	2020-02-23	改代码，想要规范，但效率太差。	7	10000451
11004125	2020-02-23		0.5	10000009
11004126	2020-02-24		0.5	10000160
11004127	2020-02-24		4.5	10000479
11004128	2020-02-24		2	10000132
11004129	2020-02-24		0.5	10000035
11004130	2020-02-24		0.5	10000083
11004131	2020-02-24	到头来发现没做的事情一大堆，赶都没法赶，之前完全没想到。	7	10000451
11004132	2020-02-24	通宵，早起会没了	5	10000014
11004133	2020-02-25		0.25	10000264
11004134	2020-02-25		0.5	10000383
11004135	2020-02-25		1	10000020
11004136	2020-02-25		1	10000132
11004137	2020-02-25		6	10000014
11004138	2020-02-25	好多代码需要改啊，我这些的到底是什么呢。有功能，但完全不规范。	6	10000377
11004139	2020-02-25		1.5	10000384
11004140	2020-02-25	早睡没通知别人，没有坚持到人家让我改代码。	3	10000451
11004141	2020-02-25	又是三天没记录了，必须得有手机版啊。而且Project经验也需要及时记录。	0.5	10000293
11004142	2020-02-25		0.25	10000035
11004143	2020-02-25		1.5	10000479
11004144	2020-02-25		0.25	10000160
11004145	2020-02-25		0.5	10000390
11004146	2020-02-25		0.75	10000133
11004147	2020-02-26	windows update 查一查，还是没结果	2.5	10000479
11004148	2020-02-26		0.5	10000480
11004149	2020-02-26		0.5	10000264
11004150	2020-02-26	好久没睡懒觉了，舒服，但早起会没去	7.5	10000014
11004151	2020-02-26		2.5	10000132
11004152	2020-02-26		6	10000384
11004153	2020-02-26		0.25	10000035
11004154	2020-02-26		1	10000143
11004155	2020-02-26		1	10000481
11004156	2020-02-26		0.25	10000160
11004157	2020-02-26	Windows Update问题被说了	2	10000451
11004158	2020-02-27		6	10000014
11004159	2020-02-27		4	10000384
11004160	2020-02-27	现场调试，真的好惨	4	10000451
11004161	2020-02-27		1.5	10000132
11004162	2020-02-27		0.25	10000160
11004163	2020-02-27	跑去扮演李四	5	10000479
11004164	2020-02-27		1	10000377
11004165	2020-02-27		1.5	10000480
11004166	2020-02-27		0.25	10000035
11004167	2020-02-27		1	10000390
11004168	2020-02-28		0.5	10000471
11004169	2020-02-28		1	10000147
11004170	2020-02-28		5	10000377
11004171	2020-02-28		0.25	10000035
11004172	2020-02-28		0.75	10000160
11004173	2020-02-28		6	10000014
11004174	2020-02-28		1.5	10000075
11004175	2020-02-28		1	10000481
11004176	2020-02-28		1	10000390
11004177	2020-02-28	通宵改，真的比工作有趣啊。	6.5	10000132
11004178	2020-02-28		2	10000479
11004179	2020-02-28		2	10000451
11004180	2020-02-29		0.5	10000072
11004181	2020-02-29		0.5	10000225
11004182	2020-02-29		4	10000451
11004183	2020-02-29	太不行了，完全调查不明白	5	10000479
11004184	2020-02-29		0.5	10000160
11004185	2020-02-29		3	10000077
11004186	2020-02-29	早起会要封了啊，对我来说是好事情	1.5	10000020
11004187	2020-02-29		4	10000132
11004188	2020-02-29	又睡懒觉，到11点	7	10000014
11004189	2020-02-29		0.5	10000383
11004190	2020-03-01	又发照片，有啥用呢	0.25	10000288
11004191	2020-03-01		1.5	10000479
11004192	2020-03-01		0.5	10000383
11004193	2020-03-01		5	10000014
11004194	2020-03-01		0.5	10000110
11004195	2020-03-01	代码规范,改了半天反而改错了,根本不会用EnumInfo这个东西.还不如不改.	5	10000451
11004196	2020-03-01		0.5	10000160
11004197	2020-03-02		0.5	10000326
11004198	2020-03-02		4	10000451
11004199	2020-03-02		0.25	10000035
11004200	2020-03-02	还是困的	2	10000390
11004201	2020-03-02		1.5	10000075
11004202	2020-03-02		4.5	10000377
11004203	2020-03-02		0.75	10000160
11004204	2020-03-02		9	10000014
11004205	2020-03-02		1	10000479
11004206	2020-03-02		1.5	10000132
11004207	2020-03-03		4	10000451
11004208	2020-03-03		0.25	10000035
11004209	2020-03-03		2	10000075
11004210	2020-03-03		0.75	10000160
11004211	2020-03-03		1	10000479
11004212	2020-03-03		4.5	10000377
11004213	2020-03-03		0.25	10000383
11004214	2020-03-03		3	10000132
11004215	2020-03-03		0.75	10000009
11004216	2020-03-03		1	10000390
11004217	2020-03-03		1	10000262
11004218	2020-03-03		6	10000014
11004219	2020-03-04		8	10000014
11004220	2020-03-04		3	10000132
11004221	2020-03-04		1	10000009
11004222	2020-03-04		0.75	10000160
11004223	2020-03-04		1	10000075
11004224	2020-03-04		0.25	10000035
11004225	2020-03-04		4	10000451
11004226	2020-03-04		1	10000390
11004227	2020-03-04	浪费时间，做证据还做错了，把画面弄丢了，想当然的去说了，尴尬。	2	10000384
11004228	2020-03-04		0.5	10000262
11004229	2020-03-04		4	10000377
11004230	2020-03-05	加班工资寄回家，算是第一次孝敬父母啊，重大事件。	0.5	10000236
11004231	2020-03-05		2.5	10000377
11004232	2020-03-05		6.5	10000014
11004233	2020-03-05		1.5	10000009
11004234	2020-03-05		0.25	10000293
11004235	2020-03-05		0.5	10000482
11004236	2020-03-05		0.75	10000160
11004237	2020-03-05		4	10000384
11004238	2020-03-05		0.5	10000479
11004239	2020-03-05		0.25	10000035
11004240	2020-03-05		1	10000075
11004241	2020-03-05		4	10000451
11004242	2020-03-05		0.5	10000390
11004243	2020-03-06		0.5	10000075
11004244	2020-03-06		0.5	10000288
11004245	2020-03-06		2	10000132
11004246	2020-03-06		5	10000377
11004247	2020-03-06		5.5	10000014
11004248	2020-03-06		0.5	10000479
11004249	2020-03-06		0.5	10000390
11004250	2020-03-06		1.5	10000009
11004251	2020-03-06		2	10000481
11004252	2020-03-06		4	10000451
11004253	2020-03-06		0.75	10000160
11004254	2020-03-06		1	10000278
11004255	2020-03-06		0.5	10000383
11004256	2020-03-07		0	10000383
11004257	2020-03-07		7	10000451
11004258	2020-03-07		0.5	10000279
11004259	2020-03-07		0.5	10000442
11004260	2020-03-07		0.25	10000225
11004261	2020-03-07		7	10000132
11004262	2020-03-07	尴尬，跟爸说钱借走了，其实没用，说没用，其实借走了。	0.5	10000287
11004263	2020-03-07		0.5	10000072
11004264	2020-03-07		0.5	10000009
11004265	2020-03-07		0.75	10000160
11004266	2020-03-07		8	10000014
11004267	2020-03-08		1	10000083
11004268	2020-03-08		2.5	10000132
11004269	2020-03-08		2	10000479
11004270	2020-03-08		0.5	10000225
11004271	2020-03-08		7	10000451
11004272	2020-03-08		0.5	10000278
11004273	2020-03-08		1	10000160
11004274	2020-03-08		0.5	10000383
11004275	2020-03-08		0.25	10000035
11004276	2020-03-08		7	10000014
11004277	2020-03-08	看不下去	0.25	10000442
11004278	2020-03-09		3	10000451
11004279	2020-03-09		0.5	10000383
11004280	2020-03-09		0.25	10000035
11004281	2020-03-09		0.5	10000479
11004282	2020-03-09	还有好多东西不懂呢，AcctDriver，DBImport	2	10000326
11004283	2020-03-09	review之后才能发现有好多功能性的东西应该改，该早点儿做出来多review几次。	5	10000377
11004284	2020-03-09		8	10000014
11004285	2020-03-09		0.5	10000009
11004286	2020-03-09	眼睛好胀，不敢看了。	0.5	10000264
11004287	2020-03-09		2	10000132
11004288	2020-03-09	眼睛好胀，不敢看了。	0.5	10000143
11004289	2020-03-09		1	10000160
11004290	2020-03-09		0.25	10000444
11004291	2020-03-10		4	10000451
11004292	2020-03-10		0.25	10000002
11004293	2020-03-10		0.75	10000160
11004294	2020-03-10		4	10000377
11004295	2020-03-10		0.25	10000075
11004296	2020-03-10		1	10000384
11004297	2020-03-10		2	10000390
11004298	2020-03-10		1.5	10000479
11004299	2020-03-10		0.25	10000035
11004300	2020-03-10		8	10000014
11004301	2020-03-10		0.25	10000293
11004302	2020-03-10		0.5	10000009
11004303	2020-03-10		0.25	10000383
11004304	2020-03-11		2	10000390
11004305	2020-03-11		6.5	10000014
11004306	2020-03-11		0.25	10000035
11004307	2020-03-11		6	10000451
11004308	2020-03-11	bug,bug,addition	3	10000377
11004309	2020-03-11		1	10000009
11004310	2020-03-11	协力，聊天，有点儿影响工作啊。	0.5	10000483
11004311	2020-03-11		1.5	10000479
11004312	2020-03-11	协力，基本在磨洋工了。	0.5	10000464
11004313	2020-03-11	Start, and wish to release in this month, one year from last program	2	10000286
11004314	2020-03-11		1.25	10000132
11004315	2020-03-11		0.75	10000160
11004316	2020-03-11		0.25	10000383
11004317	2020-03-11		0.5	10000075
11004318	2020-03-12		3	10000451
11004319	2020-03-12		1.5	10000390
11004320	2020-03-12		0.25	10000264
11004321	2020-03-12		1.5	10000009
11004322	2020-03-12		7	10000014
11004323	2020-03-12		1.5	10000384
11004324	2020-03-12		4	10000286
11004325	2020-03-12		3.5	10000132
11004326	2020-03-12		0.75	10000160
11004327	2020-03-13		2	10000451
11004328	2020-03-13		4.5	10000132
11004329	2020-03-13		7	10000014
11004330	2020-03-13		0.5	10000130
11004331	2020-03-13		0.5	10000072
11004332	2020-03-13		1	10000390
11004333	2020-03-13		0.75	10000160
11004334	2020-03-13		1	10000075
11004335	2020-03-13		2	10000468
11004336	2020-03-13	效率太低	4	10000286
11004337	2020-03-13		1	10000009
11004338	2020-03-13		0.25	10000035
11004339	2020-03-13		0.5	10000383
11004340	2020-03-14		0.5	10000160
11004341	2020-03-14	忘记密码了,尴尬	1	10000286
11004342	2020-03-14		6	10000132
11004343	2020-03-14		0.5	10000383
11004344	2020-03-14	闲聊,世界时事	1	10000287
11004345	2020-03-14		0.5	10000035
11004346	2020-03-14		0.5	10000009
11004347	2020-03-14		3	10000077
11004348	2020-03-14		7.5	10000014
11004349	2020-03-14		3	10000484
11004350	2020-03-14		2	10000451
11004351	2020-03-14		0.5	10000130
11004352	2020-03-15		1	10000484
11004353	2020-03-15		6	10000132
11004354	2020-03-15		1	10000160
11004355	2020-03-15		0.25	10000286
11004356	2020-03-15	又没买到指甲刀	0.25	10000383
11004357	2020-03-15		0	10000479
11004358	2020-03-15		4	10000451
11004359	2020-03-15		0.5	10000035
11004360	2020-03-15		0.5	10000262
11004361	2020-03-15		6.5	10000014
11004362	2020-03-16		6.5	10000014
11004363	2020-03-16		0.5	10000160
11004364	2020-03-16		3	10000286
11004365	2020-03-16	MsgId	4	10000023
11004366	2020-03-16		2	10000009
11004367	2020-03-16		1.5	10000077
11004368	2020-03-16	修改庇护所光环，失败	2	10000132
11004369	2020-03-16		1	10000390
11004370	2020-03-16		0.5	10000383
11004371	2020-03-16	Evidence	3	10000451
11004372	2020-03-17		0.5	10000072
11004373	2020-03-17	牛顿法，搞了多少天了，还在玩	1	10000384
11004374	2020-03-17		1.5	10000009
11004375	2020-03-17	NoAssign终于来了	1	10000468
11004376	2020-03-17		0.25	10000286
11004377	2020-03-17		3	10000077
11004378	2020-03-17		0.25	10000035
11004379	2020-03-17		0.5	10000160
11004380	2020-03-17	重启服务器出问题了，找半天，结果是环境变量被替换	6	10000023
11004381	2020-03-17	赖床4小时	9	10000014
11004382	2020-03-17		1	10000451
11004383	2020-03-17		1	10000002
11004384	2020-03-17		2.5	10000485
11004385	2020-03-17		0.5	10000132
11004386	2020-03-18		1.5	10000009
11004387	2020-03-18		1.5	10000486
11004388	2020-03-18		3	10000023
11004389	2020-03-18		1	10000451
11004390	2020-03-18		5.5	10000014
11004391	2020-03-18	手机上传，好累	1	10000002
11004392	2020-03-18		2	10000077
11004393	2020-03-18		1	10000390
11004394	2020-03-18		2	10000468
11004395	2020-03-18	想了想，还是没动，不好改。	1	10000132
11004396	2020-03-18		0.5	10000160
11004397	2020-03-18		0.5	10000479
11004398	2020-03-19		5	10000077
11004399	2020-03-19		1	10000160
11004400	2020-03-19		2	10000390
11004401	2020-03-19	发呆了几个小时，最后发现问题了，但是到点下班了。	4	10000468
11004402	2020-03-19		1	10000009
11004403	2020-03-19		0.5	10000479
11004404	2020-03-19		2	10000132
11004405	2020-03-19		0.5	10000035
11004406	2020-03-19		2	10000486
11004407	2020-03-19	搞了半天，没找到	2	10000487
11004408	2020-03-19		6	10000014
11004409	2020-03-19		1	10000481
11004410	2020-03-20		7	10000014
11004411	2020-03-20		1	10000486
11004412	2020-03-20		0.5	10000009
11004413	2020-03-20		1	10000287
11004414	2020-03-20		1	10000051
11004415	2020-03-20		3	10000245
11004416	2020-03-20		0.5	10000278
11004417	2020-03-20	零食吃了一大堆	1	10000160
11004418	2020-03-20		3	10000077
11004419	2020-03-20		6	10000132
11004420	2020-03-21	小凉宫搞笑	1	10000488
11004421	2020-03-21		0.5	10000051
11004422	2020-03-21		0.5	10000486
11004423	2020-03-21		1	10000160
11004547	2020-04-02		1	10000486
11004424	2020-03-21	看了两把上单薇恩，别人就压着人打，我晕啊，然后，没心思打了。感觉真的梦过去了呢，职业玩家或者游戏高手梦。	2	10000179
11004425	2020-03-21	打了四把，躺赢躺赢，尴尬啊	3	10000404
11004426	2020-03-21	乱七八糟看一通，还是人文关怀最暖心	1	10000060
11004427	2020-03-21		8	10000014
11004428	2020-03-21		0.5	10000445
11004429	2020-03-21		2	10000077
11004430	2020-03-21		0.5	10000009
11004431	2020-03-21		1	10000132
11004432	2020-03-21	抖音里开了不少，确实严重了	1	10000473
11004433	2020-03-22		9.5	10000014
11004434	2020-03-22		1.5	10000179
11004435	2020-03-22	购物，总算把插板买回来了。	0.5	10000383
11004436	2020-03-22		1	10000083
11004437	2020-03-22		0.5	10000009
11004438	2020-03-22		1	10000160
11004439	2020-03-22	抖音上看，果然好严重。然后中国，确实在这样的团结，控制方面好发挥。	3	10000473
11004440	2020-03-22	总算把服务器给租了，真是早该做成的事情呢。	3	10000286
11004441	2020-03-22		4	10000077
11004442	2020-03-23		1	10000160
11004443	2020-03-23		0.5	10000383
11004444	2020-03-23		2.5	10000486
11004445	2020-03-23	小事情，nsr参数，java包	1	10000384
11004446	2020-03-23		8	10000014
11004447	2020-03-23	问题不严重，但查了好久	8	10000468
11004448	2020-03-23		3	10000077
11004449	2020-03-24		8	10000014
11004450	2020-03-24		3.5	10000489
11004451	2020-03-24		0.5	10000264
11004452	2020-03-24		1.5	10000486
11004453	2020-03-24		0.75	10000160
11004454	2020-03-24		0.25	10000035
11004455	2020-03-24		6	10000077
11004456	2020-03-24		4.5	10000468
11004457	2020-03-25		4	10000468
11004458	2020-03-25		1	10000451
11004459	2020-03-25		0.5	10000473
11004460	2020-03-25		0.5	10000479
11004461	2020-03-25		3	10000489
11004462	2020-03-25		1	10000390
11004463	2020-03-25		1	10000486
11004464	2020-03-25		1	10000002
11004465	2020-03-25		0.75	10000160
11004466	2020-03-25		6	10000014
11004467	2020-03-25		0.5	10000009
11004468	2020-03-25		4	10000077
11004469	2020-03-25		0.25	10000035
11004470	2020-03-25		0.5	10000072
11004471	2020-03-26		4	10000468
11004472	2020-03-26		0.5	10000479
11004473	2020-03-26		6.5	10000014
11004474	2020-03-26		3	10000451
11004475	2020-03-26		0.5	10000009
11004476	2020-03-26		0.25	10000035
11004477	2020-03-26		1	10000264
11004478	2020-03-26		0.5	10000133
11004479	2020-03-26		0.75	10000160
11004480	2020-03-26		4	10000489
11004481	2020-03-26		2	10000077
11004482	2020-03-26	抢购食物，仅仅慢了半天，超市东西少了一半	0.5	10000473
11004483	2020-03-27		1	10000473
11004484	2020-03-27		1	10000390
11004485	2020-03-27		0.25	10000035
11004486	2020-03-27		0.5	10000264
11004487	2020-03-27		0.75	10000160
11004488	2020-03-27		7	10000014
11004489	2020-03-27		3	10000457
11004490	2020-03-27		3	10000451
11004491	2020-03-27		1	10000009
11004492	2020-03-27		5	10000489
11004493	2020-03-27	我们也要在宅了，哈哈	2	10000481
11004494	2020-03-28		0.5	10000009
11004495	2020-03-28		0.5	10000445
11004496	2020-03-28		0.5	10000035
11004497	2020-03-28		7	10000077
11004498	2020-03-28		7	10000451
11004499	2020-03-28		1	10000479
11004500	2020-03-28		7	10000014
11004501	2020-03-28		1	10000486
11004502	2020-03-28		0.5	10000463
11004503	2020-03-28		1	10000160
11004504	2020-03-29		8.5	10000014
11004505	2020-03-29		0.25	10000286
11004506	2020-03-29		0.25	10000035
11004507	2020-03-29		9	10000451
11004508	2020-03-29		0.5	10000160
11004509	2020-03-29		4	10000479
11004510	2020-03-30		1	10000390
11004511	2020-03-30		1	10000479
11004512	2020-03-30		0.5	10000473
11004513	2020-03-30		6.5	10000489
11004514	2020-03-30		0.25	10000035
11004515	2020-03-30		0.75	10000051
11004516	2020-03-30		4	10000451
11004517	2020-03-30		0.75	10000160
11004518	2020-03-30		0.5	10000236
11004519	2020-03-30		1.5	10000481
11004520	2020-03-30		0.75	10000060
11004521	2020-03-30		0.5	10000264
11004522	2020-03-30		6.5	10000014
11004523	2020-03-31		0.5	10000160
11004524	2020-03-31		5.5	10000077
11004525	2020-03-31		0.5	10000486
11004526	2020-03-31		0.5	10000489
11004527	2020-03-31		2	10000479
11004528	2020-03-31		0.5	10000288
11004529	2020-03-31		6	10000014
11004530	2020-03-31		0.5	10000060
11004531	2020-03-31		7	10000451
11004532	2020-04-01		1	10000051
11004533	2020-04-01		0.5	10000473
11004534	2020-04-01	改得有问题,查啊查	6	10000468
11004535	2020-04-01		7.5	10000014
11004536	2020-04-01		0.75	10000160
11004537	2020-04-01		1	10000489
11004538	2020-04-01		0.5	10000481
11004539	2020-04-01	教他图片透明,做印章	0.5	10000314
11004540	2020-04-01		1	10000486
11004541	2020-04-01		0.25	10000035
11004542	2020-04-01		0.5	10000479
11004543	2020-04-01		3	10000077
11004544	2020-04-01		1	10000390
11004545	2020-04-02		2	10000390
11004546	2020-04-02		0.25	10000035
11004548	2020-04-02		0.5	10000481
11004549	2020-04-02		0.75	10000160
11004550	2020-04-02		5	10000468
11004551	2020-04-02		1.5	10000077
11004552	2020-04-02		3	10000404
11004553	2020-04-02		0.5	10000473
11004554	2020-04-02		0.5	10000009
11004555	2020-04-02		0.25	10000133
11004556	2020-04-02		6.5	10000014
11004557	2020-04-02		2	10000262
11004558	2020-04-02		0.25	10000225
11004559	2020-04-03		0.75	10000160
11004560	2020-04-03		6.5	10000014
11004561	2020-04-03		1	10000481
11004562	2020-04-03		0.25	10000035
11004563	2020-04-03		0.5	10000009
11004564	2020-04-03		1.5	10000051
11004565	2020-04-03		0.5	10000486
11004566	2020-04-03		4	10000468
11004567	2020-04-03		2	10000404
11004568	2020-04-03		4	10000491
11004569	2020-04-03		2	10000077
11004570	2020-04-03		2	10000390
11004571	2020-04-03		1	10000490
11004572	2020-04-03		1.5	10000132
11004573	2020-04-03		0.5	10000473
11004574	2020-04-04	哀悼日,玩不了,不知道干啥了.	3.25	10000077
11004575	2020-04-04		1.5	10000051
11004576	2020-04-04		1.5	10000132
11004577	2020-04-04		0.25	10000160
11004578	2020-04-04		9.5	10000014
11004579	2020-04-04		0.25	10000133
11004580	2020-04-04	看自己得录像,真的死得好惨哪,乱冲,点兵.当然也有很爽得时候.	1.5	10000179
11004581	2020-04-04		1.25	10000490
11004582	2020-04-04		0.5	10000492
11004583	2020-04-04		1	10000009
11004584	2020-04-04	金任务，好难	2.5	10000486
11004585	2020-04-04		2.5	10000491
11004586	2020-04-05		1	10000051
11004587	2020-04-05		3	10000404
11004588	2020-04-05		9.5	10000014
11004589	2020-04-05		5	10000077
11004590	2020-04-05		0.5	10000009
11004591	2020-04-05		0.25	10000035
11004592	2020-04-05		0.75	10000490
11004593	2020-04-05		0.5	10000287
11004594	2020-04-05		0	10000383
11004595	2020-04-05	跟大哥聊	0.5	10000473
11004596	2020-04-05		1	10000160
11004597	2020-04-05		0.5	10000491
11004598	2020-04-06		3	10000390
11004599	2020-04-06		0.5	10000143
11004600	2020-04-06		5	10000077
11004601	2020-04-06		0.5	10000383
11004602	2020-04-06		1	10000060
11004603	2020-04-06		1	10000474
11004604	2020-04-06		1	10000490
11004605	2020-04-06		0.75	10000160
11004606	2020-04-06		2	10000051
11004607	2020-04-06		0.25	10000035
11004608	2020-04-06		1	10000473
11004609	2020-04-06		3	10000286
11004610	2020-04-06		2	10000481
11004611	2020-04-06		6	10000014
11004612	2020-04-07		6.5	10000014
11004613	2020-04-07		0.5	10000160
11004614	2020-04-07		0.5	10000473
11004615	2020-04-07		1	10000490
11004616	2020-04-07		2	10000077
11004617	2020-04-07		3	10000404
11004618	2020-04-07	拖了大半年才联系上，果然还是出问题了。妈妈老年痴呆，回家照顾去了。想给他送点儿钱，他也不要，果然我帮人不注意方式方法。	3	10000493
11004619	2020-04-07		1	10000474
11004620	2020-04-07		0.5	10000060
11004621	2020-04-07	好久不见，柴羽san，小林san来串门了	0.25	10000020
11004622	2020-04-07		3	10000051
11004623	2020-04-07		0.5	10000481
11004624	2020-04-07		0.25	10000035
11004625	2020-04-08		5.5	10000051
11004626	2020-04-08		1	10000490
11004627	2020-04-08		0.5	10000160
11004628	2020-04-08		0.5	10000293
11004629	2020-04-08		10	10000014
11004630	2020-04-08		3.5	10000077
11004631	2020-04-08	隔壁音乐不停，睡不了	1	10000474
11004632	2020-04-08		3	10000404
11004633	2020-04-08		0.5	10000481
11004634	2020-04-09		8.5	10000051
11004635	2020-04-09		8	10000014
11004636	2020-04-09		2	10000494
11004637	2020-04-09		0.5	10000130
11004638	2020-04-09		3	10000077
11004639	2020-04-09		1	10000160
11004640	2020-04-09	缴费，住房保险	0.5	10000383
11004641	2020-04-10		1	10000474
11004642	2020-04-10		1	10000160
11004643	2020-04-10	挑战通宵	10	10000051
11004644	2020-04-10	随便写了个学习报告，根本没学习	0.25	10000481
11004645	2020-04-10		0.5	10000490
11004646	2020-04-10	还爬山，还是算了	0.5	10000461
11004647	2020-04-10		7	10000014
11004648	2020-04-10		0.5	10000035
11004649	2020-04-10		3	10000077
11004650	2020-04-10		2.5	10000404
11004651	2020-04-10		1	10000494
11004652	2020-04-10	aliyun，服务器买了，但是没干事	0.5	10000286
11004653	2020-04-10		0.25	10000225
11004654	2020-04-10		2	10000179
11004655	2020-04-11		2	10000077
11004656	2020-04-11		0.5	10000473
11004657	2020-04-11		0.5	10000494
11004658	2020-04-11		9	10000014
11004659	2020-04-11		0.5	10000287
11004660	2020-04-11		3.5	10000051
11004661	2020-04-11		1	10000175
11004662	2020-04-11		0.25	10000293
11004663	2020-04-11		0.5	10000288
11004664	2020-04-11		0.25	10000133
11004665	2020-04-11		0.5	10000160
11004666	2020-04-12		0	10000288
11004667	2020-04-12		1	10000077
11004668	2020-04-12		1.5	10000175
11004669	2020-04-12		0.5	10000195
11004670	2020-04-12		0.5	10000495
11004671	2020-04-12		5.5	10000014
11004672	2020-04-12		1	10000160
11004673	2020-04-12		6	10000404
11004674	2020-04-12		0.5	10000474
11004675	2020-04-12		5	10000051
11004676	2020-04-12		0.5	10000383
11004677	2020-04-13		0.5	10000160
11004678	2020-04-13		0.5	10000496
11004679	2020-04-13		6	10000077
11004680	2020-04-13		5.5	10000051
11004681	2020-04-13		12	10000014
11004682	2020-04-13		0.5	10000494
11004683	2020-04-13		1	10000490
11004684	2020-04-14		0.25	10000035
11004685	2020-04-14		0.5	10000499
11004686	2020-04-14	出去买东西,路上终于没人了,业务超市好多人	1	10000383
11004687	2020-04-14		0.5	10000496
11004688	2020-04-14		1	10000498
11004689	2020-04-14		1	10000445
11004690	2020-04-14		3	10000497
11004691	2020-04-14		1.5	10000473
11004692	2020-04-14		0.5	10000160
11004693	2020-04-14		0.25	10000009
11004694	2020-04-14		2	10000490
11004695	2020-04-14		1	10000307
11004696	2020-04-14	欺负菜鸟开心啊	4	10000077
11004697	2020-04-14		4	10000014
11004698	2020-04-14		1.5	10000468
11004699	2020-04-15		1	10000445
11004700	2020-04-15		0.5	10000035
11004701	2020-04-15		12	10000014
11004702	2020-04-15		0	10000383
11004703	2020-04-15	终于吃了顿正常的了	1.5	10000160
11004704	2020-04-15		0.5	10000474
11004705	2020-04-15	通宵到第二天不睡觉	14	10000500
11004706	2020-04-15		1	10000490
11004707	2020-04-15		0.5	10000481
11004708	2020-04-15		1	10000494
11004709	2020-04-16		0.5	10000160
11004710	2020-04-16		4.5	10000014
11004711	2020-04-16		3	10000077
11004712	2020-04-16		0	10000132
11004713	2020-04-16		0.5	10000494
11004714	2020-04-16		1	10000474
11004715	2020-04-16		0.5	10000481
11004716	2020-04-16		14	10000500
11004717	2020-04-17		0.5	10000035
11004718	2020-04-17		1	10000160
11004719	2020-04-17		0.5	10000474
11004720	2020-04-17	完全不睡觉了，熬夜两天，还不吃饭	3	10000014
11004721	2020-04-17		0.5	10000468
11004722	2020-04-17		14	10000500
11004723	2020-04-17		2	10000404
11004724	2020-04-17		0.5	10000077
11004725	2020-04-17		0.5	10000494
11004726	2020-04-17		1.5	10000481
11004727	2020-04-18	出门吃饭，买老干妈，都成了难以做成的事情了。	1.5	10000160
11004728	2020-04-18		6	10000014
11004729	2020-04-18	清北班，又一个保底的选择了吧。虽然还是觉得有一部分，选择态度的疑虑。	1.5	10000278
11004730	2020-04-18	终于赢了，今天两把顺	2	10000404
11004731	2020-04-18	3个月不见，小家伙长变了吗，微信视频上看不出来	0.5	10000417
11004732	2020-04-18		8	10000500
11004733	2020-04-18		0.5	10000035
11004734	2020-04-18		0.5	10000494
11004735	2020-04-19		9.5	10000014
11004736	2020-04-19		16	10000500
11004737	2020-04-19		1.5	10000503
11004738	2020-04-19	训练完好累	0.5	10000474
11004739	2020-04-19	旗袍什么时候衰落的，大陆文化大革命，台湾90以后的西化文化。	0.25	10000501
11004740	2020-04-19	Skype	0.25	10000502
11004741	2020-04-19		1	10000459
11004742	2020-04-19		0.25	10000445
11004743	2020-04-19		0.25	10000307
11004744	2020-04-19		1	10000160
11004745	2020-04-19		1	10000035
11004746	2020-04-20		1	10000404
11004747	2020-04-20	还是不行啊，验证怎么验证，似乎没法验证。	1.25	10000468
11004748	2020-04-20		0.25	10000481
11004749	2020-04-20		5	10000500
11004750	2020-04-20		0.5	10000160
11004751	2020-04-20		5.5	10000014
11004752	2020-04-21		1	10000160
11004753	2020-04-21	程序还有改动，但我没仔细想过逻辑，拍照失败的时候。	0.5	10000479
11004754	2020-04-21		1.5	10000468
11004755	2020-04-21		4	10000077
11004756	2020-04-21	2点半对面消停了，我也可以睡觉了。	5.5	10000014
11004757	2020-04-21		1.25	10000009
11004758	2020-04-21		0.25	10000293
11004759	2020-04-21		0.25	10000463
11004760	2020-04-21		1	10000505
11004761	2020-04-21		0.5	10000471
11004762	2020-04-21	打包，但是还是没打完，还得去	2	10000481
11004763	2020-04-21		0.5	10000377
11004764	2020-04-21		0.5	10000500
11004765	2020-04-21		1	10000051
11004766	2020-04-21	结果跟我之前加班拿到的一样，安装真失败，怎么就不想好了，搞好了再回家，急着跑路	5	10000504
11004767	2020-04-21		0.25	10000035
11004768	2020-04-21		0.5	10000383
11004769	2020-04-21	纽约时报，还真是神奇，就把中国当敌人。	1.5	10000473
11004770	2020-04-22	断网，死机，好麻烦	1	10000504
11004771	2020-04-22	定个错闹钟，5点醒了，然后再睡了一个小时。再睡了一下午，本来该上班，对面还闹了一会儿。	8	10000014
11004772	2020-04-22		1.5	10000505
11004773	2020-04-22		6	10000500
11004774	2020-04-22		0.5	10000035
11004775	2020-04-22		0.75	10000160
11004776	2020-04-22		1	10000060
11004777	2020-04-22	其实是noassign	0.5	10000468
11004778	2020-04-22		1	10000459
11004779	2020-04-22		3	10000489
11004780	2020-04-22		0.25	10000494
11004781	2020-04-22		2	10000077
11004782	2020-04-23		2	10000404
11004783	2020-04-23		2	10000506
11004784	2020-04-23		0.5	10000442
11004785	2020-04-23		0.5	10000401
11004786	2020-04-23		0.5	10000035
11004787	2020-04-23	vpn连不上啊	2	10000504
11004788	2020-04-23		0.5	10000048
11004789	2020-04-23	人都睡废了	11	10000014
11004790	2020-04-23		1	10000489
11004791	2020-04-23		0.5	10000287
11004792	2020-04-23		0.5	10000009
11004793	2020-04-23		1	10000500
11004794	2020-04-23		0.5	10000160
11004795	2020-04-23		0.5	10000473
11004796	2020-04-24		2	10000404
11004797	2020-04-24		0.5	10000401
11004798	2020-04-24		1	10000160
11004799	2020-04-24	就跟vpn较劲了	1	10000504
11004800	2020-04-24	就跟vpn较劲了	2.5	10000481
11004801	2020-04-24		9	10000500
11004802	2020-04-24		4	10000014
11004803	2020-04-24		4.5	10000506
11004804	2020-04-25		0.25	10000498
11004805	2020-04-25		6.5	10000014
11004806	2020-04-25		1.5	10000077
11004807	2020-04-25	眼药水都不会滴	0.75	10000383
11004808	2020-04-25		5.5	10000506
11004809	2020-04-25		7.25	10000500
11004810	2020-04-25		1.5	10000160
11004811	2020-04-25		1.5	10000401
11004812	2020-04-25		0.25	10000363
11004813	2020-04-26	3+3.5+1.5	8	10000014
11004814	2020-04-26		5	10000500
11004815	2020-04-26		1.5	10000506
11004816	2020-04-26		2	10000404
11004817	2020-04-26		0.5	10000383
11004818	2020-04-26		5	10000077
11004819	2020-04-26		1.5	10000160
11004820	2020-04-26		0.5	10000463
11004821	2020-04-27		0.5	10000035
11004822	2020-04-27		4	10000500
11004823	2020-04-27		2	10000077
11004824	2020-04-27		4	10000506
11004825	2020-04-27		1	10000060
11004826	2020-04-27		1	10000160
11004827	2020-04-27	再也不弄鸡肉了，炒不熟还酸臭	0.5	10000048
11004828	2020-04-27		5.5	10000014
11004829	2020-04-27		0.5	10000401
11004830	2020-04-27		1	10000463
11004831	2020-04-28		2.25	10000060
11004832	2020-04-28		1	10000160
11004833	2020-04-28	中国科幻大片，真心没想到做得这么出色了	2.5	10000507
11004834	2020-04-28		6	10000014
11004835	2020-04-28		2.5	10000384
11004836	2020-04-28		0.25	10000035
11004837	2020-04-28		2.5	10000506
11004838	2020-04-28		0.5	10000383
11004839	2020-04-28		1	10000442
11004840	2020-04-28	LOL打不开	0.5	10000474
11004841	2020-04-28		6	10000077
11004842	2020-04-28		2	10000500
11004843	2020-04-29		0.5	10000498
11004844	2020-04-29		0.75	10000160
11004845	2020-04-29		2.5	10000060
11004846	2020-04-29		3	10000077
11004847	2020-04-29		3	10000500
11004848	2020-04-29		0.25	10000383
11004849	2020-04-29		0.5	10000315
11004850	2020-04-29		12.5	10000014
11004851	2020-04-29		0.5	10000143
11004852	2020-04-29		1.5	10000404
11004853	2020-04-30		1	10000508
11004854	2020-04-30		2.5	10000143
11004855	2020-04-30	开始刷明星了，林心如，刘亦菲什么的	6.5	10000060
11004856	2020-04-30		1	10000503
11004857	2020-04-30		4	10000014
11004858	2020-04-30	Springboot离线，不想调查啊	2.5	10000384
11004859	2020-04-30		0.5	10000160
11004860	2020-04-30		0.5	10000383
11004861	2020-04-30		2.5	10000404
11004862	2020-04-30		0.5	10000287
11004863	2020-04-30		0.5	10000077
11004864	2020-04-30		5.5	10000506
11004865	2020-05-01		2.5	10000404
11004866	2020-05-01		7	10000014
11004867	2020-05-01		1.5	10000077
11004868	2020-05-01		0.75	10000160
11004869	2020-05-01		1.5	10000506
11004870	2020-05-01		6	10000060
11004871	2020-05-01		0.25	10000035
11004872	2020-05-01		0.5	10000503
11004873	2020-05-01		3	10000500
11004874	2020-05-01		1	10000180
11004875	2020-05-02		0.5	10000160
11004876	2020-05-02		3	10000500
11004877	2020-05-02	3连败	2	10000404
11004878	2020-05-02		0.5	10000035
11004879	2020-05-02		5	10000014
11004880	2020-05-02		1	10000077
11004881	2020-05-02		2	10000060
11004882	2020-05-02		1	10000510
11004883	2020-05-02	给送书来了，没注意	0.5	10000020
11004884	2020-05-02		1	10000180
11004885	2020-05-02		0.5	10000503
11004886	2020-05-02		7	10000509
11004887	2020-05-03		10	10000014
11004888	2020-05-03	传销好黑	1	10000511
11004889	2020-05-03		0.5	10000060
11004890	2020-05-03		2.5	10000077
11004891	2020-05-03		0.25	10000020
11004892	2020-05-03		0.25	10000133
11004893	2020-05-03		0.5	10000160
11004894	2020-05-03		0.25	10000307
11004895	2020-05-03		1	10000287
11004896	2020-05-03		1	10000505
11004897	2020-05-03		1.5	10000180
11004898	2020-05-03		2.5	10000503
11004899	2020-05-03		1	10000497
11004900	2020-05-03		0.25	10000035
11004901	2020-05-03		1.5	10000143
11004902	2020-05-04		2	10000500
11004903	2020-05-04		8	10000014
11004904	2020-05-04		1	10000083
11004905	2020-05-04		1	10000383
11004906	2020-05-04		1.5	10000060
11004907	2020-05-04		1	10000130
11004908	2020-05-04		1	10000503
11004909	2020-05-04	新冠主题	1.5	10000512
11004910	2020-05-04		3	10000404
11004911	2020-05-04	二战暴行	0.5	10000511
11004912	2020-05-04		2	10000180
11004913	2020-05-04		1	10000143
11004914	2020-05-04		0.5	10000160
11004915	2020-05-05		1.25	10000473
11004916	2020-05-05		0.75	10000463
11004917	2020-05-05		2	10000404
11004918	2020-05-05		0.5	10000160
11004919	2020-05-05		8.5	10000014
11004920	2020-05-05		1	10000503
11004921	2020-05-05	吃零食不算吃饭	0.5	10000383
11004922	2020-05-05		0.5	10000445
11004923	2020-05-05		0.5	10000498
11004924	2020-05-05		2	10000512
11004925	2020-05-05	主席年限	0.5	10000511
11004926	2020-05-05		5	10000500
11004927	2020-05-05		1	10000505
11004928	2020-05-06		1.75	10000500
11004929	2020-05-06		8.5	10000014
11004930	2020-05-06		0.75	10000503
11004931	2020-05-06		0.5	10000060
11004932	2020-05-06		0.5	10000512
11004933	2020-05-06		0.5	10000225
11004934	2020-05-06		0.25	10000009
11004935	2020-05-06		8.5	10000513
11004936	2020-05-06		0.75	10000160
11004937	2020-05-06		0.5	10000179
11004938	2020-05-06		0.5	10000180
11004939	2020-05-06		1	10000077
11004940	2020-05-07		0.25	10000035
11004941	2020-05-07		0.25	10000383
11004942	2020-05-07		0.75	10000160
11004943	2020-05-07		0.5	10000481
11004944	2020-05-07		5	10000060
11004945	2020-05-07		0.25	10000473
11004946	2020-05-07		0.5	10000514
11004947	2020-05-07		9	10000014
11004948	2020-05-07		0.5	10000512
11004949	2020-05-07		0.5	10000401
11004950	2020-05-07		0.25	10000133
11004951	2020-05-07		0.5	10000503
11004952	2020-05-07		0.25	10000459
11004953	2020-05-07		2.5	10000077
11004954	2020-05-07	SVRS2 环境搭建	3	10000384
11004955	2020-05-08		2.5	10000077
11004956	2020-05-08		0.5	10000497
11004957	2020-05-08		0.25	10000383
11004958	2020-05-08		0.25	10000133
11004959	2020-05-08		0.75	10000160
11004960	2020-05-08		0.5	10000288
11004961	2020-05-08		1	10000384
11004962	2020-05-08		2	10000473
11004963	2020-05-08		0.25	10000035
11004964	2020-05-08		8	10000014
11004965	2020-05-08		0.25	10000494
11004966	2020-05-08		0.25	10000512
11004967	2020-05-08		0.5	10000503
11004968	2020-05-08		2.5	10000060
11004969	2020-05-08		1.5	10000404
11004970	2020-05-08		1	10000401
11004971	2020-05-08		1	10000489
11004972	2020-05-08		1	10000481
11004973	2020-05-09		0.25	10000463
11004974	2020-05-09		0.25	10000133
11004975	2020-05-09		0.75	10000503
11004976	2020-05-09		0.5	10000511
11004977	2020-05-09		3.5	10000014
11004978	2020-05-09		4	10000077
11004979	2020-05-09		1	10000160
11004980	2020-05-09		1.25	10000512
11004981	2020-05-09		4	10000060
11004982	2020-05-09		1	10000473
11004983	2020-05-09		0.25	10000035
11004984	2020-05-09		7	10000515
11004985	2020-05-09		0.25	10000505
11004986	2020-05-10		5.5	10000060
11004987	2020-05-10		10	10000014
11004988	2020-05-10		0.5	10000503
11004989	2020-05-10		0.25	10000287
11004990	2020-05-10		0.25	10000288
11004991	2020-05-10		5	10000077
11004992	2020-05-10		1	10000051
11004993	2020-05-10		1	10000512
11004994	2020-05-10		0.5	10000505
11004995	2020-05-11		0.5	10000401
11004996	2020-05-11		6	10000051
11004997	2020-05-11		7	10000014
11004998	2020-05-11		0.5	10000471
11004999	2020-05-11		1.5	10000481
11005000	2020-05-11		1.5	10000077
11005001	2020-05-11		0.5	10000516
11005002	2020-05-11		0.5	10000517
11005003	2020-05-11		0.5	10000497
11005004	2020-05-11		0.75	10000503
11005005	2020-05-11		0.75	10000160
11005006	2020-05-11		4	10000060
11005007	2020-05-12		0.5	10000489
11005008	2020-05-12		1	10000518
11005009	2020-05-12		3.5	10000060
11005010	2020-05-12		0.5	10000503
11005011	2020-05-12		0.5	10000512
11005012	2020-05-12		2	10000481
11005013	2020-05-12		4	10000051
11005014	2020-05-12		0.5	10000035
11005015	2020-05-12		5	10000014
11005016	2020-05-12	原稿练习，好难，还得再练两小时	3	10000020
11005017	2020-05-12		0.25	10000383
11005018	2020-05-12		1	10000262
11005019	2020-05-12		0.75	10000160
11005020	2020-05-12		1.5	10000077
11005021	2020-05-13		0.5	10000503
11005022	2020-05-13		0.25	10000035
11005023	2020-05-13		0.5	10000498
11005024	2020-05-13		1	10000481
11005025	2020-05-13		7	10000014
11005026	2020-05-13		0.25	10000459
11005027	2020-05-13		1	10000160
11005028	2020-05-13		0.25	10000307
11005029	2020-05-13		1.5	10000077
11005030	2020-05-13		5	10000060
11005031	2020-05-13		0.75	10000518
11005032	2020-05-13		6	10000051
11005033	2020-05-14		2	10000404
11005034	2020-05-14		4	10000518
11005035	2020-05-14		0.5	10000503
11005036	2020-05-14		4	10000060
11005037	2020-05-14		1	10000179
11005038	2020-05-14		0.5	10000494
11005039	2020-05-14		0.25	10000035
11005040	2020-05-14		0.25	10000498
11005041	2020-05-14	休息，眼睛痛	0.5	10000383
11005042	2020-05-14		0.25	10000481
11005043	2020-05-14		0.25	10000463
11005044	2020-05-14		0.5	10000287
11005045	2020-05-14		1.5	10000512
11005046	2020-05-14		0.5	10000009
11005047	2020-05-14		0.25	10000445
11005048	2020-05-14		0.75	10000160
11005049	2020-05-14		1.5	10000489
11005050	2020-05-14		2	10000077
11005051	2020-05-15		1	10000512
11005052	2020-05-15		1.5	10000278
11005053	2020-05-15		0.25	10000133
11005054	2020-05-15	William gates speech	0.75	10000331
11005055	2020-05-15		0.5	10000390
11005056	2020-05-15		1	10000489
11005057	2020-05-15		0.5	10000463
11005058	2020-05-15		2	10000481
11005059	2020-05-15		6.5	10000014
11005060	2020-05-15		1.5	10000404
11005061	2020-05-15		3	10000500
11005062	2020-05-15		2	10000077
11005063	2020-05-15		0.5	10000494
11005064	2020-05-15		4	10000060
11005065	2020-05-15		0.5	10000160
11005066	2020-05-16	脸书，苹果乔布斯，大学演讲	1.5	10000331
11005067	2020-05-16		0.5	10000133
11005068	2020-05-16		0.25	10000143
11005069	2020-05-16		4	10000500
11005070	2020-05-16		1	10000519
11005071	2020-05-16		0.25	10000459
11005072	2020-05-16		1	10000160
11005073	2020-05-16	中国发生疫情的原因	0.5	10000473
11005074	2020-05-16		1.25	10000060
11005075	2020-05-16		11.75	10000014
11005076	2020-05-16		2	10000512
11005077	2020-05-17		0.5	10000519
11005078	2020-05-17		0.25	10000307
11005079	2020-05-17		2.5	10000503
11005080	2020-05-17		1	10000459
11005081	2020-05-17	特朗普的支持者	0.5	10000511
11005082	2020-05-17		0.5	10000445
11005083	2020-05-17		0.25	10000133
11005084	2020-05-17		1	10000383
11005085	2020-05-17		2	10000512
11005086	2020-05-17		4.5	10000077
11005087	2020-05-17		0.25	10000035
11005088	2020-05-17		1	10000060
11005089	2020-05-17		0.75	10000160
11005090	2020-05-17		0.5	10000520
11005091	2020-05-18	Lux连坑	3	10000077
11005092	2020-05-18		4	10000489
11005093	2020-05-18		0.5	10000519
11005094	2020-05-18		0.5	10000179
11005095	2020-05-18		0.25	10000504
11005096	2020-05-18		1.5	10000512
11005097	2020-05-18		0.25	10000035
11005098	2020-05-18		1.5	10000404
11005099	2020-05-18		0.25	10000481
11005100	2020-05-18		1.5	10000521
11005101	2020-05-18		0.5	10000518
11005102	2020-05-18		10	10000014
11005103	2020-05-18		1.25	10000473
11005104	2020-05-18		2.75	10000522
11005105	2020-05-18		0.75	10000160
11005106	2020-05-18		0.5	10000060
11005107	2020-05-19		1.5	10000077
11005108	2020-05-19		0.5	10000401
11005109	2020-05-19	伊拉克战争	0.5	10000511
11005110	2020-05-19		0.5	10000499
11005111	2020-05-19		0.5	10000519
11005112	2020-05-19		1	10000473
11005113	2020-05-19		2	10000512
11005114	2020-05-19		0.5	10000445
11005115	2020-05-19		0.5	10000060
11005116	2020-05-19		8	10000014
11005117	2020-05-19		0.5	10000498
11005118	2020-05-19		2	10000404
11005119	2020-05-19		0.5	10000035
11005120	2020-05-19	新冠，朝鲜战争	0.5	10000287
11005121	2020-05-19		0.5	10000463
11005122	2020-05-19		3.5	10000489
11005123	2020-05-19	根本不是ero，而是动作游戏	1	10000523
11005124	2020-05-19		0.5	10000522
11005125	2020-05-19		0.5	10000160
11005126	2020-05-20		0.5	10000160
11005127	2020-05-20		5	10000489
11005128	2020-05-20		0.5	10000481
11005129	2020-05-20		1	10000459
11005130	2020-05-20		1.5	10000522
11005131	2020-05-20		0.5	10000463
11005132	2020-05-20		1.5	10000499
11005133	2020-05-20		1	10000143
11005134	2020-05-20		3.5	10000077
11005135	2020-05-20		7.5	10000014
11005136	2020-05-20		0.5	10000287
11005137	2020-05-20		3	10000524
11005138	2020-05-21	九品芝麻官	0.5	10000526
11005139	2020-05-21		0.25	10000035
11005140	2020-05-21		0.25	10000287
11005141	2020-05-21		0.5	10000160
11005142	2020-05-21		0.75	10000481
11005143	2020-05-21		0.25	10000384
11005144	2020-05-21		6	10000014
11005145	2020-05-21		0.25	10000225
11005146	2020-05-21		0.5	10000143
11005147	2020-05-21		3.25	10000525
11005148	2020-05-21		0.25	10000401
11005149	2020-05-21		3.5	10000077
11005150	2020-05-21		3	10000060
11005151	2020-05-21		2	10000404
11005152	2020-05-21	世界名将	0.25	10000511
11005153	2020-05-22		2	10000404
11005154	2020-05-22		3	10000077
11005155	2020-05-22	好难看下去	4	10000527
11005156	2020-05-22		1	10000481
11005157	2020-05-22		7	10000014
11005158	2020-05-22		0.5	10000384
11005159	2020-05-22	台湾历史	1	10000511
11005160	2020-05-22		3	10000500
11005161	2020-05-22		0.5	10000390
11005162	2020-05-22		4	10000060
11005163	2020-05-22		1	10000522
11005164	2020-05-23		6.5	10000014
11005165	2020-05-23		0.5	10000445
11005166	2020-05-23		0.5	10000494
11005167	2020-05-23		0.5	10000519
11005168	2020-05-23		1	10000060
11005169	2020-05-23		0.5	10000160
11005170	2020-05-23		2	10000077
11005171	2020-05-23		0.5	10000225
11005172	2020-05-23		2	10000500
11005173	2020-05-23		1	10000522
11005174	2020-05-24		0.5	10000528
11005175	2020-05-24	记不住了，超过一天就记不住	0.5	10000293
11005176	2020-05-24		0.5	10000519
11005177	2020-05-24		1.5	10000522
11005178	2020-05-24		2.25	10000143
11005179	2020-05-24	新冠，历史，大航海地图探险	2	10000287
11005180	2020-05-24		0.25	10000499
11005181	2020-05-24		2	10000060
11005182	2020-05-24		1	10000077
11005183	2020-05-24		0.5	10000529
11005184	2020-05-24		7	10000263
11005185	2020-05-24		0.5	10000514
11005186	2020-05-24		1	10000530
11005187	2020-05-24		11	10000014
11005188	2020-05-25		1.5	10000404
11005189	2020-05-25		0.5	10000225
11005190	2020-05-25		7	10000014
11005191	2020-05-25		1	10000522
11005192	2020-05-25		0.25	10000035
11005193	2020-05-25		1.25	10000060
11005195	2020-05-25		0.5	10000160
11005197	2020-05-25		10	10000531
11005198	2020-05-26		0.5	10000383
11005199	2020-05-26		0.5	10000522
11005200	2020-05-26		0.5	10000498
11005201	2020-05-26		0.5	10000264
11005202	2020-05-26		2	10000404
11005203	2020-05-26		0.25	10000009
11005204	2020-05-26		1	10000489
11005205	2020-05-26		0.5	10000514
11005206	2020-05-26		5	10000060
11005207	2020-05-26		0.5	10000160
11005208	2020-05-26		0.25	10000035
11005209	2020-05-26		2	10000481
11005210	2020-05-26		1.5	10000533
11005211	2020-05-26		7	10000014
11005212	2020-05-26		0.5	10000390
11005213	2020-05-26		0.5	10000519
11005214	2020-05-26		1	10000534
11005215	2020-05-27		1	10000459
11005216	2020-05-27		0.25	10000524
11005217	2020-05-27		3.25	10000377
11005218	2020-05-27		0.25	10000481
11005219	2020-05-27		1	10000264
11005220	2020-05-27		11	10000510
11005221	2020-05-27		1	10000514
11005222	2020-05-27		0.25	10000160
11005223	2020-05-27		0.5	10000262
11005224	2020-05-27		1	10000287
11005225	2020-05-27		0.25	10000463
11005226	2020-05-27		2	10000060
11005227	2020-05-27		1	10000522
11005228	2020-05-27		7.5	10000014
11005229	2020-05-27		0.25	10000512
11005230	2020-05-28		5.5	10000014
11005231	2020-05-28		0.25	10000035
11005232	2020-05-28		2.5	10000077
11005233	2020-05-28		0.5	10000160
11005234	2020-05-28		0.25	10000401
11005235	2020-05-28		2	10000060
11005236	2020-05-28		0.5	10000505
11005237	2020-05-28		0.5	10000519
11005238	2020-05-28		0.5	10000471
11005239	2020-05-28		2	10000522
11005240	2020-05-28		0.5	10000051
11005241	2020-05-28	帮忙找工作	1.5	10000535
11005242	2020-05-28		1	10000510
11005243	2020-05-29		5	10000536
11005244	2020-05-29		1.5	10000481
11005245	2020-05-29	上午直接睡过了，还自己报告了	8.5	10000014
11005246	2020-05-29		0.25	10000035
11005247	2020-05-29		3	10000077
11005248	2020-05-29		0.25	10000160
11005249	2020-05-29		3	10000533
11005250	2020-05-29		3	10000060
11005251	2020-05-29		2	10000537
11005252	2020-05-29		0.5	10000503
11005253	2020-05-30		1	10000539
11005254	2020-05-30		0.5	10000287
11005255	2020-05-30		0.75	10000160
11005256	2020-05-30		0.5	10000404
11005257	2020-05-30		1	10000505
11005258	2020-05-30		1	10000442
11005259	2020-05-30		2	10000077
11005260	2020-05-30		8	10000014
11005261	2020-05-30		0.25	10000035
11005262	2020-05-30		2	10000060
11005263	2020-05-30	人家结婚，我居然忘了送红包。	0.5	10000477
11005264	2020-05-30		0.5	10000051
11005265	2020-05-30		1	10000536
11005266	2020-05-30	出门买东西. too much of good things, need to rest	1	10000383
11005267	2020-05-30		0.5	10000538
11005268	2020-05-31		10	10000014
11005269	2020-05-31		1.5	10000540
11005270	2020-05-31		0.5	10000514
11005271	2020-05-31		0.5	10000539
11005272	2020-05-31	或许这才是我的生活，迷茫，向往自由，迷失梦想	0.5	10000541
11005273	2020-05-31		1.5	10000060
11005274	2020-05-31		0.25	10000160
11005275	2020-05-31		0.25	10000499
11005276	2020-05-31		3.5	10000533
11005277	2020-05-31	迷茫	0.5	10000474
11005278	2020-05-31		0.5	10000180
11005279	2020-05-31		0.25	10000035
11005280	2020-05-31		0.25	10000307
11005281	2020-05-31		0.5	10000535
11005282	2020-05-31	喝酒，瓜子	1.25	10000538
11005283	2020-05-31	该再重新看看我的novel了	0.25	10000293
11005284	2020-06-01		0.5	10000471
11005285	2020-06-01		1	10000077
11005286	2020-06-01		10	10000014
11005287	2020-06-01		0.5	10000481
11005288	2020-06-01		0.5	10000519
11005289	2020-06-01	刘文辉，学校要比县衙好	1	10000511
11005290	2020-06-01		0.25	10000133
11005291	2020-06-01	漫画终于有更新了	4	10000543
11005292	2020-06-01		2.5	10000542
11005293	2020-06-01		0.75	10000160
11005294	2020-06-01		1	10000533
11005295	2020-06-01		0.5	10000060
11005296	2020-06-01		1	10000512
11005297	2020-06-02		0.75	10000544
11005298	2020-06-02		0.5	10000194
11005299	2020-06-02	又烧焦了	0.75	10000160
11005300	2020-06-02		7.5	10000539
11005301	2020-06-02		0.5	10000545
11005302	2020-06-02		4.5	10000542
11005303	2020-06-02		0.5	10000498
11005304	2020-06-02		0.25	10000383
11005305	2020-06-02		2.5	10000060
11005306	2020-06-02		0.25	10000035
11005307	2020-06-02		9	10000014
11005308	2020-06-03		0.25	10000546
11005309	2020-06-03		1.5	10000522
11005310	2020-06-03		1.5	10000060
11005311	2020-06-03		0.25	10000035
11005312	2020-06-03		0.75	10000544
11005313	2020-06-03	好烦	3	10000489
11005314	2020-06-03		2.5	10000077
11005315	2020-06-03		3.5	10000328
11005316	2020-06-03		0.5	10000160
11005317	2020-06-03		0.25	10000383
11005318	2020-06-03	被部长无视了，打回重做	0.5	10000481
11005319	2020-06-03		0.25	10000494
11005320	2020-06-03		1.25	10000519
11005321	2020-06-03		8	10000014
11005322	2020-06-04	好困哪	8	10000014
11005323	2020-06-04		4.25	10000077
11005324	2020-06-04		0.5	10000481
11005325	2020-06-04		2.5	10000060
11005326	2020-06-04	睡不着	0.5	10000474
11005327	2020-06-04		1	10000522
11005328	2020-06-04		0.25	10000527
11005329	2020-06-04		0.5	10000471
11005330	2020-06-04	微信小程序	1	10000401
11005331	2020-06-04		2.5	10000539
11005332	2020-06-04		0.25	10000160
11005333	2020-06-04		2	10000547
11005334	2020-06-04		0.25	10000363
11005335	2020-06-04		0.5	10000286
11005336	2020-06-05		1	10000481
11005337	2020-06-05		6.5	10000014
11005338	2020-06-05	散步去吃饭	0.5	10000383
11005339	2020-06-05		1	10000160
11005340	2020-06-05		4	10000539
11005341	2020-06-05		2.5	10000542
11005342	2020-06-05		0.5	10000514
11005343	2020-06-05		1	10000547
11005344	2020-06-05		0.5	10000474
11005345	2020-06-05		1.5	10000404
11005346	2020-06-05		2.5	10000060
11005347	2020-06-05		0.5	10000519
11005348	2020-06-05		0.5	10000287
11005349	2020-06-05		1	10000536
11005350	2020-06-05		0.5	10000194
11005351	2020-06-06		0.25	10000035
11005352	2020-06-06		7	10000547
11005353	2020-06-06		0.5	10000522
11005354	2020-06-06		3	10000548
11005355	2020-06-06		0.5	10000160
11005356	2020-06-06		1.5	10000060
11005357	2020-06-06		0.25	10000549
11005358	2020-06-06		7	10000383
11005359	2020-06-06		1	10000195
11005360	2020-06-07	最惨主角，从零开始的异世界	0.5	10000287
11005361	2020-06-07		0.25	10000473
11005362	2020-06-07		0.5	10000160
11005363	2020-06-07		0.75	10000175
11005364	2020-06-07		5	10000547
11005365	2020-06-07		0.5	10000522
11005366	2020-06-07		0.25	10000060
11005367	2020-06-07		11	10000014
11005368	2020-06-07		0.5	10000363
11005369	2020-06-07	没考好，继续学	0.5	10000278
11005370	2020-06-07		0.25	10000544
11005371	2020-06-07		0.5	10000401
11005372	2020-06-07		1.5	10000195
11005373	2020-06-08		2	10000542
11005374	2020-06-08		0.5	10000383
11005375	2020-06-08		1	10000264
11005376	2020-06-08		1	10000522
11005377	2020-06-08	跟郭志南回头玩11平台，被电脑虐地好惨	1.5	10000551
11005378	2020-06-08	又一个电话号码，哎，没有那个耐心谈，不知道谈什么	0.5	10000288
11005379	2020-06-08		1	10000060
11005381	2020-06-08	sdl的round	1	10000384
11005382	2020-06-08		6	10000553
11005383	2020-06-08		1	10000552
11005384	2020-06-08		0.75	10000160
11005385	2020-06-08		0.25	10000035
11005386	2020-06-08		7.5	10000014
11005387	2020-06-09	3800憋了28分钟，对面高地都掉了	1	10000551
11005388	2020-06-09		2.5	10000060
11005389	2020-06-09	无限火力可以选人啊	1	10000077
11005390	2020-06-09		0.25	10000035
11005391	2020-06-09	面试失败了	0.25	10000535
11005392	2020-06-09	肯定睡不好，白天	7	10000014
11005393	2020-06-09		0.25	10000160
11005394	2020-06-09		4	10000554
11005395	2020-06-09		1	10000195
11005396	2020-06-09	打个卡好艰难，半睡半醒间	0.5	10000481
11005397	2020-06-09	该做微信车票demo了	0.25	10000401
11005398	2020-06-09		2	10000522
11005399	2020-06-10		0.5	10000528
11005400	2020-06-10		0.25	10000481
11005401	2020-06-10		0.5	10000555
11005402	2020-06-10	花时间提取音频	1.5	10000519
11005403	2020-06-10		0.25	10000498
11005404	2020-06-10		2.5	10000060
11005405	2020-06-10	项目告吹了，改做微信物产店	0.5	10000547
11005406	2020-06-10		0.25	10000401
11005407	2020-06-10		0.5	10000463
11005408	2020-06-10		5	10000543
11005409	2020-06-10		2	10000522
11005410	2020-06-10		2	10000195
11005411	2020-06-10		0.5	10000160
11005412	2020-06-10	洗头	0.25	10000035
11005413	2020-06-10		7	10000014
11005414	2020-06-10		0.5	10000077
11005415	2020-06-11		8	10000014
11005416	2020-06-11		0.25	10000401
11005417	2020-06-11		1.25	10000522
11005418	2020-06-11	请假不说，被追问了。	0.25	10000481
11005419	2020-06-11		5	10000543
11005420	2020-06-11		0.75	10000519
11005421	2020-06-11	磕了半小时瓜子	0.75	10000383
11005422	2020-06-11		0.25	10000035
11005423	2020-06-11		0.25	10000293
11005424	2020-06-11		1	10000046
11005425	2020-06-11	不吃晚饭，夜里饿啊	0.75	10000160
11005426	2020-06-11	刚不明白对象存储	3	10000555
11005427	2020-06-11		2	10000060
11005428	2020-06-12	乱七八糟看了一大堆	4	10000060
11005429	2020-06-12	报告结果，没戏，田。	0.25	10000288
11005430	2020-06-12		6.5	10000014
11005431	2020-06-12		0.25	10000133
11005432	2020-06-12		1.75	10000481
11005433	2020-06-12		0.5	10000287
11005434	2020-06-12		1	10000544
11005435	2020-06-12		0.5	10000527
11005436	2020-06-12		0.5	10000543
11005437	2020-06-12		1	10000536
11005438	2020-06-12		1	10000551
11005439	2020-06-12	CPU占用，怎么办	1	10000555
11005440	2020-06-12	汤圆，又烧焦了.第一顿火锅午餐肉	1.75	10000160
11005441	2020-06-12	曾经的音乐，能引起共鸣，才是最好的。牧马城市，明天会更好。	1	10000514
11005442	2020-06-13		2	10000555
11005443	2020-06-13		0.5	10000160
11005444	2020-06-13		0.5	10000519
11005445	2020-06-13	少年怨灵神庙	0.25	10000363
11005446	2020-06-13		3.5	10000060
11005447	2020-06-13		1.5	10000556
11005448	2020-06-13		0.5	10000473
11005449	2020-06-13		13	10000014
11005450	2020-06-13		1.5	10000522
11005451	2020-06-13		0.25	10000288
11005452	2020-06-13		1	10000278
11005453	2020-06-14		6	10000539
11005454	2020-06-14		2	10000522
11005455	2020-06-14	比广告的那个小白文强太多了	1.5	10000557
11005456	2020-06-14		0.5	10000307
11005457	2020-06-14		1.25	10000278
11005458	2020-06-14		0.25	10000051
11005459	2020-06-14		0.25	10000035
11005460	2020-06-14		0.5	10000488
11005461	2020-06-14	美国禁用matlab，被删掉的课文	1	10000511
11005462	2020-06-14	昏昏沉沉的睡眠	6	10000014
11005463	2020-06-14		2	10000060
11005464	2020-06-14	毛不易	1	10000514
11005465	2020-06-14		0.75	10000160
11005466	2020-06-14		0.25	10000383
11005467	2020-06-14		0.25	10000499
11005468	2020-06-15		1	10000287
11005469	2020-06-15		0.25	10000035
11005470	2020-06-15		0.25	10000505
11005471	2020-06-15		12	10000557
11005472	2020-06-15		0.5	10000401
11005473	2020-06-15		0.5	10000160
11005474	2020-06-15		1.5	10000533
11005475	2020-06-15		1.5	10000481
11005476	2020-06-15	对面实在太吵了，对心脏不好。	6	10000014
11005477	2020-06-16		0.25	10000499
11005478	2020-06-16		12	10000557
11005479	2020-06-16		0.25	10000307
11005480	2020-06-16		2	10000539
11005481	2020-06-16		8	10000014
11005482	2020-06-16		0.5	10000505
11005483	2020-06-16		0.5	10000160
11005484	2020-06-16	睡过头了	0.5	10000481
11005485	2020-06-17		1	10000533
11005486	2020-06-17		0.5	10000160
11005487	2020-06-17		12	10000557
11005488	2020-06-17		2.5	10000046
11005489	2020-06-17		1	10000481
11005490	2020-06-17		7	10000014
11005491	2020-06-18		0.5	10000035
11005492	2020-06-18	终于看完了	6.5	10000557
11005493	2020-06-18		0.5	10000160
11005494	2020-06-18		2	10000558
11005495	2020-06-18	3天没记	0.25	10000293
11005496	2020-06-18		2	10000533
11005497	2020-06-18		1	10000481
11005498	2020-06-18		2	10000539
11005499	2020-06-18	坐车手机没电	1	10000383
11005500	2020-06-18		3	10000046
11005501	2020-06-18	不止吵得睡不着，还能把睡着的吵醒。	2.75	10000014
11005502	2020-06-19		6	10000558
11005503	2020-06-19		12	10000014
11005504	2020-06-19		1.25	10000481
11005505	2020-06-19		2	10000060
11005506	2020-06-19		2	10000404
11005507	2020-06-19		0.25	10000160
11005508	2020-06-19		0.25	10000293
11005509	2020-06-19	虽然思维主要停留在付钱找不出零钱，但重点是曾经有机会追女孩，没有去啊。	0.25	10000363
11005510	2020-06-20		2	10000539
11005511	2020-06-20		1	10000195
11005512	2020-06-20		6	10000014
11005513	2020-06-20		12	10000558
11005514	2020-06-20		0.5	10000383
11005515	2020-06-20		0.5	10000160
11005516	2020-06-20		1	10000175
11005517	2020-06-20		1	10000060
11005518	2020-06-21		1	10000522
11005519	2020-06-21		0.25	10000383
11005520	2020-06-21		3	10000195
11005521	2020-06-21		0.5	10000473
11005522	2020-06-21		0.5	10000160
11005523	2020-06-21		0.75	10000559
11005524	2020-06-21		1	10000060
11005525	2020-06-21	买三轮车，都不知道今天是父亲节	1	10000429
11005526	2020-06-21		0.25	10000463
11005527	2020-06-21		0.25	10000035
11005528	2020-06-21		1	10000505
11005529	2020-06-21		0.5	10000471
11005530	2020-06-21		2	10000404
11005531	2020-06-21	搞定	6	10000558
11005532	2020-06-21		6	10000014
11005533	2020-06-22		1	10000522
11005534	2020-06-22		2	10000539
11005535	2020-06-22		1	10000560
11005536	2020-06-22	抖音国际版	1.5	10000561
11005537	2020-06-22		0.5	10000499
11005538	2020-06-22		0.25	10000527
11005539	2020-06-22		3	10000533
11005540	2020-06-22		0.5	10000463
11005541	2020-06-22		3	10000195
11005542	2020-06-22		1.5	10000060
11005543	2020-06-22		0.25	10000401
11005544	2020-06-22		0.25	10000383
11005545	2020-06-22		0.5	10000160
11005546	2020-06-22		6.5	10000014
11005547	2020-06-22		0.25	10000293
11005548	2020-06-22		0.25	10000481
11005549	2020-06-22		0.25	10000035
11005550	2020-06-22		0.5	10000307
11005551	2020-06-22		0.5	10000287
11005552	2020-06-22	劣势翻盘	0.5	10000404
11005553	2020-06-23	我该回头了，三个月加班，三个月玩耍，三个月学习，就三十岁了	0.5	10000352
11005554	2020-06-23		0.5	10000563
11005555	2020-06-23		0.25	10000293
11005556	2020-06-23	TikTok	1	10000562
11005557	2020-06-23		4	10000560
11005558	2020-06-23	睡不着	10.75	10000014
11005559	2020-06-23		0.5	10000561
11005560	2020-06-23		0.25	10000383
11005561	2020-06-23		0.25	10000481
11005562	2020-06-23		0.75	10000160
11005563	2020-06-23		1	10000009
11005564	2020-06-23		4	10000533
11005565	2020-06-23		0.25	10000498
11005566	2020-06-24		1	10000564
11005567	2020-06-24		0.75	10000565
11005568	2020-06-24	半夜醒，不知道被吵醒还是热醒	7	10000014
11005569	2020-06-24	没有显示器转接头	0.5	10000502
11005570	2020-06-24	Gundam，Fate	2	10000060
11005571	2020-06-24		1	10000560
11005572	2020-06-24		0.25	10000035
11005573	2020-06-24		3	10000195
11005574	2020-06-24	三连败	2	10000404
11005575	2020-06-24		1	10000519
11005576	2020-06-24		0.5	10000077
11005577	2020-06-24		0.5	10000160
11005578	2020-06-24		4	10000533
11005579	2020-06-24		0.5	10000561
11005580	2020-06-24		0.5	10000566
11005581	2020-06-24		0.5	10000390
11005582	2020-06-24		0.25	10000498
11005583	2020-06-24		0.5	10000009
11005584	2020-06-24		0.25	10000481
11005585	2020-06-25		1	10000563
11005586	2020-06-25		0.5	10000401
11005587	2020-06-25		2	10000404
11005588	2020-06-25		0.5	10000561
11005589	2020-06-25		0.25	10000481
11005590	2020-06-25		0.5	10000160
11005591	2020-06-25		5	10000567
11005592	2020-06-25		0.25	10000363
11005593	2020-06-25		1	10000505
11005594	2020-06-25		0.5	10000009
11005595	2020-06-25		4	10000533
11005596	2020-06-25		2.5	10000195
11005597	2020-06-25		0.5	10000035
11005598	2020-06-25		6.5	10000014
11005599	2020-06-26		0.5	10000565
11005600	2020-06-26		0.5	10000561
11005601	2020-06-26		2	10000195
11005602	2020-06-26		2	10000563
11005603	2020-06-26		3	10000404
11005604	2020-06-26		0.5	10000060
11005605	2020-06-26		0.5	10000035
11005606	2020-06-26		0.5	10000160
11005607	2020-06-26		7.5	10000014
11005608	2020-06-26		6.5	10000567
11005609	2020-06-26		0.5	10000481
11005610	2020-06-27		1	10000505
11005611	2020-06-27		3	10000195
11005612	2020-06-27		0.5	10000561
11005613	2020-06-27		0.5	10000130
11005614	2020-06-27		0.25	10000035
11005615	2020-06-27		10	10000567
11005616	2020-06-27		0.5	10000160
11005617	2020-06-27		0.25	10000471
11005618	2020-06-27		7	10000014
11005619	2020-06-28	总算大清理了一次，该扔的扔，该洗的洗，该收起来的收起来。	2	10000130
11005620	2020-06-28		1	10000160
11005621	2020-06-28		2	10000195
11005622	2020-06-28		1	10000110
11005623	2020-06-28		2	10000083
11005624	2020-06-28		0.5	10000035
11005625	2020-06-28		7.5	10000014
11005626	2020-06-28		6	10000567
11005627	2020-06-29		0.5	10000160
11005628	2020-06-29		0.25	10000035
11005629	2020-06-29		3	10000195
11005630	2020-06-29		5	10000014
11005631	2020-06-29		6	10000567
11005632	2020-06-29		0.5	10000060
11005633	2020-06-29		0.25	10000471
11005634	2020-06-29	好久没有认真干活了，结果还没干完，尴尬	9	10000533
11005635	2020-06-29		1.5	10000505
11005636	2020-06-29	太恐怖，忍不住要放点儿音乐了。	0.5	10000514
11005637	2020-06-30		0.25	10000035
11005638	2020-06-30		0.5	10000160
11005639	2020-06-30		2.5	10000568
11005640	2020-06-30		6.5	10000014
11005641	2020-06-30	又是半年总结	1	10000481
11005642	2020-06-30		0.25	10000471
11005643	2020-06-30		2	10000195
11005644	2020-06-30		2.5	10000533
11005645	2020-06-30		7.5	10000567
11005646	2020-06-30		1	10000060
11005647	2020-07-01		0.5	10000568
11005648	2020-07-01		0.5	10000160
11005649	2020-07-01		3	10000286
11005650	2020-07-01		0.5	10000542
11005651	2020-07-01		0.5	10000404
11005652	2020-07-01		0.5	10000481
11005653	2020-07-01		0.5	10000236
11005654	2020-07-01		0.5	10000264
11005655	2020-07-01		1.5	10000514
11005656	2020-07-01		1.5	10000195
11005657	2020-07-01		1	10000533
11005658	2020-07-01		6	10000567
11005659	2020-07-01		0.5	10000218
11005660	2020-07-01		6	10000014
11005661	2020-07-01	5天没记录了，好遥远	0.5	10000293
11005662	2020-07-02		3	10000195
11005663	2020-07-02		1	10000404
11005664	2020-07-02		1.5	10000218
11005665	2020-07-02		0.5	10000035
11005666	2020-07-02		0.5	10000519
11005667	2020-07-02		1	10000481
11005668	2020-07-02		1.5	10000390
11005669	2020-07-02		2.5	10000568
11005670	2020-07-02		6.5	10000014
11005671	2020-07-02		4.5	10000567
11005672	2020-07-02	又一家中餐馆，几样东西吃一遍	1	10000160
11005673	2020-07-02		1	10000533
11005674	2020-07-02		0.5	10000286
11005675	2020-07-03		0.25	10000035
11005676	2020-07-03		1.5	10000218
11005677	2020-07-03		6.5	10000195
11005678	2020-07-03		2	10000060
11005679	2020-07-03		0.75	10000160
11005680	2020-07-03		6	10000014
11005681	2020-07-03	难了，本体悬案，不好办呢，在家网络还不好	1	10000568
11005682	2020-07-03		1.5	10000533
11005683	2020-07-03		2.5	10000567
11005684	2020-07-03		1.5	10000481
11005685	2020-07-04		0.25	10000035
11005686	2020-07-04		1	10000060
11005687	2020-07-04		0.75	10000160
11005688	2020-07-04		1.5	10000567
11005689	2020-07-04		0.5	10000179
11005690	2020-07-04		8	10000014
11005691	2020-07-04	中国地缘政治，周围基本没有战略盟友国家	0.5	10000511
11005692	2020-07-04		1	10000286
11005693	2020-07-04		1.5	10000522
11005694	2020-07-04		5.5	10000195
11005695	2020-07-05		6.5	10000567
11005696	2020-07-05		7.5	10000014
11005697	2020-07-05		0.25	10000035
11005698	2020-07-05		0	10000473
11005699	2020-07-05		1.5	10000522
11005700	2020-07-05		3.5	10000286
11005701	2020-07-05		2.25	10000060
11005702	2020-07-05		6.5	10000195
11005703	2020-07-05		1	10000160
11005704	2020-07-06		0.25	10000160
11005705	2020-07-06		5	10000014
11005706	2020-07-06		1	10000568
11005707	2020-07-06		1	10000481
11005708	2020-07-06		1	10000522
11005709	2020-07-06		1	10000567
11005710	2020-07-06		6	10000195
11005711	2020-07-06		0.25	10000035
11005712	2020-07-06		3	10000542
11005713	2020-07-06		1.5	10000060
11005714	2020-07-07		2	10000533
11005715	2020-07-07	现场给的显示器搬到公司去，编程用。	1	10000569
11005716	2020-07-07		0.5	10000401
11005717	2020-07-07		0.5	10000522
11005718	2020-07-07	该好好营造一个适合工作学习的环境了，连续三个月玩300小时以上。	0.5	10000352
11005719	2020-07-07		0.25	10000293
11005720	2020-07-07		0.5	10000060
11005721	2020-07-07	惩罚自己，先跑一趟公司	0.5	10000383
11005722	2020-07-07		4	10000568
11005723	2020-07-07		0.25	10000035
11005724	2020-07-07		2	10000567
11005725	2020-07-07		0.5	10000481
11005726	2020-07-07		6.5	10000014
11005727	2020-07-07		1	10000160
11005728	2020-07-07		1	10000542
11005729	2020-07-07	在Mac环境设定，服务器数据库连接这些基础上，把时间耗光了	3.5	10000286
11005730	2020-07-08		0.5	10000442
11005731	2020-07-08		9	10000014
11005732	2020-07-08		0.5	10000383
11005733	2020-07-08		0.5	10000160
11005734	2020-07-08		3.5	10000568
11005735	2020-07-08		3.5	10000567
11005736	2020-07-08		0.5	10000514
11005737	2020-07-08	真的要好好收拾下环境，重新开始学习了。	0.5	10000352
11005738	2020-07-08		5	10000286
11005739	2020-07-08		0.5	10000401
11005740	2020-07-08		0.5	10000060
11005741	2020-07-09		1.5	10000060
11005742	2020-07-09		1	10000514
11005743	2020-07-09	硬是找不到修改的地方，搜索栏在哪	4	10000568
11005744	2020-07-09		2	10000286
11005745	2020-07-09		1.5	10000567
11005746	2020-07-09		0.5	10000383
11005747	2020-07-09		7.5	10000014
11005748	2020-07-09		0.5	10000522
11005749	2020-07-09		3	10000570
11005750	2020-07-09	机器又断网了，失败	2	10000481
11005751	2020-07-09		0.5	10000035
11005752	2020-07-10		7	10000014
11005753	2020-07-10		0.75	10000160
11005754	2020-07-10		1	10000481
11005755	2020-07-10		0.25	10000035
11005756	2020-07-10		3	10000570
11005757	2020-07-10		0.5	10000383
11005758	2020-07-10		6	10000568
11005759	2020-07-10		4.5	10000567
11005760	2020-07-10		2.5	10000218
11005761	2020-07-11		0.5	10000287
11005762	2020-07-11		2.5	10000218
11005763	2020-07-11		0.5	10000514
11005764	2020-07-11		0.5	10000160
11005765	2020-07-11		7	10000014
11005766	2020-07-11		0.5	10000463
11005767	2020-07-11		1.5	10000195
11005768	2020-07-11	2013年陨石爆炸	0.5	10000511
11005769	2020-07-11		1	10000060
11005770	2020-07-11		1	10000571
11005771	2020-07-11	三连败	2	10000077
11005772	2020-07-11		7.5	10000567
11005773	2020-07-11		0.5	10000288
11005774	2020-07-12		1	10000561
11005775	2020-07-12		8.5	10000014
11005776	2020-07-12		1	10000567
11005777	2020-07-12		0.75	10000160
11005778	2020-07-12		0.25	10000463
11005779	2020-07-12		8	10000286
11005780	2020-07-12		0.5	10000035
11005781	2020-07-12		1.5	10000060
11005782	2020-07-13		1	10000519
11005783	2020-07-13		6.5	10000014
11005784	2020-07-13		1.5	10000481
11005785	2020-07-13		3	10000218
11005786	2020-07-13		0.5	10000383
11005787	2020-07-13		7	10000568
11005788	2020-07-13		1	10000384
11005789	2020-07-13		0.75	10000160
11005790	2020-07-13		0.5	10000514
11005791	2020-07-13		3.5	10000567
11005792	2020-07-13		0.25	10000035
11005793	2020-07-14		4	10000195
11005794	2020-07-14		0.5	10000561
11005795	2020-07-14	明天开始，加班	2	10000568
11005796	2020-07-14		5.5	10000567
11005797	2020-07-14		0.5	10000570
11005798	2020-07-14		6.5	10000014
11005799	2020-07-14		0.5	10000522
11005800	2020-07-14		1.5	10000060
11005801	2020-07-14		0.5	10000481
11005802	2020-07-14		0.25	10000463
11005803	2020-07-14		0.25	10000035
11005804	2020-07-14		0.5	10000512
11005805	2020-07-14		0.5	10000160
11005806	2020-07-15	困死了	1	10000390
11005807	2020-07-15	追加Basedate完全没弄好，NSR项目卡死，也找不到原因	6	10000568
11005808	2020-07-15		6.5	10000014
11005809	2020-07-15		0.5	10000514
11005810	2020-07-15		5.25	10000567
11005811	2020-07-15	车票买了半天没买明白	1	10000572
11005812	2020-07-15		2	10000195
11005813	2020-07-15		0.25	10000035
11005814	2020-07-15		0.75	10000160
11005815	2020-07-15		1	10000481
11005816	2020-07-15		0.5	10000384
11005817	2020-07-15		0.25	10000463
11005818	2020-07-16		3.5	10000195
11005819	2020-07-16		0.5	10000514
11005820	2020-07-16	看小说太久，直接错过时间，本来正事要紧的	6	10000014
11005821	2020-07-16		0.25	10000463
11005822	2020-07-16		8.5	10000567
11005823	2020-07-16		1.5	10000060
11005824	2020-07-16	进场就要排三个小时	2	10000046
11005825	2020-07-16	好饿啊	1	10000160
11005826	2020-07-16		0.25	10000035
11005827	2020-07-16		0.5	10000383
11005828	2020-07-17		0.5	10000390
11005829	2020-07-17		0.5	10000060
11005830	2020-07-17	两重会议，然后又开始家里蹲了	1.5	10000481
11005831	2020-07-17		2	10000195
11005956	2020-07-27		0.25	10000160
11005832	2020-07-17	速度慢到怀疑人生，重建vs项目	3	10000568
11005833	2020-07-17		6	10000567
11005834	2020-07-17		1.25	10000278
11005835	2020-07-17		2	10000218
11005836	2020-07-17		0.5	10000401
11005837	2020-07-17		6	10000014
11005838	2020-07-17		0.5	10000533
11005839	2020-07-17		0.25	10000383
11005840	2020-07-18		4.5	10000567
11005841	2020-07-18		0.5	10000060
11005842	2020-07-18		1	10000256
11005843	2020-07-18		0.5	10000160
11005844	2020-07-18		0.5	10000363
11005845	2020-07-18		0.25	10000035
11005846	2020-07-18		0.5	10000383
11005847	2020-07-18	改不明白	3.5	10000218
11005848	2020-07-18		0.5	10000573
11005849	2020-07-18		8	10000014
11005850	2020-07-18		0.5	10000083
11005851	2020-07-18		2	10000278
11005852	2020-07-18		1	10000195
11005853	2020-07-18		0.25	10000463
11005854	2020-07-19		5	10000567
11005855	2020-07-19		9	10000014
11005856	2020-07-19		0.5	10000470
11005857	2020-07-19	聊了聊，果然还是要自己去决定，定个目标，达成或者达不成就回国	1	10000401
11005858	2020-07-19		0.25	10000035
11005859	2020-07-19		0.25	10000463
11005860	2020-07-19		0.5	10000160
11005861	2020-07-19		3	10000195
11005862	2020-07-19		5	10000218
11005863	2020-07-20		0.25	10000035
11005864	2020-07-20		7	10000195
11005865	2020-07-20		2	10000567
11005866	2020-07-20		0.5	10000160
11005867	2020-07-20		2	10000060
11005868	2020-07-20		0.25	10000481
11005869	2020-07-20		7.5	10000014
11005870	2020-07-20		0.5	10000383
11005871	2020-07-20		4	10000568
11005872	2020-07-21	高考顶替	0.5	10000511
11005873	2020-07-21	Trump	0.5	10000561
11005874	2020-07-21		1.5	10000574
11005875	2020-07-21		0.25	10000160
11005876	2020-07-21		0.25	10000383
11005877	2020-07-21		6	10000014
11005878	2020-07-21		7	10000568
11005879	2020-07-21		5.5	10000195
11005880	2020-07-21		0.5	10000060
11005881	2020-07-21		2	10000567
11005882	2020-07-22		0.5	10000481
11005883	2020-07-22		0.5	10000225
11005884	2020-07-22		9	10000567
11005885	2020-07-22		7	10000014
11005886	2020-07-22		0.5	10000561
11005887	2020-07-22		3	10000533
11005888	2020-07-22		0.5	10000568
11005889	2020-07-22		0.5	10000160
11005890	2020-07-22		0.25	10000035
11005891	2020-07-22		0.25	10000383
11005892	2020-07-22		5	10000195
11005893	2020-07-22		1	10000060
11005894	2020-07-23		0.25	10000160
11005895	2020-07-23		1	10000278
11005896	2020-07-23		6	10000014
11005897	2020-07-23		1.5	10000404
11005898	2020-07-23		2.5	10000195
11005899	2020-07-23		1	10000060
11005900	2020-07-23		4.75	10000567
11005901	2020-07-23	中国地图，浙大强奸，特朗普病毒	0.5	10000511
11005902	2020-07-23		0.25	10000225
11005903	2020-07-23		1	10000287
11005904	2020-07-23		0.25	10000035
11005905	2020-07-23		3	10000218
11005906	2020-07-24		0.5	10000561
11005907	2020-07-24		0.5	10000575
11005908	2020-07-24		0.5	10000576
11005909	2020-07-24		3	10000062
11005910	2020-07-24		3	10000557
11005911	2020-07-24		10	10000014
11005912	2020-07-24	我有时间做事情，但是没有决心和信心，太多的失败让我知道简单做事行不通，但是痛苦的挣扎又是现在的我没有去追求的话题。	1	10000352
11005913	2020-07-24		1.5	10000060
11005914	2020-07-24		0.25	10000160
11005915	2020-07-24		0.25	10000567
11005916	2020-07-24		0.25	10000035
11005917	2020-07-24	女子离奇失踪，成都领事馆关闭，	0.75	10000511
11005918	2020-07-24		0.5	10000577
11005919	2020-07-25		0.25	10000160
11005920	2020-07-25		0.25	10000035
11005921	2020-07-25		2	10000578
11005922	2020-07-25		4.75	10000014
11005923	2020-07-25	时间浪费起来太轻松了	0.75	10000474
11005924	2020-07-25		0.75	10000404
11005925	2020-07-25	慢慢磨，也能磨出点儿东西来，差不多可以发布，然后跟肖体松介绍了。	5.5	10000286
11005926	2020-07-25		0.25	10000175
11005927	2020-07-25		0.25	10000540
11005928	2020-07-25		3.5	10000195
11005929	2020-07-25		0.25	10000218
11005930	2020-07-25		0.25	10000511
11005931	2020-07-25		5.5	10000060
11005932	2020-07-25		0.25	10000503
11005933	2020-07-25		0.5	10000567
11005934	2020-07-25		0.25	10000575
11005935	2020-07-25	泡杯咖啡把	0.25	10000383
11005936	2020-07-25		0.5	10000512
11005937	2020-07-26		0.25	10000575
11005939	2020-07-26		0.5	10000009
11005940	2020-07-26		4.5	10000286
11005941	2020-07-26		7	10000014
11005942	2020-07-26	绵啊，就是不想好好干活，不过总算干了不少	0.5	10000474
11005943	2020-07-26	今天居然没开	0.25	10000503
11005944	2020-07-26	胡子，耳毛，真的成年了，各种长毛	0.5	10000035
11005945	2020-07-26		0.25	10000060
11005946	2020-07-26		0.5	10000077
11005947	2020-07-26		0.25	10000130
11005948	2020-07-26		0.5	10000521
11005949	2020-07-26		0.25	10000490
11005950	2020-07-26		0.25	10000133
11005951	2020-07-26		0.25	10000581
11005952	2020-07-26		0.5	10000160
11005953	2020-07-26		0.75	10000383
11005954	2020-07-26		1.5	10000195
11005955	2020-07-26		0.25	10000580
11005957	2020-07-27	中间醒了一次，不过是真的好好睡了一觉	7	10000014
11005958	2020-07-27		0.25	10000498
11005959	2020-07-27		0.5	10000561
11005960	2020-07-27		2	10000195
11005961	2020-07-27		0.5	10000175
11005962	2020-07-27		0.5	10000511
11005963	2020-07-27		3.5	10000060
11005964	2020-07-27		0.25	10000383
11005965	2020-07-27		2	10000568
11005966	2020-07-27	卡得罢工了	2	10000533
11005967	2020-07-27		2	10000332
11005968	2020-07-27		0.25	10000567
11005971	2019-10-19		0.10000000000000001	10000582
11005973	2019-10-19		0.10000000000000001	10000584
11005974	2019-10-19		0.10000000000000001	10000585
11005975	2019-10-19		0.10000000000000001	10000586
11005976	2019-10-19		0.10000000000000001	10000587
11005977	2019-10-19		0.10000000000000001	10000588
11005978	2019-10-19		0.10000000000000001	10000589
11005979	2019-10-19		0.10000000000000001	10000590
11005980	2019-10-19		0.10000000000000001	10000591
11005981	2019-12-02		0.10000000000000001	10000592
11005982	2019-12-02		0.10000000000000001	10000593
11005983	2019-12-02		0.10000000000000001	10000594
11005984	2019-12-02		0.10000000000000001	10000595
11005985	2019-12-02		0.10000000000000001	10000596
11005986	2019-12-02		0.10000000000000001	10000597
11005987	2019-12-02		0.10000000000000001	10000598
11005988	2019-12-04		0.10000000000000001	10000599
11005989	2019-12-04		0.10000000000000001	10000600
11005990	2019-12-04		0.10000000000000001	10000601
11005991	2019-12-04		0.10000000000000001	10000602
11005992	2019-12-05		0.10000000000000001	10000603
11005993	2019-12-05		0.10000000000000001	10000604
11005994	2019-12-05		0.10000000000000001	10000605
11005995	2019-12-05		0.10000000000000001	10000606
11005996	2019-12-05		0.10000000000000001	10000607
11005997	2019-12-05		0.10000000000000001	10000608
11005998	2019-12-05		0.10000000000000001	10000609
11005999	2019-12-05		0.10000000000000001	10000610
11006000	2019-12-05		0.10000000000000001	10000611
11006001	2019-12-05		0.10000000000000001	10000612
11006002	2019-12-05		0.10000000000000001	10000613
11006003	2019-12-05		0.10000000000000001	10000614
11006004	2019-12-05		0.10000000000000001	10000615
11006005	2019-12-05		0.10000000000000001	10000616
11006006	2019-12-05		0.10000000000000001	10000617
11006007	2019-12-05		0.10000000000000001	10000618
11006008	2019-12-07		0.10000000000000001	10000619
11006009	2019-12-07		0.10000000000000001	10000620
11006010	2019-12-07		0.10000000000000001	10000621
11006011	2019-12-07		0.10000000000000001	10000622
11006012	2019-12-07		0.10000000000000001	10000623
11006013	2019-12-07		0.10000000000000001	10000624
11006014	2019-12-07		0.10000000000000001	10000625
11006015	2019-12-08		0.10000000000000001	10000626
11006016	2019-12-08		0.10000000000000001	10000627
11006017	2019-12-08		0.10000000000000001	10000628
11006018	2020-07-10		0.10000000000000001	10000629
11006019	2005-10-03		0.10000000000000001	10000630
11006020	1983-10-13		0.10000000000000001	10000631
11006021	1986-02-26		0.10000000000000001	10000632
11006022	1986-10-11		0.10000000000000001	10000633
11006023	1996-01-01		0.10000000000000001	10000634
11006024	1992-10-10		0.10000000000000001	10000635
11006025	1989-04-15		0.10000000000000001	10000636
11006026	1996-04-06		0.10000000000000001	10000637
11006027	1993-04-09		0.10000000000000001	10000638
11006028	0001-01-01		0.10000000000000001	10000639
11006029	0001-01-01		0.10000000000000001	10000640
11006030	1999-03-07		0.10000000000000001	10000641
11006031	0001-01-01		0.10000000000000001	10000642
11006032	0001-01-01		0.10000000000000001	10000643
11006033	0001-01-01		0.10000000000000001	10000644
11006034	0001-01-01		0.10000000000000001	10000645
11006035	0001-01-01		0.10000000000000001	10000646
11006036	1998-04-18		0.10000000000000001	10000647
11006037	0001-01-01		0.10000000000000001	10000648
11006038	0001-01-01		0.10000000000000001	10000649
11006039	0001-01-01		0.10000000000000001	10000650
11006040	0001-01-01		0.10000000000000001	10000651
11006041	0001-01-01		0.10000000000000001	10000652
11006042	0001-01-01		0.10000000000000001	10000653
11006043	0001-01-01		0.10000000000000001	10000654
11006044	0001-01-01		0.10000000000000001	10000655
11006045	1996-01-08		0.10000000000000001	10000656
11006046	0001-01-01		0.10000000000000001	10000657
11006047	0001-01-01		0.10000000000000001	10000658
11006048	2008-04-12		0.10000000000000001	10000659
11006049	0001-01-01		0.10000000000000001	10000660
11006050	2006-01-06		0.10000000000000001	10000661
11006051	0001-01-01		0.10000000000000001	10000662
11006052	0001-01-01		0.10000000000000001	10000663
11006053	0001-01-01		0.10000000000000001	10000664
11006054	0001-01-01		0.10000000000000001	10000665
11006055	2004-09-30		0.10000000000000001	10000666
11006056	2005-10-06		0.10000000000000001	10000667
11006057	0001-01-01		0.10000000000000001	10000668
11006059	2009-10-02		0.10000000000000001	10000670
11006060	2013-10-04		0.10000000000000001	10000671
11006061	2009-04-02		0.10000000000000001	10000672
11006062	2004-04-10		0.10000000000000001	10000673
11006063	0001-01-01		0.10000000000000001	10000674
11006064	2006-10-03		0.10000000000000001	10000675
11005972	2019-10-19		0.10000000000000001	10000435
11006058	2008-10-01		0.10000000000000001	10000540
11006065	2011-09-28		0.10000000000000001	10000676
11006066	2012-04-22		0.10000000000000001	10000677
11006067	2010-07-05		0.10000000000000001	10000678
11006068	0001-01-01		0.10000000000000001	10000679
11006069	0001-01-01		0.10000000000000001	10000680
11006070	0001-01-01		0.10000000000000001	10000681
11006071	0001-01-01		0.10000000000000001	10000682
11006072	0001-01-01		0.10000000000000001	10000683
11006073	0001-01-01		0.10000000000000001	10000684
11006074	0001-01-01		0.10000000000000001	10000685
11006075	0001-01-01		0.10000000000000001	10000686
11006076	0001-01-01		0.10000000000000001	10000687
11006077	2010-02-22		0.10000000000000001	10000688
11006078	2013-10-02		0.10000000000000001	10000689
11006079	2014-04-08		0.10000000000000001	10000690
11006080	0001-01-01		0.10000000000000001	10000691
11006081	2014-10-05		0.10000000000000001	10000692
11006082	2015-07-04		0.10000000000000001	10000693
11006083	2014-07-14		0.10000000000000001	10000694
11006084	2006-07-02		0.10000000000000001	10000695
11006085	2011-04-15		0.10000000000000001	10000696
11006086	2009-10-06		0.10000000000000001	10000697
11006087	0001-01-01		0.10000000000000001	10000698
11006088	0001-01-01		0.10000000000000001	10000699
11006089	2012-10-04		0.10000000000000001	10000700
11006090	2010-07-01		0.10000000000000001	10000701
11006091	0001-01-01		0.10000000000000001	10000702
11006092	0001-01-01		0.10000000000000001	10000703
11006093	0001-01-01		0.10000000000000001	10000704
11006094	0001-01-01		0.10000000000000001	10000705
11006095	2008-04-05		0.10000000000000001	10000706
11006096	2013-07-05		0.10000000000000001	10000707
11006097	0001-01-01		0.10000000000000001	10000708
11006098	0001-01-01		0.10000000000000001	10000709
11006099	2018-01-05		0.10000000000000001	10000710
11006100	1996-10-01		0.10000000000000001	10000711
11006101	1995-10-04		0.10000000000000001	10000712
11006102	1995-04-07		0.10000000000000001	10000713
11006103	1996-04-05		0.10000000000000001	10000714
11006104	0001-01-01		0.10000000000000001	10000715
11006105	2002-10-05		0.10000000000000001	10000716
11006106	1979-01-01		0.10000000000000001	10000717
11006107	2010-02-20		0.10000000000000001	10000718
11006108	0001-01-01		0.10000000000000001	10000719
11006109	0001-01-01		0.10000000000000001	10000720
11006110	0001-01-01		0.10000000000000001	10000721
11006111	2006-10-05		0.10000000000000001	10000722
11006112	2013-10-07		0.10000000000000001	10000723
11006113	2009-01-07		0.10000000000000001	10000724
11006114	2009-04-04		0.10000000000000001	10000725
11006115	0001-01-01		0.10000000000000001	10000726
11006116	0001-01-01		0.10000000000000001	10000727
11006117	0001-01-01		0.10000000000000001	10000728
11006118	0001-01-01		0.10000000000000001	10000729
11006119	0001-01-01		0.10000000000000001	10000730
11006120	0001-01-01		0.10000000000000001	10000731
11006121	0001-01-01		0.10000000000000001	10000732
11006122	0001-01-01		0.10000000000000001	10000733
11006123	0001-01-01		0.10000000000000001	10000734
11006124	0001-01-01		0.10000000000000001	10000735
11006125	0001-01-01		0.10000000000000001	10000736
11006126	0001-01-01		0.10000000000000001	10000737
11006127	0001-01-01		0.10000000000000001	10000738
11006128	0001-01-01		0.10000000000000001	10000739
11006129	0001-01-01		0.10000000000000001	10000740
11006130	0001-01-01		0.10000000000000001	10000741
11006131	0001-01-01		0.10000000000000001	10000742
11006132	0001-01-01		0.10000000000000001	10000743
11006133	0001-01-01		0.10000000000000001	10000744
11006134	0001-01-01		0.10000000000000001	10000745
11006135	0001-01-01		0.10000000000000001	10000746
11006136	0001-01-01		0.10000000000000001	10000747
11006137	0001-01-01		0.10000000000000001	10000748
11006138	0001-01-01		0.10000000000000001	10000749
11006139	0001-01-01		0.10000000000000001	10000750
11006140	0001-01-01		0.10000000000000001	10000751
11006141	0001-01-01		0.10000000000000001	10000752
11006142	0001-01-01		0.10000000000000001	10000753
11006143	0001-01-01		0.10000000000000001	10000754
11006144	0001-01-01		0.10000000000000001	10000755
11006145	0001-01-01		0.10000000000000001	10000756
11006146	0001-01-01		0.10000000000000001	10000757
11006147	0001-01-01		0.10000000000000001	10000758
11006148	0001-01-01		0.10000000000000001	10000759
11006149	0001-01-01		0.10000000000000001	10000760
11006150	0001-01-01		0.10000000000000001	10000761
11006151	0001-01-01		0.10000000000000001	10000762
11006152	0001-01-01		0.10000000000000001	10000763
11006170	2020-07-28		4	10000060
11006160	2020-07-28		0.5	10000481
11006161	2020-07-28	川普终于戴口罩了	0.5	10000511
11006162	2020-07-28		0.5	10000160
11006163	2020-07-28		0.25	10000383
11006164	2020-07-28		0.25	10000035
11006165	2020-07-28		8.5	10000014
11006166	2020-07-28		0.5	10000503
11006159	2020-07-28		4	10000568
11006168	2020-07-28		1	10000009
11006173	2020-07-29	熬通宵好难受啊，晚上睡不着，白天不能睡	0.5	10000383
11006179	2020-07-29		4.5	10000568
11006169	2020-07-28	玩太多了，没快乐了	4	10000195
11006167	2020-07-28	VSCode更新好烦，花了几小时总算调回来了	4	10000286
11006171	2020-07-28		0.5	10000567
11006178	2020-07-29		1	10000286
11006184	2020-07-29		1.5	10000522
11006185	2020-07-29	美国终于开始防疫了	0.5	10000511
11006180	2020-07-29		0.5	10000481
11006189	2020-07-29		0.5	10000236
11006181	2020-07-29		0.5	10000160
11006182	2020-07-29	单机娱乐	0.5	10000077
11006183	2020-07-29		1.5	10000195
11006186	2020-07-29		0.25	10000035
11006187	2020-07-29		0.25	10000225
11006188	2020-07-29		0.5	10000474
11006190	2020-07-29		0.25	10000133
11006191	2020-07-29		0.25	10000565
11006193	2020-07-30		4	10000568
11006194	2020-07-30		1	10000481
11006195	2020-07-30		0.5	10000574
11006199	2020-07-30		0.5	10000077
11006200	2020-07-30		0.5	10000195
11006196	2020-07-30		0.5	10000160
11006174	2020-07-29	莫名噪音，但是把空调和冰箱关了，确实好多了。	7	10000014
11006175	2020-07-29		3	10000060
11006202	2020-07-30		2	10000675
11006203	2020-07-30		1	10000401
11006204	2020-07-30		0.5	10000505
11006197	2020-07-30		0.5	10000383
11006198	2020-07-30		5	10000014
11006285	2020-08-05		1.5	10000038
11006205	2020-07-30		0.25	10000035
11006282	2020-08-05		1.75	10000195
11006206	2020-07-29		1	10000675
11006207	2020-07-30	没有快感啊，找不到什么能直接得到快感的事情了	0.5	10000352
11006208	2020-07-30		0.25	10000567
11006192	2020-07-30		3.5	10000557
11006201	2020-07-30		2	10000060
11006209	2020-07-30		0.5	10000286
11006210	2020-07-31		10.25	10000014
11006212	2020-07-31	问题越改越多，做事完全没有效率	6	10000568
11006211	2020-07-31		0.5	10000481
11006214	2020-07-31		0.25	10000035
11006215	2020-07-31		0.25	10000288
11006216	2020-07-31	果然太难，我找不到状态	1.5	10000077
11006213	2020-07-31		1.5	10000060
11006217	2020-07-31	涂游象棋	1	10000764
11006219	2020-07-31		0.25	10000160
11006220	2020-07-31		2	10000218
11006218	2020-07-31		3.5	10000765
11006222	2020-08-01		6.25	10000014
11006223	2020-08-01	项目说明会	2	10000766
11006225	2020-08-01		1	10000060
11006287	2020-08-06		0.5	10000481
11006228	2020-08-01	男保姆带孩子	0.5	10000522
11006229	2020-08-01		0.25	10000035
11006221	2020-08-01		0.5	10000383
11006226	2020-08-01	跟肖体松象棋，一胜一负打平了	1.5	10000764
11006227	2020-08-01	微信上买MP3，还是没买成	2	10000278
11006224	2020-08-01		4	10000286
11006230	2020-08-01		0.5	10000160
11006232	2020-08-01		5	10000765
11006236	2020-08-02		0.5	10000565
11006240	2020-08-02		0.25	10000035
11006237	2020-08-02		0.5	10000009
11006235	2020-08-02		0.75	10000767
11006234	2020-08-02		10.5	10000014
11006239	2020-08-02		1	10000768
11006241	2020-08-02		0.5	10000160
11006242	2020-08-02		0.5	10000383
11006244	2020-08-02		1	10000764
11006243	2020-08-02		1.5	10000278
11006238	2020-08-02		7	10000765
11006245	2020-08-03		5.5	10000568
11006246	2020-08-03	机器还是卡啊，掉线啊，没事干，刷抖音浪费时间	0.5	10000481
11006247	2020-08-03	疫情更严重了，各种相关知识也出来了，比如传染病电影	0.25	10000511
11006249	2020-08-03		6	10000014
11006250	2020-08-03		0.75	10000009
11006252	2020-08-03		1	10000522
11006253	2020-08-03		0.25	10000565
11006251	2020-08-03		1.5	10000060
11006257	2020-08-03		0.5	10000286
11006258	2020-08-03	装个软件装不上	2	10000766
11006259	2020-08-03		0.25	10000035
11006260	2020-08-03		5	10000765
11006248	2020-08-03	香肠，总算吃到最想吃的了，可惜调味料不够好	1	10000160
11006265	2020-08-04		0.5	10000522
11006266	2020-08-04		0.5	10000565
11006261	2020-08-04	赖床一上午	8.5	10000014
11006263	2020-08-04		1.5	10000278
11006268	2020-08-04		0.25	10000035
11006269	2020-08-04		4.5	10000765
11006270	2020-08-04		1	10000009
11006298	2020-08-07	会议中睡着了。。。	1.25	10000481
11006264	2020-08-04		2	10000060
11006271	2020-08-04		0.25	10000471
11006262	2020-08-04		4	10000568
11006267	2020-08-04		0.5	10000160
11006272	2020-08-05		5	10000568
11006273	2020-08-05		0.5	10000481
11006274	2020-08-05		2.5	10000766
11006275	2020-08-05		0.5	10000160
11006276	2020-08-05		0.25	10000383
11006277	2020-08-05		0.25	10000035
11006278	2020-08-05		7	10000014
11006279	2020-08-05		0.5	10000287
11006280	2020-08-05	防沉迷验证	1	10000278
11006281	2020-08-05		0.25	10000009
11006283	2020-08-05		1.5	10000404
11006284	2020-08-05		1.5	10000060
11006288	2020-08-06		7	10000014
11006286	2020-08-06		3.5	10000568
11006292	2020-08-06		0.25	10000035
11006291	2020-08-06		5.5	10000195
11006289	2020-08-06		2.25	10000060
11006293	2020-08-06		1	10000042
11006294	2020-08-06		1	10000567
11006295	2020-08-06		0.25	10000565
11006290	2020-08-06		0.5	10000160
11006296	2020-08-06	没什么可看的，从零看不下去	0.25	10000769
11006299	2020-08-07		7.75	10000014
11006303	2020-08-07		2	10000195
11006306	2020-08-07	我真的需要改变了吧，四个月的沉沦，还要往下沉吗	0.25	10000352
11006301	2020-08-07	softbank的动漫网，好坑	1	10000771
11006297	2020-08-07	通帐找了半天，结果还打不出明细，不够长了	1.5	10000770
11006307	2020-08-07	状态不行，也不想打了	1.5	10000404
11006302	2020-08-07		0.75	10000160
11006304	2020-08-07	看个op合集，果然我所看的动漫故事就能构成一个世界观，大千世界	2	10000264
11006308	2020-08-07		0.5	10000772
11006300	2020-08-07	没什么可看了	3.5	10000060
11006305	2020-08-07	一不小心搞到天亮了	6	10000286
11005196	2020-05-25		3	10000533
11006309	2020-08-08		1	10000766
11005938	2020-07-26	无线耳机	0.25	10000119
11006255	2020-08-03		0.5	10000119
11001644	2019-07-10		0	10000203
11001661	2019-07-11		0	10000203
11002444	2019-10-06	邮寄机器	0.5	10000269
11001516	2019-07-01		0	10000146
11000870	2019-05-10		0	10000175
11000877	2019-05-11		0	10000175
11000892	2019-05-12		0	10000175
11000915	2019-05-14		0	10000175
11000945	2019-05-17		0	10000175
11001101	2019-05-29		0	10000175
11001114	2019-05-30		0	10000175
11006312	2020-08-08		2	10000557
11006311	2020-08-08		5.75	10000014
11006310	2020-08-08		0.5	10000160
11001123	2019-05-31		0	10000175
11001132	2019-06-01		0	10000175
11001158	2019-06-03		0	10000175
11001174	2019-06-04		0	10000175
11001581	2019-07-06		0	10000175
11002611	2019-10-20	安装了半天，还是解决不了大地图问题，果然已经与这个游戏的环境脱节了。	2	10000175
11002686	2019-10-26		0.10000000000000001	10000175
11000635	2019-04-21		0	10000245
11000648	2019-04-22		0	10000245
11006395	2020-08-14	梦游状态，各种不合时宜	1.5	10000404
11006368	2020-08-12	真的要禁欲了，重新回头生活	0.5	10000352
11006369	2020-08-12		1	10000505
11006396	2020-08-15		1.5	10000766
11001856	2019-08-12		0	10000009
11005380	2020-06-08		3	10000025
11002210	2019-09-16		2	10000233
11001721	2019-07-15		0	10000195
11001725	2019-07-16		0	10000195
11001743	2019-07-17		0	10000195
11001751	2019-07-18		0	10000195
11006313	2020-08-08	真的得改变生活模式了吧，但是总是光说不练	2.5	10000293
11006315	2020-08-08		1.5	10000060
11006370	2020-08-12		1	10000766
11006314	2020-08-08		2.5	10000286
11006317	2020-08-08		2	10000404
11006318	2020-08-08		0.5	10000522
11006316	2020-08-08		3.5	10000195
11006319	2020-08-08		0.25	10000035
11006320	2020-08-09		9	10000014
11006321	2020-08-09		3	10000195
11006322	2020-08-09		1.5	10000060
11006326	2020-08-09	买了菜，但是不想做饭了	0.5	10000383
11006398	2020-08-15		7.5	10000014
11006371	2020-08-12		0.25	10000567
11006372	2020-08-12		0.75	10000009
11006325	2020-08-09		0.75	10000567
11006327	2020-08-09		0.25	10000035
11006323	2020-08-09	炒不熟的白菜，好像把调味料撒在生菜上吃的感觉	1	10000160
11006328	2020-08-09	回头看，玩的时间，游戏小说动漫，赘婿居然一年翻了两遍	0.5	10000546
11006324	2020-08-09		5.5	10000286
11006329	2020-08-09		2	10000404
11006356	2020-08-12		1	10000160
11006335	2020-08-10	才发现今天放假，虽然天天都在放假。把显示器用上了。	0.5	10000481
11006359	2020-08-12		5.25	10000557
11006336	2020-08-10		0.5	10000287
11006334	2020-08-10		1.75	10000568
11006365	2020-08-12		2	10000195
11006337	2020-08-10		0.25	10000035
11006330	2020-08-10		0.75	10000160
11006332	2020-08-10		9	10000195
11006338	2020-08-10	昏昏沉沉，根本没听进去	1	10000766
11006339	2020-08-10		0.5	10000293
11006340	2020-08-10	好多老歌，好多熟悉的旋律	0.5	10000514
11006331	2020-08-10		4	10000014
11006333	2020-08-10		2.75	10000060
11006341	2020-08-11		11	10000014
11006376	2020-08-13		0.25	10000463
11006344	2020-08-11	才发现没抖音后，这就是首选项了	0.5	10000009
11006342	2020-08-11	删了，太浪费精力了，已经成为手机app首选项了，不小心就点进去。	2	10000060
11006345	2020-08-11		0.25	10000119
11006346	2020-08-11	啊，抖音删了，就在磨时间，也能看出我是多没有耐心	0.5	10000374
11006347	2020-08-11		0.25	10000567
11006377	2020-08-13	怎么都下不过电脑	1	10000764
11006348	2020-08-11		0.5	10000160
11006343	2020-08-11		3.5	10000568
11006350	2020-08-11	听他们一家外出散步，果然一个人在日本呆着还是有点儿寂寞，特别是新冠期间	1	10000287
11006351	2020-08-11		1	10000557
11006352	2020-08-11	一个10次拉空8次的蕾欧娜，居然拿了S-	1	10000077
11006349	2020-08-11		6	10000195
11006353	2020-08-12		1.5	10000568
11006354	2020-08-12		0.5	10000374
11006355	2020-08-12		0.25	10000481
11006357	2020-08-12		0.25	10000383
11006358	2020-08-12		4.5	10000014
11006360	2020-08-12		0.5	10000471
11006361	2020-08-12		0.5	10000401
11006362	2020-08-12		0.25	10000035
11006363	2020-08-12		0.5	10000278
11006364	2020-08-12		1.5	10000077
11006366	2020-08-12		1.5	10000404
11006367	2020-08-12		0.5	10000764
11006374	2020-08-13	做饭吃饭	0.5	10000160
11006379	2020-08-13		0.25	10000374
11006373	2020-08-13		6.5	10000568
11006380	2020-08-13		0.25	10000541
11006381	2020-08-13	他们一家看打游戏	0.25	10000287
11006382	2020-08-13		1.5	10000195
11006383	2020-08-13		1	10000404
11006384	2020-08-13		1.5	10000557
11006378	2020-08-13		0.75	10000048
11006375	2020-08-13		9.25	10000014
11006385	2020-08-14	搞不定	2.5	10000568
11006386	2020-08-14		1.25	10000481
11006387	2020-08-14		1.5	10000401
11006389	2020-08-14		7	10000014
11006390	2020-08-14		0.5	10000567
11006392	2020-08-14		3	10000195
11006393	2020-08-14		0.25	10000463
11006394	2020-08-14		0.5	10000505
11006401	2020-08-15		1	10000287
11006403	2020-08-15		0.25	10000383
11006404	2020-08-15	找不到事情做的休闲时间	0.5	10000352
11006405	2020-08-15		1	10000009
11006406	2020-08-15		0.25	10000764
11006399	2020-08-15		0.5	10000160
11006410	2020-08-14	饿了睡不着	1	10000160
11006400	2020-08-15		0.5	10000541
11006407	2020-08-15		0.25	10000035
11006408	2020-08-15		0.5	10000195
11006409	2020-08-15		0.5	10000404
11006397	2020-08-15		0.75	10000048
11006402	2020-08-15		8.5	10000773
11006391	2020-08-14		4.5	10000557
11006411	2020-08-16		0.25	10000048
11006412	2020-08-16		0.5	10000160
11006413	2020-08-16		9.5	10000014
11006415	2020-08-16		0.5	10000278
11006416	2020-08-16		0.25	10000567
11006417	2020-08-16		0.25	10000557
11006418	2020-08-16		0.25	10000009
11006420	2020-08-16		0.10000000000000001	10000774
11006421	2020-08-16	还是没决定好是增加achievement还是skill	0.90000000000000002	10000286
11006414	2020-08-16		1	10000287
11006422	2020-08-15		0.5	10000505
11006419	2020-08-16		10	10000773
11006423	2020-08-17		3.5	10000568
11006424	2020-08-17		0.5	10000401
11006425	2020-08-17		0.5	10000048
11006426	2020-08-17		0.5	10000160
11006427	2020-08-17		5.5	10000014
11006428	2020-08-17		0.25	10000119
11006429	2020-08-17		3	10000287
11006430	2020-08-17	考虑了该怎么做，就是不想动	0.5	10000286
11006431	2020-08-17		0.25	10000567
11006432	2020-08-17		0.5	10000557
11006433	2020-08-17		0.5	10000009
11006434	2020-08-17		7.5	10000773
11006435	2020-08-17		0.5	10000195
11006436	2020-08-17		0.5	10000404
11006437	2020-08-18	网络不通好麻烦，根本完不成事情	4	10000568
11006438	2020-08-18	机器看着要坏啊，有点儿fan	0.25	10000481
11006439	2020-08-18		7	10000014
11006441	2020-08-18		2.5	10000775
11006442	2020-08-18		0.25	10000160
11006443	2020-08-18	来检修防火的	0.5	10000383
11006444	2020-08-18		0.25	10000035
11006445	2020-08-18		1	10000287
11006446	2020-08-18		0.25	10000471
11006447	2020-08-18		0.25	10000463
11006440	2020-08-18	莫名奇妙时间就过去了	7.5	10000773
11006448	2020-08-18		0.25	10000521
11006451	2020-08-19		5	10000568
11006452	2020-08-19		0.5	10000481
11006453	2020-08-19		0.5	10000383
11006454	2020-08-19		1.5	10000287
11006455	2020-08-19		0.5	10000567
11006456	2020-08-19		0.5	10000557
11006457	2020-08-19		0.5	10000009
11006458	2020-08-19		7	10000773
11006459	2020-08-19		0.25	10000471
11006460	2020-08-19		0.25	10000463
11006449	2020-08-19	晚上睡觉饿醒了，好久没这么饿过了	1	10000160
11006450	2020-08-19		6.5	10000014
11006461	2020-08-20		4	10000568
11006462	2020-08-20		1	10000481
11006464	2020-08-20		5	10000014
11006465	2020-08-20		0.5	10000567
11006466	2020-08-20		0.25	10000009
11006468	2020-08-20		1	10000776
11006469	2020-08-20		1	10000766
11006470	2020-08-20		0.5	10000574
11006519	2020-08-25		0.5	10000780
11006471	2020-08-20		0.5	10000287
11006501	2020-08-24		2	10000568
11006473	2020-08-20		0.25	10000035
11006463	2020-08-20	没吃饭	0.25	10000160
11006467	2020-08-20		8	10000773
11006472	2020-08-20		1.5	10000053
11006474	2020-08-21	https://zoom.us/j/97266662322?pwd=aDFYWlZRQnluSjUrN3M2NnZvM3VRZz09	0.5	10000481
11006475	2020-08-22	https://zoom.us/j/9639984819?pwd=d0hyRk9sNk5Qd0xKYW13SVJOTkJHUT09	1	10000766
11006502	2020-08-24		1	10000374
11006478	2020-08-22	https://zoom.us/j/91414780961?pwd=UWNtb3R6NzdLOVp6YnNHSmNaUzFFZz09	0.5	10000574
11006479	2020-08-22	eyZYsntl58skEKT2RE(4f6T&	0.5	10000776
11006480	2020-08-22		0.5	10000160
11006481	2020-08-22		0.25	10000035
11006483	2020-08-22		0.25	10000463
11006476	2020-08-22	玩三国志战略，午睡时间多了	8	10000014
11006503	2020-08-24		0.25	10000160
11006484	2020-08-22		0.5	10000567
11006485	2020-08-22		0.5	10000557
11006482	2020-08-22		2.5	10000287
11006477	2020-08-22		7.5	10000773
11006488	2020-08-23		1.5	10000287
11006504	2020-08-24		0.25	10000035
11006491	2020-08-23		0.10000000000000001	10000777
11006492	2020-08-23		0.10000000000000001	10000778
11006493	2020-08-23		0.10000000000000001	10000779
11006505	2020-08-24		6.5	10000014
11006494	2020-08-23		0.5	10000383
11006495	2020-08-23		0.5	10000035
11006496	2020-08-23		1	10000293
11006497	2020-08-23		0.25	10000009
11006498	2020-08-23		0.5	10000505
11006486	2020-08-23	吃饼干当饭	1.5	10000048
11006487	2020-08-23		6.9500000000000002	10000014
11006490	2020-08-23	还是没决定好怎么做achievement，以及没有心情追加collection	2.25	10000286
11006489	2020-08-23		7.5	10000773
11006499	2020-08-23	不知道怎么带妹妹，还一直叫爸爸不停，感觉这孩子确实不好长大啊，依赖性很重。	0.5	10000418
11006507	2020-08-24		0.25	10000557
11006509	2020-08-25		4.5	10000568
11006510	2020-08-25		0.5	10000374
11006511	2020-08-25		0.5	10000481
11006513	2020-08-25		0.5	10000130
11006514	2020-08-25		0.5	10000383
11006515	2020-08-25		0.25	10000035
11006516	2020-08-25		2	10000287
11006518	2020-08-25		1	10000195
11006520	2020-08-25		1	10000279
11006500	2020-08-25	skype  https://zoom.us/j/93208422289?pwd=MVY3ZFpJUzV2NzRoRldtUXI3NGowUT09	1	10000214
11006521	2020-08-25		0.25	10000567
11006522	2020-08-25		0.25	10000557
11006523	2020-08-25		0.25	10000463
11006524	2020-08-25		1.5	10000505
11006512	2020-08-25		0.5	10000160
11006525	2020-08-24		1.5	10000505
11006526	2020-08-24		0.25	10000463
11006506	2020-08-24		0.5	10000567
11006517	2020-08-25		9.5	10000773
11006508	2020-08-24	建小号	10.5	10000773
11006528	2020-08-26		1	10000481
11006529	2020-08-26		0.5	10000401
11006530	2020-08-26		5.5	10000014
11006532	2020-08-26		0.5	10000384
11006527	2020-08-26		6.5	10000568
11006533	2020-08-26		0.5	10000160
11006534	2020-08-26	好痒啊	0.25	10000035
11006535	2020-08-26		1.5	10000287
11006536	2020-08-26	又一个电话号码	0.5	10000288
11006531	2020-08-26		6.5	10000773
11006537	2020-08-27		2	10000568
11006538	2020-08-27		1	10000374
11006539	2020-08-27		1.5	10000481
11006540	2020-08-27		0.5	10000401
11006544	2020-08-28	https://zoom.us/j/96719113750?pwd=c0pmN3NucEhqV1RGR00zZWtHV0dadz09	1	10000481
11006545	2020-08-29	https://zoom.us/j/9639984819?pwd=d0hyRk9sNk5Qd0xKYW13SVJOTkJHUT09	1	10000766
11006541	2020-08-27		0.5	10000160
11006542	2020-08-27	睡眠不足，断断续续，眼睛痛	8	10000014
11006543	2020-08-27		9	10000773
11006546	2020-08-28		2.5	10000568
11006547	2020-08-28		10	10000773
11006548	2020-08-28		3	10000505
11006549	2020-08-28		6.5	10000014
11006550	2020-08-28		0.5	10000160
11006551	2020-08-29		0.5	10000160
11006552	2020-08-29		0.25	10000035
11006553	2020-08-29		6	10000014
11006554	2020-08-29		2	10000287
11006555	2020-08-29		0.25	10000567
11006556	2020-08-29		0.25	10000557
11006557	2020-08-29	战争的感觉还是很爽的，但是玩到郁闷了，想喝酒，然后又拉肚子	12	10000773
11006558	2020-08-29		0.25	10000471
11006559	2020-08-29		0.25	10000463
11006560	2020-08-29		1.5	10000781
11006561	2020-08-31	好好干了一天，是不是呢，果然需要时间限制	8.25	10000568
11006562	2020-08-31		0.25	10000401
11006563	2020-08-31		6	10000014
11006565	2020-08-31		0.25	10000494
11006567	2020-08-30		2	10000568
11006568	2020-08-30		0.5	10000160
11006569	2020-08-30		6	10000014
11006570	2020-08-30		2	10000287
11006571	2020-08-30		0.25	10000494
11006572	2020-08-30		0.25	10000567
11006573	2020-08-30	国战打输了呢	10	10000773
11006574	2020-08-30		2	10000505
11006575	2020-08-31		0.5	10000160
11006576	2020-08-31	无聊，不想干事	0.5	10000505
11006564	2020-08-31		2.25	10000287
11006566	2020-08-31	想买号啊	5	10000773
11006577	2020-09-05	https://zoom.us/j/9639984819?pwd=d0hyRk9sNk5Qd0xKYW13SVJOTkJHUT09	5	10000766
11006578	2020-09-05		6.5	10000014
11006580	2020-09-05		1	10000160
11006581	2020-09-05		0.25	10000383
11006582	2020-09-05		0.25	10000035
11006583	2020-09-05		3	10000195
11006579	2020-09-05		9	10000773
11006584	2020-09-04		3	10000568
11006585	2020-09-04		1	10000481
11006586	2020-09-04		2	10000766
11006587	2020-09-04		0.5	10000160
11006588	2020-09-04		6.5	10000014
11006589	2020-09-04		10	10000773
11006590	2020-09-04		0.5	10000463
11006591	2020-09-06		4	10000568
11006592	2020-09-06		1	10000160
11006593	2020-09-06		0.5	10000383
11006594	2020-09-06		0.25	10000035
11006595	2020-09-06		6	10000014
11006596	2020-09-06		9	10000773
11006597	2020-09-06		3	10000195
11006598	2020-09-06		0.25	10000463
11006599	2020-09-07		6	10000568
11006600	2020-09-07		0.5	10000481
11006601	2020-09-07		0.5	10000160
11006602	2020-09-07		0.25	10000035
11006603	2020-09-07		5.5	10000014
11006604	2020-09-07		0.5	10000567
11006605	2020-09-07		9	10000773
11006606	2020-09-07		0.25	10000471
11006607	2020-09-07		1.5	10000051
11006608	2020-09-08	=IF(MOD(ROW(),2),INDIRECT("a"&(ROW()+1)/2),INDIRECT("B"&ROW()/2))	0.5	10000401
11006609	2020-09-08		4	10000568
11006610	2020-09-08	Excel公式，写起来也挺累的	1.5	10000384
11006611	2020-09-08		1	10000766
11006612	2020-09-08	没饭吃	0.5	10000160
11006613	2020-09-08		0.25	10000035
11006614	2020-09-08	断断续续困了好久	7	10000014
11006615	2020-09-08		1	10000287
11006616	2020-09-08		0.5	10000567
11006617	2020-09-08		1	10000051
11006618	2020-09-08		7.25	10000773
11006620	2020-09-09		1	10000374
11006621	2020-09-09	根本不能够抽出单独的price啊，用的数据结构不对	1	10000766
11006623	2020-09-09		0.5	10000383
11006624	2020-09-09	该去买洗发露了	0.25	10000035
11006625	2020-09-09	睡得不好	6	10000014
11006626	2020-09-09		1	10000287
11006627	2020-09-09	五个号，还是没有太多操作	9	10000773
11006628	2020-09-09		1	10000051
11006622	2020-09-09	吃了个蛋糕当晚饭，9月9，身份证上我30岁了	0.75	10000160
11006619	2020-09-09	调查问题，到底是不是本体障害呢	4	10000568
11006633	2020-09-10	调查	3	10000568
11006634	2020-09-10		0.5	10000481
11006635	2020-09-10		0.5	10000401
11006638	2020-09-10		0.5	10000160
11006640	2020-09-10		0.25	10000035
11006641	2020-09-10	下午睡觉，不上班啊	7	10000014
11006649	2020-09-10	帮忙检查，也没看出个什么来	1.5	10000782
11006642	2020-09-10		1	10000287
11006646	2020-09-10		0.5	10000557
11006647	2020-09-10		9	10000773
11006648	2020-09-10		0.25	10000463
11006651	2020-09-11		1	10000568
11006652	2020-09-11		3	10000374
11006653	2020-09-11		1	10000481
11006654	2020-09-11		0.5	10000384
11006655	2020-09-11		0.5	10000401
11006656	2020-09-11		1	10000160
11006657	2020-09-11		0.25	10000035
11006658	2020-09-11		5.5	10000014
11006659	2020-09-11		1	10000287
11006660	2020-09-11		0.5	10000567
11006661	2020-09-11		1	10000051
11006662	2020-09-11		7	10000773
11006663	2020-09-11		1.5	10000195
11006664	2020-09-11		0.25	10000463
11006665	2020-09-12		1	10000160
11006666	2020-09-12		0.5	10000383
11006667	2020-09-12		0.25	10000035
11006668	2020-09-12		5	10000014
11006669	2020-09-12	半年后的早起会	1	10000020
11006670	2020-09-12		0.25	10000567
11006673	2020-09-12		0.25	10000463
11006737	2020-09-24		1	10000784
11006738	2020-09-24		7	10000773
11006650	2020-09-12	https://zoom.us/j/9639984819?pwd=d0hyRk9sNk5Qd0xKYW13SVJOTkJHUT09	4	10000766
11006739	2020-09-23		7	10000014
11006675	2020-09-12		1	10000110
11006674	2020-09-12	雨天骑车骑了一小时才到地方	3.5	10000783
11006671	2020-09-12		1.75	10000051
11006672	2020-09-12		5.5	10000773
11006676	2020-09-13	就在听他不做作业的事情，这样的性格到底该怎么纠正呢	1	10000418
11006677	2020-09-13		1	10000160
11006678	2020-09-13		0.5	10000383
11006679	2020-09-13	又不记得买洗发露	0.25	10000035
11006680	2020-09-13		9	10000014
11006681	2020-09-13	又买了一个号	11	10000773
11006682	2020-09-13		0.25	10000463
11006683	2020-09-13	无聊啊，眼睛痛	1	10000505
11006684	2020-09-14	有难度，不知道怎么改	2	10000784
11006685	2020-09-14		2	10000374
11006686	2020-09-14		0.5	10000574
11006687	2020-09-14		0.5	10000160
11006688	2020-09-14		0.25	10000035
11006689	2020-09-14		6.5	10000014
11006690	2020-09-14		0.5	10000567
11006691	2020-09-14		9	10000773
11006692	2020-09-14		0.25	10000463
11006693	2020-09-14	饮料喝多了，腹痛，难受	2	10000785
11006694	2020-09-14		0.5	10000287
11006695	2020-09-15	吃多了，不消化	1	10000160
11006698	2020-09-15		9	10000773
11006696	2020-09-15		6	10000014
11006740	2020-09-23		6	10000773
11006741	2020-09-22		2.5	10000786
11006699	2020-09-16		1	10000784
11006700	2020-09-16		0.25	10000401
11006701	2020-09-16		0.25	10000574
11006702	2020-09-16		0.5	10000160
11006703	2020-09-16		0.5	10000383
11006706	2020-09-16		0.5	10000051
11006707	2020-09-15		0.5	10000051
11006697	2020-09-15	半夜痛醒了，第一次上救护车，去输了止痛药，回来了	7.5	10000785
11006708	2020-09-16		8	10000014
11006704	2020-09-16	多喝水，多跳跳，就能好啊。明天还得去医院	5	10000785
11006705	2020-09-16		8	10000773
11006710	2020-09-17		4.5	10000568
11006711	2020-09-17		1	10000374
11006712	2020-09-17	饿昏了	1.5	10000160
11006713	2020-09-17		0.25	10000035
11006714	2020-09-17		6.5	10000014
11006715	2020-09-17	跑医院，结果已经结束，等下个月检查，而且没结账就跑了	1.5	10000785
11006716	2020-09-17		0.25	10000567
11006717	2020-09-17		0.5	10000051
11006718	2020-09-17		8	10000773
11006719	2020-09-19	https://zoom.us/j/9639984819?pwd=d0hyRk9sNk5Qd0xKYW13SVJOTkJHUT09	1	10000766
11006721	2020-09-25	整理releas好麻烦	3	10000568
11006722	2020-09-25	弄了两周了，终于把功能实现了，code还没写完	2	10000784
11006723	2020-09-25		0.5	10000481
11006724	2020-09-25		0.5	10000160
11006725	2020-09-25		0.5	10000035
11006726	2020-09-25	上班最适合睡觉	8	10000014
11006727	2020-09-25	完结撒花	1	10000567
11006728	2020-09-25		8	10000773
11006729	2020-09-25		0.5	10000463
11006730	2020-09-24		3	10000568
11006731	2020-09-24		1	10000481
11006732	2020-09-24		0.5	10000160
11006733	2020-09-24		0.25	10000035
11006734	2020-09-24		7	10000014
11006735	2020-09-24		0.25	10000567
11006736	2020-09-24		0.5	10000463
11006743	2020-09-22		1	10000288
11006745	2020-09-22		1	10000160
11006746	2020-09-23		1	10000786
11006747	2020-09-23	坐车方向错n次	2	10000783
11006748	2020-09-23		1	10000160
11006749	2020-09-23		3	10000784
11006742	2020-09-22	没睡着	8	10000014
11006744	2020-09-22		8	10000773
11006750	2020-09-22		1.5	10000287
11006753	2020-09-18		8	10000014
11006754	2020-09-18		8	10000773
11006755	2020-09-18		2	10000481
11006756	2020-09-18		1.5	10000784
11006757	2020-09-18		3	10000374
11006758	2020-09-18		0.5	10000160
11006759	2020-09-18		0.5	10000035
11006760	2020-09-19		1	10000160
11006761	2020-09-19		0.5	10000035
11006751	2020-09-19		8	10000014
11006762	2020-09-19		1	10000567
11006752	2020-09-19		11	10000773
11006763	2020-09-19	克隆模式打一把就累了	1	10000404
11006764	2020-09-20		9	10000773
11006765	2020-09-20		8	10000014
11006766	2020-09-20		1	10000195
11006767	2020-09-20		1	10000287
11006768	2020-09-20		1	10000160
11006769	2020-09-20		0.5	10000035
11006770	2020-09-21		8	10000014
11006771	2020-09-21		1	10000160
11006772	2020-09-21		0.5	10000035
11006773	2020-09-21		11	10000773
11006774	2020-09-21		1	10000051
11006775	2020-09-21		0.5	10000463
11006776	2020-09-26		1	10000293
11006777	2020-09-26		7	10000014
11006720	2020-09-26	https://zoom.us/j/9639984819?pwd=d0hyRk9sNk5Qd0xKYW13SVJOTkJHUT09	2.5	10000766
11006786	2020-10-05		5	10000784
11006784	2020-10-05		1	10000374
11006781	2020-10-05		1	10000481
11006785	2020-10-05	好久没听了，还是家庭和谐，或许我真的要退会了？ https://vimeo.com/454957367/2e7c1575c7	2	10000254
11006787	2020-10-05		0.75	10000160
11006788	2020-10-05		0.25	10000035
11006789	2020-10-05		7.5	10000014
11006790	2020-10-05		0.5	10000786
11006791	2020-10-05		6	10000773
11006793	2020-10-07		1	10000374
11006794	2020-10-07		7	10000014
11006796	2020-10-07	三十岁了，今天以后是不是该改一下生活方式了呢	1	10000788
11006856	2020-10-11		2	10000538
11006800	2020-10-07		2	10000287
11006801	2020-10-07		2	10000494
11006802	2020-10-07		0.5	10000035
11006799	2020-10-07		1	10000160
11006795	2020-10-07		6	10000773
11006792	2020-10-07	跟郭志男聊，跟大哥聊，然后就下下来玩了	2	10000787
11006778	2020-09-26		7.5	10000773
11006803	2020-09-27		7	10000014
11006804	2020-09-27		7	10000773
11006805	2020-09-27		1	10000160
11006806	2020-09-27		0.5	10000035
11006807	2020-10-06		2	10000374
11006808	2020-10-06		1	10000160
11006809	2020-10-06		0.5	10000035
11006810	2020-10-06		7	10000014
11006811	2020-10-06		7	10000773
11006812	2020-10-04		4	10000548
11006813	2020-10-04		7	10000014
11006814	2020-10-04		7	10000773
11006815	2020-10-04		1	10000160
11006816	2020-10-04		0.5	10000035
11006817	2020-10-08		1	10000160
11006818	2020-10-08		0.5	10000035
11006822	2020-10-06		1	10000557
11006823	2020-10-08		2	10000374
11006819	2020-10-08		8	10000014
11006821	2020-10-08		4	10000789
11006820	2020-10-08		8	10000773
11006824	2020-10-09	新入组员	1	10000790
11006825	2020-10-09		2	10000568
11006826	2020-10-09		2	10000784
11006827	2020-10-09		3	10000374
11006828	2020-10-09		1	10000481
11006829	2020-10-09		1	10000160
11006831	2020-10-09	没睡好	6.5	10000014
11006832	2020-10-09		0.25	10000133
11006833	2020-10-09		2	10000789
11006834	2020-10-09		4	10000773
11006835	2020-10-09		1	10000028
11006830	2020-10-09		0.25	10000035
11006839	2020-10-10		1	10000791
11006841	2020-10-10		0.5	10000383
11006840	2020-10-10		0.5	10000160
11006836	2020-10-10		1	10000130
11006837	2020-10-10		9	10000014
11006842	2020-10-10		3.5	10000789
11006846	2020-10-11		5	10000773
11006843	2020-10-10		1	10000505
11006844	2020-10-10		3	10000404
11006857	2020-10-12		1	10000568
11006847	2020-10-11		1	10000293
11006848	2020-10-11		0.25	10000565
11006838	2020-10-10		6.5	10000773
11006850	2020-10-11	搞笑视频	2	10000179
11006852	2020-10-11		1	10000505
11006845	2020-10-11		8	10000014
11006858	2020-10-12		3	10000784
11006859	2020-10-12		2	10000374
11006853	2020-10-11		0.5	10000160
11006854	2020-10-11		0.25	10000035
11006849	2020-10-11		2	10000792
11006860	2020-10-12		1	10000481
11006855	2020-10-11		1	10000287
11006889	2020-10-15		2	10000568
11006851	2020-10-11		1	10000195
11006861	2020-10-12		1	10000160
11006862	2020-10-12		0.25	10000035
11006863	2020-10-12	又是8点睡着了，半夜醒	6	10000014
11006864	2020-10-12		1	10000287
11006865	2020-10-12	上班光想游戏了	5	10000773
11006866	2020-10-12		1	10000195
11006867	2020-10-12		0.25	10000463
11006868	2020-10-12		1.5	10000793
11006869	2020-10-13		0.25	10000481
11006870	2020-10-13		6.5	10000014
11006872	2020-10-13		2	10000568
11006873	2020-10-13		2	10000374
11006874	2020-10-13	茄子很方便，煮就行了	0.25	10000048
11006876	2020-10-13		2	10000051
11006877	2020-10-13		0.5	10000195
11006871	2020-10-13		5.5	10000773
11006875	2020-10-13		1.5	10000160
11006878	2020-10-13		1.5	10000359
11006879	2020-10-13		0.5	10000450
11006880	2020-10-13		0.5	10000792
11006881	2020-10-14	调查问题，excel打开，解决不了啊	3	10000568
11006882	2020-10-14		3	10000784
11006883	2020-10-14		1	10000374
11006884	2020-10-14		1	10000160
11006885	2020-10-14	没有去锻炼，不想动了	0.5	10000035
11006886	2020-10-14		7	10000014
11006887	2020-10-14		1.5	10000051
11006888	2020-10-14	自己组出来，以为很厉害的阵容，被9级贼寇打被气了，弯弓加落凤，控到死	5.5	10000773
11006890	2020-10-15		1	10000384
11006891	2020-10-15		0.75	10000160
11006892	2020-10-15		0.25	10000035
11006893	2020-10-15		7	10000014
11006894	2020-10-15	检查没问题	1	10000785
11006895	2020-10-15		3	10000051
11006896	2020-10-15		9	10000773
11006897	2020-10-16		1	10000784
11006898	2020-10-16		2	10000374
11006899	2020-10-16		1	10000481
11006900	2020-10-16		0.5	10000160
11006901	2020-10-16		0.25	10000035
11006902	2020-10-16	没睡好	7.5	10000014
11006903	2020-10-16		0.5	10000287
11006904	2020-10-16		5	10000051
11006905	2020-10-16		6	10000773
11006906	2020-10-16		0.25	10000565
11006907	2020-10-17		0.75	10000160
11006908	2020-10-17		0.25	10000035
11006909	2020-10-17		8	10000014
11006910	2020-10-17		2	10000051
11006911	2020-10-17		6	10000773
11006912	2020-10-18		1	10000048
11006913	2020-10-18		1	10000160
11006914	2020-10-18		0.5	10000035
11006915	2020-10-18		6	10000014
11006916	2020-10-18		1	10000287
11006917	2020-10-18	去早起会的路上，就能想起许多想做的事	1	10000020
11006918	2020-10-18		4	10000051
11006919	2020-10-18		2	10000773
11006920	2020-10-18	无限火力	4	10000077
11006921	2020-10-18		0.5	10000286
11006922	2020-10-19	好难受	5	10000784
11006923	2020-10-19		1	10000374
11006924	2020-10-19		0.5	10000481
11006925	2020-10-19		0.5	10000048
11006926	2020-10-19		1	10000160
11006927	2020-10-19		0.5	10000035
11006928	2020-10-19		7	10000014
11006929	2020-10-19		3	10000051
11006930	2020-10-19	新号，总是事情干的	5.5	10000773
11006931	2020-10-21	三国志大多了，想到战略类的东西，别人在打仗，氛围紧张，我还在扫地。扫啊扫，等着我出手的时机。已经不记得爽点在哪里了。	1	10000363
11006932	2020-10-21		6.5	10000014
11006933	2020-10-20	bug啊	1	10000568
11006934	2020-10-20		1	10000784
11006935	2020-10-20		1	10000374
11006936	2020-10-20		0.5	10000481
11006937	2020-10-20		0.75	10000160
11006938	2020-10-20		0.25	10000035
11006939	2020-10-20	睡不着，睡不好	7	10000014
11006940	2020-10-20		6	10000051
11006941	2020-10-20		5	10000773
11006942	2020-10-21	搞不出来	2	10000784
11006943	2020-10-21		1	10000374
11006944	2020-10-21		1	10000160
11006945	2020-10-21		0.25	10000035
11006946	2020-10-21		6	10000051
11006947	2020-10-21		5	10000773
11006948	2020-10-21		0.25	10000225
11006949	2020-10-21		1	10000401
11006950	2020-10-22	居然是设定问题，不是excel版本	2	10000568
11006951	2020-10-22		0.5	10000160
11006952	2020-10-22		0.25	10000035
11006953	2020-10-22		8	10000014
11006954	2020-10-22		7	10000051
11006955	2020-10-22		6	10000773
11006956	2020-10-22		0.25	10000225
11006957	2020-10-23		1	10000784
11006958	2020-10-23		2	10000374
11006959	2020-10-23		1	10000481
11006960	2020-10-23		1	10000401
11006961	2020-10-23		1	10000160
11006962	2020-10-23		8	10000014
11006964	2020-10-23		4	10000773
11006965	2020-10-23		2	10000794
11006966	2020-10-23	原来20部还是都看过的	1.5	10000538
11006967	2020-10-23		0.25	10000035
11006968	2020-10-23		0.25	10000565
11006969	2020-10-23		1	10000505
11006963	2020-10-23		1	10000051
11006971	2020-10-25		0.25	10000035
11006976	2020-10-25		1.5	10000505
11006999	2020-10-26	突然发现还是现实美女更有吸引力，是不是年龄大了	0.25	10000565
11006977	2020-10-24		0.25	10000160
11006978	2020-10-24		0.25	10000035
11006979	2020-10-24		9	10000014
11006981	2020-10-24	终于新赛季了，抽将基本没救	10	10000773
11006982	2020-10-24		1	10000195
11006983	2020-10-24		1.5	10000505
11007000	2020-10-26		0.25	10000051
11006984	2020-10-25		0.5	10000048
11006985	2020-10-25		1	10000383
11006986	2020-10-25		1	10000786
11006970	2020-10-25		0.75	10000160
11006972	2020-10-25		7.5	10000014
11006974	2020-10-25	刷五级地，果然比三级有意思，之前刷到想吐了	9	10000773
11006987	2020-10-25		0.5	10000051
11007001	2020-10-27	好好的干了几个小时	6	10000794
11006988	2020-10-25		0.5	10000002
11006973	2020-10-25		1.5	10000287
11006980	2020-10-24		1.5	10000287
11006989	2020-10-24	又开始封闭式学习了，估计不怎么会联系了	0.5	10000278
11006990	2020-10-26		2	10000374
11006991	2020-10-26	迎新会	2	10000481
11006992	2020-10-26		0.25	10000794
11006993	2020-10-26		0.25	10000035
11006994	2020-10-26		1	10000160
11006995	2020-10-26		0.5	10000383
11006996	2020-10-26		7.5	10000014
11006997	2020-10-26		1	10000786
11006998	2020-10-26		9	10000773
11007002	2020-10-27		1	10000401
11007003	2020-10-27	鸡块吃撑了	1.5	10000160
11007004	2020-10-27		0.5	10000383
11007005	2020-10-27		0.25	10000035
11007006	2020-10-27		7.5	10000014
11007007	2020-10-27	无聊时最该做的事情	0.25	10000133
11007008	2020-10-27		6	10000773
11007009	2020-10-27	无聊看视频	0.5	10000195
11007010	2020-10-27		0.5	10000002
11007011	2020-10-28		1	10000374
11007012	2020-10-28		0.5	10000048
11007013	2020-10-28		0.5	10000160
11007014	2020-10-28		0.25	10000035
11007015	2020-10-28		9	10000014
11007016	2020-10-28		0.25	10000133
11007017	2020-10-28		0.5	10000557
11007018	2020-10-28		8	10000773
11007019	2020-10-28		1.5	10000195
11007020	2020-10-28		0.5	10000565
11007021	2020-10-28		1	10000287
11007022	2020-10-28	无聊无聊，看特朗普	1	10000505
11007023	2020-10-29	躺着睡午觉一下午	9	10000014
11007024	2020-10-29		1	10000287
11007025	2020-10-29		0.25	10000133
11007026	2020-10-29		8	10000773
11007027	2020-10-29		2.5	10000195
11007028	2020-10-29		0.25	10000565
11007029	2020-10-30		1	10000374
11007030	2020-10-30		1	10000481
11007031	2020-10-30		4	10000794
11007032	2020-10-30		1	10000401
11007033	2020-10-30		1	10000160
11007034	2020-10-30		0.25	10000035
11007035	2020-10-30	晚上睡不着，早上睡不醒	7	10000014
11007036	2020-10-30	形成日常习惯，才是学习进步的最自然方法	1.25	10000133
11007037	2020-10-30		4	10000773
11007038	2020-10-31		7.5	10000014
11007039	2020-10-31		1.5	10000133
11007040	2020-10-31		1	10000786
11007042	2020-10-31		1.5	10000195
11007043	2020-10-31		1.5	10000179
11007044	2020-10-31		0.5	10000160
11007045	2020-10-31		0.5	10000383
11007046	2020-10-31		0.25	10000035
11007047	2020-10-31		0.25	10000463
11007048	2020-10-31	美国大选还有3天，特朗普继续作	0.5	10000511
11007113	2020-11-07		1	10000287
11007041	2020-10-31		7.5	10000773
11007049	2020-11-01		0.5	10000160
11007050	2020-11-01		0.25	10000035
11007051	2020-11-01		8	10000014
11007052	2020-11-01		1	10000133
11007053	2020-11-01		0.25	10000557
11007055	2020-11-01		2	10000195
11007056	2020-11-01		0.25	10000463
11007057	2020-11-01		0.5	10000225
11007058	2020-11-01	无限活力	1.25	10000404
11007054	2020-11-01	通宵铺路，迁城到上洛口	10	10000773
11007059	2020-11-02		0.5	10000481
11007060	2020-11-02		4.5	10000794
11007061	2020-11-02		0.75	10000160
11007062	2020-11-02		0.25	10000035
11007063	2020-11-02		4	10000014
11007064	2020-11-02		0.25	10000133
11007065	2020-11-02		0.5	10000557
11007066	2020-11-02	打了一天仗，暂时战功第一了，虽然才18000	11	10000773
11007067	2020-11-02		1.5	10000195
11007068	2020-11-02	秘籍和bug的讨论	0.25	10000787
11007069	2020-11-02		0.5	10000225
11007114	2020-11-07		0.25	10000133
11007072	2020-11-03	果然还是经典故事有深度令人遐想，大部分经典都是无法复制的，现在的动漫多半都是剩下的越发挖掘简单欲望的作品，只有简单模式才能在商界生存，毕竟可以量产	1	10000795
11007073	2020-11-03	跑图书馆看了看日本历史，昭和天皇的失败	3	10000796
11007074	2020-11-03		0.75	10000160
11007075	2020-11-03	出门走一走，不带手机和钱包，感觉轻松愉快	1	10000383
11007076	2020-11-03		0.25	10000035
11007077	2020-11-03		0.5	10000287
11007078	2020-11-03		1.5	10000195
11007071	2020-11-03		7	10000014
11007070	2020-11-03	凌晨光是想阵容就想了三个小时，真的入迷上瘾	9	10000773
11007079	2020-11-04	早上7点半到，结结实实干了一天吧	7	10000794
11007080	2020-11-04		1	10000401
11007081	2020-11-04		1	10000160
11007082	2020-11-04		0.25	10000035
11007083	2020-11-04		5	10000014
11007084	2020-11-04	没时间玩，好像错过了什么	6	10000773
11007085	2020-11-04		2	10000195
11007086	2020-11-04		0.25	10000463
11007087	2020-11-05		1	10000374
11007088	2020-11-05	review	4	10000794
11007089	2020-11-05		0.5	10000160
11007090	2020-11-05		0.25	10000035
11007091	2020-11-05		6.5	10000014
11007092	2020-11-05	一直玩，但是中间开个会，被人俘虏了，超级不爽	10	10000773
11007093	2020-11-05		1	10000195
11007094	2020-11-05		0.5	10000253
11007095	2020-11-05		0.25	10000793
11007096	2020-11-07	见diary	1	10000797
11007097	2020-11-06		2	10000374
11007098	2020-11-06		1	10000481
11007099	2020-11-06		4	10000794
11007101	2020-11-06		0.25	10000035
11007102	2020-11-06		7	10000014
11007103	2020-11-06		1	10000793
11007104	2020-11-06		0.25	10000557
11007106	2020-11-06		1	10000195
11007107	2020-11-06		2	10000404
11007100	2020-11-06		0.5	10000160
11007105	2020-11-06		5	10000773
11007108	2020-11-07		6.5	10000014
11007110	2020-11-07		0.75	10000160
11007111	2020-11-07	出去买东西，又忘了电池	1.5	10000383
11007112	2020-11-07	这次找到想看的历史书了，不知道为什么没干劲	1.5	10000796
11007115	2020-11-07		0.5	10000195
11007109	2020-11-07	各种思考，各种换阵容	11	10000773
11007116	2020-11-09	明天出勤预定	0.25	10000401
11007117	2020-11-09		1.25	10000160
11007118	2020-11-09	出去逛一逛，但还是在想游戏	1	10000383
11007119	2020-11-09		0.25	10000035
11007120	2020-11-09		8	10000014
11007121	2020-11-09		0.5	10000287
11007122	2020-11-09		0.25	10000133
11007123	2020-11-09	周末，元旦预定	0.25	10000020
11007124	2020-11-09		11	10000773
11007125	2020-11-09		1	10000195
11007126	2020-11-09		0.25	10000225
11007127	2020-11-10		0.5	10000481
11007128	2020-11-10		4	10000794
11007129	2020-11-10		6	10000014
11007131	2020-11-10		2	10000195
11007132	2020-11-10		0.5	10000374
11007133	2020-11-10		0.5	10000160
11007134	2020-11-10		0.25	10000035
11007135	2020-11-10		0.25	10000471
11007130	2020-11-10		10	10000773
11007136	2020-11-11		1	10000374
11007137	2020-11-11		0.25	10000160
11007138	2020-11-11		0.25	10000035
11007139	2020-11-11		8	10000014
11007140	2020-11-11		9	10000773
11007141	2020-11-11		3	10000195
11007142	2020-11-11		1	10000404
11007143	2020-11-11		1.5	10000387
11007144	2020-11-12		1	10000374
11007145	2020-11-12		0.25	10000160
11007146	2020-11-12		0.25	10000035
11007147	2020-11-12		9	10000014
11007149	2020-11-12		2	10000195
11007150	2020-11-12		0.25	10000225
11007148	2020-11-12		7	10000773
11007152	2020-11-12		1	10000505
11007151	2020-11-12		3.25	10000387
11007153	2020-11-13		5	10000568
11007154	2020-11-13		1.5	10000374
11007155	2020-11-13		1	10000481
11007156	2020-11-13		1	10000160
11007157	2020-11-13		0.5	10000383
11007158	2020-11-13		0.25	10000035
11007159	2020-11-13		7	10000014
11007160	2020-11-13		0.25	10000287
11007161	2020-11-13		3	10000387
11007162	2020-11-13		4	10000773
11007163	2020-11-13		0.5	10000195
11007164	2020-11-14		0.75	10000160
11007165	2020-11-14		0.25	10000035
11007166	2020-11-14		8.5	10000014
11007167	2020-11-14		1	10000287
11007168	2020-11-14		5	10000387
11007170	2020-11-14	跟刷抖音一样了，本来百度应该是查询问题的地方，现在变成推送信息了	2	10000798
11007171	2020-11-14		0.5	10000494
11007169	2020-11-14	练了一天的级，不知道在玩什么了	6	10000773
11007172	2020-11-15		0.5	10000383
11007173	2020-11-15		0.25	10000035
11007174	2020-11-15		8	10000014
11007177	2020-11-15		0.5	10000110
11007178	2020-11-15		0.75	10000160
11007179	2020-11-15		0.5	10000083
11007248	2020-11-27		0.25	10000035
11007180	2020-11-15		0.25	10000225
11007181	2020-11-15	重装电脑	3	10000799
11007175	2020-11-15		6	10000387
11007176	2020-11-15	被人偷家里地了	4.25	10000773
11007182	2020-11-18		1	10000160
11007183	2020-11-18		0.25	10000383
11007184	2020-11-18		0.25	10000035
11007185	2020-11-18		8	10000014
11007186	2020-11-18		6	10000387
11007187	2020-11-18		4	10000773
11007188	2020-11-18		3	10000396
11007189	2020-11-18	还是忘记材料了	1	10000360
11007190	2020-11-18		0.5	10000505
11007191	2020-11-17		2	10000568
11007192	2020-11-17	完全没有好好找着手，做事提不起劲，不知道提高效率	4	10000784
11007193	2020-11-17		0.5	10000160
11007194	2020-11-17		0.25	10000035
11007195	2020-11-17		7	10000014
11007196	2020-11-17		4	10000387
11007197	2020-11-17		3	10000773
11007198	2020-11-17		0.25	10000225
11007199	2020-11-17		3	10000505
11007200	2020-11-19		0.5	10000481
11007201	2020-11-19		0.75	10000048
11007202	2020-11-19		0.25	10000035
11007203	2020-11-19		8	10000014
11007205	2020-11-19		6	10000773
11007206	2020-11-19		4	10000307
11007204	2020-11-19		4	10000387
11007207	2020-11-19		0.5	10000463
11007208	2020-11-20	好烦	5	10000784
11007209	2020-11-20		1.5	10000481
11007210	2020-11-20		0.75	10000160
11007211	2020-11-20		0.25	10000035
11007212	2020-11-20		7.5	10000014
11007213	2020-11-20		4	10000387
11007214	2020-11-20		4.5	10000773
11007215	2020-11-20		0.5	10000798
11007216	2020-11-21		0.75	10000160
11007217	2020-11-21		0.25	10000035
11007218	2020-11-21		9	10000014
11007219	2020-11-21		7	10000387
11007220	2020-11-21		7	10000773
11007221	2020-11-22		0.75	10000048
11007222	2020-11-22		0.25	10000035
11007223	2020-11-22		7.5	10000014
11007224	2020-11-22	聚餐	1	10000020
11007225	2020-11-22		7	10000387
11007226	2020-11-22		7	10000773
11007227	2020-11-22		0.5	10000798
11007228	2020-11-23	找不到东西啊	1	10000800
11007229	2020-11-23		6	10000784
11007230	2020-11-23		1	10000481
11007231	2020-11-23		0.75	10000160
11007232	2020-11-23		0.25	10000035
11007233	2020-11-23		8	10000014
11007234	2020-11-23		3	10000387
11007235	2020-11-23		4	10000773
11007238	2020-11-26		0.5	10000401
11007240	2020-11-26		0.25	10000035
11007258	2020-11-28		0.5	10000160
11007259	2020-11-28		0.25	10000035
11007260	2020-11-28		8	10000014
11007239	2020-11-26		0.75	10000160
11007241	2020-11-26		6.5	10000014
11007245	2020-11-27		0.5	10000784
11007247	2020-11-27		0.5	10000160
11007249	2020-11-27		8	10000014
11007251	2020-11-27		11	10000773
11007262	2020-11-28		1	10000404
11007264	2020-11-25		1	10000374
11007265	2020-11-25		1	10000481
11007266	2020-11-25		0.5	10000401
11007267	2020-11-25		0.5	10000160
11007268	2020-11-25		0.25	10000035
11007269	2020-11-25		7	10000014
11007270	2020-11-25		4	10000387
11007271	2020-11-25	打游戏是打爽了，但是上班没干活	9.5	10000773
11007272	2020-11-25		0.25	10000225
11007273	2020-11-26		1.5	10000801
11007274	2020-11-26		5	10000784
11007275	2020-11-26		0.5	10000568
11007276	2020-11-26		0.5	10000798
11007242	2020-11-26		2.5	10000387
11007243	2020-11-26		6	10000773
11007277	2020-11-27		1	10000481
11007278	2020-11-27		1	10000384
11007279	2020-11-27		1	10000404
11007280	2020-11-27		0.75	10000505
11007281	2020-11-28		0.5	10000383
11007370	2020-12-09		7	10000804
11007371	2020-12-09		2	10000384
11007282	2020-11-28		2	10000077
11007283	2020-11-28		3	10000802
11007284	2020-11-28		0.5	10000287
11007285	2020-11-28		0.25	10000288
11007261	2020-11-28	决战孟津	5	10000773
11007263	2020-11-28		3	10000505
11007286	2020-11-29		0.5	10000160
11007287	2020-11-29		0.25	10000035
11007288	2020-11-29		10	10000014
11007289	2020-11-29		3	10000802
11007290	2020-11-29		7	10000773
11007291	2020-11-29		1	10000798
11007292	2020-11-29		0.25	10000463
11007293	2020-11-29		1	10000077
11007294	2020-11-29		1	10000505
11007295	2020-11-30		1	10000801
11007296	2020-11-30		1	10000784
11007297	2020-11-30		2	10000374
11007298	2020-11-30		0.5	10000160
11007299	2020-11-30		8	10000014
11007300	2020-11-30		3	10000802
11007301	2020-11-30	聊天花了很多时间	7	10000773
11007302	2020-11-30		1	10000798
11007303	2020-11-30		0.5	10000505
11007304	2020-12-01		2	10000801
11007305	2020-12-01		1	10000784
11007306	2020-12-01		1	10000374
11007307	2020-12-01		0.5	10000160
11007308	2020-12-01		0.25	10000035
11007309	2020-12-01		6.5	10000014
11007310	2020-12-01		0.5	10000287
11007311	2020-12-01		3	10000802
11007312	2020-12-01		8	10000773
11007313	2020-12-01		1	10000798
11007314	2020-12-01		0.25	10000505
11007315	2020-12-02		1	10000374
11007316	2020-12-02		0.5	10000160
11007317	2020-12-02		0.25	10000035
11007318	2020-12-02		8	10000014
11007319	2020-12-02		2	10000287
11007320	2020-12-02		3	10000802
11007321	2020-12-02		8	10000773
11007322	2020-12-02		0.25	10000463
11007323	2020-12-02		1	10000505
11007324	2020-12-03		2	10000384
11007325	2020-12-03		0.75	10000160
11007326	2020-12-03		9	10000014
11007327	2020-12-03		1	10000287
11007328	2020-12-03		8	10000773
11007329	2020-12-03		2	10000798
11007330	2020-12-03		0.25	10000463
11007331	2020-12-03		1	10000505
11007332	2020-12-04		3	10000784
11007333	2020-12-04		1	10000374
11007334	2020-12-04		1	10000481
11007335	2020-12-04		2	10000384
11007336	2020-12-04		1	10000511
11007337	2020-12-04		1.25	10000160
11007338	2020-12-04		0.25	10000035
11007339	2020-12-04		6	10000014
11007340	2020-12-04		0.5	10000287
11007341	2020-12-04		0.5	10000133
11007342	2020-12-04		6	10000773
11007343	2020-12-04		1.5	10000195
11007345	2020-12-05		0.5	10000160
11007346	2020-12-05		0.25	10000035
11007347	2020-12-05		11.5	10000014
11007350	2020-12-05		0.25	10000225
11007351	2020-12-05		0.25	10000133
11007352	2020-12-05		7	10000773
11007353	2020-12-05		1	10000798
11007344	2020-12-05		0.25	10000511
11007348	2020-12-05		1	10000077
11007349	2020-12-05		2	10000195
11007354	2020-12-06		2	10000445
11007355	2020-12-06		0.25	10000160
11007356	2020-12-06		0.25	10000035
11007357	2020-12-06		9	10000014
11007358	2020-12-06		8	10000773
11007359	2020-12-06		2	10000798
11007360	2020-12-06		2	10000505
11007361	2020-12-06		0.5	10000803
11007363	2020-12-07		1	10000374
11007364	2020-12-07		1	10000384
11007365	2020-12-07		0.25	10000160
11007366	2020-12-07		8	10000014
11007367	2020-12-07		6	10000773
11007368	2020-12-07		1	10000798
11007369	2020-12-07		0.75	10000505
11007362	2020-12-07	搞不清楚环境，特别急的项目	6	10000804
11007372	2020-12-09		0.25	10000160
11007373	2020-12-09		0.25	10000035
11007374	2020-12-09		8	10000014
11007375	2020-12-09		4	10000773
11007376	2020-12-09		1	10000194
11007377	2020-12-09		1	10000287
11007378	2020-12-09		0.5	10000461
11007379	2020-12-10		1.5	10000804
11007380	2020-12-10		2	10000374
11007381	2020-12-10		1	10000384
11007382	2020-12-10		0.75	10000160
11007383	2020-12-10		0.25	10000035
11007384	2020-12-10		8	10000014
11007385	2020-12-10		0.25	10000803
11007386	2020-12-10		6.75	10000773
11007387	2020-12-10		1	10000798
11007388	2020-12-10		0.25	10000565
11007389	2020-12-10		0.25	10000225
11007390	2020-12-10		1.5	10000194
11007391	2020-12-10		0.5	10000051
11007392	2020-12-11		7	10000014
11007393	2020-12-11		0.25	10000803
11007394	2020-12-11	我的积累总是没有很好的执行，所以效果也不好。	0.25	10000799
11007396	2020-12-11		0.5	10000805
11007398	2020-12-12		0.25	10000035
11007402	2020-12-12		0.25	10000471
11007404	2020-12-12		1	10000505
11007494	2020-12-21		0.25	10000803
11007405	2020-12-11		10	10000804
11007406	2020-12-11		1	10000445
11007407	2020-12-11		1	10000160
11007408	2020-12-11		0.25	10000035
11007409	2020-12-11		0.25	10000463
11007395	2020-12-11		3.5	10000773
11007493	2020-12-21	本拉登最初是受到美国训练，打击苏联的基地组织	0.75	10000511
11007401	2020-12-12		0.5	10000160
11007399	2020-12-12		8	10000014
11007397	2020-12-12		7	10000804
11007400	2020-12-12		7	10000773
11007410	2020-12-13		9	10000804
11007411	2020-12-13		1	10000401
11007412	2020-12-13		1	10000160
11007413	2020-12-13		0.25	10000035
11007414	2020-12-13		7	10000014
11007415	2020-12-13		3	10000773
11007416	2020-12-13		0.25	10000463
11007417	2020-12-13	手机没电，回家路上一直想着，真的需要好大的勇气，才能开始真正的创作啊。旅者之路，也是我的冒险。	1	10000265
11007418	2020-12-13	PeterPan， A story of little sister’s dream land.	1	10000806
11007419	2020-12-13	他被日本俘虏后，反手击溃整个中国防线，给自己学生们的信息，是从不会说出口的，你们所有人加起来都打不过我一个人。	0.5	10000807
11007420	2020-12-14		6	10000804
11007421	2020-12-14	忘带门禁卡，白跑一趟	2	10000374
11007422	2020-12-14		1	10000160
11007423	2020-12-14		8.5	10000014
11007424	2020-12-14		0.25	10000194
11007425	2020-12-14		5	10000773
11007426	2020-12-14		0.25	10000798
11007427	2020-12-14		0.5	10000373
11007428	2020-12-14		0.5	10000284
11007429	2020-12-16		0.5	10000801
11007430	2020-12-16		1	10000804
11007431	2020-12-16		1	10000374
11007432	2020-12-16		0.5	10000481
11007433	2020-12-16		0.5	10000401
11007434	2020-12-16		1	10000160
11007435	2020-12-16		0.25	10000035
11007436	2020-12-16		8	10000014
11007437	2020-12-16		0.5	10000803
11007438	2020-12-16		1.5	10000194
11007439	2020-12-16		4	10000773
11007440	2020-12-16		0.25	10000225
11007441	2020-12-16	给他讲怎么搭建summit环境	2.5	10000808
11007442	2020-12-16	好久没玩了，为了找一下正常的游戏感觉，通了一回，手生	1	10000809
11007443	2020-12-16	电车上瞎想，时间就过了	1.5	10000505
11007444	2020-12-15		9	10000804
11007445	2020-12-15		0.5	10000401
11007446	2020-12-15		1.5	10000160
11007447	2020-12-15		0.25	10000035
11007448	2020-12-15		8	10000014
11007449	2020-12-15	一不小心就睡着了	2	10000773
11007450	2020-12-17		3	10000457
11007451	2020-12-17		3.5	10000804
11007452	2020-12-17		2.75	10000374
11007453	2020-12-17		0.75	10000160
11007454	2020-12-17		0.25	10000035
11007455	2020-12-17		7.5	10000014
11007456	2020-12-17		0.5	10000803
11007457	2020-12-17		0.5	10000194
11007458	2020-12-17		5	10000773
11007459	2020-12-17		0.25	10000225
11007461	2020-12-18		0.5	10000160
11007462	2020-12-18		0.25	10000035
11007463	2020-12-18		7	10000014
11007464	2020-12-18		4	10000773
11007465	2020-12-18		3	10000457
11007466	2020-12-18		0.25	10000225
11007460	2020-12-18		9	10000804
11007467	2020-12-19		9	10000804
11007468	2020-12-19		0.5	10000160
11007469	2020-12-19		0.25	10000035
11007470	2020-12-19	失眠，早上5点才睡着	6	10000014
11007471	2020-12-19		1	10000803
11007472	2020-12-19		2	10000773
11007473	2020-12-19		2	10000457
11007474	2020-12-19		0.25	10000225
11007475	2020-12-20	开始NSR了	7	10000804
11007476	2020-12-20		1	10000808
11007477	2020-12-20		0.5	10000160
11007478	2020-12-20		8	10000014
11007481	2020-12-20		0.5	10000225
11007482	2020-12-20		0.25	10000035
11007483	2020-12-20		0.25	10000194
11007480	2020-12-20		2	10000798
11007484	2020-12-20		1	10000457
11007479	2020-12-20		3.5	10000773
11007485	2020-12-21		9	10000804
11007486	2020-12-21		0.5	10000401
11007487	2020-12-21		0.5	10000160
11007488	2020-12-21		0.25	10000035
11007489	2020-12-21		7	10000014
11007490	2020-12-21		0.25	10000133
11007491	2020-12-21		3	10000773
11007492	2020-12-21		0.5	10000798
11007502	2020-12-22		7	10000804
11007503	2020-12-22		0.5	10000160
11007504	2020-12-22		0.25	10000035
11007505	2020-12-22	英国新冠再变异	0.25	10000511
11007506	2020-12-22		0.5	10000383
11007507	2020-12-22		7	10000014
11007508	2020-12-22		0.25	10000803
11007509	2020-12-22		0.5	10000194
11007510	2020-12-22		5	10000773
11007511	2020-12-22		2.5	10000195
11007512	2020-12-22		0.25	10000798
11007495	2020-12-23		10	10000804
11007496	2020-12-23		1	10000160
11007513	2020-12-23		0.5	10000810
11007514	2020-12-23		0.25	10000035
11007498	2020-12-23	电车上差点儿睡着了，果然是困了	7.5	10000014
11007500	2020-12-23		4	10000773
11007515	2020-12-23		0.75	10000505
11007516	2020-12-24		9	10000804
11007517	2020-12-24		0.75	10000160
11007518	2020-12-24	上下班路上，没干事	2	10000383
11007519	2020-12-24		0.25	10000035
11007520	2020-12-24		7	10000014
11007521	2020-12-24		3	10000773
11007522	2020-12-24		2	10000505
11007524	2020-12-25		0.5	10000160
11007525	2020-12-25		0.25	10000035
11007526	2020-12-25		7	10000014
11007527	2020-12-25		2	10000773
11007528	2020-12-25		2	10000195
11007529	2020-12-25		0.25	10000225
11007530	2020-12-25		2	10000740
11007531	2020-12-25	上班路上	1	10000383
11007523	2020-12-25		9	10000804
11007532	2020-12-26		3	10000804
11007533	2020-12-26		0.25	10000160
11007534	2020-12-26		0.25	10000035
11007535	2020-12-26	又失眠	8	10000014
11007536	2020-12-26		5	10000740
11007537	2020-12-26		3.5	10000773
11007538	2020-12-26		3.5	10000457
11007539	2020-12-26		0.5	10000225
11007540	2020-12-28		5	10000804
11007541	2020-12-28		3	10000773
11007542	2020-12-28		1	10000457
11007543	2020-12-28		7	10000014
11007544	2020-12-28		7	10000811
11007545	2020-12-28		0.25	10000374
11007546	2020-12-28		0.25	10000160
11007547	2020-12-28		0.25	10000035
11007548	2020-12-28		0.25	10000225
11007549	2020-12-29		5	10000804
11007550	2020-12-29		1	10000160
11007551	2020-12-29		0.25	10000035
11007552	2020-12-29		7	10000014
11007553	2020-12-29		8	10000811
11007554	2020-12-29		2	10000773
11007555	2020-12-30	NSR好麻烦，式样不明白	5	10000804
11007556	2020-12-30		1.5	10000160
11007557	2020-12-30		5.5	10000014
11007559	2020-12-30		3	10000773
11007558	2020-12-30		9	10000811
11007560	2020-12-31		4	10000804
11007561	2020-12-31		1	10000374
11007562	2020-12-31		0.25	10000160
11007563	2020-12-31		0.25	10000035
11007564	2020-12-31		5	10000014
11007565	2020-12-31		0.5	10000287
11007566	2020-12-31		11.5	10000811
11007567	2020-12-31		1	10000773
11007568	2020-12-31		0.25	10000225
11007569	2021-01-01		0.5	10000160
11007570	2021-01-01		0.25	10000035
11007571	2021-01-01		7	10000014
11007572	2021-01-01	元朝式	4	10000020
11007573	2021-01-01		3	10000811
11007574	2021-01-01		2	10000740
11007575	2021-01-01		1	10000457
11007576	2021-01-01		1	10000195
11007577	2021-01-01		0.25	10000225
11007579	2021-01-01		1.5	10000773
11007580	2021-01-01		0.5	10000288
11007578	2021-01-01		2	10000287
11007581	2021-01-02		7	10000014
11007582	2021-01-02	不看了，就想屠灭他族，对现在的我来说没有吸引力	1	10000811
11007583	2021-01-02		2	10000130
11007585	2021-01-02		3	10000195
11007586	2021-01-02		1	10000773
11007587	2021-01-02	h小说比正版还要有吸引力。。。	1	10000471
11007588	2021-01-02	Zoom上听别人讲圣经，	2	10000812
11007589	2021-01-02	Zoom上听别人讲圣经，听金姐	2	10000813
11007590	2021-01-02		2	10000322
11007584	2021-01-02		3	10000740
11007591	2021-01-03		7	10000014
11007592	2021-01-03		5	10000740
11007594	2021-01-03		0.25	10000160
11007595	2021-01-03		0.25	10000035
11007596	2021-01-03		1.5	10000813
11007597	2021-01-03		1.5	10000773
11007598	2021-01-03		1	10000195
11007625	2021-01-05		1	10000195
11007599	2021-01-03		2	10000322
11007593	2021-01-03		5.5	10000814
11007600	2021-01-04		8	10000804
11007601	2021-01-04	困，而且不相干nsr	2	10000374
11007602	2021-01-04		1	10000160
11007603	2021-01-04		0.25	10000035
11007604	2021-01-04		7	10000014
11007605	2021-01-04		2	10000740
11007606	2021-01-04		1	10000773
11007607	2021-01-04		0.25	10000565
11007608	2021-01-04		1	10000505
11007609	2021-01-06		7	10000804
11007610	2021-01-06		1	10000374
11007611	2021-01-06		0.5	10000160
11007612	2021-01-06		7	10000014
11007613	2021-01-06		5	10000740
11007614	2021-01-06		2	10000773
11007615	2021-01-06		0.5	10000565
11007616	2021-01-06		0.5	10000798
11007617	2021-01-05		5.5	10000804
11007618	2021-01-05		1	10000374
11007619	2021-01-05		0.25	10000160
11007620	2021-01-05		0.25	10000035
11007621	2021-01-05		6	10000014
11007622	2021-01-05		8	10000740
11007623	2021-01-05		0.5	10000773
11007624	2021-01-05		0.5	10000565
11007626	2021-01-06		1	10000437
11007627	2021-01-07		9	10000804
11007628	2021-01-07		0.25	10000160
11007629	2021-01-07		0.25	10000035
11007630	2021-01-07		6	10000014
11007631	2021-01-07		7	10000740
11007632	2021-01-07		0.75	10000773
11007633	2021-01-07		0.25	10000471
11007634	2021-01-08		9	10000804
11007635	2021-01-08		0.25	10000160
11007636	2021-01-08		0.25	10000035
11007637	2021-01-08		6	10000014
11007638	2021-01-08		4	10000740
11007639	2021-01-08		1	10000773
11007640	2021-01-08		0.5	10000471
11007641	2021-01-09		10	10000804
11007642	2021-01-09		0.25	10000160
11007643	2021-01-09		0.25	10000035
11007644	2021-01-09		6	10000014
11007646	2021-01-09	考试考差了，可能进不了清北班了	1	10000278
11007647	2021-01-09		0.5	10000287
11007645	2021-01-09	新赛季了	6	10000773
11007649	2021-01-11		0.25	10000160
11007650	2021-01-11		0.25	10000035
11007652	2021-01-11		0.25	10000287
11007655	2021-01-11		0.25	10000463
11007656	2021-01-10		11	10000804
11007657	2021-01-10		0.25	10000160
11007658	2021-01-10		0.25	10000035
11007659	2021-01-10		6.5	10000014
11007660	2021-01-10		0.25	10000287
11007661	2021-01-10		2	10000740
11007662	2021-01-10		3	10000773
11007663	2021-01-10		0.5	10000798
11007664	2021-01-10		0.25	10000463
11007665	2021-01-11		2	10000195
11007648	2021-01-11		9	10000804
11007651	2021-01-11		6	10000014
11007653	2021-01-11		3	10000740
11007654	2021-01-11		3	10000773
11007668	2021-01-13		0.25	10000035
11007669	2021-01-13		8	10000014
11007673	2021-01-13		0.5	10000798
11007674	2021-01-12		8.5	10000804
11007675	2021-01-12		0.25	10000160
11007676	2021-01-12		0.25	10000035
11007678	2021-01-12		0.5	10000287
11007679	2021-01-12		2	10000740
11007680	2021-01-12		4	10000773
11007681	2021-01-12		0.5	10000798
11007677	2021-01-12		8	10000014
11007682	2021-01-13		3	10000195
11007667	2021-01-13	煮火锅，好像还是不太好弄，没有油底	0.75	10000160
11007670	2021-01-13	特朗普和美国	0.5	10000287
11007671	2021-01-13		4	10000740
11007672	2021-01-13		6	10000773
11007683	2021-01-14		3	10000804
11007684	2021-01-14	这程序真的没法看呢	2	10000808
11007685	2021-01-14		0.5	10000401
11007686	2021-01-14	火锅面，有菜有肉就是最好的伙食了	1	10000048
11007687	2021-01-14		0.5	10000160
11007688	2021-01-14		6	10000014
11007690	2021-01-14		4	10000773
11007691	2021-01-14		2	10000815
11007689	2021-01-14		2	10000740
11007692	2021-01-14		3	10000816
11007693	2021-01-15		3	10000804
11007694	2021-01-15		3	10000808
11007695	2021-01-15		0.5	10000048
11007696	2021-01-15		0.5	10000160
11007697	2021-01-15		0.25	10000035
11007698	2021-01-15		6	10000014
11007699	2021-01-15		0.25	10000287
11007700	2021-01-15		3	10000740
11007701	2021-01-15		3	10000773
11007702	2021-01-15		4	10000816
11007703	2021-01-16		2	10000804
11007704	2021-01-16		0.5	10000160
11007705	2021-01-16		0.25	10000035
11007706	2021-01-16		7	10000014
11007707	2021-01-16		0.5	10000287
11007708	2021-01-16		0.5	10000288
11007709	2021-01-16		5	10000740
11007710	2021-01-16		4	10000773
11007711	2021-01-16		3	10000077
11007712	2021-01-16		0.25	10000471
11007713	2021-01-17		0.5	10000160
11007714	2021-01-17		7	10000014
11007715	2021-01-17		1	10000287
11007716	2021-01-17		12	10000740
11007717	2021-01-17		3	10000773
11007718	2021-01-17		0.25	10000798
11007719	2021-01-17		0.25	10000463
11007720	2021-01-18		3	10000804
11007721	2021-01-18		2	10000808
11007722	2021-01-18		4	10000014
11007723	2021-01-18		12	10000740
11007724	2021-01-18		1	10000773
11007725	2021-01-18		0.5	10000077
11007726	2021-01-19		1	10000804
11007727	2021-01-19		0.5	10000160
11007728	2021-01-19		7	10000014
11007729	2021-01-19		12.5	10000740
11007730	2021-01-19		2	10000773
11007731	2021-01-19		0.25	10000463
11007732	2021-01-20		3	10000804
11007733	2021-01-20		1	10000374
11007734	2021-01-20		0.25	10000160
11007735	2021-01-20		0.25	10000035
11007736	2021-01-20		5.75	10000014
11007737	2021-01-20		3	10000740
11007738	2021-01-20		4	10000773
11007739	2021-01-20		1	10000816
11007740	2021-01-20		2	10000077
11007741	2021-01-20		0.25	10000471
11007742	2021-01-20		4.5	10000437
11007743	2021-01-21		5	10000554
11007744	2021-01-21		4	10000804
11007745	2021-01-21		4	10000384
11007746	2021-01-21		6	10000014
11007747	2021-01-21		2	10000773
11007748	2021-01-21		0.25	10000048
11007749	2021-01-21		0.25	10000160
11007750	2021-01-21		0.25	10000035
11007751	2021-01-21		0.25	10000471
11007752	2021-01-21		2	10000294
11007753	2021-01-22		6	10000804
11007754	2021-01-22		0.5	10000481
11007755	2021-01-22		1.5	10000384
11007756	2021-01-22		0.25	10000048
11007757	2021-01-22		0.25	10000160
11007758	2021-01-22		0.25	10000035
11007759	2021-01-22		8	10000014
11007760	2021-01-22		2.5	10000773
11007761	2021-01-22		0.25	10000471
11007762	2021-01-22		2	10000294
11007763	2021-01-22	有生之年	1	10000789
11007765	2021-01-23		9	10000014
11007767	2021-01-23		1	10000818
11007768	2021-01-23		0.5	10000225
11007764	2021-01-22		1.5	10000817
11007769	2021-01-23		1.5	10000079
11007770	2021-01-23		2	10000819
11007771	2021-01-23		0.5	10000160
11007772	2021-01-23	出门走一走都成了奢侈啊	0.5	10000383
11007773	2021-01-23		0.5	10000083
11007774	2021-01-23		0.5	10000820
11007775	2021-01-23		0.5	10000035
11007776	2021-01-23		2	10000821
11007766	2021-01-23		3	10000245
11007777	2021-01-23		3	10000773
11007779	2021-01-24		1	10000823
11007781	2021-01-24		0.5	10000824
11007780	2021-01-24		6	10000014
11007782	2021-01-24		1	10000825
11007783	2021-01-24		0.25	10000048
11007786	2021-01-24	这种黑暗题材我不喜欢	1	10000826
11007787	2021-01-24		0.5	10000827
11007788	2021-01-24		3	10000828
11007778	2021-01-24		5	10000822
11007790	2021-01-24	喝点儿酒	0.25	10000383
11007791	2021-01-24		0.25	10000035
11007792	2021-01-24		0.25	10000225
11007784	2021-01-24		0.5	10000160
11007789	2021-01-24		3	10000829
11007785	2021-01-24		2.5	10000773
11007793	2021-01-25		2	10000804
11007795	2021-01-25		0.25	10000160
11007796	2021-01-25		7.5	10000014
11007797	2021-01-25		3	10000829
11007798	2021-01-25		1	10000773
11007799	2021-01-25		2	10000830
11007800	2021-01-25		1.5	10000831
11007801	2021-01-25		1.5	10000832
11007802	2021-01-25		1.5	10000833
11007803	2021-01-25		0.25	10000225
11007794	2021-01-25		0.5	10000808
11007804	2021-01-25		0.5	10000834
11007805	2021-01-25	真的该出门走走，哪怕是这个疫情期间	1	10000383
11007806	2021-01-25		0.25	10000035
11007807	2021-01-26		0.5	10000448
11007808	2021-01-26		0.5	10000160
11007809	2021-01-26		1	10000834
11007862	2021-01-30		0.5	10000843
11007811	2021-01-26		1	10000384
11007812	2021-01-26		1.5	10000303
11007815	2021-01-26		0.5	10000481
11007863	2021-01-30		0.5	10000844
11007814	2021-01-26		5	10000835
11007813	2021-01-26		1.5	10000773
11007816	2021-01-26		1	10000817
11007817	2021-01-26		1	10000009
11007810	2021-01-26		9.5	10000014
11007818	2021-01-26		3	10000067
11007820	2021-01-27		0.5	10000481
11007821	2021-01-27		9.5	10000014
11007824	2021-01-27		0.5	10000225
11007864	2021-01-30		0.5	10000835
11007865	2021-01-30		1	10000521
11007822	2021-01-27		4	10000067
11007825	2021-01-27		0.25	10000401
11007819	2021-01-27		0.75	10000804
11007826	2021-01-27		3	10000822
11007827	2021-01-27		0.5	10000079
11007828	2021-01-27		0.5	10000817
11007829	2021-01-27		0.5	10000789
11007866	2021-01-30		0.5	10000821
11007830	2021-01-27		0.25	10000160
11007831	2021-01-27		0.25	10000035
11007832	2021-01-28		0.5	10000836
11007834	2021-01-28		1	10000784
11007835	2021-01-28		1.5	10000804
11007836	2021-01-28		8	10000014
11007838	2021-01-28		0.25	10000160
11007839	2021-01-28		0.25	10000565
11007840	2021-01-27		0.5	10000838
11007823	2021-01-27		3	10000773
11007841	2021-01-28		0.5	10000384
11007842	2021-01-28		0.5	10000574
11007843	2021-01-28		0.5	10000838
11007833	2021-01-28		4	10000837
11007845	2021-01-28		0.25	10000035
11007844	2021-01-28		4.5	10000839
11007860	2021-01-30		11	10000014
11007846	2021-01-28		0.5	10000688
11007837	2021-01-28		2.5	10000773
11007847	2021-01-29		1.5	10000840
11007848	2021-01-29		0.5	10000804
11007849	2021-01-29		1	10000374
11007850	2021-01-29		0.5	10000481
11007851	2021-01-29		0.5	10000160
11007852	2021-01-29		7	10000014
11007854	2021-01-29		1.5	10000009
11007855	2021-01-29		2	10000841
11007856	2021-01-29		1.5	10000051
11007857	2021-01-29		3	10000315
11007868	2021-01-30		0.5	10000009
11007858	2021-01-29		0.5	10000842
11007853	2021-01-29		3.5	10000773
11007859	2021-01-29		0.5	10000821
11007869	2021-01-30		0.25	10000160
11007870	2021-01-30		0.25	10000035
11007867	2021-01-30		6.5	10000632
11007861	2021-01-30		2.5	10000773
11007871	2021-01-30		0.5	10000845
11007873	2021-01-31		0.25	10000838
11007875	2021-01-31		0.5	10000771
11007877	2021-01-31		0.5	10000847
11007879	2021-01-31		1	10000110
11007880	2021-01-31		0.5	10000160
11007878	2021-01-31		4	10000498
11007885	2021-01-31		1	10000849
11007881	2021-01-31		0.5	10000009
11007882	2021-01-31		0.25	10000035
11007883	2021-01-31		0.5	10000051
11007872	2021-01-31		8	10000014
11007886	2021-01-31		1	10000850
11007876	2021-01-31		0.5	10000846
11007874	2021-01-31		3.5	10000773
11007884	2021-01-31	好老的动漫了，太久没看过了	0.5	10000848
11007887	2021-01-31		0.5	10000851
11007888	2021-02-01		0.25	10000481
11007889	2021-02-01		10	10000014
11007891	2021-02-01		1	10000852
11007892	2021-02-01		0.5	10000051
11007893	2021-02-01		3	10000384
11007894	2021-02-01		0.5	10000160
11007895	2021-02-01		0.25	10000035
11007897	2021-02-01		2	10000077
11007898	2021-02-01		0.5	10000183
11007896	2021-02-01		3.5	10000851
11007890	2021-02-01	被人抢了10级地，好不开心，下野干他？	3.5	10000773
11007899	2021-02-02		0.25	10000853
11007900	2021-02-02		0.25	10000374
11007901	2021-02-02		0.25	10000481
11007902	2021-02-02		7	10000014
11007904	2021-02-02		0.25	10000847
11007905	2021-02-02	调查内存增加	0.75	10000384
11007906	2021-02-02		0.25	10000051
11007981	2021-02-09		2	10000855
11007908	2021-02-02		2	10000849
11007909	2021-02-02		0.5	10000160
11007907	2021-02-02		3.5	10000854
11007910	2021-02-02		0.25	10000035
11007995	2021-02-09	耍够了，聊一聊学习。	0.5	10000287
11007903	2021-02-02		2.5	10000773
11007911	2021-02-02		5.5	10000183
11007912	2021-02-02		0.25	10000133
11007914	2021-02-03		8	10000014
11007915	2021-02-03		1	10000855
11007918	2021-02-03		0.5	10000481
11007919	2021-02-03	UBW线，果然最喜欢凛	4	10000661
11007920	2021-02-03		1	10000808
11007921	2021-02-03	把人家问烦了	1	10000574
11007969	2021-02-08	终于完结了，原来是这样一个故事。看爽了。	6.5	10000075
11007913	2021-02-03		0.5	10000160
11007917	2021-02-03		4.5	10000773
11007922	2021-02-03		1	10000310
11007916	2021-02-03		1.5	10000075
11007923	2021-02-03		1	10000856
11007925	2021-02-04		0.5	10000481
11007927	2021-02-04		8	10000014
11007930	2021-02-04		0.5	10000856
11007924	2021-02-04	搞半天是统计工具的错	2	10000855
11007931	2021-02-04		0.25	10000035
11007932	2021-02-04		4	10000075
11007926	2021-02-04		1	10000160
11007928	2021-02-04	浪费时间啊，又没什么新发现	3.75	10000773
11007933	2021-02-04		1	10000466
11007934	2021-02-04		1	10000661
11007929	2021-02-04		2	10000183
11007935	2021-02-05		1	10000855
11007936	2021-02-05		1	10000374
11007937	2021-02-05		1.5	10000481
11007938	2021-02-05		0.5	10000160
11007939	2021-02-05		0.25	10000035
11007940	2021-02-05		8	10000014
11007942	2021-02-05		4	10000773
11007941	2021-02-05		7	10000075
11007943	2021-02-05		0.5	10000183
11007944	2021-02-05		0.25	10000857
11007945	2021-02-06		8	10000014
11007946	2021-02-06		0.5	10000821
11007980	2021-02-09	Virtual Bytes	1	10000866
11007949	2021-02-06		0.5	10000160
11007950	2021-02-06		0.25	10000035
11007948	2021-02-06		3.5	10000773
11007951	2021-02-06		0.5	10000183
11007952	2021-02-06	地球的毁灭	0.75	10000287
11007954	2021-02-07		6.5	10000014
11007947	2021-02-06		11	10000075
11007957	2021-02-06		1	10000858
11007958	2021-02-07	记不住了	0.25	10000859
11007959	2021-02-07		0.25	10000860
11007960	2021-02-07	又丢了，n次了，这次买两个	0.5	10000861
11007961	2021-02-07		0.5	10000862
11007953	2021-02-07		0.25	10000160
11007962	2021-02-07		0.5	10000863
11007984	2021-02-09		0.5	10000798
11007963	2021-02-07	把苹果电脑的盒子拆来用，总算换成一个稳固的能装毕业证的盒子了。虽然好像把证书架子扔了也行	0.5	10000864
11007965	2021-02-07		0.25	10000035
11007955	2021-02-07		6	10000075
11007998	2021-02-09	好难受，这个剧真的很折磨人，主角果然还是很不喜欢的，太扭曲了，没有凛来纠正，根本看不下去。	2.5	10000870
11007964	2021-02-07		3.5	10000466
11007956	2021-02-07		2.5	10000773
11007967	2021-02-08		0.5	10000481
11007968	2021-02-08		8.5	10000014
11007966	2021-02-08		2	10000855
11007972	2021-02-08	讲解Dline	1.5	10000865
11007971	2021-02-08	编程理解能力不太行啊	2	10000808
11007994	2021-02-09		0.75	10000143
11007970	2021-02-08		2	10000773
11007973	2021-02-08		0.5	10000160
11007974	2021-02-08		0.5	10000858
11007975	2021-02-08		0.25	10000035
11007976	2021-02-08	被bilibili下架了，不过对我来说很不错啊，能看两遍	1	10000852
11007977	2021-02-08		0.25	10000225
11007986	2021-02-09		0.25	10000225
11007996	2021-02-09		0.25	10000035
11007978	2021-02-09		5.5	10000014
11007983	2021-02-09		0.5	10000817
11007987	2021-02-09		1	10000808
11007985	2021-02-09		2.5	10000867
11007988	2021-02-09		0.5	10000051
11007982	2021-02-09	聊一个问题聊一个小时，好像很浪费时间，最后还不用做了。	1	10000401
11007989	2021-02-09		0.25	10000868
11007990	2021-02-09		0.25	10000869
11007991	2021-02-09		0.25	10000541
11007992	2021-02-09	又完成一段娱乐，现在不知道干啥了。本来应该学习吧。	0.25	10000352
11007993	2021-02-09		0.25	10000133
11007997	2021-02-09	回顾了一下剧情，还是没有去写新的。终于有些小说的想法了，却没有搞好写幻构的工具（程序）。	0.5	10000265
11007979	2021-02-09		1.75	10000773
11008000	2021-02-09		0.25	10000871
11007999	2021-02-10		0.5	10000313
11008001	2021-02-10		1	10000855
11008002	2021-02-10		6.5	10000014
11008003	2021-02-10	好折磨人啊，这一部，以前一直不看果然是正确的，该等完结了再看。	2.5	10000870
11008007	2021-02-10		0.5	10000401
11008008	2021-02-10		0.25	10000858
11008010	2021-02-10		0.5	10000079
11008006	2021-02-10		0.5	10000804
11008009	2021-02-10		1	10000773
11008005	2021-02-10		2.5	10000872
11008011	2021-02-10		1.5	10000873
11008012	2021-02-10		1.5	10000874
11008014	2021-02-10		0.5	10000143
11008013	2021-02-10		0.5	10000875
11008015	2021-02-10		2	10000876
11008016	2021-02-10		1.5	10000877
11008017	2021-02-10		0.25	10000878
11008018	2021-02-11	今天休假，不知道呢	0.25	10000481
11008022	2021-02-11	这个汇率好低啊，下次再说。	0.25	10000236
11008021	2021-02-11		0.25	10000879
11008023	2021-02-11		0.5	10000849
11008086	2021-02-17		0.5	10000505
11008024	2021-02-11	糅杂回忆和最近的话题的梦，姜晓涵，好久没想起来的名字了。	1	10000797
11008087	2021-02-17		0.5	10000852
11008025	2021-02-11		0.25	10000287
11008026	2021-02-11		0.5	10000288
11008019	2021-02-11		10.5	10000014
11008027	2021-02-11	安装VSCode，JDK等	0.5	10000880
11008028	2021-02-11	怎么都连不上，弄了半天啊，太烦了，还是得装个本地数据库	2	10000881
11008029	2021-02-11		1.5	10000143
11008085	2021-02-17		2	10000886
11008030	2021-02-11		0.5	10000051
11008032	2021-02-11		0.25	10000009
11008088	2021-02-18		1.5	10000867
11008031	2021-02-11		6	10000632
11008020	2021-02-11		1.75	10000773
11008033	2021-02-12		0.25	10000882
11008034	2021-02-12		0.5	10000374
11008035	2021-02-12		0.75	10000481
11008037	2021-02-12		3	10000632
11008036	2021-02-12		6.5	10000014
11008039	2021-02-12		3	10000883
11008041	2021-02-12		0.5	10000225
11008090	2021-02-18		0.5	10000160
11008091	2021-02-18		6	10000014
11008042	2021-02-12		0.25	10000009
11008043	2021-02-12		0.25	10000849
11008044	2021-02-12		0.5	10000821
11008040	2021-02-12		3	10000884
11008038	2021-02-12		2	10000773
11008045	2021-02-12		0.25	10000035
11008046	2021-02-12		0.25	10000505
11008093	2021-02-18		1	10000773
11008047	2021-02-12		3	10000885
11008094	2021-02-18		0.5	10000505
11008051	2021-02-13		0.5	10000886
11008048	2021-02-13		9	10000014
11008095	2021-02-18		1	10000889
11008052	2021-02-13		0.25	10000225
11008050	2021-02-13		1	10000773
11008053	2021-02-13		0.5	10000887
11008054	2021-02-13		0.25	10000035
11008096	2021-02-18		1	10000384
11008055	2021-02-13		1	10000505
11008049	2021-02-13		11.5	10000885
11008056	2021-02-14		1.5	10000804
11008057	2021-02-14		0.25	10000481
11008058	2021-02-14		0.25	10000035
11008059	2021-02-14		7	10000014
11008060	2021-02-14		13	10000885
11008061	2021-02-14		1	10000773
11008062	2021-02-15		0.25	10000035
11008063	2021-02-15		6.5	10000014
11008065	2021-02-15		1	10000773
11008066	2021-02-15		0.25	10000225
11008067	2021-02-15		2	10000867
11008068	2021-02-15		2	10000808
11008064	2021-02-15		11	10000885
11008069	2021-02-15		1	10000888
11008070	2021-02-16		2.5	10000874
11008071	2021-02-16		1	10000808
11008072	2021-02-16		0.5	10000401
11008073	2021-02-16		1	10000863
11008074	2021-02-16		0.25	10000035
11008075	2021-02-16		6.5	10000014
11008077	2021-02-16		0.75	10000773
11008078	2021-02-16		0.5	10000888
11008076	2021-02-16	人渣还是人渣，总是会失败的。最后还是需要攻略。记忆、天赋、攻略，穿越能有的作弊器都有了。不过这也正是经典吧。	11.5	10000885
11008079	2021-02-17		0.25	10000401
11008080	2021-02-17		0.5	10000160
11008081	2021-02-17		7.5	10000014
11008083	2021-02-17		1	10000773
11008084	2021-02-17		0.25	10000225
11008089	2021-02-18		1	10000481
11008092	2021-02-18		12	10000886
11008082	2021-02-17	大概知道剧情了，看个结局就算了。这一部我觉得是少有的小说不如动画做得好。价值观不好，至少我不喜欢。	11	10000885
11008097	2021-02-19		1	10000889
11008098	2021-02-19		1	10000481
11008099	2021-02-19		5	10000014
11008100	2021-02-19	今天看爽了，只是后面好像没主剧情了	11	10000886
11008101	2021-02-19		1	10000773
11008102	2021-02-19		0.5	10000160
11008103	2021-02-19		0.25	10000035
11008104	2021-02-19		0.25	10000463
11008105	2021-02-19		0.5	10000821
11008106	2021-02-20		0.5	10000160
11008107	2021-02-20		0.25	10000383
11008108	2021-02-20		0.25	10000035
11008111	2021-02-20		1.5	10000773
11008116	2021-02-21		0.5	10000773
11008110	2021-02-20		16	10000886
11008109	2021-02-20		8	10000014
11008112	2021-02-20	啊，真的想着该改变了，生活比例，但是第二天还是没有动	1.5	10000505
11008113	2021-02-21		7	10000014
11008114	2021-02-21		0.5	10000143
11008117	2021-02-21		0.5	10000890
11008119	2021-02-21		0.5	10000817
11008120	2021-02-21		0.25	10000888
11008121	2021-02-21		0.5	10000891
11008118	2021-02-21		0.5	10000823
11008122	2021-02-21		0.5	10000821
11008123	2021-02-21		0.5	10000160
11008124	2021-02-21		0.25	10000035
11008125	2021-02-21		0.25	10000133
11008126	2021-02-21		0.25	10000463
11008115	2021-02-21		11	10000886
11008128	2021-02-22		0.5	10000160
11008129	2021-02-22		5	10000014
11008130	2021-02-22	果然看起来太慢了	11	10000886
11008132	2021-02-22		0.5	10000505
11008133	2021-02-22		1	10000384
11008127	2021-02-22	环境搞半天没弄好	3.5	10000804
11008134	2021-02-22		0.25	10000035
11008135	2021-02-22		0.25	10000225
11008131	2021-02-22		2	10000773
11008136	2021-02-23		0.5	10000160
11008137	2021-02-23		0.25	10000383
11008138	2021-02-23		0.25	10000035
11008139	2021-02-23		8	10000014
11008141	2021-02-23		2.5	10000773
11008140	2021-02-23		12.5	10000886
11008142	2021-02-24		0.5	10000889
11008143	2021-02-24		0.25	10000874
11008144	2021-02-24		1	10000808
11008145	2021-02-24		0.5	10000384
11008146	2021-02-24		0.5	10000160
11008147	2021-02-24		0.5	10000035
11008148	2021-02-24		5	10000014
11008150	2021-02-24		0.25	10000888
11008151	2021-02-24		2.5	10000773
11008149	2021-02-24	看完了，回头继续看日文原版	12.5	10000886
11008152	2021-02-25		1	10000481
11008153	2021-02-25		3.5	10000794
11008156	2021-02-25		0.5	10000892
11008157	2021-02-25		0.5	10000160
11008154	2021-02-25		6	10000014
11008158	2021-02-25	饿死了	0.5	10000875
11008160	2021-02-25		1	10000051
11008255	2021-03-03		0.25	10000345
11008161	2021-02-25		0.5	10000225
11008155	2021-02-25		7	10000886
11008159	2021-02-25		3	10000773
11008166	2021-02-27		0.5	10000160
11008167	2021-02-27		0.25	10000035
11008171	2021-02-27		0.25	10000225
11008172	2021-02-26		1	10000481
11008173	2021-02-26		2	10000808
11008174	2021-02-26		1	10000384
11008175	2021-02-26		3	10000794
11008176	2021-02-26		0.5	10000160
11008177	2021-02-26		0.25	10000035
11008178	2021-02-26		6	10000014
11008179	2021-02-26		8	10000886
11008180	2021-02-26		2	10000773
11008181	2021-02-26		0.25	10000225
11008168	2021-02-27		9	10000014
11008169	2021-02-27		9	10000886
11008221	2021-03-02		1	10000437
11008182	2021-02-27		0.5	10000821
11008170	2021-02-27		3.5	10000773
11008184	2021-02-28		1	10000821
11008238	2021-03-03		0.5	10000286
11008183	2021-02-28	醒了两次，还只睡了4小时，为什么醒了？做的梦虽然很不爽，被幺幺训了，什么都做不好还添乱。	8	10000014
11008186	2021-02-28		0.5	10000863
11008187	2021-02-28		0.25	10000035
11008188	2021-02-28		0.5	10000083
11008189	2021-02-28		0.25	10000288
11008190	2021-02-28	退会了	0.25	10000786
11008191	2021-02-28		0.25	10000236
11008192	2021-02-28		0.5	10000383
11008194	2021-02-28		0.25	10000891
11008195	2021-02-28		0.25	10000225
11008216	2021-03-02		7.5	10000014
11008222	2021-03-02		1.5	10000894
11008196	2021-02-28		1.5	10000051
11008185	2021-02-28		2.5	10000773
11008197	2021-02-28		1	10000505
11008193	2021-02-28		7.5	10000893
11008198	2021-03-01		0.5	10000889
11008199	2021-03-01		1.5	10000481
11008200	2021-03-01		2.5	10000794
11008201	2021-03-01		0.25	10000160
11008202	2021-03-01		0.25	10000858
11008203	2021-03-01		6.5	10000014
11008205	2021-03-01		0.25	10000035
11008206	2021-03-01		0.5	10000851
11008207	2021-03-01	看不进去啊	0.25	10000079
11008208	2021-03-01	这东西价值观真的有问题	0.25	10000826
11008209	2021-03-01		2	10000773
11008210	2021-03-01		0.25	10000798
11008211	2021-03-01		0.25	10000891
11008212	2021-03-01		0.25	10000225
11008204	2021-03-01		7.5	10000893
11008213	2021-03-01		0.5	10000345
11008214	2021-03-02	VUP说明会	1	10000889
11008215	2021-03-02		0.25	10000160
11008218	2021-03-02		0.25	10000051
11008219	2021-03-02		1	10000773
11008220	2021-03-02		0.5	10000630
11008223	2021-03-02		0.25	10000858
11008224	2021-03-02		0.25	10000035
11008217	2021-03-02		5	10000893
11008225	2021-03-02		0.5	10000817
11008226	2021-03-02		1.5	10000895
11008227	2021-03-02		0.5	10000844
11008228	2021-03-02		1	10000488
11008230	2021-03-03		1	10000867
11008239	2021-03-03		1.5	10000897
11008236	2021-03-03		0.5	10000896
11008240	2021-03-03		0.10000000000000001	10000898
11008241	2021-03-03		0.10000000000000001	10000899
11008237	2021-03-03		1.5	10000374
11008229	2021-03-03		2	10000894
11008234	2021-03-03	記録を見て、いろいろと思うんだが、果たして行動にうつせるのでしょうか	1.25	10000167
11008242	2021-03-03		0.10000000000000001	10000900
11008243	2021-03-03		0.10000000000000001	10000901
11008244	2021-03-03		0.10000000000000001	10000902
11008235	2021-03-03	久しぶりのまともな食事	0.75	10000160
11008231	2021-03-03	久しぶりの出勤	1	10000383
11008233	2021-03-03		1.5	10000893
11008256	2021-03-03		1.5	10000906
11008246	2021-03-03		0.25	10000773
11008248	2021-03-03		1.5	10000904
11008249	2021-03-03		0.5	10000884
11008250	2021-03-03		0.25	10000671
11008251	2021-03-03		0.5	10000905
11008252	2021-03-03		0.25	10000035
11008253	2021-03-03		0.25	10000471
11008254	2021-03-03		0.25	10000225
11008257	2021-03-04	这机器好像也有点儿问题哦	0.5	10000894
11008247	2021-03-03		0.5	10000849
11008245	2021-03-03	https://syosetu.com/site/about/	1	10000903
11008232	2021-03-03		7.5	10000014
11008259	2021-03-04		0.5	10000904
11008261	2021-03-04		0.5	10000895
11008262	2021-03-04		0.5	10000851
11008263	2021-03-04		1	10000690
11008264	2021-03-04		2	10000677
11008267	2021-03-04		1	10000907
11008265	2021-03-04		0.5	10000481
11008266	2021-03-04		0.5	10000808
11008268	2021-03-04		1	10000855
11008258	2021-03-04		7	10000014
11008333	2021-03-10		0.25	10000914
11008271	2021-03-04		0.25	10000035
11008337	2021-03-10		1.5	10000915
11008272	2021-03-04		0.75	10000909
11008270	2021-03-04		0.5	10000908
11008269	2021-03-04		2.25	10000440
11008260	2021-03-04		1	10000773
11008273	2021-03-04	21唐红	1	10000538
11008274	2021-03-04		1.75	10000910
11008276	2021-03-05		7	10000014
11008278	2021-03-05		0.5	10000907
11008279	2021-03-05		0.25	10000225
11008280	2021-03-05		0.25	10000911
11008281	2021-03-05		1.75	10000912
11008282	2021-03-05		1	10000808
11008275	2021-03-05		0.75	10000481
11008283	2021-03-05		0.25	10000401
11008285	2021-03-05		1	10000894
11008286	2021-03-05	聊记忆，小说转生蜘蛛	1.5	10000287
11008341	2021-03-10		1	10000808
11008287	2021-03-05		0.5	10000160
11008288	2021-03-05		0.25	10000035
11008277	2021-03-05		1.5	10000773
11008284	2021-03-05		7.5	10000438
11008289	2021-03-06		9.25	10000014
11008292	2021-03-06		0.5	10000863
11008294	2021-03-06		0.5	10000051
11008296	2021-03-06		0.5	10000858
11008342	2021-03-10		0.5	10000909
11008290	2021-03-06		2.25	10000821
11008297	2021-03-06		0.25	10000035
11008298	2021-03-06		1.5	10000789
11008293	2021-03-06		0.75	10000383
11008343	2021-03-10		0.25	10000225
11008299	2021-03-06		1	10000287
11008300	2021-03-06		1	10000278
11008340	2021-03-10		0.75	10000865
11008291	2021-03-06		0.75	10000773
11008295	2021-03-06		6.75	10000387
11008301	2021-03-07		6	10000014
11008302	2021-03-07		0.5	10000821
11008304	2021-03-07		0.5	10000858
11008305	2021-03-07		0.25	10000035
11008307	2021-03-07		1	10000773
11008308	2021-03-07		0.5	10000225
11008360	2021-03-11		2	10000804
11008309	2021-03-07		1.25	10000079
11008303	2021-03-07		0.5	10000160
11008339	2021-03-10		3	10000804
11008310	2021-03-07		0.25	10000852
11008306	2021-03-07		11.75	10000387
11008311	2021-03-08		0.25	10000894
11008312	2021-03-08		6.75	10000014
11008314	2021-03-08		0.25	10000401
11008313	2021-03-08		0.75	10000913
11008317	2021-03-08		1.5	10000808
11008318	2021-03-08		1	10000852
11008320	2021-03-08		0.25	10000225
11008338	2021-03-10		3.25	10000307
11008344	2021-03-10		0.25	10000079
11008321	2021-03-08		0.5	10000160
11008322	2021-03-08		0.25	10000035
11008316	2021-03-08	ps1没做成，sql没用功	2.5	10000889
11008315	2021-03-08		9	10000387
11008319	2021-03-08		1	10000773
11008324	2021-03-09	问答组会议，最后也不知道有什么用，总之有群要关注了	2	10000481
11008325	2021-03-09		0.25	10000808
11008326	2021-03-09	杂粮吃了，饭没有	0.25	10000160
11008327	2021-03-09		7	10000014
11008329	2021-03-09		1	10000384
11008330	2021-03-09		0.5	10000909
11008323	2021-03-09		2.5	10000804
11008345	2021-03-10		0.25	10000789
11008331	2021-03-09		0.5	10000852
11008328	2021-03-09		7	10000387
11008346	2021-03-10		0.25	10000916
11008332	2021-03-09		3	10000440
11008334	2021-03-10		0.5	10000374
11008335	2021-03-10	Windows VUP	0.5	10000481
11008336	2021-03-10		7.5	10000014
11008347	2021-03-10		0.25	10000917
11008354	2021-03-11		1.5	10000401
11008349	2021-03-10	介绍了两本小说	0.5	10000287
11008363	2021-03-11		1	10000919
11008350	2021-03-10		0.5	10000773
11008348	2021-03-10	http://manhua.dmzj1.com/dcii/4029.shtml#@page=1	1.5	10000906
11008351	2021-03-10		2	10000918
11008352	2021-03-10		1.5	10000499
11008353	2021-03-11		0.25	10000865
11008356	2021-03-11		0.25	10000835
11008357	2021-03-11		0.25	10000849
11008359	2021-03-11		0.5	10000918
11008361	2021-03-11		1	10000160
11008355	2021-03-11		6.25	10000014
11008362	2021-03-11		6	10000916
11008364	2021-03-11		1	10000488
11008365	2021-03-11		0.25	10000035
11008358	2021-03-11		1.25	10000773
11008366	2021-03-11		0.5	10000920
11008367	2021-03-12		7.5	10000014
11008371	2021-03-12		0.25	10000481
11008368	2021-03-12		0.75	10000837
11008369	2021-03-12		0.5	10000888
11008374	2021-03-12	未来的路，我一生的三个问题，赚钱，成家，赡养父母。	1	10000352
11008376	2021-03-12		1	10000808
11008370	2021-03-12		2.5	10000804
11008375	2021-03-12		0.5	10000921
11008372	2021-03-12		1	10000916
11008377	2021-03-12	拜年祭，音乐	1	10000922
11008373	2021-03-12		1.5	10000374
11008378	2021-03-12		0.75	10000909
11008380	2021-03-12		0.5	10000862
11008381	2021-03-12		1	10000923
11008382	2021-03-12		0.5	10000773
11008383	2021-03-12		0.25	10000471
11008384	2021-03-12		0.5	10000463
11008379	2021-03-12		2.5	10000554
11008385	2021-03-12		0.5	10000821
11008386	2021-03-13		6.5	10000014
11008390	2021-03-13		0.5	10000287
11008388	2021-03-13		1.5	10000773
11008391	2021-03-13		0.25	10000288
11008456	2021-03-19		0.5	10000481
11008392	2021-03-13		0.25	10000817
11008389	2021-03-13		0.5	10000909
11008394	2021-03-13		0.25	10000035
11008393	2021-03-13		1.5	10000278
11008458	2021-03-19		0.25	10000051
11008468	2021-03-20	又看两遍，是真的很有趣吗，我都看至少四遍了，动漫加小说	1	10000821
11008387	2021-03-13		12.25	10000916
11008395	2021-03-14	Lay in bed for 30min	6	10000014
11008396	2021-03-14	ドット疲れる、一年も運動なしだと、体が呆れるほど弱くなっていました。	4	10000924
11008397	2021-03-14	電車乗り間違い、各停にしたので、ほぼ動けない	0.5	10000383
11008399	2021-03-14	結果疲れる、寝たい	1	10000925
11008400	2021-03-14		0.5	10000160
11008398	2021-03-14		4.5	10000916
11008403	2021-03-15	風邪にならなくて済んだ	11	10000014
11008406	2021-03-15		1	10000926
11008407	2021-03-15	出勤	0.5	10000383
11008454	2021-03-19		1.5	10000821
11008459	2021-03-19		0.25	10000225
11008408	2021-03-15	NSR VUPの質問、回答は簡単	0.25	10000574
11008409	2021-03-15		0.25	10000401
11008410	2021-03-15		0.5	10000774
11008460	2021-03-19	保险	0.25	10000041
11008461	2021-03-19		2	10000175
11008401	2021-03-15		3	10000874
11008411	2021-03-15	Acct	1.5	10000804
11008402	2021-03-15	何をすればいいのか、分からない	1.5	10000374
11008462	2021-03-19		0.5	10000401
11008405	2021-03-15		1	10000773
11008404	2021-03-15		5.5	10000916
11008414	2021-03-16		7.5	10000014
11008416	2021-03-16		0.5	10000907
11008417	2021-03-16		0.5	10000401
11008463	2021-03-19		1.5	10000929
11008451	2021-03-19		2	10000930
11008413	2021-03-16		1	10000374
11008418	2021-03-16		1	10000927
11008419	2021-03-16		0.5	10000160
11008412	2021-03-16		1.5	10000804
11008482	2021-03-20		0.5	10000886
11008415	2021-03-16		3	10000867
11008455	2021-03-19		1	10000374
11008420	2021-03-16		4	10000916
11008422	2021-03-16		1	10000789
11008421	2021-03-16		1.5	10000773
11008424	2021-03-17		1	10000867
11008425	2021-03-17		0.5	10000374
11008426	2021-03-17		1	10000481
11008427	2021-03-17		7.5	10000014
11008423	2021-03-16		1.5	10000928
11008428	2021-03-17		0.5	10000160
11008429	2021-03-17	白调查了，还是环境设定问题	1	10000784
11008431	2021-03-17		0.25	10000225
11008433	2021-03-17		0.5	10000817
11008430	2021-03-17		0.5	10000773
11008436	2021-03-17		0.5	10000808
11008432	2021-03-17		1.25	10000401
11008435	2021-03-17	VUP手顺	1.5	10000889
11008464	2021-03-19		3	10000445
11008437	2021-03-17		1	10000175
11008438	2021-03-17		0.5	10000287
11008434	2021-03-17		2.5	10000929
11008439	2021-03-18		0.25	10000481
11008440	2021-03-18		9	10000014
11008442	2021-03-18		0.5	10000471
11008465	2021-03-19		2	10000540
11008443	2021-03-18		0.5	10000183
11008446	2021-03-18		1	10000374
11008447	2021-03-18	面煮废了	0.5	10000909
11008448	2021-03-18		0.25	10000160
11008449	2021-03-18		0.25	10000035
11008444	2021-03-18		4	10000930
11008453	2021-03-19		1.5	10000773
11008466	2021-03-19		0.25	10000035
11008450	2021-03-18		0.5	10000789
11008457	2021-03-19		0.5	10000160
11008445	2021-03-18		4.5	10000929
11008441	2021-03-18		2.25	10000773
11008452	2021-03-19		8	10000014
11008470	2021-03-20		0.5	10000931
11008471	2021-03-20		8.75	10000014
11008472	2021-03-20		0.25	10000133
11008473	2021-03-20	走一走没坏处，我想到了好多关于人生的事情	1	10000361
11008474	2021-03-20	人生的定义，自我的定义，虚假和真实，他人的认知和自我的认知	0.5	10000265
11008475	2021-03-20		0.5	10000083
11008476	2021-03-20		0.25	10000932
11008477	2021-03-20		1.5	10000130
11008479	2021-03-20	汇率降低了，该早汇的	0.5	10000933
11008480	2021-03-20	购物，平时也该去超市逛一逛的	0.5	10000383
11008478	2021-03-20	找不到印章了	0.75	10000099
11008483	2021-03-20	披萨，蔬菜汁	0.5	10000160
11008484	2021-03-20		1	10000929
11008481	2021-03-20		2	10000278
11008469	2021-03-20		1	10000773
11008485	2021-03-20		3	10000540
11008486	2021-03-21		8.5	10000014
11008489	2021-03-21		0.25	10000160
11008490	2021-03-21		0.25	10000225
11008491	2021-03-21		0.5	10000287
11008492	2021-03-21		0.5	10000404
11008487	2021-03-21		1.5	10000773
11008494	2021-03-21		0.25	10000035
11008495	2021-03-21		0.5	10000909
11008493	2021-03-21		8	10000540
11008488	2021-03-21		2.25	10000445
11008496	2021-03-21		1.5	10000934
11008497	2021-03-22		0.5	10000401
11008498	2021-03-22		8	10000014
11008499	2021-03-22		2.5	10000935
11008500	2021-03-22		2	10000930
11008501	2021-03-22		1	10000481
11008503	2021-03-22	购物	0.25	10000383
11008504	2021-03-22		0.5	10000909
11008505	2021-03-22		0.25	10000523
11008506	2021-03-22	大哥发过来的老照片，果然已经过了好长的时间啊，还有，那个家庭已经破碎了。	0.5	10000936
11008509	2021-03-22		1	10000773
11008502	2021-03-22		3.5	10000934
11008510	2021-03-22		0.5	10000540
11008511	2021-03-22		1	10000175
11008508	2021-03-22		1.5	10000937
11008507	2021-03-22		1	10000445
11008513	2021-03-23		0.25	10000160
11008517	2021-03-23		0.5	10000225
11008519	2021-03-23		0.5	10000909
11008521	2021-03-23		0.5	10000481
11008512	2021-03-23	啊，原来是VS没装全	2	10000930
11008518	2021-03-23		1.5	10000374
11008516	2021-03-23		1	10000773
11008522	2021-03-23		1	10000938
11008515	2021-03-23		9.5	10000014
11008520	2021-03-23		4	10000934
11008514	2021-03-23		1.25	10000937
11008523	2021-03-24		8.5	10000014
11008524	2021-03-24		0.5	10000160
11008525	2021-03-24		0.5	10000079
11008529	2021-03-24		0.5	10000939
11008530	2021-03-24	找了N回，最后还是在包里	0.5	10000940
11008531	2021-03-24		0.5	10000404
11008528	2021-03-24		1.5	10000175
11008527	2021-03-24		1	10000773
11008533	2021-03-24		0.5	10000849
11008534	2021-03-24		0.5	10000661
11008535	2021-03-24		1	10000937
11008526	2021-03-24		5.5	10000934
11008532	2021-03-24		2	10000505
11008536	2021-03-24		0.5	10000310
11008537	2021-03-25	果然好烦哪	4	10000930
11008538	2021-03-25		1	10000374
11008539	2021-03-25		0.5	10000481
11008540	2021-03-25		0.5	10000384
11008541	2021-03-25		0.5	10000401
11008542	2021-03-25		9.5	10000014
11008544	2021-03-25		1	10000283
11008546	2021-03-25		0.5	10000773
11008548	2021-03-25		0.25	10000383
11008547	2021-03-25		0.25	10000225
11008549	2021-03-25		0.5	10000160
11008550	2021-03-25		0.25	10000035
11008551	2021-03-25		1	10000175
11008545	2021-03-25		2	10000245
11008576	2021-03-28		8	10000014
11008552	2021-03-25		1.25	10000941
11008543	2021-03-25		1.5	10000939
11008553	2021-03-25		0.5	10000942
11008554	2021-03-25		0.5	10000286
11008555	2021-03-26		3	10000930
11008557	2021-03-26		1.5	10000401
11008558	2021-03-26		0.5	10000160
11008559	2021-03-26		8	10000014
11008560	2021-03-26		1	10000849
11008561	2021-03-26		0.5	10000903
11008562	2021-03-26		1	10000943
11008563	2021-03-26		1.5	10000944
11008556	2021-03-26		1.5	10000808
11008577	2021-03-28		1	10000849
11008565	2021-03-26		0.5	10000821
11008564	2021-03-26		2.5	10000945
11008566	2021-03-26		1	10000773
11008568	2021-03-27		7	10000014
11008569	2021-03-27		5	10000461
11008570	2021-03-27		8	10000946
11008567	2021-03-27		0.25	10000160
11008571	2021-03-27	爬山那样的看不见终点的坚持，正是我需要的毅力。计划开始新的学习了。	1	10000352
11008572	2021-03-27		0.5	10000383
11008573	2021-03-27		0.25	10000035
11008574	2021-03-27		0.5	10000287
11008575	2021-03-27	继续充值啊，应该是最后一次了	1.5	10000773
11008580	2021-03-28	搞半天还是搞不明白	3	10000880
11008581	2021-03-28	浪费时间，还是Windows适合用来开发	1	10000301
11008582	2021-03-28		0.25	10000160
11008583	2021-03-28		1.5	10000051
11008584	2021-03-28		0.25	10000225
11008585	2021-03-28		1	10000445
11008586	2021-03-28		1	10000287
11008579	2021-03-28		2	10000818
11008578	2021-03-28		4	10000773
11008587	2021-03-28		1	10000947
11008588	2021-03-29		8	10000014
11008590	2021-03-29	编译好麻烦	4	10000930
11008591	2021-03-29		1	10000935
11008592	2021-03-29		1	10000897
11008593	2021-03-29		0.5	10000808
11008594	2021-03-29		1	10000286
11008595	2021-03-29		0.5	10000909
11008596	2021-03-29		0.25	10000225
11008597	2021-03-29		1	10000949
11008598	2021-03-29		0.25	10000943
11008600	2021-03-29		0.25	10000937
11008601	2021-03-29		0.25	10000035
11008589	2021-03-29		7	10000948
11008599	2021-03-29		2	10000773
11008603	2021-03-30		0.5	10000808
11008604	2021-03-30		0.5	10000935
11008605	2021-03-30		0.5	10000160
11008606	2021-03-30		6.5	10000014
11008607	2021-03-30		1	10000865
11008682	2021-04-04		1.5	10000959
11008610	2021-03-30		0.5	10000863
11008611	2021-03-30		1	10000383
11008685	2021-04-04		0.5	10000943
11008678	2021-04-04		1.5	10000773
11008612	2021-03-30		0.5	10000225
11008602	2021-03-30		3.5	10000930
11008686	2021-04-04		0.25	10000951
11008687	2021-04-04		0.25	10000035
11008614	2021-03-30		0.25	10000035
11008609	2021-03-30		0.75	10000773
11008615	2021-03-30		0.5	10000498
11008608	2021-03-30		5	10000948
11008613	2021-03-30		1.5	10000009
11008616	2021-03-31		3	10000930
11008617	2021-03-31		1.5	10000481
11008618	2021-03-31		0.5	10000808
11008619	2021-03-31		1	10000401
11008620	2021-03-31		0.25	10000160
11008621	2021-03-31		0.25	10000383
11008622	2021-03-31		0.25	10000035
11008623	2021-03-31		7.5	10000014
11008624	2021-03-31		1	10000948
11008625	2021-03-31		0.5	10000773
11008626	2021-03-31		0.75	10000225
11008627	2021-03-31		1	10000374
11008628	2021-03-31		0.5	10000079
11008629	2021-03-31		1.5	10000795
11008631	2021-03-31		1	10000849
11008630	2021-03-31		2	10000342
11008632	2021-04-01		7	10000014
11008635	2021-04-01		1	10000948
11008636	2021-04-01		1	10000950
11008633	2021-04-01	去早了，找不到路	3.5	10000254
11008639	2021-04-01		1	10000789
11008638	2021-04-01		5	10000342
11008634	2021-04-01		2.5	10000943
11008640	2021-04-01		0.5	10000225
11008641	2021-04-01		1	10000505
11008637	2021-04-01	原来罐头的拉环这么锋利，一下就划伤了，血流得我都怕了	1	10000951
11008642	2021-04-01		0.5	10000773
11008643	2021-04-01		0.5	10000307
11008644	2021-04-01	回头看看	2.5	10000079
11008645	2021-04-02	看了	4	10000930
11008646	2021-04-02		1	10000481
11008647	2021-04-02		1	10000808
11008648	2021-04-02		0.5	10000950
11008650	2021-04-02		0.25	10000035
11008652	2021-04-02		0.5	10000943
11008653	2021-04-02		1	10000773
11008654	2021-04-02		0.5	10000225
11008655	2021-04-02		1	10000952
11008657	2021-04-02		1	10000287
11008649	2021-04-02		0.75	10000160
11008651	2021-04-02		6.5	10000014
11008659	2021-04-02		0.5	10000849
11008658	2021-04-02		1	10000278
11008656	2021-04-02		3	10000953
11008660	2021-04-03		9	10000014
11008661	2021-04-03		1.5	10000953
11008663	2021-04-03		0.5	10000849
11008665	2021-04-03		0.5	10000954
11008666	2021-04-03		0.5	10000937
11008690	2021-04-04		0.25	10000798
11008664	2021-04-03		2	10000263
11008668	2021-04-03		1	10000956
11008669	2021-04-03		0.25	10000160
11008670	2021-04-03		0.25	10000035
11008667	2021-04-03		4	10000955
11008662	2021-04-03		1	10000773
11008671	2021-04-03		0.5	10000505
11008673	2021-04-03		0.5	10000287
11008674	2021-04-03		0.5	10000288
11008675	2021-04-03		0.5	10000278
11008672	2021-04-03		3	10000957
11008676	2021-04-04		0.5	10000958
11008680	2021-04-04		1.5	10000948
11008703	2021-04-05		1	10000822
11008681	2021-04-04		1.5	10000032
11008677	2021-04-04		8	10000014
11008679	2021-04-04		0.75	10000225
11008683	2021-04-04		1	10000960
11008684	2021-04-04		1	10000950
11008691	2021-04-04	玩不下去	0.5	10000218
11008692	2021-04-04		1.5	10000278
11008688	2021-04-04		1	10000961
11008693	2021-04-04		1.5	10000822
11008689	2021-04-04		1	10000849
11008694	2021-04-05		1	10000374
11008695	2021-04-05		6	10000014
11008697	2021-04-05		0.5	10000943
11008698	2021-04-05		0.5	10000948
11008700	2021-04-05	点多了，吃撑了	0.5	10000963
11008696	2021-04-05	这次才是真正的全面开始了解NSR机制，可是好像很难受，还没开始做事就难受，而随便把程序拷过去就能编译和使用，好像又不需要动了	4	10000962
11008704	2021-04-05		0.25	10000954
11008705	2021-04-05		1	10000828
11008702	2021-04-05		1.5	10000964
11008706	2021-04-05		0.5	10000965
11008707	2021-04-05		1.75	10000673
11008699	2021-04-05		1	10000773
11008701	2021-04-05		2	10000849
11008709	2021-04-06		0.25	10000160
11008710	2021-04-06		8.5	10000014
11008711	2021-04-06		0.5	10000773
11008713	2021-04-06		0.5	10000950
11008717	2021-04-06		0.5	10000494
11008715	2021-04-06		0.25	10000865
11008716	2021-04-06		0.5	10000808
11008718	2021-04-06		0.25	10000383
11008712	2021-04-06		5.5	10000673
11008708	2021-04-06		2.75	10000962
11008719	2021-04-06		1	10000852
11008714	2021-04-06		1.5	10000943
11008720	2021-04-06		1.5	10000966
11008721	2021-04-06		1	10000849
11008724	2021-04-07		0.5	10000950
11008725	2021-04-07		0.25	10000160
11008726	2021-04-07		0.25	10000035
11008727	2021-04-07		8	10000014
11008728	2021-04-07		1	10000943
11008730	2021-04-07		0.25	10000225
11008731	2021-04-07		2.5	10000175
11008723	2021-04-07		1	10000374
11008729	2021-04-07		1.5	10000773
11008732	2021-04-07		0.25	10000797
11008722	2021-04-07		2.5	10000962
11008733	2021-04-07		0.5	10000849
11008737	2021-04-08		1	10000930
11008738	2021-04-08		0.5	10000481
11008739	2021-04-08		0.5	10000401
11008742	2021-04-08		0.5	10000950
11008743	2021-04-08		1	10000948
11008736	2021-04-08		3	10000967
11008734	2021-04-08		8.5	10000014
11008744	2021-04-08		1	10000968
11008746	2021-04-08		0.5	10000849
11008740	2021-04-08		1	10000374
11008741	2021-04-08		2.5	10000808
11008745	2021-04-08		2	10000969
11008788	2021-04-11	这就干不下去了，还妄想成为写手	0.75	10000208
11008748	2021-04-08		0.25	10000160
11008749	2021-04-08		0.25	10000035
11008747	2021-04-08		1.5	10000970
11008735	2021-04-08		1.5	10000773
11008750	2021-04-08		1	10000971
11008755	2021-04-09		0.25	10000225
11008754	2021-04-09		1.5	10000349
11008791	2021-04-11		1	10000505
11008790	2021-04-11		1.5	10000970
11008779	2021-04-11		3.5	10000773
11008792	2021-04-12		3	10000968
11008758	2021-04-09		0.5	10000160
11008793	2021-04-12		1	10000808
11008757	2021-04-09	走一走，心情会很不同，现在想干点儿事情了，F,P,N	0.75	10000361
11008794	2021-04-12		1	10000401
11008795	2021-04-12		0.5	10000160
11008759	2021-04-09	剧情，只喜欢高潮部分啊，弑神一剑。	2	10000265
11008760	2021-04-09		0.25	10000858
11008761	2021-04-09		0.5	10000937
11008762	2021-04-09		1.5	10000175
11008751	2021-04-09		8.75	10000014
11008796	2021-04-12		0.25	10000035
11008763	2021-04-09		1.5	10000287
11008797	2021-04-12		7.5	10000014
11008756	2021-04-09		1	10000505
11008752	2021-04-09		5.5	10000773
11008753	2021-04-09		1	10000849
11008766	2021-04-10		0.5	10000821
11008767	2021-04-10		1	10000918
11008769	2021-04-10		2.5	10000958
11008770	2021-04-10	搞半天玩不明白，太失败了	1	10000972
11008772	2021-04-10		1	10000948
11008771	2021-04-10	奢侈了一顿，1500加1000带走	0.5	10000973
11008798	2021-04-12		5	10000971
11008800	2021-04-12		0.5	10000918
11008775	2021-04-10	本来想等早起会的，结果还是太困，算了	1	10000937
11008776	2021-04-10		1.5	10000287
11008777	2021-04-10		1.5	10000278
11008764	2021-04-10		8	10000014
11008773	2021-04-10	又想着重新写一下了，虽然还只是想着	3	10000208
11008765	2021-04-10		3	10000773
11008774	2021-04-10		1.5	10000175
11008778	2021-04-11		6	10000014
11008780	2021-04-11		0.5	10000918
11008781	2021-04-11		0.25	10000849
11008782	2021-04-11	暗夜光出英雄居然打不过	2.5	10000175
11008801	2021-04-12		1	10000374
11008783	2021-04-11		0.5	10000110
11008786	2021-04-11		0.5	10000361
11008787	2021-04-11		1	10000287
11008822	2021-04-14		0.25	10000808
11008789	2021-04-11		1	10000677
11008784	2021-04-11		1	10000160
11008823	2021-04-14		0.25	10000401
11008785	2021-04-11		3	10000971
11008824	2021-04-14	cH_IAC测试数据	2.5	10000384
11008802	2021-04-12		1.75	10000208
11008799	2021-04-12		2	10000773
11008804	2021-04-13		1	10000374
11008809	2021-04-13		0.5	10000918
11008810	2021-04-13		0.25	10000478
11008811	2021-04-13		0.25	10000927
11008812	2021-04-13		0.25	10000035
11008803	2021-04-13	BO，STD	4.5	10000968
11008805	2021-04-13		0.75	10000160
11008806	2021-04-13		8.5	10000014
11008813	2021-04-13	1v7的TD	1.5	10000175
11008814	2021-04-13	写得好慢好慢	2	10000208
11008815	2021-04-13		0.5	10000505
11008826	2021-04-14		0.5	10000968
11008819	2021-04-14		4	10000971
11008808	2021-04-13		1.5	10000773
11008807	2021-04-13		4	10000971
11008816	2021-04-14		0.5	10000481
11008817	2021-04-14		0.5	10000160
11008818	2021-04-14		6.5	10000014
11008821	2021-04-14		2.5	10000974
11008828	2021-04-14		0.25	10000035
11008827	2021-04-14		2	10000678
11008820	2021-04-14		2	10000773
11008830	2021-04-14		0.5	10000505
11008829	2021-04-14		2.5	10000208
11008835	2021-04-15		0.5	10000968
11008836	2021-04-15		1	10000374
11008831	2021-04-15		2	10000808
11008832	2021-04-15		6.25	10000014
11008841	2021-04-15		1.5	10000175
11008845	2021-04-15		0.5	10000975
11008840	2021-04-15		0.5	10000849
11008839	2021-04-15		1.5	10000930
11008833	2021-04-15		1.75	10000971
11008837	2021-04-15		1	10000401
11008842	2021-04-15		0.25	10000035
11008843	2021-04-15		0.5	10000287
11008844	2021-04-15		1	10000208
11008846	2021-04-15		0.5	10000505
11008838	2021-04-15		0.75	10000160
11008834	2021-04-15		2.5	10000773
11008847	2021-04-16		1	10000374
11008849	2021-04-16		9	10000014
11008852	2021-04-16		0.5	10000481
11008848	2021-04-16		1	10000808
11008851	2021-04-16		1	10000798
11008853	2021-04-16		3	10000384
11008854	2021-04-16		2	10000401
11008855	2021-04-16	Distribute	1	10000962
11008856	2021-04-16		0.5	10000051
11008857	2021-04-16		0.5	10000160
11008858	2021-04-16		2	10000287
11008920	2021-04-21		1	10000031
11008859	2021-04-16		0.5	10000821
11008915	2021-04-21		1	10000160
11008850	2021-04-16		2	10000773
11008860	2021-04-16		2	10000175
11008864	2021-04-17		1.5	10000334
11008866	2021-04-17		0.5	10000505
11008921	2021-04-21		0.25	10000463
11008861	2021-04-17		6.5	10000014
11008863	2021-04-17		3	10000175
11008868	2021-04-17		0.5	10000401
11008869	2021-04-17		0.5	10000160
11008867	2021-04-17		2	10000808
11008871	2021-04-17		1	10000287
11008862	2021-04-17		2	10000773
11008872	2021-04-17		0.25	10000461
11008865	2021-04-17		1.25	10000463
11008873	2021-04-17	现在没有心情做任何事，玩和学习，工作，都没有心情，这种时候该干什么呢	0.5	10000352
11008870	2021-04-17		1.5	10000971
11008874	2021-04-17		1	10000232
11008875	2021-04-18		10	10000014
11008878	2021-04-18		0.5	10000160
11008880	2021-04-18		1.5	10000977
11008881	2021-04-18	坐车	1	10000383
11008879	2021-04-18	结果他想让我陪他练日语	3	10000461
11008876	2021-04-18	滑水，鬼屋，电玩	3	10000976
11008882	2021-04-18		0.25	10000035
11008883	2021-04-18		0.75	10000773
11008884	2021-04-18		2.5	10000960
11008877	2021-04-18		1.5	10000971
11008885	2021-04-19		1.5	10000481
11008922	2021-04-21		1	10000773
11008886	2021-04-19		0.5	10000808
11008923	2021-04-21		0.5	10000798
11008892	2021-04-19		0.25	10000979
11008913	2021-04-21	好烦躁啊。不想搞std了	1.5	10000374
11008890	2021-04-19		8.25	10000014
11008924	2021-04-21		0.5	10000886
11008925	2021-04-21		0.25	10000035
11008926	2021-04-21		0.5	10000505
11008888	2021-04-19		2.25	10000968
11008889	2021-04-19		0.5	10000374
11008893	2021-04-19		0.5	10000935
11008927	2021-04-21		1	10000175
11008894	2021-04-19		0.5	10000160
11008928	2021-04-21		0.5	10000492
11008887	2021-04-19		2.75	10000978
11008896	2021-04-19		0.5	10000540
11008929	2021-04-21		1	10000398
11008891	2021-04-19		2	10000773
11008897	2021-04-19	也许对我来说，最有感觉的是“回去”。一直就说我是吃老本，老想着以前，或许真的就是那样怀旧的性格了。然而，又不能真的回去，因为一旦回去，就结束了。所以又需要往外跑，去哪里无所谓，只是要有回去的机会。就像虫师，为了偶尔能够休息，而去旅行。	1	10000980
11008895	2021-04-19		4	10000960
11008898	2021-04-20		3.5	10000978
11008899	2021-04-20		1	10000374
11008901	2021-04-20		0.5	10000808
11008902	2021-04-20		0.5	10000401
11008903	2021-04-20		0.5	10000160
11008904	2021-04-20		7.5	10000014
11008906	2021-04-20		0.5	10000962
11008907	2021-04-20		1	10000968
11008908	2021-04-20		0.5	10000888
11008909	2021-04-20		1	10000960
11008910	2021-04-20		0.5	10000440
11008911	2021-04-20		0.5	10000981
11008905	2021-04-20		2.5	10000773
11008900	2021-04-20	好多会	3	10000481
11008912	2021-04-21		5	10000978
11008914	2021-04-21		0.5	10000808
11008916	2021-04-21		8	10000014
11008917	2021-04-21		1	10000865
11008918	2021-04-21		0.5	10000897
11008919	2021-04-21		0.5	10000401
11008933	2021-04-22		1	10000982
11008930	2021-04-22		1.5	10000978
11008935	2021-04-22		0.5	10000865
11008938	2021-04-22		0.5	10000401
11008936	2021-04-22		0.25	10000935
11008939	2021-04-22		1	10000481
11008932	2021-04-22		7.5	10000014
11008942	2021-04-22		0.5	10000505
11008937	2021-04-22		0.5	10000897
11008943	2021-04-22		0.25	10000478
11008931	2021-04-22		1.5	10000374
11008934	2021-04-22		5	10000808
11008944	2021-04-22		1.5	10000398
11008941	2021-04-22		1	10000773
11008945	2021-04-22		0.25	10000035
11008940	2021-04-22		0.75	10000160
11008946	2021-04-22		0.5	10000676
11008949	2021-04-23		0.5	10000384
11008950	2021-04-23		2	10000854
11008951	2021-04-23		1	10000865
11008952	2021-04-23		1	10000808
11008953	2021-04-23		0.5	10000401
11008954	2021-04-23		0.5	10000287
11008955	2021-04-23		1	10000773
11008956	2021-04-23	买了重制版体验一下，还可以嘛	2.5	10000175
11008948	2021-04-23	开会打断别人话语很不礼貌，这一点上我还是没什么进步啊	1.5	10000481
11008957	2021-04-23		1	10000374
11008958	2021-04-23		0.5	10000160
11008959	2021-04-23		0.25	10000035
11008960	2021-04-23		7	10000014
11008961	2021-04-23		0.25	10000463
11008963	2021-04-23		0.5	10000264
11008964	2021-04-23		1	10000849
11008947	2021-04-23		1	10000968
11008962	2021-04-23		0.5	10000505
11008966	2021-04-24	去看病，结果还是去了新医院，而且貌似被新冠所以不能在正厅呆	2	10000436
11008967	2021-04-24		0.5	10000983
11008968	2021-04-24		1	10000175
11008969	2021-04-24		0.5	10000773
11008970	2021-04-24	魔兽，然后是我的通行证制作，虚拟游戏或者异世界的	0.5	10000797
11008971	2021-04-24		0.25	10000160
11008972	2021-04-24		0.25	10000035
11008973	2021-04-24		0.5	10000821
11008974	2021-04-24		1	10000505
11008965	2021-04-24		16.5	10000014
11008977	2021-04-25		1	10000672
11008978	2021-04-25		1	10000485
11008975	2021-04-25		11	10000014
11008980	2021-04-25		0.5	10000075
11008981	2021-04-25	协议	0.5	10000041
11008983	2021-04-25		0.5	10000383
11008984	2021-04-25		1.5	10000948
11008976	2021-04-25		1.5	10000773
11008985	2021-04-25		0.5	10000463
11008979	2021-04-25		3.5	10000175
11008986	2021-04-25		1.5	10000953
11008987	2021-04-25		0.25	10000035
11008982	2021-04-25		0.75	10000160
11008989	2021-04-26		0.25	10000481
11008991	2021-04-26	醒了好几次	10	10000014
11008993	2021-04-26		1	10000948
11008995	2021-04-26		2	10000374
11008996	2021-04-26		0.5	10000384
11008997	2021-04-26		0.5	10000463
11008998	2021-04-26		0.5	10000401
11008999	2021-04-26		0.5	10000984
11009000	2021-04-26		0.5	10000519
11009001	2021-04-25		0.5	10000519
11008988	2021-04-25		0.5	10000505
11008994	2021-04-26		3	10000968
11009002	2021-04-26		1.5	10000175
11008992	2021-04-26		1	10000773
11009003	2021-04-26		0.25	10000035
11008990	2021-04-26		1	10000160
11009004	2021-04-26		0.5	10000085
11009005	2021-04-26		0.5	10000985
11009006	2021-04-26		0.5	10000986
11009007	2021-04-26		0.5	10000814
11009008	2021-04-27		5	10000968
11009010	2021-04-27		1	10000401
11009011	2021-04-27		0.5	10000160
11009012	2021-04-27		8	10000014
11009015	2021-04-27		0.5	10000987
11009016	2021-04-27		0.5	10000988
11009017	2021-04-27		0.25	10000463
11009013	2021-04-27		0.75	10000773
11009014	2021-04-27		2	10000175
11009009	2021-04-27		3	10000374
11009018	2021-04-27		1	10000519
11009019	2021-04-27		0.25	10000035
11009020	2021-04-27		0.25	10000436
11009021	2021-04-27	project note restart.	1	10000019
11009022	2021-04-28		2	10000989
11009024	2021-04-28		8	10000014
11009025	2021-04-28		0.5	10000978
11009027	2021-04-28		0.5	10000481
11009029	2021-04-28		0.5	10000773
11009030	2021-04-28		0.5	10000935
11009068	2021-04-30		0.5	10000264
11009032	2021-04-28		0.5	10000990
11009033	2021-04-28		1	10000948
11009069	2021-04-30		0.5	10000273
11009034	2021-04-28		0.25	10000035
11009035	2021-04-28		0.25	10000287
11009036	2021-04-28		0.5	10000519
11009037	2021-04-28		0.25	10000175
11009026	2021-04-28		1.25	10000374
11009023	2021-04-28		2	10000384
11009031	2021-04-28		1	10000401
11009028	2021-04-28		0.75	10000160
11009038	2021-04-28		0.5	10000361
11009039	2021-04-28		0.25	10000236
11009040	2021-04-28		0.5	10000286
11009041	2021-04-28		2	10000404
11009043	2021-04-29		0.25	10000991
11009045	2021-04-29		0.25	10000463
11009070	2021-04-30		0.5	10000361
11009071	2021-04-30	联系闭眼走路，果然很怕，然而数着数往前走，将注意力转移到数数上，就没有那么怕了，能够走到比单纯害怕黑暗时更远，而且还偶然跨过了真的危险区域。人生或许也是这样吧，定了目标往前走，大部分的时候都是看不见未来的黑暗。	0.5	10000997
11009046	2021-04-29		1.25	10000814
11009047	2021-04-29		2.5	10000953
11009049	2021-04-29	想来想去，我也就是在给自己不结婚不带孩子找借口而已。不想制造比自由更重要的因缘。	0.5	10000352
11009048	2021-04-29	唱歌，走路，随想，结果就是，不锁定目标的话，并不可能有什么最想做的事情。	1	10000361
11009050	2021-04-29		0.25	10000992
11009052	2021-04-29		0.25	10000948
11009051	2021-04-29	一天一个画面，绝对够	1.5	10000286
11009053	2021-04-29		0.5	10000993
11009042	2021-04-29		12.5	10000014
11009054	2021-04-29		0.5	10000288
11009055	2021-04-29		0.5	10000937
11009056	2021-04-29		0.25	10000035
11009057	2021-04-29		0.25	10000160
11009058	2021-04-29		0.75	10000077
11009059	2021-04-29		0.25	10000519
11009044	2021-04-29		2.5	10000773
11009060	2021-04-29		0.25	10000849
11009062	2021-04-30	穿越异世界，成为女性，在经历各种事件之后邂逅异国王子，被求婚，但是对方出了个高得异常的嫁妆价格。形势所逼必须嫁过去的主角，无奈成为冒险者去挣嫁妆。类似怪物猎人的迷宫，又或者三国战记的敌人，反正努力战斗的主角好不容易挣到一半的金额。最后才知道那个金额是对方的聘礼，异世界错位的知识。	0.25	10000994
11009064	2021-04-30		0.25	10000995
11009065	2021-04-30		1	10000996
11009063	2021-04-30		1.75	10000773
11009084	2021-04-30		0.01	10001010
11009091	2021-04-30		0.01	10001017
11009088	2021-04-30		0.01	10001014
11009085	2021-04-30		0.01	10001011
11009072	2021-04-30		0.01	10000998
11009073	2021-04-30		0.01	10000999
11009076	2021-04-30		0.01	10001002
11009061	2021-04-30		8.75	10000014
11009067	2021-04-30		0.75	10000471
11009066	2021-04-30		0.75	10000492
11009095	2021-04-30		0.01	10001021
11009090	2021-04-30		0.01	10001016
11009086	2021-04-30		0.01	10001012
11009087	2021-04-30		0.01	10001013
11009093	2021-04-30		0.01	10001019
11009094	2021-04-30		0.01	10001020
11009097	2021-04-30		0.01	10001023
11009098	2021-04-30		0.01	10001024
11009089	2021-04-30		0.01	10001015
11009080	2021-04-30		0.01	10001006
11009083	2021-04-30		0.01	10001009
11009078	2021-04-30		0.01	10001004
11009081	2021-04-30		0.01	10001007
11009077	2021-04-30		0.01	10001003
11009082	2021-04-30		0.01	10001008
11009079	2021-04-30		0.01	10001005
11009074	2021-04-30		0.01	10001000
11009075	2021-04-30		0.01	10001001
11009099	2021-04-30		0.01	10001025
11009096	2021-04-30		0.01	10001022
11009092	2021-04-30		0.01	10001018
11009101	2021-04-30		0.5	10000355
11009102	2021-04-30		1	10001026
11009103	2021-04-30		0.5	10001027
11009104	2021-04-30		0.25	10000035
11009105	2021-04-30		0.5	10000519
11009100	2021-04-30		0.75	10000293
11009107	2021-04-30		0.25	10000278
11009109	2021-04-30		0.5	10000079
11009110	2021-04-30		0.25	10000287
11009108	2021-04-30		0.5	10000906
11009106	2021-04-30	顺手改了个bug	0.75	10000286
11009111	2021-05-01		12	10000014
11009113	2021-05-01		0.5	10000886
11009112	2021-05-01		1	10000821
11009115	2021-05-01		0.25	10000160
11009114	2021-05-01		1.75	10001028
11009116	2021-05-01		0.75	10001029
11009117	2021-05-01	海湾战争和改革开放	0.5	10001030
11009118	2021-05-01		0.25	10000891
11009120	2021-05-01		0.5	10000948
11009119	2021-05-01		1	10000963
11009121	2021-05-01		3	10000042
11009122	2021-05-01		1	10000287
11009123	2021-05-01		1	10000773
11009124	2021-05-01		1	10000175
11009125	2021-05-01		0.25	10000035
11009127	2021-05-02		0.25	10000503
11009149	2021-05-02		0.01	10001042
11009150	2021-05-02		0.01	10001043
11009128	2021-05-02	或许我真正想要的状态，是轻松地什么都尝试一下。然而现实总让我感到负担，责任是我讨厌、害怕的东西。我对自己的定位，就是对大局不重要但又有自己特点的配角，即便那是自己的人生，我也愿意当配角。	0.25	10000352
11009152	2021-05-02		0.01	10001045
11009129	2021-05-02		1.25	10000886
11009153	2021-05-02		0.01	10001046
11009132	2021-05-02		0.5	10001031
11009131	2021-05-02	■使用アプリ  Zoom(URL) https://us02web.zoom.us/j/3309092130?pwd=ZGVIS1FnVnh5Z1gvb2tTWU1nVjAzUT09 ■ミーティングID : 330 909 2130 ■パスワード : ut0731	2	10000381
11009133	2021-05-02	其实也是爱过情怀啊	0.25	10001030
11009154	2021-05-02		0.01	10001047
11009135	2021-05-02		0.5	10000963
11009136	2021-05-02	想半天，还是觉得太复杂，不能乱改	0.5	10000286
11009126	2021-05-02		5.25	10000014
11009138	2021-05-02		0.5	10000195
11009137	2021-05-02		0.75	10000287
11009134	2021-05-02		0.75	10000948
11009155	2021-05-02		0.01	10001048
11009157	2021-05-02		0.01	10001050
11009144	2021-05-02		0.01	10001037
11009143	2021-05-02		0.01	10001036
11009142	2021-05-02		0.01	10001035
11009146	2021-05-02		0.01	10001039
11009162	2021-05-02		0.01	10001055
11009158	2021-05-02		0.01	10001051
11009147	2021-05-02		0.01	10001040
11009159	2021-05-02		0.01	10001052
11009160	2021-05-02		0.01	10001053
11009161	2021-05-02		0.01	10001054
11009148	2021-05-02		0.01	10001041
11009145	2021-05-02		0.01	10001038
11009151	2021-05-02		0.01	10001044
11009156	2021-05-02		0.01	10001049
11009140	2021-05-02		0.01	10001033
11009141	2021-05-02		0.01	10001034
11009164	2021-05-02		0.01	10001057
11009163	2021-05-02		0.01	10001056
11009165	2021-05-02		0.75	10001058
11009167	2021-05-02		0.25	10000035
11009166	2021-05-02		1.75	10001059
11009168	2021-05-02		0.10000000000000001	10001060
11009169	2021-05-02		0.10000000000000001	10001061
11009130	2021-05-02		2.25	10000773
11009171	2021-05-02		0.25	10000160
11009170	2021-05-02		2	10000278
11009139	2021-05-02		4.5499999999999998	10001032
11009175	2021-05-03		0.25	10000463
11009176	2021-05-03		0.5	10000948
11009172	2021-05-03		10	10000014
11009174	2021-05-03		6.25	10001032
11009173	2021-05-03		2.25	10000773
11009190	2021-05-03		0.050000000000000003	10001075
11009193	2021-05-03		0.050000000000000003	10001078
11009192	2021-05-03		0.050000000000000003	10001077
11009178	2021-05-03		0.050000000000000003	10001063
11009198	2021-05-03		0.050000000000000003	10001083
11009180	2021-05-03		0.050000000000000003	10001065
11009201	2021-05-03		0.050000000000000003	10001086
11009189	2021-05-03		0.050000000000000003	10001074
11009196	2021-05-03		0.050000000000000003	10001081
11009179	2021-05-03		0.050000000000000003	10001064
11009195	2021-05-03		0.050000000000000003	10001080
11009191	2021-05-03		0.050000000000000003	10001076
11009177	2021-05-03		0.050000000000000003	10001062
11009188	2021-05-03		0.050000000000000003	10001073
11009181	2021-05-03		0.050000000000000003	10001066
11009184	2021-05-03		0.050000000000000003	10001069
11009199	2021-05-03		0.050000000000000003	10001084
11009187	2021-05-03		0.050000000000000003	10001072
11009186	2021-05-03		0.050000000000000003	10001071
11009204	2021-05-03		0.050000000000000003	10001089
11009194	2021-05-03		0.050000000000000003	10001079
11009197	2021-05-03		0.050000000000000003	10001082
11009182	2021-05-03		0.050000000000000003	10001067
11009205	2021-05-03		0.050000000000000003	10001090
11009203	2021-05-03		0.050000000000000003	10001088
11009202	2021-05-03		0.050000000000000003	10001087
11009185	2021-05-03		0.050000000000000003	10001070
11009183	2021-05-03		0.050000000000000003	10001068
11009200	2021-05-03		0.050000000000000003	10001085
11009206	2021-05-03		0.050000000000000003	10001091
11009207	2021-05-03		0.25	10001092
11009208	2021-05-03	漫画	0.5	10000828
11009210	2021-05-03		0.5	10001026
11009211	2021-05-03		0.25	10000035
11009209	2021-05-03		0.75	10000355
11009275	2021-05-08		0.25	10000363
11009247	2021-05-06		0.25	10000035
11009213	2021-05-04		2	10000175
11009248	2021-05-06		0.5	10000461
11009215	2021-05-04		0.5	10000160
11009214	2021-05-04		6.5	10001032
11009218	2021-05-04		0.25	10000471
11009219	2021-05-04		0.5	10001092
11009221	2021-05-04		0.5	10000963
11009222	2021-05-04		0.25	10000083
11009249	2021-05-06		0.25	10000463
11009250	2021-05-06		0.5	10000225
11009251	2021-05-06		0.5	10000401
11009224	2021-05-04	八孃回来，妈她们去九龙耍，果然还是谢光华、陆萍姐他们在照顾	0.25	10000288
11009252	2021-05-06	帮忙确定了问题	0.25	10000927
11009220	2021-05-04	考虑考虑，好像根本没有必要修改，只要把全部东西，都做成单一事件。重新构思，VUP，改动很大啊，关键没有心力去做，先做一点儿吧。	2.5	10000286
11009246	2021-05-06		2.25	10000130
11009225	2021-05-04		0.25	10000798
11009226	2021-05-04		0.25	10000035
11009223	2021-05-04		0.5	10000278
11009217	2021-05-04		1.5	10001093
11009253	2021-05-06	世界奇妙物语	1.5	10001096
11009212	2021-05-04		7.5	10000014
11009216	2021-05-04		1.75	10000773
11009227	2021-05-04		1.5	10001094
11009254	2021-05-06		0.5	10000948
11009230	2021-05-05		0.5	10000463
11009228	2021-05-05		10.5	10000014
11009234	2021-05-05		0.5	10000773
11009273	2021-05-07		1.25	10000773
11009233	2021-05-05	聊小说，看排行榜，分类	1	10000287
11009235	2021-05-05		0.5	10000963
11009236	2021-05-05		0.25	10000035
11009237	2021-05-05		0.75	10000937
11009231	2021-05-05		1.5	10000175
11009241	2021-05-06		1.5	10001094
11009238	2021-05-05		0.25	10000160
11009232	2021-05-05		7.25	10001094
11009239	2021-05-06		0.75	10000160
11009242	2021-05-06		0.25	10000773
11009244	2021-05-06		0.5	10000865
11009245	2021-05-06		0.5	10000935
11009243	2021-05-06		4.5	10001095
11009240	2021-05-06		7	10000014
11009257	2021-05-07		0.5	10001097
11009256	2021-05-07	睡不着，醒了睡，醒了睡	9.5	10000014
11009258	2021-05-07		1	10001098
11009260	2021-05-07		0.5	10000920
11009261	2021-05-07		0.5	10000863
11009262	2021-05-07		0.5	10000361
11009263	2021-05-07	整理migration手顺，还是漏掉了啊	1	10000401
11009264	2021-05-07	去警察局领回来，还坐过站了	0.5	10001099
11009265	2021-05-07	问了退房手续，下个月退房	0.5	10001100
11009266	2021-05-07		0.5	10000948
11009267	2021-05-07		0.5	10001101
11009255	2021-05-07		3	10001095
11009268	2021-05-07		1	10000374
11009269	2021-05-07		2	10000042
11009270	2021-05-07	还是跑了一趟去买洗发露，总记不住	0.5	10000035
11009271	2021-05-07	一起工作了一天，开会不太好	1.5	10001102
11009272	2021-05-07		0.5	10000944
11009274	2021-05-07		0.25	10000463
11009279	2021-05-08		0.25	10000225
11009278	2021-05-08	system好麻烦，没有权限	1.75	10000301
11009276	2021-05-08		9.5	10000014
11009280	2021-05-08		0.5	10000160
11009281	2021-05-08		0.75	10000948
11009286	2021-05-09		1	10000877
11009282	2021-05-08		0.25	10001103
11009283	2021-05-08		0.25	10001104
11009277	2021-05-08	浪费时间，在那弄macos	7.5	10000286
11009285	2021-05-08		0.25	10000035
11009284	2021-05-08		0.75	10000278
11009288	2021-05-09		0.5	10000821
11009294	2021-05-09		0.25	10001105
11009291	2021-05-09		0.25	10000075
11009292	2021-05-09		0.5	10000020
11009290	2021-05-09	死活睡不着，不睡了？	8	10000014
11009293	2021-05-09		1	10000293
11009295	2021-05-09		0.5	10000948
11009298	2021-05-09		1.5	10001107
11009289	2021-05-09		2.5	10000773
11009297	2021-05-09		3.75	10001101
11009296	2021-05-09	等了好久，果然不喜欢这样排队吃饭的	0.5	10001106
11009299	2013-08-22		0.10000000000000001	10001108
11009300	2013-10-30		0.10000000000000001	10001109
11009301	2000-08-01		0.10000000000000001	10001110
11009302	2000-08-01		0.10000000000000001	10001111
11009303	2000-08-28		0.10000000000000001	10001112
11009304	2000-08-28		0.10000000000000001	10001113
11009371	2021-05-14		7	10000014
11009307	2021-05-09		0.25	10000463
11009305	2021-05-09		0.5	10001114
11009306	2021-05-09	顺手还看了个星际争霸	0.75	10000888
11009308	2021-05-09		0.25	10000035
11009373	2021-05-14		0.5	10001097
11009309	2021-05-09		0.5	10000849
11009374	2021-05-14		0.5	10000935
11009287	2021-05-09		4	10000286
11009311	2021-05-10		7.5	10000014
11009314	2021-05-10		0.5	10000774
11009375	2021-05-14		0.5	10001122
11009315	2021-05-10		0.5	10000401
11009316	2021-05-10		1.5	10000935
11009317	2021-05-10		0.5	10000865
11009376	2021-05-14		0.5	10000962
11009377	2021-05-14		0.5	10000374
11009318	2021-05-10		0.25	10000035
11009313	2021-05-10		0.75	10000160
11009400	2021-05-15		1	10000505
11009378	2021-05-14		0.25	10001124
11009310	2021-05-10		3	10001107
11009312	2021-05-10		10.5	10001101
11009319	2021-05-11		1.5	10001107
11009322	2021-05-11		0.5	10001095
11009323	2021-05-11	发现Bug了，好失败，居然没搞对，还好没出错	2	10001115
11009324	2021-05-11		1	10000935
11009325	2021-05-11		0.5	10000401
11009327	2021-05-11		0.5	10001116
11009328	2021-05-11		0.5	10001117
11009329	2021-05-11		0.5	10001118
11009330	2021-05-11		0.5	10000882
11009380	2021-05-14		0.25	10001121
11009320	2021-05-11		7	10000014
11009381	2021-05-14		0.25	10000888
11009321	2021-05-11		4.5	10001101
11009332	2021-05-11		1	10000773
11009331	2021-05-11		4.5	10001119
11009333	2021-05-12		6	10000014
11009335	2021-05-12		0.5	10001116
11009336	2021-05-12		0.5	10001118
11009337	2021-05-12		1	10001115
11009340	2021-05-12		1	10000897
11009339	2021-05-12		1	10000935
11009343	2021-05-12		1	10000968
11009344	2021-05-12		0.5	10000875
11009369	2021-05-14	最后看来，只需要改10行，多加了100多行	1.75	10001115
11009334	2021-05-12		2.5	10001107
11009382	2021-05-14		1	10001125
11009346	2021-05-12		0.5	10001121
11009347	2021-05-12		0.25	10000035
11009342	2021-05-12		1.75	10000773
11009345	2021-05-12		1.5	10001120
11009348	2021-05-12		0.5	10000665
11009349	2021-05-12		0.5	10000463
11009385	2021-05-14		0.25	10001029
11009352	2021-05-13		6.5	10000014
11009354	2021-05-13		1	10001107
11009386	2021-05-14		0.25	10001127
11009356	2021-05-13		0.5	10001118
11009357	2021-05-13		0.5	10000935
11009358	2021-05-13		0.5	10000401
11009359	2021-05-13		0.5	10000865
11009355	2021-05-13		1.5	10000968
11009360	2021-05-13		0.5	10001122
11009364	2021-05-13		0.25	10000035
11009353	2021-05-13		1	10000160
11009379	2021-05-14		0.75	10000401
11009365	2021-05-13		0.5	10000463
11009366	2021-05-12		1.5	10000923
11009341	2021-05-12		2.5	10001119
11009384	2021-05-14		0.25	10001126
11009351	2021-05-13		1.5	10001115
11009361	2021-05-13		4.25	10001123
11009363	2021-05-13		0.75	10000773
11009362	2021-05-13		4.25	10000923
11009367	2021-05-14		0.5	10000808
11009368	2021-05-14		0.5	10000897
11009370	2021-05-14		1.5	10000968
11009388	2021-05-14		0.25	10000035
11009372	2021-05-14		0.75	10000160
11009389	2021-05-14		0.5	10001128
11009390	2021-05-14		0.5	10000287
11009410	2021-05-16		0.10000000000000001	10001134
11009401	2021-05-15		0.5	10000821
11009391	2021-05-14		2	10000175
11009383	2021-05-14		1.5	10000773
11009402	2021-05-15		0.25	10000225
11009387	2021-05-14		1	10000923
11009392	2021-05-15		10.5	10000014
11009394	2021-05-15		2.5	10000175
11009393	2021-05-15		5	10000923
11009396	2021-05-15		0.5	10000287
11009395	2021-05-15		1.5	10000773
11009397	2021-05-15		0.5	10000160
11009398	2021-05-15		0.25	10000035
11009411	2021-05-16		0.5	10001101
11009399	2021-05-15		1	10001129
11009403	2021-05-16		9.5	10000014
11009405	2021-05-16	开始忘记大学同学的名字了	0.5	10000352
11009406	2021-05-16		0.10000000000000001	10001130
11009407	2021-05-16		0.10000000000000001	10001131
11009408	2021-05-16		0.10000000000000001	10001132
11009409	2021-05-16		0.10000000000000001	10001133
11009413	2021-05-16		0.25	10000160
11009414	2021-05-16		0.5	10000293
11009415	2021-05-16		0.5	10000888
11009412	2021-05-16	放弃了，好像不好改，没有明确的目标了，又觉得无所谓了。	2.5	10000286
11009418	2021-05-16		5	10000175
11009420	2021-05-16		0.25	10000035
11009421	2021-05-16		0.25	10000225
11009419	2021-05-16	不成功，怎么都跑不进去	1.5	10001125
11009417	2021-05-16		1	10000505
11009416	2021-05-16		2.75	10000773
11009425	2021-05-17		0.5	10000160
11009423	2021-05-17	src提交	3	10000968
11009424	2021-05-17		3.5	10001127
11009422	2021-05-17	睡不着，睡不醒	6.25	10000014
11009426	2021-05-17		0.5	10001135
11009427	2021-05-17	等下次再现，明年5月10号，我估计不在了	0.25	10001123
11009429	2021-05-17		0.5	10000374
11009428	2021-05-17		1	10000401
11009430	2021-05-17		0.25	10001136
11009431	2021-05-17		0.5	10001137
11009433	2021-05-17		1.5	10000773
11009434	2021-05-17	拼多多	0.5	10000287
11009435	2021-05-17		0.25	10000035
11009432	2021-05-17		3	10000175
11009436	2021-05-17		0.5	10000918
11009437	2021-05-17		0.5	10000042
11009438	2021-05-17		0.25	10001138
11009439	2021-05-17		0.25	10001101
11009440	2021-05-18		0.5	10001115
11009443	2021-05-18		0.25	10000160
11009442	2021-05-18		7.75	10000014
11009441	2021-05-18	gaobuding	2.5	10001127
11009444	2021-05-18		0.5	10001116
11009447	2021-05-18		0.5	10000897
11009448	2021-05-18		0.5	10000935
11009449	2021-05-18	又他妈是旧版本没问题	1	10001139
11009497	2021-05-20		3	10000042
11009445	2021-05-18		1	10000401
11009446	2021-05-18	总算把src提交了，之后就是个别对应了吧	2.5	10000968
11009498	2021-05-21		0.25	10001145
11009451	2021-05-18		0.5	10001135
11009452	2021-05-18		1	10000773
11009499	2021-05-21		0.5	10001097
11009450	2021-05-18		6	10000042
11009456	2021-05-19		0.25	10001124
11009458	2021-05-19	Summitユーザ以外、実際のユーザで権限確認	0.25	10001141
11009459	2021-05-19		0.5	10000897
11009460	2021-05-19		0.5	10000808
11009461	2021-05-19		0.5	10000401
11009462	2021-05-19		0.25	10001126
11009463	2021-05-19		0.25	10001137
11009501	2021-05-21		0.5	10000808
11009464	2021-05-19		0.5	10001142
11009465	2021-05-19		0.5	10001143
11009502	2021-05-21		0.25	10001144
11009467	2021-05-19		0.25	10001101
11009457	2021-05-19	靠，不止这一个问题	1.5	10001140
11009468	2021-05-19		0.5	10001029
11009469	2021-05-19		0.5	10000374
11009470	2021-05-19		0.5	10000865
11009471	2021-05-19		0.5	10001116
11009454	2021-05-19		2.5	10001136
11009455	2021-05-19		9.25	10000014
11009466	2021-05-19		0.75	10000160
11009504	2021-05-21		6.5	10000014
11009472	2021-05-19		0.5	10000287
11009506	2021-05-21		0.25	10001101
11009475	2021-05-19		0.25	10000225
11009476	2021-05-19		0.25	10000035
11009473	2021-05-19		2	10000923
11009477	2021-05-19		0.25	10000042
11009453	2021-05-19	说是不想玩了，还是在继续	1.5	10000773
11009479	2021-05-20		1	10001029
11009480	2021-05-20		0.5	10001127
11009483	2021-05-20		0.25	10000035
11009484	2021-05-20		0.5	10000982
11009485	2021-05-20		0.5	10000897
11009486	2021-05-20		0.5	10000808
11009488	2021-05-20		0.5	10001142
11009490	2021-05-20		0.5	10000777
11009492	2021-05-20		0.25	10000287
11009491	2021-05-20	跟大二爷说话，就觉得总有路走，回家吧。	0.5	10001050
11009493	2021-05-20	模拟高考，其他年级放假	0.25	10000278
11009494	2021-05-20		0.75	10000773
11009481	2021-05-20	确认手顺	1	10001136
11009487	2021-05-20		1	10000401
11009482	2021-05-20	结果还是环境问题，不知道为什么debug版不行	4	10001140
11009495	2021-05-20		1	10000374
11009478	2021-05-20		7	10000014
11009496	2021-05-20		0.25	10001144
11009516	2021-05-22		0.75	10000160
11009489	2021-05-20		0.75	10000160
11009500	2021-05-21		0.75	10000865
11009509	2021-05-21		1	10000773
11009510	2021-05-21		0.5	10000287
11009511	2021-05-21		0.25	10000035
11009525	2021-05-23		1.25	10000773
11009505	2021-05-21		0.75	10000160
11009508	2021-05-21	不知道干了啥，反正时间耗掉了	1	10000374
11009503	2021-05-21	确定release版没问题，用了一上午	3	10001140
11009519	2021-05-22		0.25	10000278
11009507	2021-05-21		8.5	10000042
11009520	2021-05-22		0.25	10000287
11009514	2021-05-22	为了参加一下，又绵到早上了	0.25	10000020
11009517	2021-05-22		1.5	10000773
11009521	2021-05-23		8	10000014
11009513	2021-05-22		10	10000042
11009526	2021-05-23		0.5	10000175
11009515	2021-05-22		9.5	10000014
11009518	2021-05-22	袁隆平院士逝世。半年前还在继续研究的袁老爷子突然逝世，真的好突然。国士无双，现代最适合这个称号的人物离世了。跟大哥聊，他还在校庆上见过，西农校友。跟肖体松聊，他们也应该会在学校遇到相关话题吧。	1	10001146
11009523	2021-05-23		0.25	10000035
11009524	2021-05-23		0.25	10000160
11009528	2021-05-24		0.25	10000264
11009527	2021-05-23		0.25	10000225
11009522	2021-05-23		12	10000042
11009529	2021-05-24		0.25	10000225
11009530	2021-05-24		2	10000821
11009535	2021-05-24		0.5	10000160
11009533	2021-05-24		1	10000401
11009540	2021-05-24		2.75	10000175
11009537	2021-05-24		0.25	10000035
11009534	2021-05-24		4	10001147
11009531	2021-05-24	又重来一遍，浪费时间	4	10001127
11009532	2021-05-24		7	10000014
11009539	2021-05-24		1	10000505
11009536	2021-05-24		2	10000374
11009542	2021-05-25		0.5	10001127
11009543	2021-05-25		8	10000014
11009544	2021-05-25		0.5	10000865
11009546	2021-05-25		0.5	10000160
11009547	2021-05-25		0.25	10000886
11009548	2021-05-25		0.25	10000773
11009616	2021-05-28	这种剧情也可以创作一个我喜欢的故事吧	0.5	10001163
11009545	2021-05-25		0.5	10001148
11009550	2021-05-25		0.5	10000935
11009551	2021-05-25		0.5	10001150
11009552	2021-05-25		0.5	10000401
11009617	2021-05-28		0.25	10001155
11009553	2021-05-25		0.5	10001151
11009554	2021-05-25		0.25	10000225
11009555	2021-05-25		1.5	10001152
11009556	2021-05-25		0.5	10000896
11009541	2021-05-25		3	10001029
11009558	2021-05-25		2	10001153
11009559	2021-05-25		0.5	10000374
11009560	2021-05-25		0.25	10000035
11009557	2021-05-25		1	10000891
11009561	2021-05-25		1.75	10000286
11009549	2021-05-25	转生异界的理由，校车坠崖，被同车的神救了。	0.5	10001149
11009563	2021-05-25		0.25	10001154
11009564	2021-05-26		0.25	10000543
11009613	2021-05-28		2.5	10001119
11009566	2021-05-26		0.5	10001029
11009567	2021-05-26		0.5	10001115
11009565	2021-05-26	睡得好爽啊	8	10000014
11009568	2021-05-26		0.5	10001116
11009569	2021-05-26		0.5	10001118
11009571	2021-05-26		0.5	10000374
11009618	2021-05-28		0.5	10000821
11009573	2021-05-26		0.5	10000865
11009574	2021-05-26		0.5	10001148
11009575	2021-05-26		0.5	10000984
11009570	2021-05-26		1	10000160
11009619	2021-05-28		1	10000175
11009576	2021-05-26		0.25	10000035
11009572	2021-05-26		6	10001125
11009562	2021-05-26		1	10001154
11009578	2021-05-26		1	10001155
11009621	2021-05-29		0.25	10000363
11009579	2021-05-26		0.25	10000463
11009580	2021-05-26		0.5	10000891
11009577	2021-05-26		2	10000175
11009581	2021-05-26		0.25	10000264
11009583	2021-05-27		7.5	10000014
11009584	2021-05-27		0.5	10000160
11009585	2021-05-27		0.5	10000982
11009587	2021-05-27		0.5	10000808
11009582	2021-05-27	执行方法明白了，测试都要好久	6.5	10001125
11009588	2021-05-27	还差一个悬案	2	10001156
11009589	2021-05-27		0.25	10000035
11009586	2021-05-27		1	10000401
11009590	2021-05-27	问一下段波怎么解决的	0.5	10001157
11009592	2021-05-27	加班理由	0.5	10000898
11009593	2021-05-27		0.5	10001154
11009594	2021-05-27		0.25	10000463
11009596	2021-05-27		0.25	10000773
11009595	2021-05-27		2.75	10000286
11009598	2021-05-28	悬案登陆	0.25	10001156
11009601	2021-05-28	考虑打钱回国，日元汇率一路降，该早点儿打的	0.25	10000236
11009602	2021-05-28		0.25	10001154
11009597	2021-05-28		7.75	10000014
11009603	2021-05-28		0.75	10001097
11009599	2021-05-28		2.25	10001145
11009626	2021-05-29		0.25	10001166
11009605	2021-05-28		1.75	10001160
11009606	2021-05-28		0.5	10001161
11009607	2021-05-28		0.5	10000401
11009623	2021-05-29		1	10001164
11009624	2021-05-29		1	10001165
11009604	2021-05-28	靠，没注意环境以为我dll错了，吓了一跳。只搭建了一个MSIM。	2.5	10001159
11009608	2021-05-28		0.75	10000798
11009609	2021-05-28		0.5	10001162
11009610	2021-05-28		0.5	10001029
11009611	2021-05-28		0.5	10000374
11009600	2021-05-28		0.75	10000160
11009614	2021-05-28		0.25	10000035
11009612	2021-05-28	聊疫情，汇率，动漫灵笼，大师兄	1	10000287
11009615	2021-05-28	人物还可以增加好感度设置-_-!	0.25	10000286
11009627	2021-05-29		0.75	10000225
11009628	2021-05-29		0.25	10000821
11009630	2021-05-29		0.25	10001168
11009629	2021-05-29		0.75	10001167
11009634	2021-05-29		0.5	10000160
11009677	2021-05-31	调查出错了，memset的问题	1.5	10001160
11009678	2021-05-31		1	10001185
11009636	2021-05-29		0.25	10000773
11009680	2021-05-31		0.25	10001059
11009681	2021-05-31		0.25	10000773
11009682	2021-05-31		0.5	10000175
11009622	2021-05-29		0.75	10000180
11009633	2021-05-29	切换用户好麻烦	1.5	10000286
11009637	2021-05-29		0.25	10000035
11009620	2021-05-29		11	10000014
11009625	2021-05-29		2.25	10000175
11009635	2021-05-29		2.25	10001154
11009638	2021-05-29		0.25	10000798
11009640	2021-05-30		0.25	10001169
11009642	2021-05-30		0.25	10001171
11009683	2021-05-31		0.25	10000035
11009643	2021-05-30		0.25	10000020
11009639	2021-05-30	录入	1.25	10000265
11009641	2021-05-30	我的内容去哪了，居然只剩章节名了	0.5	10001170
11009645	2021-05-30		0.25	10000616
11009646	2021-05-30		0.25	10000130
11009671	2021-05-31		7	10000211
11009647	2021-05-30		0.25	10001102
11009648	2021-05-30		0.25	10000891
11009649	2021-05-30	历史照片-开国元勋们的脏衣服和笑脸	0.25	10001172
11009650	2021-05-30		0.25	10001154
11009651	2021-05-30		0.5	10001173
11009653	2021-05-30	好他妈难	0.5	10001174
11009654	2021-05-30	还是有很多游戏可以玩的，只是我没去看没去找而已。主动做事才能有更多的收获，被动接受的当然都不是那么符合自己价值观的东西。	0.5	10000144
11009655	2021-05-30		0.5	10001175
11009656	2021-05-30		0.5	10001176
11009657	2021-05-30		0.25	10001177
11009644	2021-05-30		6.75	10000014
11009700	2021-06-02		6.5	10000014
11009659	2021-05-30		0.25	10001178
11009660	2021-05-30	好他妈难	0.75	10001179
11009701	2021-06-02		0.75	10000160
11009662	2021-05-30		0.25	10000160
11009686	2021-06-01		0.5	10000401
11009652	2021-05-30		1	10000225
11009661	2021-05-30		1.5	10001180
11009689	2021-06-01		1	10001160
11009663	2021-05-30		1	10000175
11009664	2021-05-30		0.25	10000035
11009665	2021-05-30		0.25	10000773
11009690	2021-06-01		1.25	10001186
11009667	2021-05-30		0.25	10001155
11009691	2021-06-01	入组，不过好像他很闲	0.5	10001187
11009658	2021-05-30		3.5	10000211
11009669	2021-05-31		0.5	10001181
11009670	2021-05-31		1	10001182
11009673	2021-05-31		0.25	10000401
11009692	2021-06-01		1	10001188
11009672	2021-05-31		0.75	10000963
11009674	2021-05-31		0.5	10001183
11009668	2021-05-31		8	10000014
11009675	2021-05-31		0.5	10000374
11009697	2021-06-01	煮面，鸡蛋菘菜小面	0.5	10000160
11009676	2021-05-31		2	10001184
11009679	2021-05-31		0.25	10000160
11009688	2021-06-01		1.5	10001183
11009685	2021-06-01	睡不着，通宵了啊	6.5	10000014
11009693	2021-06-01		0.25	10001189
11009687	2021-06-01		1	10001148
11009684	2021-06-01		7.5	10000211
11009694	2021-06-01		0.5	10001180
11009695	2021-06-01		0.25	10001155
11009696	2021-06-01		0.25	10000035
11009698	2021-06-01		1	10000374
11009703	2021-06-02		0.5	10000401
11009707	2021-06-02		0.25	10000773
11009699	2021-06-01		1	10000505
11009708	2021-06-02		0.25	10000035
11009704	2021-06-02		1	10001190
11009702	2021-06-02		3.5	10001148
11009705	2021-06-02		1.5	10001191
11009706	2021-06-02		10.25	10000211
11009709	2021-06-02		0.5	10001192
11009710	2021-06-02		1	10000374
11009712	2021-06-03		5.25	10000014
11009714	2021-06-03		0.5	10000982
11009715	2021-06-03		0.5	10000401
11009713	2021-06-03		1	10001136
11009722	2021-06-03		0.25	10000773
11009718	2021-06-03		0.25	10000896
11009717	2021-06-03		1	10001186
11009720	2021-06-03		0.25	10000035
11009711	2021-06-03		1.5	10001160
11009716	2021-06-03		3	10001187
11009721	2021-06-03		0.5	10000160
11009723	2021-06-04		0.25	10000401
11009719	2021-06-03		9	10000211
11009727	2021-06-04		0.5	10000160
11009729	2021-06-04		0.25	10001118
11009724	2021-06-04		1	10001187
11009725	2021-06-04		8.5	10000014
11009726	2021-06-04		3.5	10000211
11009730	2021-06-04		0.5	10001155
11009732	2021-06-04		0.25	10000463
11009728	2021-06-04		2.25	10001186
11009733	2021-06-04		0.5	10000888
11009735	2021-06-04		0.25	10000035
11009736	2021-06-04		0.25	10000773
11009731	2021-06-04		2	10000175
11009734	2021-06-04		4	10000219
11009737	2021-06-05		6.5	10000014
11009738	2021-06-05		2	10001144
11009739	2021-06-05		1	10001193
11009741	2021-06-05		0.25	10000401
11009742	2021-06-05		0.25	10001140
11009740	2021-06-05		2.5	10000219
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: xiao
--

COPY public.person (id, address, category, input_date, memo, name, name2, name3, status) FROM stdin;
21000001	18623332478	Family	2019-10-19	兄弟，最亲近而相似的，然而，我总需要独立了吧。	肖智华	大哥		Close
21000002		Family	2019-10-19		谢显容	妈		Close
21000003	13500306378	Family	2019-10-19		肖坤科	爸		Close
21000004	微信	Family	2019-10-19		肖体松	弟弟		Close
21000005	1**78788192	Family	2019-10-19		蒋禄红	姐姐		Close
21000006		Family	2019-10-19		萧皓然	侄儿		Close
21000007		Family	2019-10-19		蔡天玉	婆婆		Close
21000022		青年部	2019-12-02		岡南佑樹	部長		Far
21000023		青年部	2019-12-02	最初の練成会。私を青年部に繋げた人。\n	室井一起			Close
21000024		青年部	2019-12-02	笑顔と錬成の掛け声、最初の錬成のサブリーダー。	江連孝文			Close
21000025		青年部	2019-12-02	ずっと年下なのに、全く敵わないリーダー。\n	石原勲武	学生部長		Close
21000026		青年部	2019-12-02	仕事も青年部行事も、しっかりやっている人で、年下と全く見えない。	星克成			Close
21000027		青年部	2019-12-02	一番世話になった人。	栗原大樹	本部職員		Close
21000028		青年部	2019-12-02	色々相談できて、真面目で優しい。	加藤大輝			Close
21000029		青年部	2019-12-02	真面目な教師ですが、サバイバルなどいろいろ挑戦した。\n	志賀洸介			Close
21000030		青年部	2019-12-02	プログラマーの先輩で、最初に声を掛けてもらいました。	山下一成			Close
21000031		Elife	2019-12-04	算是给我机会来日本的恩人呢,可惜待人处事不是很圆滑,开公司太艰难了.\n	桑辉	社长		Far
21000032		Elife	2019-12-04	虽然性格上不能说喜欢,但那两年确实有许多事情都是她帮我办的,所以挺纠结的,到底算不算自己人呢?	金莎	业务		Far
21000033		Elife	2019-12-04	第一个室友,一起带了大半年.待机太长,走了.	童力	室友		Far
21000034		Elife	2019-12-04	一起呆了半年吧,现在还有联系的,或许是唯一一个算朋友的人.	杨罡	室友		Far
21000035		Elife	2019-12-04	第三任室友?	王乃鹏	室友		Far
21000036		Elife	2019-12-04	96年的了,开始感觉自己年龄大了.	赫飞龙	室友		Far
21000037		Elife	2019-12-04	很会做菜,很会生活.感觉他们俩.	李致国	室友		Far
21000038		Elife	2019-12-05		刘辉			Far
21000039		Elife	2019-12-05	我还算教过他一点儿吧？	余志力			Miss
21000040		Elife	2019-12-05	金姐走后很多事情就是她负责了，跟我基本同龄，算是朋友吧。	张立欣	业务		Miss
21000041		Elife	2019-12-05	住在高岛平，电车上还能见到。跟宋夫人一起过年包饺子，玩狼人杀。	宋兆庆			Far
21000042		Elife	2019-12-05	我去机场接的，本以为是后辈，结果比我大。没相处几天就搬走了。	刘扬			Far
21000043		Elife	2019-12-05	真的没有印象了，或许一起在公司学习过。	陈静			Far
21000044		Elife	2019-12-05	我去机场接的女生，住附近，还一起去横田家吃过火锅。后来离职自己去找了工作，比桑san给的好。没联系了。	张淼			Far
21000045		Elife	2019-12-05	性格外向，算是聊过吧。再不记下来，真要连名字都忘了。	刘恋			Far
21000046		SJI	2019-12-05	带我去现场的人，可是比我们晚到，感觉基本也没得到什么帮助。	张海成	UTS社长		Far
21000047		SJI	2019-12-05	一起进现场的，张san找的人，比我大3岁，听说要回国。估计已经回了。很稳重的一个人，女朋友很漂亮，两人再上一个现场认识的。	高瑞			Far
21000048		SJI	2019-12-05	現場責任者、技術担当。	丸山さん	EXEO責任者		Far
21000049		SJI	2019-12-05	上のグループリーダー。私たちをからかって楽しんでいた。でも私が現場から追いだされる時、引き留めることをしてくれた。	江口さん	SJI責任者		Far
21000050		SJI	2019-12-05	现场受到他的照顾最多,也教了我一些日本的规则.后来很长时间都会在微信运动里给赞.朝鲜族,中日韩三国语言都在用.\n	金时哲			Far
21000051		高岛平会场	2019-12-05	2016年6月22日で出会った、朝起会の頒布で。これほど面倒をみてくれた人だから、恩返しをするのが、帰って難しいと感じました。	羽柴直子	お世話係		Close
21000052		高岛平会场	2019-12-05	日本語も、日本文化も、いろいろ教えてくれました。	中地和彦	壮年リーダー		Close
21000053		高岛平会场	2019-12-05		四戸ゆうこ	会場責任者		Close
21000054	电话	初中	2019-12-07	初中同学，我自己认为的五人众。教我日语，三年后游戏水平还在我之上。	龙浩			Close
21000055		初中	2019-12-07	初中五人众，喜欢画画，最初的同桌。学习也很好。	吴亚	乌鸦		Close
21000056		初中	2019-12-07	初中五人众，眼镜，学习跟我差不多，前几名，特别是语文好。住校。	罗希			Close
21000057		初中	2019-12-07	初中五人众中接触最少的一个，性格开朗。\n	张杨	张扬		Close
21000058		初中	2019-12-07	第一学期的班主任，小学同学苏丽拉的妈妈。给过我鼓励吧，初一上期中考试考得太差，被请了家长好像。期末考试考年级第一，还得了她留的奖励，巴黎圣母院，真心看不进去的书。只一学期就调走了。	燕丽琼	班主任-语文老师		Close
21000059		初中	2019-12-07	很照顾我的班主任，数学竞赛迟到了，都给了我复试的机会。两年半的班主任，我当数学课代表的时间好像也不短，具体不记得了。	溪容梅	班主任-数学老师		Close
21000060		初中	2019-12-07	班上最漂亮的女生，暗恋对象啊。选位置的时候专门挑的对方旁边，第三排的好位置，虽然假装是跟罗希坐一起。可惜后来眼睛实在看不到了，还是坐到第一排去了。	姜晓涵			Close
21000061		思辨	2019-12-08	面试的时候写了个题我没做出来，尴尬。算是靠关系进去的。\n真说起来的话，是我最对不起的一个老板了。什么正事没干，四个月实习期过了就跑了，真不好意思。关键是后来还后悔了。	干劲	老板		Far
21000062		思辨	2019-12-08	招聘时候面试，后来也一起吃饭，调节公司气氛，算是帮过我一些忙吧。记得他经常走得晚，后来我晚上呆公司的时候，也得等他走了才开游戏。没办法，家里得网太差，玩不了英雄联盟。\n	刘勇	人事		Far
21000063		思辨	2019-12-08	真不记得名字了，白头发最有特征，近视眼却不带眼镜，确实不知道为什么。公司技术负责人，但当时主要在做前台，作为后台的我真不知道该不该去问问题。	赵白	技术负责人		Far
21000064		Family	2020-07-10		肖乾富	公公		Close
21000087		Neso	2020-07-21		陈琛			
21000089		Neso	2020-08-16		汪明立	Neso社长		
21000070	微信 天津 	大学	2020-04-30	大学里实质上相处时间最多，最和善的室友。有女朋友的人，最后还是开始跟我们玩游戏。	王国泉	室友		Finished
21000075	微信 辽宁本溪	大学	2020-04-09	毕业后也“留校”的三人，一个出租屋住了接近一年半，算起来比大学里边相处的时间还长了。\r\n也是唯一一个我留意他去处的人，最后还是回家了，照顾老娘，不知道未来会怎么样。	郭志南	室友		Current
21000091	微信	大学	2020-08-23	不得不说的大学同学，自动化的裴浩，也是我所相处的人里唯一一个主张阶级斗争的人。不知道跟他的讨论到底有没有意义，不过我大概是跟他说话说得最多的同学了吧。我觉得我们算是一对，他需要一个斗争对象，我需要一个关注我的人。而且我大学里的生活模式，也有一部分是因为他形成的吧，既跟对面317一起玩耍，又始终保持一定的距离，没进入沉溺游戏模式的一大原因。	裴浩	室友		Finished
21000074		Family	2019-12-29		肖舒妤	侄女		Finished
21000071		Neso	2019-10-16		王文航	业务		
21000090		Neso	2020-08-20		冯天鸿			
21000096		新日铁	2020-10-09	新入组员	劉丹奇			
21000082		新日铁	2019-12-19		段波			
21000086		Elife	2020-05-28		翟杰			
21000084		Neso	2020-01-25		张py			
21000101		新日铁	2021-03-03		曹瑞			
21000097		新日铁	2020-12-16	给他讲怎么搭建summit环境	刘丹奇			
21000100		新日铁	2021-02-08		任琼			
21000102		新日铁	2021-03-03		李勝鵬			
21000073		青年部	2019-12-22		社頭来喜			
21000081		新日铁	2020-03-05		板仓新			
21000085		Neso	2020-02-13		田云峰			
21000094		新日铁	2020-08-25		有津　拓			
21000068		青年部	2019-12-22		小倉さん			
21000069		青年部	2019-12-22		尾山たけし			
21000083		Neso	2020-03-11		周san			
21000095		东京	2020-08-29		王慧敏			
21000098		东京	2021-01-25		吴冠宇			
21000072		东京	2020-06-08		田Tina			
21000099		东京	2021-01-25		王-omo			
21000088		Fantasy	2020-05-11		周恩来			
21000103	 <kobayashi.masaaki.f27@jp.nssol.nipponsteel.com>	新日铁	2021-03-03		小林 正明			
21000104		Neso	2021-03-03		陳 陽			
21000105		新日铁	2021-03-03		石松 俊文			
21000106		新日铁	2021-03-03		五十嵐 克成			
21000107		新日铁	2021-03-03		日向 尋久	hyuga.hirohisa		Finished
21000109		Neso	2021-03-16		陈阳			
21000108		Neso	2021-03-15		王亮			
21000110		Neso	2021-03-22		赖兴涛			
21000114		父系	2021-04-30		邓清丽	邓阿姨		
21000112		Neso	2021-04-26		徐超			
21000113		新日铁	2021-04-28		高水駿典			
21000065		母系	2019-12-29		卢俊希			
21000133		八孃家	2021-04-30	跟女儿一起出国，一起去沿海城市，常年不在。15年回来玩过一趟，21年第二趟回永川。	谢八孃	八孃		Finished
21000111		新日铁	2021-04-22		石松俊文			
21000171		小学	2021-05-03	最初认识的同学，同一条路回家，现在是光英姐那边的亲戚。	李梦都			Finished
21000172		小学	2021-05-03	一起打乒乓，踢球的朋友，跟李梦都一样直到三年级	刘航			Finished
21000173		小学	2021-05-03	踢球同学，忘记名字了，初中时候找过我作弊	曹华（不确定）			Finished
21000174		小学	2021-05-03	二年级转学过来的，小学最后唯一一个朋友，还送了我一个毕业礼物，已经没有联系方式了。	吕政法			Finished
21000175		小学	2021-05-03	女生，第一个印象深刻的同桌，漂亮而且感觉高傲。	杨颺			Finished
21000176		小学	2021-05-03	吕政法的同桌，以前经常换座位。初中第一个班主任是她母亲。	苏扬			Finished
21000177		小学	2021-05-03	小学后来说话比较多的女生，跟吕政法下棋，她在旁边看着，还说过请我们两个饭桶去她家吃饭，她住在学校家属院里。	陈怡然			Finished
21000178		小学	2021-05-03	小学第一个“暗恋”的女生，班长，长得漂亮。虽然长大之后好像很胖。	燕翔羽			Finished
21000179		小学	2021-05-03	初中同班，还能偶尔聊两句的小学同学。后来对方还给够联系方式，我给忘了。	金建华			Finished
21000180		小学	2021-05-03	也就记得一个名字的，名字挺漂亮的小学同学。	石秋月			Finished
21000181		小学	2021-05-03	我的印象里第一个被人欺负的同学，那个年代对霸凌唯一的记忆吧，不想成为那样，但也坐守旁观了。	石佑迁			Finished
21000182		高中	2021-05-03	高中应该算最好的朋友了吧，一起学习，一起出去玩，总得来说应该是最能跟我聊的人了。结婚了在四川重庆工作，想联系也还是能联系得上，不过确实没有联系了。两个人结婚的时候很遗憾的没赶上，选错回国时间了	杨开星			Finished
21000183		高中	2021-05-03	还算挺友好的女生吧，或许自我感觉有点儿暧昧，不过杨开星跟她在一起了。	张海燕			Finished
21000184		高中	2021-05-03	高中10班这个团体，总感觉还是以万薇为中心的，毕竟班长	万薇			
21000185		初中	2021-05-03		李光灿	英语老师		Finished
21000186		高中	2021-05-03	给我取绰号“老大”的始作俑者，因为我是数学课代表，或者组长，要让她交作业。虽然后来我的数学作业也基本是抄的她们的。	刘洋洋			Finished
21000187		高中	2021-05-03	万薇这个团体的活跃人物，人也很可爱，到现在还在发微信共享，快乐的吃货。	刘学竹			Finished
21000188		高中	2021-05-03	继续这个团体，娘娘腔角色扮演，相处还挺友好的。	罗星星			Finished
21000189		高中	2021-05-03	团体活跃人物，感觉就非常可靠。	朱师佳			Finished
21000190		高中	2021-05-03	类似于团体男生队长，感觉上最有见识最能指挥的人。	彭晟			Finished
21000191		高中	2021-05-03	漂亮骄傲，对原班长意见很大，跟团体里的人相处得倒很不错。	苏愉婷			Finished
21000192		高中	2021-05-03	一起换班的同学，成绩相近，原本是耍的最好的，后来加入万薇那边，相处就变少了。	刘鸣峰			Finished
21000193		高中	2021-05-03	除了那个团体之外，相处最多的女生了吧，不知道她到底怎么想的，感觉关系有些暧昧。后来毕业之后的一次见面，可能拒绝了她，虽然后来也还有偶尔聊天。	田甜			Finished
21000137		母系	2021-04-30	母亲唯一的婆婆辈，不认识，好像大哥结婚来过。	三姨婆			Finished
21000134		八孃家	2021-04-30	外语学得好，出国工作过，后来在沿海工作。	李红姐	表姐		Finished
21000135		八孃家	2021-04-30	说起来还没问过名字	李红姐丈夫			Finished
21000136		八孃家	2021-04-30	不记得名字，听说比我大，身高很高	李红姐弟弟			Finished
21000141		母系	2021-04-30		蒋禄申	大哥的大哥		Finished
21000138		大舅家	2021-04-30		谢光英	表姐		Finished
21000140		大舅家	2021-04-30	还记得小时候去他那里玩，拿到了星际争霸带帝国时代的光盘。	杨哥	光英姐前夫		Finished
21000139		大舅家	2021-04-30	小时候贪玩，经常跑过来玩电脑，中学之后好像有点儿流，不知道现在怎么样了。	杨启航	侄儿		Finished
21000194		高中	2021-05-03	田甜一组的女生，偶尔会在放学后一起走路聊到学校门口，宿舍旁。	陈清			Finished
21000195		高中	2021-05-03	最初的同桌，其实相处还算挺融洽吧。	周游			Finished
21000196		高中	2021-05-03	性格认真的班长，可惜不被同学们认同，也算是我同情或者觉得伤感的一个形象呢，想到或许自己也会那样，就总是心里不好受。老师里边，则是蒋崇碧。	谭甲莲			Finished
21000197		高中	2021-05-03	女大十八变，或者毕业后外貌变化最大的女生吧，完全是成功人士的感觉，做设计什么的。	蔡曌宇			Finished
21000198		高中	2021-05-03	还曾经帮我看过我写的诗，或许是曾鼓励过我发展自己的爱好吧，虽然我什么也没做成。	罗家明	语文老师-班主任		Finished
21000199		高中	2021-05-03	新人教师，给我感觉挺好，但也不被学生、家长所接受，高三的时候换成了教学经验丰富的罗斌。	蒋崇碧			Finished
21000200		高中	2021-05-03	印象比较深，但是说对他什么印象的话，好像说不出来。	李界	物理老师		Finished
21000067		母系	2020-01-02		吕茹紫嫣			
21000066		母系	2020-01-02		吕叔叔			
21000076		母系	2019-12-29		姻伯			
21000201		NEC	2013-08-22	第一份工作时带我的人	杨阳	组长		Finished
21000202		NEC	2013-10-30		秦川	分管经理		Finished
21000203	龙腾宾馆	武术馆	2000-08-01		师父-石			Finished
21000008		二爷家	2019-10-19		肖月	二哥		Close
21000009		二爷家	2019-10-19		肖光	三哥		Close
21000010		二爷家	2019-10-19		肖坤财	二爷		Close
21000011		二爷家	2019-10-19		二娘	二娘		Close
21000012		三娘家	2019-10-19		蒋思源	表哥		Close
21000013		三娘家	2019-10-19		肖坤慧	三嬢		Close
21000142		三娘家	2021-05-02		蒋叔叔	三孃丈夫		Finished
21000014		五爷家	2019-10-19		肖影	堂妹		Close
21000015		五爷家	2019-10-19		肖坤杰	五爷		Close
21000016		五爷家	2019-10-19		五娘	五娘		Close
21000018		幺幺家	2019-10-19		肖坤胜	幺幺		Close
21000019		幺幺家	2019-10-19		谭冽冽	幺妈		Close
21000020		幺幺家	2019-10-19		肖诗言	堂妹		Close
21000143		幺幺家	2021-05-02		谭骊咧	幺妈的妹妹		Finished
21000144		大公家	2021-05-02		大婆婆	大公家		Finished
21000145		大公家	2021-05-02		大公家大大	大公家		Finished
21000146		大公家	2021-05-02		大五爷	大公家		Finished
21000147		大公家	2021-05-02		五娘	大公家		Finished
21000148		大公家	2021-05-02		肖阳	大公家		Finished
21000149		大公家	2021-05-02		大幺幺	大公家		Finished
21000150		大公家	2021-05-02		幺娘	大公家		Finished
21000151		大公家	2021-05-02		肖川	大公家		Finished
21000152		三公家	2021-05-02		大大	三公家		Finished
21000153		三公家	2021-05-02		三公	三公家		Finished
21000154		三公家	2021-05-02		三婆	三公家		Finished
21000155		三公家	2021-05-02		肖雨	三公家		Finished
21000156		五公家	2021-05-02		五公	五公家		Finished
21000157		五公家	2021-05-02		五婆	五公家		Finished
21000158		五公家	2021-05-02		保保	五公家	肖坤英	Finished
21000159		五公家	2021-05-02		保保丈夫	五公家		Finished
21000160		五公家	2021-05-02		萧晗	五公家		Finished
21000161		五公家	2021-05-02		大二爷	五公家		Finished
21000162		幺公家	2021-05-02		幺公	幺公家		Finished
21000163		幺公家	2021-05-02		幺婆	幺公家		Finished
21000164		幺公家	2021-05-02		琴孃	肖坤琴		Finished
21000165		幺公家	2021-05-02		琴孃丈夫	幺公家		Finished
21000166		幺公家	2021-05-02		小二爷			Finished
21000167		二爷家	2021-05-02		三哥妻子	二爷家		Finished
21000168		二爷家	2021-05-02		肖劲余	三哥儿子		Finished
21000170		五爷家	2021-05-02		肖颖丈夫			Finished
21000169		五爷家	2021-05-02		双胞胎哥哥	肖颖儿子		Finished
21000119		二孃家	2021-04-30		沈爷	二孃丈夫		
21000120		二孃家	2021-04-30		沈文	表哥		
21000122		二孃家	2021-04-30		沈兵	表哥		
21000124		二孃家	2021-04-30		沈立	表哥		
21000121		二孃家	2021-04-30		沈静	侄女		
21000123		二孃家	2021-04-30	同年	沈浩	耗儿		
21000125		二孃家	2021-04-30		沈小蝶	侄女		
21000079		三孃家	2019-12-31	三嬢是教师，教书育人，虽然一直注意到，其实一直是很和善理性的。小时候总能得到些零花钱，特别是父母离婚后，三嬢每年的拜年钱，都是我很重要的生活费啊。	谢三嬢	三嬢		
21000118		三孃家	2021-04-30		陆爷	三孃丈夫		Complete
21000080		三孃家	2019-12-31		陆萍姐			
21000116		三孃家	2021-04-30		聂哥	陆萍姐丈夫		
21000117		三孃家	2021-04-30		聂梦秋	侄女		
21000115		三孃家	2021-04-30		陆川	表哥		
21000126		大舅家	2021-04-30	金龙政府工作	谢光华	表哥	大老表哥哥	
21000131		四孃家	2021-04-30		杨爷	四孃丈夫		Finished
21000130		四孃家	2021-04-30		谢四孃	四孃		Complete
21000093		大舅家	2020-08-23		大舅	大舅		Current
21000128		大舅家	2021-04-30		大舅娘			Finished
21000078		大舅家	2019-12-31		李玟	李医生		
21000077		幺舅家	2019-12-31		幺舅			Finished
21000129		幺舅家	2021-04-30		幺舅娘			Finished
21000127		幺舅家	2021-04-30	出去搞过销售，跟朋友一起开过公司	谢川	表哥	小老表哥哥	
21000204		武术馆	2000-08-01	第一个月就被检查到作业乱做，暑假最后一天赶作业啊，不眠之夜，虽然还是睡着了	师娘			Finished
21000205		武术馆	2000-08-28	矮个子，人挺风趣，训练比起其他老师来说，应该是最温和的一个	师兄-杨			Finished
21000206		武术馆	2000-08-28	完全记不起名字了，唯一的记忆就是第二天起床全身肌肉痛，跑步监督的师姐放过了我，抓住了另外两个偷懒的	师姐-陈			Finished
21000210		大学	2021-05-16	三好学生，可是结果跟他聊得最少	俞文洋	室友		Finished
21000211		大学	2021-05-16	室友里最我行我素的人，虽然我们寝室大部分人都我行我素	胡雅博	室友		Finished
21000212		大学	2021-05-16	电气专业的室友，人虽然随和，不过交流挺少的	吴宇佳	室友		Finished
21000017		五爷家	2019-10-19		肖晨晨	堂妹		Close
21000021		幺幺家	2019-10-19	都快两岁了吧，还不知道名字。三哥家的小子也是，总记不住。该记下来的。	肖盼盼	堂弟		Close
21000213		五爷家	2021-05-16		双胞胎弟弟	肖影儿子		Finished
21000092		二孃家	2020-08-23	还记得在川剧院上边的二嬢家，是我最初来永川的地方，小耗儿应该是我的儿时伙伴，却完全不记得了。	谢二嬢	二嬢		Finished
21000132		四孃家	2021-04-30	记忆中唯一一次玩耍，结果我耐不她的黏劲，觉得麻烦了。现在想起来，对那个看起来挺怕生的小姑娘很不好啊，是我找她玩的，结果我烦了不想跟她玩了。	四孃女儿			Finished
21000214		母系	2021-05-16		吕小川	吕叔叔儿子		Finished
21000207		新日铁	2021-05-11		山本大寛			
21000209		新日铁	2021-05-11		大八木隆平			
21000208		新日铁	2021-05-11		河村高道			
21000215		Unsorted	2021-05-22	袁隆平院士逝世。半年前还在继续研究的袁老爷子突然逝世，真的好突然。国士无双，现代最适合这个称号的人物离世了。跟大哥聊，他还在校庆上见过，西农校友。跟肖体松聊，他们也应该会在学校遇到相关话题吧。	袁隆平			
\.


--
-- Data for Name: person_item; Type: TABLE DATA; Schema: public; Owner: xiao
--

COPY public.person_item (id, date, memo, "time", parent_id) FROM stdin;
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiao
--

SELECT pg_catalog.setval('public.category_id_seq', 40000015, true);


--
-- Name: category_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiao
--

SELECT pg_catalog.setval('public.category_item_id_seq', 41000341, true);


--
-- Name: collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiao
--

SELECT pg_catalog.setval('public.collection_id_seq', 30000554, true);


--
-- Name: collection_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiao
--

SELECT pg_catalog.setval('public.collection_item_id_seq', 31000150, true);


--
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiao
--

SELECT pg_catalog.setval('public.event_id_seq', 10001193, true);


--
-- Name: event_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiao
--

SELECT pg_catalog.setval('public.event_item_id_seq', 11009742, true);


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiao
--

SELECT pg_catalog.setval('public.person_id_seq', 21000215, true);


--
-- Name: pesron_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiao
--

SELECT pg_catalog.setval('public.pesron_item_id_seq', 21000001, false);


--
-- Data for Name: BLOBS; Type: BLOBS; Schema: -; Owner: 
--

BEGIN;

SELECT pg_catalog.lo_open('24900', 131072);
SELECT pg_catalog.lowrite(0, '\x746869732064617920616761696e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('24901', 131072);
SELECT pg_catalog.lowrite(0, '\x742c682c692c732c202c642c612c792c202c612c672c612c692c6e20736f2077686174');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('24902', 131072);
SELECT pg_catalog.lowrite(0, '\x742c2c2c682c2c2c692c2c2c732c2c2c202c2c2c642c2c2c612c2c2c792c2c2c202c2c2c612c2c2c672c2c2c612c2c2c692c2c2c6e2c202c732c6f2c202c772c682c612c74');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('24903', 131072);
SELECT pg_catalog.lowrite(0, '\x7468697320697320736f20676f6f64');
SELECT pg_catalog.lo_close(0);

COMMIT;

--
-- Name: category_item category_item_pkey; Type: CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.category_item
    ADD CONSTRAINT category_item_pkey PRIMARY KEY (id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: collection_item collection_item_pkey; Type: CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.collection_item
    ADD CONSTRAINT collection_item_pkey PRIMARY KEY (id);


--
-- Name: collection collection_pkey; Type: CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_pkey PRIMARY KEY (id);


--
-- Name: diary diary_pkey; Type: CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.diary
    ADD CONSTRAINT diary_pkey PRIMARY KEY (date);


--
-- Name: event_item event_item_pkey; Type: CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.event_item
    ADD CONSTRAINT event_item_pkey PRIMARY KEY (id);


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- Name: person_item person_item_pkey; Type: CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.person_item
    ADD CONSTRAINT person_item_pkey PRIMARY KEY (id);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: person_item fk864sl4h1avqb8aem17sgxssqg; Type: FK CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.person_item
    ADD CONSTRAINT fk864sl4h1avqb8aem17sgxssqg FOREIGN KEY (parent_id) REFERENCES public.person(id);


--
-- Name: category_item fkc55uc5tlmjwpxnmji5onqubxy; Type: FK CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.category_item
    ADD CONSTRAINT fkc55uc5tlmjwpxnmji5onqubxy FOREIGN KEY (parent_id) REFERENCES public.category_item(id);


--
-- Name: collection_item fkcbdeyw4hsxw60iw7cfh6krix7; Type: FK CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.collection_item
    ADD CONSTRAINT fkcbdeyw4hsxw60iw7cfh6krix7 FOREIGN KEY (parent_id) REFERENCES public.collection(id);


--
-- Name: event_item fkclk0pp6p3qr3mtwvk06nu2dwk; Type: FK CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.event_item
    ADD CONSTRAINT fkclk0pp6p3qr3mtwvk06nu2dwk FOREIGN KEY (parent_id) REFERENCES public.event(id);


--
-- Name: category fkge26ktd35v1ef6000re6hshgy; Type: FK CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT fkge26ktd35v1ef6000re6hshgy FOREIGN KEY (item_id) REFERENCES public.category_item(id);


--
-- Name: collection_parent_bean_tags fkpm79wpr25nh2y3njnskjo41hh; Type: FK CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.collection_parent_bean_tags
    ADD CONSTRAINT fkpm79wpr25nh2y3njnskjo41hh FOREIGN KEY (collection_parent_bean_id) REFERENCES public.collection(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

