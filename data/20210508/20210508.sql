--
-- PostgreSQL database dump
--

-- Dumped from database version 10.13
-- Dumped by pg_dump version 10.13

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
40000007	9999-12-31	2019-10-17	Person	1900-01-01	41000132
40000008	2019-10-26	2019-10-20	Collection	1900-01-01	41000169
40000001	2019-01-01	2000-01-01	Event	1900-01-01	41000001
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
41000136	FatherSide	41000132	41000134
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
41000282	The Song of Travelers	41000269	41000272
41000283	The Love Song of City	41000269	41000272
41000284	The Syllable of Universe	41000269	41000272
41000285	The Melody of Magic	41000269	41000272
41000286	New Pages	41000269	41000272
41000287	Second Visions	41000269	41000272
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
30000226	1	Book	2019-04-25		Fate/Apocrypha			0001-01-01	Finished
30000227	1	Book	2019-11-05		因为我是开武器店的大叔			0001-01-01	GiveUp
30000228	1	Book	2019-04-27		埃尔梅罗二世事件簿			0001-01-01	Finished
30000229	1	Book	2019-08-13		大宋北斗司			0001-01-01	Finished
30000230	1	Book	2019-10-22		怪盗圣少女			0001-01-01	Finished
30000231	1	Book	2020-06-25		我有一个恐怖屋			0001-01-01	OnProcess
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
30000311	1	Book	2019-07-14		平凡职业造就世界最强			0001-01-01	Finished
30000312	1	Game	2019-03-18		プリコネ			0001-01-01	OnProcess
30000313	1	Game	2019-03-23		三国群英传7			0001-01-01	Finished
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
30000380	1	Fantasy	2019-09-21		勇者召唤之风骑士			0001-01-01	Finished
30000381	1	Fantasy	2019-09-27		幻兽传说			0001-01-01	Finished
30000382	1	Fantasy	2019-09-18		幻想_勇者召唤			0001-01-01	Finished
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
30000421	1	Book	2020-11-28		超人高中生们即使在异世界也能从容生存！			0001-01-01	OnProcess
30000422	1	Book	2020-12-06		关于邻家的天使大人			0001-01-01	OnProcess
30000423	1	Book	2020-12-13	PeterPan， A story of little sister’s dream land.	FairyTale			0001-01-01	OnProcess
30000424	1	Fantasy	2020-12-13	他被日本俘虏后，反手击溃整个中国防线，给自己学生们的信息，是从不会说出口的，你们所有人加起来都打不过我一个人。	民国参谋			0001-01-01	Finished
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
30000521	1	Fantasy	2021-04-11		城市恋曲			0001-01-01	OnProcess
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
30000538	4	Second Visions	2019-01-01	\N	梦记录			2019-01-01	Finished
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
31000021	101	2020-10-11	    “啊，不要！”\r\n    悲鸣传自森林深处，那是离开团队试图独自一人穿越试炼之森回到初始村庄的女玩家小小铃铛发出的。\r\n    眼前的怪物，包围她的十数只哥布林并非不可战胜的，但是此时精神被恐惧所占据的铃铛已经完全无法动弹，更不用说对抗眼前比平时击杀的怪物强数倍的敌人了。看着自己的血条由安全的黄色转到从未看到过的红色时，恐惧更加倍增，不由自主的发出悲鸣。以前所有的对游戏的一点自信被击得粉碎，自己最终还是会在一事无成的情况下结束人生吗。\r\n    小小铃铛的恐惧是理所当然的，因为在这个叫做《崛起》的虚拟实境网络游戏中，游戏角色的死亡意味着现实世界中的一个生命的结束，他们是被关在这个游戏中的五千人的幸存者。其中的大部分人都或多或少感觉到了，或许会有大半的人会在游戏通关之前因为各种原因死去吧。而铃铛或许也将成为其中的一员了。\r\n    然而，向铃铛挥下的狼牙棒被剑光斩断，一个迅捷的身影挡在了铃铛面前。铃铛从未见过拥有如此神速的剑士，然而更让她惊讶的是，剑士守护在她身前一步不动，仅靠突刺的剑风和斩击的剑气就将眼前的十数只哥布林化作了数码碎片。\r\n    剑士转过头来时，铃铛还没能反应过来，以为她被吓傻了的剑士只好伸出手来。\r\n    “总之，先离开这里吧，快天黑了。”\r\n    剑士左手牵着铃铛，右手握剑随手清理了挡道的野怪。然而铃铛却从如此强大的剑士的手上感觉到一丝颤抖，连一向迟钝的铃铛都立刻明白了眼前的男孩不太会和女孩子相处。剑士或许怕她又感到害怕，所以不敢放开手，而现在的铃铛也有些不愿意主动放开，眼前的剑士大概是被关在游戏半年以来，给一直带着恐惧活着的她最大安心感的人。即便他的肩膀并不很宽，模样甚至稍显俊俏。\r\n\r\n    两人走出试炼之森拐上回安可村的大道时，天已经黑了，于是就扎好帐篷准备露营了。在篝火堆边，两人的对话才真正开始。\r\n    “谢谢你，救了我。我叫小小铃铛，叫我铃铛就好了。”\r\n    “恩，我叫孤星，孤星点点。”\r\n    孤星只是简单的回应了一下，就找不到话说了。\r\n    “真的很谢谢你，孤星大哥，如果没有你在，我恐怕早就⋯⋯”\r\n    现在想来也还很后怕，毕竟事关本人的性命。\r\n    “恩，其实你冷静一点，就算打不过也是能逃掉的。”\r\n    “呃，实在抱歉。当时已经吓得慌了手脚，以前也是这么笨手笨脚，本以为在游戏里还好些，没想到还是那么不中用。”\r\n    “这也是没办法的事，毕竟这个游戏太危险了。不过以后记得别一个人穿越试炼之森，这个区域比较特别，是根据队伍中等级最低的队员刷怪的，所以跟着高等级玩家或低等级玩家一起走都很安全，相反一个人走特别危险。”\r\n    “是吗，我都不知道。”\r\n    “⋯⋯⋯⋯”\r\n    孤星沉默了半响，还是补充道。\r\n    “进出试炼之森的牌子上都注明着的，以后做事记得看说明。很多说明都是前边开荒成员留下的宝贵经验。”\r\n    “我知道了，孤星大哥。”\r\n    “你怎么会一个人在试炼之森里走？”\r\n    “嗯⋯⋯之前加入的公会会长性格不好，一气之下在打怪途中就离开了。原本还因为终于说出了自己的想法而沾沾自喜来着，没想却差点害死自己了，果然不该做自己不习惯的事吗？”\r\n    说到这里，铃铛突然想到，眼前同样只有十几岁的少年孤星，大概也是个不会跟人相处的人。如果他不做救人、照顾人这种不习惯的事，那么自己或许就不在这里了吧。\r\n    \r\n    帐篷也有保护人睡眠的作用，玩家的一般手段是无法摧毁的，其他人进入时也会对睡眠中的人发出警示。此时睡下的孤星正想着今天救下的少女的事情，对方却已经钻进了他的帐篷。\r\n    孤星还是一身简单的剑士装备，铃铛却已经换了一身轻柔的睡衣，抱着枕头，带着些羞涩的她一反往常的大胆请求睡在才认识一天的男孩子旁边。经历过一番生死，或许人总有些改变吧。\r\n    孤星看着铃铛羞涩的脸和睡衣领口露出的锁骨，原本一直没有表情的脸上也显出些红潮，不由自主的移开了视线。然而他或许是比铃铛更不会拒绝人的类型吧，不希望才经历生死的少女心中的不安扩大，向旁边让开了一个身位。\r\n    这个夜晚，是铃铛来到这个世界半年以来最轻松的一个晚上，孤星是个很好的听众，听着她聊起来到这个死亡游戏后的不安，所遇到的各种各样的人，想要改变的自己的弱点，甚至是很多人都不愿意提及的现实世界的种种。笨手笨脚又不懂拒绝的性格、格外照顾自己的大富豪家的表姐、对游戏的小小的自信和父母的不理解。\r\n    铃铛都不知道自己是什么时候睡着的，孤星大概睡得比自己更晚，却又在第二天将她唤醒。铃铛抬头睁开眼时，就看到侧过身来轻声唤着自己的孤星，两人的鼻尖几乎碰到一起了。被吓醒过来的铃铛，大叫一声冲出了帐篷。在自己的帐篷里整理的铃铛知道，睡觉的时候孤星没有动弹，反倒是自己差点靠到他的怀里去了。又想到昨晚的种种，一直到整理完出帐篷时，铃铛脸上的红潮也完全没有褪去。\r\n    \r\n    “我们这是去哪里啊，孤星大哥？”\r\n    “你昨天不是说不想再回以前的公会了吗，带你去我认识的公会看看吧。”\r\n    “哦。”\r\n    铃铛的声音里，稍微有些遗憾。察觉到了的孤星摸了摸头，不好意思的说。\r\n    “对不起，我实在不太会照顾人，而且为了早点通关这个游戏，也需要出入一些危险的地方，不能带着你去的。”\r\n    “不是的，孤星大哥又没有错，我只是，只是，你说的那个公会会收我这样不怎么厉害的人吗？”\r\n    不知道说什么的铃铛只好转换话题。\r\n    “放心吧，都是些很有意思也很好心的人。而且大部分公会都有些后援人员的，你的等级又不低，当主力也是可能的。”\r\n    两人穿过安可村的前段，走过在进入这个游戏的初战中被焚毁的街道，来到了发展得最快最好的公会聚集区。孤星和铃铛在一个稍带点汉族古典风格的建筑前停下，门正开着，突然从里边传出一个愤怒的声音。\r\n    “你先给我滚出去！”\r\n    然后是一个身影直飞出来，砸扁在对面相似建筑的门上。\r\n    铃铛被这场景吓了一跳，正奇怪到底什么人有这样的怪力，对方已经走出来了。那是一位\r\n让人惊艳的女子，丰满的身材、带着野性的装束以及奇特的猫耳和尾巴，让铃铛立刻想起进入游戏前收集过的资料，原本敏捷极高、力量偏弱的猫人族中极少会出现的拥有怪力的狮王般的存在。\r\n    “花姐。”\r\n    孤星无视了刚才飞出来的男子，自然的上前打招呼。\r\n    “哦，小星啊，难得见你在村里出现。怎么，又有事要姐姐帮忙啊？”\r\n    被叫做花姐的女子笑呵呵的回应，跟刚才怒气冲冲走出来的时候判若两人。她的眼神扫过旁边的铃铛，一副了然于胸的模样。\r\n    “嗯，这个，这个女孩没地方去了，我想你们公会会不会想招人什么的？如果不行我就去找别人。”\r\n    被一脸笑意的花姐看着的孤星好不容易憋出两句话来，一旁的铃铛的直觉告诉她，或许孤星不擅长跟异性相处就是拜这位大姐所赐。\r\n    “小星救下来的人姐姐我哪次没有收下的？到现在还说这么见外的话，你可真是⋯⋯”\r\n    “啊，凌哥又做什么让花姐生气了？”\r\n    预感到又要被长时间说教的孤星赶紧转换话题。\r\n    “他呀，好不容易有一天休息不用去打怪练级，他又到我面前唠叨个没完，说的话还，还那么肉麻，实在受不了了。”\r\n    “凌哥也是真心喜欢花姐嘛，我长这么大还是第一次见到这么主动这么直白的人呢。”\r\n    “那也得顾及下别人的感受啊，唉，他要有连云或者你一成的细心，就不会这么粘人了。算了，凌风，过来。”\r\n    花姐向前喊了一声，原本在自家门前做被砸扁状的凌风立即回复过来，转瞬间就到了花姐身前，正准备开口花花时被花姐眼睛一瞪，立即恢复正经，转头向孤星和铃铛看过来。\r\n    “你好，我叫繁花似锦，是“花都”公会的会长，欢迎你加入我们公会。这个是对面公会，‘风云’公会的会长凌风，性格虽然有点儿问题，人还算不坏。”\r\n    “花姐您好，我叫小小铃铛，您叫我铃铛就行了。请多关照。”\r\n    铃铛跟看起来挺强势也挺可靠的繁花似锦说话有些紧张，花姐宽慰她。\r\n    “不用那么紧张，同是天涯沦落人，在这个死亡游戏里相遇也是缘分，大家互相帮助着共度难关吧。”\r\n    “哇，孤星你又捡到一位漂亮的小女孩啊，为什么你总有这样的好运啊。一会儿记得告诉我地方，我也去试试⋯⋯啊⋯⋯”\r\n    说胡话的人又一次遭了毒手。\r\n    孤星在将铃铛带进花都以后，很快就离开了。明明走的时候还说会回来看她的，心情失落的铃铛却没能等到他的来访，再次相遇，已经是一个月后的事情了。\r\n\r\n\r\n\t------------\r\n\r\n\r\n    铃铛没有等到孤星，却从花都和风云两个公会的同伴那里获得了关心、帮助和挑战未来的勇气、经验。原本等级就不比一线玩家低多少的她在花姐的带领下进入了最前线的战场。\r\n    《崛起》这个游戏所讲述的是被神秘力量庇佑的安可村人奋起反抗帝国压迫最终创建新的时代的故事。进入游戏的五千玩家全是安可村人，故事的第一章就是帝国肃清部队袭击安可村，将村庄几乎焚毁殆尽的情节。\r\n    然而，当游戏设计者同时也是虚拟实境网络技术开发者的林煜突然发表死亡游戏的宣言，将五千玩家困在了游戏当中无法退出时，整个世界就完全不一样了。原本带着挑战故事，体验游戏而来的玩家们，一开始就直面生死，必须在与肃清部队的争斗中生存下来。而且必须真的完成战胜帝国的目标，才能回到原本的世界中去。\r\n    原本抱着等待外界援救想法而足不出村的玩家们，也在近半年的时间里认清了现状，如同林煜所说的一样，从外破解游戏无法指望，因为一旦失误就会直接葬送这五千人的性命。\r\n    更有甚者，即便不出村，玩家也会遇到危险。在第二章节目标“攻陷附近的贵族城镇银赫镇”达成之前，银赫镇会每个月派遣一只讨伐队攻击安可村，并且讨伐队会越来越强。经过了三个月的适应和磨合之后，玩家们终于达成一致意见，由大规模公会“希望”和“狂战士”牵头和指挥，攻陷了银赫镇。\r\n    而如今，在第六个月末，玩家们终于触发了第三章节的最终任务，“扫清银赫镇周围的帝国势力，巩固防线，以应对帝国的全力镇压。”\r\n    这个任务的难点在于，所需要攻略的地点有三处，原本集中所有精锐进行的攻略战行不通了，必须有三个足够威望的公会带领着分别击败三个势力。狂战士公会带领精英们强攻银赫镇前唯一的军事防御费雷要塞，强攻虽然需要人数，但考虑到不能有伤亡，只好全部派遣精英。希望公会则带领大量人手剿灭在各村、各镇以及矿场、林地间巡逻或流窜的帝国武装，虽然敌人大多不算强大，但统筹和指挥需要更高的威望和指挥能力，整个游戏里，或许也只有希望公会的会长亚里斯最有资格。\r\n    而风云和花都两个公会的联合体作为剩下的公会中最有能力和责任心的一个团体，独立接下了第三个讨伐任务，对血红骑士团的讨伐。铃铛，作为拥有出色辅助能力和少量输出的精灵使，也参与到了这个任务中来。\r\n    血红骑士团是银赫镇附近帝国一直未启用的一支力量，隶属教皇的断罪者。虽然现今的教会和帝国统帅都不愿启用这股会引起腥风血雨的力量，但作为起义军的玩家方也不敢任由这股敌对势力留存在自己背后。\r\n\r\n    “风之加护！”\r\n    铃铛给前卫的繁花似锦施加上加速的魔法，繁花原本就拥有怪力的双拳变得更加迅捷有力。即便是等级相对较高的血红骑士团的卫兵也能够一拳轰飞或者一击致命。\r\n    “土灵再生！”\r\n    繁花在前方开路的同时，铃铛又给旁边负责招架敌人攻击的盾战士附加了土系的魔法，增强恢复能力。看着自己这边顺利的进展，铃铛脸上露出轻松的笑意。\r\n    由于前期详细的侦查，己方已经对血红骑士团驻地的兵力分布了如指掌了。所以这次的作战计划有些大胆，己方从血红骑士团的东西两扇大门同时杀入，争取在敌方集合兵力重整旗鼓之前击溃他们。铃铛所在的东路由繁花和凌风带领，西路则由风云的副会长，比凌大哥看起来可靠得多的连云带领。原本还有些担心战力不足的铃铛，在看到平时和蔼可亲的公会同伴们矫健的身姿和强大的战力后，也轻松了下来。在中间提着双剑准备策应突变的凌风更是无聊的吹着口哨。\r\n    既然自己这边都那么轻松，西路想必更不用担心了。毕竟连云大哥是铃铛看到过的最厉害的人，不过，或许孤星也有那么厉害的，虽然肯定比不上连云大哥从小锻炼的武技，但在游戏里，孤星应该能跟连云大哥比个高下吧。\r\n    想到孤星，铃铛的心情又有些波动了，说好了回来看她的那个人，已经一个月没有消息了。一时疏忽没加好友，结果根本联系不上，即便去问花姐和凌哥，也是一样。\r\n    \r\n    两个队伍没出任何意外的在血红骑士团的正厅前汇合了，在两波人相互招呼和打趣的时候，铃铛却注意到，三位会长的表情有些严峻。铃铛不由自主的凑过去听了他们的对话。\r\n    “你们不觉得这次的血盟骑士团的防御有些奇怪吗？”\r\n    凌风难得正经的提出问题。\r\n    “看来你也感觉到了。繁花呢？”\r\n    连云接口。\r\n    “恩，这次的电脑太过“老实”了吧。毕竟是章节最终任务，照以前的经验看，不应该任由我们随意进攻的，但这一次血红骑士团的兵力完全没做调动的让我们歼灭了。电脑智能应该不止这种程度的，而且还有一点，我总感觉这次的讨伐任务，高等级NPC太少了一点。”\r\n    繁花思考了一会儿说出了自己的感受。\r\n    “恩，难得繁花能说出这么冷静的分析。”\r\n    “就是啊，平时总是靠蛮力解决问题，难得理性一回。”\r\n    “你又找打是不是？”\r\n    “总之，看来答案就在这个大厅里吧。最大可能，或许精英都集中到了里边了。现在的问题就是，我们再侦查一遍再决定打不打呢，还是直接进去挑战。”\r\n    “Boss骑士团长的战斗能力只能靠实战来确认，但是如果旁边精英太多，挑战Boss就太危险了。这次还是先做好撤退的准备吧。”\r\n    一向开朗得过头的凌风在这种时候倒比较保守。\r\n    “那也不见得，总之先进去看看再说吧，从头再来守卫之类的小兵又会刷新一大堆，而且也浪费时间了。”\r\n    繁花比较倾向打一打。\r\n    “总之，进去看看吧。”\r\n    \r\n    大门打开，大厅中出乎意料的冷清。两个门卫，两个血骑士，以及坐在正中间似笑非笑的一个骑士团长。血红骑士团团长弗朗西斯，一身红中嵌黑的骑士袍服，二十左右的模样，一头红发格外醒目，一柄十字剑就靠放在他座位旁边。\r\n    “什么人胆敢闯入吾等断罪者的大殿！”\r\n    NPC血骑士说着预设的语言冲了过来，仅仅四人就攻向了铃铛他们，而在后边的骑士团长还稳坐着，看戏一般看着自己的小弟的送死冲锋。\r\n    繁花和连云一人接下一个血骑士，在铃铛的辅助魔法加完之前就已经逼得对方节节后退了。两个门卫早早的被击杀，在退回骑士团长身边前，两个血骑士也已经死亡。在连云首先逼近骑士团长弗朗西斯的时候，对方仍然带着那似笑非笑的眼神。\r\n    “恭喜诸位来到我等断罪者的营地，虽然看来我那些不成器的手下们没有招待好诸位，部下们的不称职就只好由我来善后了。来吧，说说你们想要什么吧？”\r\n    说着，站起来的弗朗西斯单手握住他的佩剑。这个NPC显然跟那些重复刷新的小怪有很大区别，即便连云所见过的前两章的boss也没有如他一般个性鲜明。犹豫之后，连云回答。\r\n    “我们想向你要求的东西只有一样，你的人头。”\r\n    “嚯嚯，我这颗头可不值钱，相反的，你的人头在帝国可是有明码标价的喔，斗士连云。”\r\n    “我们这些小人物哪入得了帝国的法眼，堂堂断罪者一支的领袖，不会想去赚那点儿赏金吧。”\r\n    连云的语气更加慎重，身体也已绷紧，他用眼神示意凌风等人退后，自己却打定主意要试一试这个独特boss的深浅。一般人形boss的血量和破坏力都较弱，实力强劲的个人也能与其周旋一二。\r\n    “我虽然不在乎那点儿赏金，但是却对安可村这些有胆识又有纪律的反贼的首领们挺有兴趣的，总而言之，既然你也这么想，先过过招吧。”\r\n    话音刚落，弗朗西斯的突刺已经到了连云身前，动作之迅速，完全不是连云从前所遇敌人可比的。矮身、侧头、抬手，用拳套挡开十字剑的突刺，连云立刻冲向对手腹心进行反击。连云轰出的右拳被对方下撤的剑背挡住，于是顺势改拳为爪扣住了对方握剑的手。\r\n    “缴械！”\r\n    弗朗西斯的十字剑向上空飞起，本以为得手的连云却被更加迅捷的一拳打飞了出去。连云在空中转了两圈才受身着地，抬头看时，弗朗西斯已经重新抓住了飞起的十字剑，正微笑着看他。\r\n    “喂，云，干嘛这么冲动。”\r\n    凌风赶紧凑了过来。\r\n    “我想探探他的实力。”\r\n    “那也不用这么近身吧，虽然格斗家擅长近身战，但人家好歹也是boss啊，以伤换伤十个你都干不过他。”\r\n    “恩，是我错了。总之，先让格斗经验少的人后退些，这个人的战斗能力太强。”\r\n    说完连云又向前走了一步，重新跟弗朗西斯对峙。 \r\n    凌风本想上前夹攻，不过连云坚持一战，他也只有尊重对方，先去下达指示了，同时向繁花示意。繁花会意的点点头，稍微靠前了一点，以便随时帮上连云。其他的战士也都握紧了手中的武器，随时准备上前。\r\n    “这回换你出招了，斗士。”\r\n     弗朗西斯说出话后，剑尖向前一指，准备招架连云的攻击。\r\n     连云深吸一口气，在心中演算了一遍动作，脚尖一踏向弗朗西斯冲去。技能“突进”给与了连云速度，技能“强化”给与了他力量，技能“变向”让弗朗西斯的招架落空，正当拳头要击中弗朗西斯时，弗朗西斯空着的左手又一次快速回转，接下了这一拳。在弗朗西斯正要笑着反击的时候，看来已经力尽的连云却发出了经过一次转职的他现在所习得的最强招式。\r\n    “烈焰击！”\r\n    出乎意料的攻击将防御没到位的弗朗西斯的右手的骑士袍烧坏，而更让他意外的是连云扭转身体竟然没有僵直的又发动了波涛般的掌击。\r\n    “连云掌！”\r\n    连续十三掌打出，即便身为boss的弗朗西斯也被打得直后退到自己的石座前。受伤的弗朗西斯却满是笑意，眼中只有依然保持架势的连云。\r\n    “哈哈，果然如此。你们这些头领果然都有些本事，刚才的掌法不是系统默认技能吧，却居然能给我这么大的伤害。”\r\n    “家传武学。”\r\n    “好，好。我决定了，我要把你留在这里！”\r\n    这一次的弗朗西斯动真格了，单手挥动十字剑，斩击快而狠，刺击精准，攻得连云几乎没有还手之力。就在弗朗西斯的剑要斩伤连云时，两柄交错的剑挡下了他的斩击。\r\n    “他可是我家重要的二当家，不会让给你的！”\r\n    手持双剑的凌风快速抢攻，然而没有连云那样强格斗能力的他的剑击，被弗朗西斯轻描淡写的化解了。其他人也赶紧上来帮忙，只是除了连云，没有人能在迅捷如风的弗朗西斯身上留下伤痕。相反，很多人都被他快捷的反击所伤。\r\n    后方的魔法师和牧师队伍也开始行动，铃铛的辅助魔法也给前方的战士一一加持上了。原本由于弗朗西斯独特的出场而中断的boss攻略战重新开始。然而，铃铛他们马上发现了这次攻略的难度。\r\n    弗朗西斯的剑术众人还能应对，连云等武者的格挡、几个重战士的硬抗，不会让他将谁重伤。然而当他们打掉高魔抗的弗朗西斯大概六分之一血量的时候，弗朗西斯突然退后一步，右手握剑使出格挡技能，左手前伸，开始了吟唱。\r\n    “主啊，请让这些罪人知晓神威。”\r\n    弗朗西斯的左手突然放出耀眼的圣光。\r\n    “不好！所有人闭眼，前排全部后退一步！”\r\n    连云赶紧叫道，然而已经晚了，所有人都被圣光所照耀，进入了“目眩”状态，原本保持的阵型立刻混乱，前排战士更受到了血红骑士团长无情的攻击。\r\n    弗朗西斯在敌人从目眩状态恢复之前，向左右各发了一个斩击，多名战士受伤。所幸他的目标还只是连云，在逼开两边战士之后，又急攻向连云。连云所受目眩状态较小，斗士职业的异常状态抗性也高，依靠着稍微能感觉到的光影效果和自己的战斗本能，持续躲避着弗朗西斯的攻击。\r\n    就在其他人也渐渐恢复视觉，牧师们正想全力恢复伤者的时候，弗朗西斯的吟唱又一次响起。\r\n    “主啊，请让这些罪人知晓圣灵。”\r\n    众人头上再度显现圣光，当大家以为又是光系攻击时，凌风却惊讶的大叫。\r\n    “不是吧，天国之门！还让不让人活了！”\r\n    众人这才敢抬头，只见空中放行的一块圣光中出现了两个身影，圣灵之影。圣灵那可是堪比天使的存在了。才二十几级的众人，哪有挑战天使的能力！\r\n    \r\n    眼见大殿上空显现的天国之门，众人的心一下子沉到了谷底。\r\n    “不要慌张，那只是圣灵的影子，能力应该不会太强，重组两个小队拖住它们，别被他们切入后排，魔法师和射手优先解决掉它们。”\r\n    全场最冷静的连云一边与弗朗西斯周旋，一边发出指示，激战中的他反而第一个看到了天国之门中出现的敌人。凌风和繁花则立刻开始组织拦截圣灵之影。\r\n    还好圣灵之影果然不具备太强的攻击能力，圣光的目眩效果虽然烦人但对有所防备的众人影响不大，然而超强的魔法抗性和几乎完美的物理抗性却让没有与其对战过的风云、花都两个公会的精英们头痛不已。磨了好半天才将两个圣灵解决的众人回头看弗朗西斯时，才发现，对方的生命值竟然恢复了不少。\r\n    战斗时间并不算长，但将弗朗西斯的生命值磨到三分之一时，连耐力最强的连云都颇有些吃力了，只是如今的他们已经有些进退不得了。在暴风雨般的狂攻中，弗朗西斯还犹有余力的说着话。\r\n    “你们想跑也不是没办法，只要退出这个大殿我就不会追了，不过在这之前，我有信心留下包括斗士在内的五条性命。我知道你们一向都是共同进退的，所以还是安下心来想办法打倒我吧。”\r\n    弗朗西斯那像劝说又像自语的话语刺激着连云的心，连云知道他说的是实情，这个boss完全不是现阶段一个精英团队能够战胜的，即便将现存的最强战力全部集中起来，如果没有默契的配合，恐怕也是无法战胜他的。\r\n    就像印证他的想法似的，弗朗西斯又开始了吟唱。\r\n    “主啊，请让这些罪人明辨是非。” \r\n    然后就是几乎让凌风等人抽搐的特效，全场伤害无效，连后援的回血技能也没有效果。没有治疗，战线根本无法维持，连云当机立断的喊道。\r\n    “全员后撤，我来断后！”\r\n    然而仅有防御技能的连云也没有办法完全避开弗朗西斯的攻击，连续的几次刺击让他的血量低于了30%，陷入了危险状态。\r\n    这还不够，伤害无效还未解除，弗朗西斯的第四次吟唱又开始了。\r\n    “主啊，请让这些罪人们明晰真理。”\r\n    群体减速和持续掉血将众人打下了深渊，连云再也无法躲开弗朗西斯的攻击，被其一拳打翻在地。危急关头凌风抢过同伴的盾牌帮连云挡下了一剑，然而不善用盾的他手上的盾牌很快被挑飞。仿佛看着死人一般，弗朗西斯毫无慈悲的刺下手中的剑，繁花往这边飞扑，连云也挣扎欲起，凌风却只是静静的看着剑尖越来越近。\r\n    “不要!”\r\n    铃铛的叫声中，谁都没有注意到的一个身影从殿外飞速赶来。铃铛虽然看到了，却知道不管他有多快的速度，都无法挡下刺向凌大哥的那一剑。\r\n    然而，赶来的他却创造了这个奇迹，飞速前进中的身影左手向前，急声念道。\r\n    “定！”\r\n    弗朗西斯的剑没能刺下去，就那样停顿了一秒。当他反应过来时，也并没有顺手解决凌风，而是抽身后退，戒备着疾冲过来的剑士。\r\n    “你又来了，剑士！看来你也是个不见黄河心不死的人呢，还想再败一次倒也无妨，不过这回我可不会给你逃脱的机会了！”\r\n    “这回没有那么多小弟给你当后盾，我看你的小命也快到头了。”\r\n    与弗朗西斯对拼一剑后停下的孤星，少有的反唇相讥，铃铛看到他的眼神比以前任何时候都凌厉。不过在回过头来看铃铛时，孤星的眼神却又是那么温和。\r\n    “铃铛，还有花姐，先带凌哥他们退到殿外去吧，这里先交给我应付。”\r\n    “孤星，这个人不是那么好对付的，而且⋯⋯”\r\n    连云正想说些什么，孤星已经打断了他。\r\n    “不用担心，我已经有过一次经验了。击杀他的把握虽然没有，要拖住他还是不难的。”\r\n    “哦，那我倒要看看你能保下几条性命！”\r\n    听到这边对话的弗朗西斯立即行动，向旁边没了盾的盾战士攻了过去，即便是皮糙肉厚的战士，恐怕也扛不住他针对要害的一剑。\r\n    同样单手持剑的孤星以不逊于他的速度迎了上去，挡开十字剑，然后是针对弗朗西斯的一阵猛攻。三连刺、二段斩，挡开这些基本攻击后想要追赶逃向殿门的众人的弗朗西斯忽然停了下来。原本以为孤星那完全以压制对方为目的的猛攻，并不会带来多少损伤，但是突然的危机意识还是让弗朗西斯停下来格挡。此后他才发现，并非所有攻击都没有威胁，眼前这个男人，竟然有利用他分心二用，想去追敌的心理，偷袭他的心脏。\r\n    所有人形boss都有相同的弱点，头颅和心脏。即便是普通的刺击，如果能够一剑穿心，也是会对boss造成极大伤害的。弗朗西斯也似乎想通了，面对如此的强敌，又何必去在乎其他蝼蚁的死活呢。就在不顾自己损伤全力抢攻的孤星和回头与他对决的弗朗西斯开始全力战斗的时候，其他人已经在繁花的带领下退到大殿门口关注两人的战况。想要上前帮忙的铃铛被繁花紧紧的拉住了，虽然她也心情焦急，想上前帮忙，但为了不给孤星增加更多的负担，现在的她们只能紧张的注视战局的发展。\r\n    这是一场众人前所未见的死斗，孤星与弗兰西斯的身形相互交错，剑击之声不断。\r\n    “十字斩！”\r\n    “龙牙突！”\r\n    弗朗西斯大声念着血之圣骑士的技能名，向孤星发起攻击。而孤星则以更低沉的声音、更准确的突刺技能反击。\r\n    “龙破斩！”\r\n    “审判之剑！”\r\n    孤星的表情严峻，而弗朗西斯也不再有微笑。孤星以所持技能的无缝连接对抗弗朗西斯技能的强大破坏力，而在双方都不使用技能的单纯剑斗中，孤星甚至以自创的剑术更胜一筹。然而真正的考验才刚开始，当弗朗西斯的血量降到一半时，第五次吟唱开始了。\r\n    “主啊，请让你的仆人执掌威光。”\r\n    弗朗西斯抬手向天，他的上方一个巨大的圣光体正在凝聚，那恐怕是一个大规模破坏性魔法。靠在殿边的众人立刻紧张了起来，这次是直接的攻击魔法了，魔法师们赶紧释放出防御结界。铃铛也赶紧呼唤孤星闪避。\r\n    然而孤星并没有闪避，只见他也如同弗兰西斯般将左手伸向天空的圣光体，急叱。\r\n    “破！”\r\n    还未完成的大范围破坏性魔法“威光”就被他的一声“破”所引爆，产生强烈的气流席卷了整个大殿。\r\n    “狂妄之徒，竟敢破坏神迹！”\r\n    气流刚平息，弗朗西斯就气急败坏的攻向孤星，孤星则小心翼翼的招架。\r\n    交手几招之后，弗朗西斯再次吟唱。\r\n    “主啊，请让你的仆人执掌光雨！”\r\n    周围突然出现无数的圣光弹，那已经不是几个十几个光明教士所能召唤的圣光弹数量了。飘飞盘旋的圣光弹随着弗朗西斯的手指汇聚，然后一齐向孤星袭来。\r\n    “啊！”\r\n     铃铛忍不住惊叫，这么多的光弹袭击，即便身法再好也无法躲开，即便血量再厚恐怕也撑不住的。\r\n    孤星却仍有办法，依然是左手做施法状，孤星念道。\r\n    “无光之盾！”\r\n    孤星被一个暗系力量的光罩所包裹，圣光弹连续不断的打在光罩上，却一个不漏的被吸收了。慢慢蓄积的圣光力量最终将暗系的光罩填满引爆了，却最终没有对孤星造成太大伤害。\r\n    破解了弗朗西斯的两次吟唱，孤星又疾风般攻了过去。繁花等人本准备上前帮忙，却被孤星用眼神制止了。要一边保护着队友一边战斗，对他来说恐怕更加困难。\r\n    一招龙牙突打过去，在弗朗西斯格挡僵直而自己的技能僵直未到的瞬间，孤星又接上了下一个技能，旋风斩！狠狠的击中弗朗西斯后孤星赶紧旋转开去，等待双倍的技能僵直和躲避弗朗西斯的反击。\r\n    多重招式让孤星经常能击伤弗朗西斯，但长时间的僵直也让他很难完全避开反击。以伤换伤的战斗始终是对孤星不利的，毕竟弗朗西斯是boss，在他打掉弗朗西斯中间三分之一血量的时候，自己的生命值也已经降下危险线好一段了。最重要的是，孤星早就知道，而其他人才发现的一个问题，弗朗西斯第三次吟唱之后，回复魔法和道具都已经失去效用了。\r\n    弗朗西斯的第七次吟唱。\r\n    “主啊，请赐予此等愚者以绝望。”\r\n    比上次更加可怕的虚弱，想要来援的繁花等人都几乎难以动弹了。然而孤星以绝对的冷静应对着危机，虽然被弗朗西斯的连续刺击所伤，但所有针对要害的攻击都被他勉强的避开了。\r\n    虚弱时间刚到，下一次吟唱又开始了。\r\n    “主啊，请赐予此等愚者以死亡。”\r\n    比刚才圣光弹还要密集的血色匹练布满大殿，这已经不是光明神的神力，而是作为断罪者的血红骑士们所斩杀的冤魂的怨念汇聚而成的恐怖魔力。在这不详魔法出现的瞬间，刚恢复一点儿体力的连云就赶紧拉着繁花和铃铛往殿外冲去。\r\n    “所有人赶快出殿！”\r\n    “但是孤星还在⋯⋯”\r\n    铃铛挣脱连云的手想返身去看孤星，却又被凌风抱着向外冲去。殿内的孤星没有动作，只是静静的看着血色的匹练在身周流转。\r\n    在铃铛还来不及呼唤孤星的时候，所有的血色匹练已经加速流转，其中不少都冲向了他。在接触前一瞬间，孤星才低声念出自己的魔法。\r\n    “爆！”\r\n    孤星所在之处被血色匹练袭击，产生了一连串的爆炸。而剩下的血色匹练也撞向大殿各处，引起各处的爆炸和腐蚀，原本宏伟的殿堂变得完全不成样子。在一阵此起彼伏的爆炸过后，只剩下弗朗西斯的狂笑。\r\n    “哈哈，这回你离殿门可够远的，想逃也逃不掉了吧！哈哈！”\r\n    听着那狂笑，连云在义愤中颤抖、凌风咬牙切齿，繁花悲伤的捂住嘴唇，而铃铛，则傻在那里还没能认清事实。\r\n    “啊！”\r\n    笑声没能持续太久，接着的却又是弗朗西斯的一声惨叫，他惶然的看着自背后洞穿自己的长剑，一脸的不可置信。\r\n    “你到底？你怎么会没事？”\r\n    “最初的爆炸是我自己引发的，然后我就已经不在原来的地方了。我知道你这个魔法的范围很广，杀伤力也很大。但是毕竟有一个地方你不会攻击，那就是你自己所站的地方。我明白你想知道我是怎么到你身后的，很简单，在与你战斗的时候我在你背后做上了标记，而你一定知道有一种需要标记的瞬间移动魔法，它刚好有使得被施术者察觉不到背后异常的特效。”\r\n    “死神之影！可是并非刺客而且等级还低的你，哪可能学到这么高级的魔法？”\r\n    “单纯的剑士怎么会使用魔法？”\r\n    “那你到底⋯⋯”\r\n    “我使用的其实是这个。”\r\n    说着，孤星打开物品菜单，取出了一个卷轴。\r\n    “呵，原来如此。果然是准备周全呢。”\r\n    “毕竟曾经败给过你一次。”\r\n    “哼，你没有败给我。如果在同一⋯⋯线上，你不会败给我。”\r\n    弗朗西斯强撑最后的意识说道。\r\n    “你，的确厉害，或许⋯⋯真有可能战胜⋯⋯那个人呢。”\r\n\r\n    铃铛第一个奋不顾身的冲进毁坏殆尽的大殿内，然后就看到了站在弗朗西斯尸身旁边的孤星。她不顾一切的冲过去抱住了孤星，激动得全身颤抖。孤星也因为劫后余生的喜悦，轻轻的回抱着她。    \r\n    陆续进来的连云、繁花等人断断续续的聊着这个艰难的任务，以及整个《崛起》的剧情，心情都有些沉重。最后还是最开朗的凌风活跃起气氛，要在这里开庆功会，大吃大喝大闹一番。\r\n    “也就这种时候有些作用。”\r\n    繁花似锦看着又开始欢笑的公会，轻笑着感叹。\r\n    而此时的凌风、铃铛甚至连云则在对孤星进行“严刑逼供”。\r\n    “你到底怎么使用魔法的，明明是个没转职的剑士，不用吟唱咒语，竟然就能施展瞬间移动那一级别的魔法？”\r\n    “我都说过了，是用的魔法卷轴。”\r\n    “骗人，使用魔法卷轴不是需要把卷轴拿出来，双手展开，然后念咒语使用的吗？哪有你刚才那样轻松啊？”\r\n    “有个任务可以获得快速施法技能，所有咒语都可以精简。还有个任务获得意念施展技能，可以像快捷栏一样靠意念使用预设的几个物品。”\r\n    “哦，这么好的技能你咋不早说。任务在哪，我也去学一个。”\r\n    “其实这些技能也不算太好吧，还占技能位，如果不是这次的情况，我都不太想学的。关键收集卷轴太花钱了，为了凑齐这次任务需要的卷轴，我不仅把存款花光了，还向别人借了不少钱呢。凌哥，这次任务的酬金可得分我一份啊，就算卖出剩下的几张卷轴，我也暂时还不上借款。”\r\n    “剩下的卷轴你要不用了，卖给我好了，我出高价。”\r\n    “你用的是双剑，学这技能买些卷轴又有什么用呢？”\r\n    “有什么用？小星你这都不知道，果然是身在福中不知福啊。来，云，你告诉他这些技能有什么用。”\r\n    孤星回头看向一旁的连云，只看一向严肃认真的他突然坏坏的笑道。\r\n    “最大的作用就是，帅啊！”\r\n    孤星差点绝倒，而一旁的铃铛居然也赞同两个大男人的言论。懒懒的靠在孤星身边，铃铛回想起漫天血色中沉着冷静的孤星的身影，轻声的嘟囔。\r\n    “真的很帅嘛。”\r\n    \r\n\r\n\r\n\r\n\r\n	圣剑传说I：剑士之路 第一章  独行剑士.txt				2021-04-29	30000417
31000025	0	2021-05-08	学校开运动会，一个学生因为搞怪被失败，然后被班长女孩勒令回家拿东西收拾现场，另外的几个同学也跟着他回去了。然后他家里原来是一个鬼屋，进去的人从地下室拿器具的时候，被吸血鬼、僵尸、憎恶、飞机（外星人飞碟）等各种东西袭击，一路往外逃。终于逃出来跑回学校，结果他们闹出的动静把运动会给炸穿了，好多人错愕不已，然后愤怒的掀起另一部抗议和搞怪的风暴，另一边的一个女生公寓也被炸穿，里边也是一群奋起抗议的搞怪群体。整个社区都是搞事不嫌大的搞怪人士，外界一般敬而远之的整蛊社区。	整蛊社区			Paragraph	2021-05-08	30000538
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
10000042	Animation	海贼王	Collection	Finished
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
10000211	Book	醉枕江山	Collection	Finished
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
10000293	Note	MyNote记录	Event	Finished
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
10000888	Movie	百度视频-魔兽争霸3	Event	Finished
10000782	TSSummit	统合DB_IF	Event	Finished
10000858	Live	嗑瓜子	Event	Finished
10000797	Note	梦幻想	Event	Finished
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
10000265	Fantasy	旅者之歌	Event	Finished
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
10000421	Communicate	婆婆	Person	Finished
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
10000665	Animation	魔法少女奈叶	Collection	Finished
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
10000020	Discipline	早起会	Achievement	Finished
10000075	Book	埃尔梅罗二世事件簿	Collection	Finished
10000871	Animation	异世界狂想曲	Collection	Finished
10000876	Animation	政宗	Collection	Complete
10000855	TSSummit	NSR内存调查	Event	Finished
10000892	TSSummit	Security教育	Event	Finished
10000896	TSSummit	曹瑞	Person	Finished
10000901	Communicate	五十嵐 克成	Person	Finished
10000898	Communicate	小林 正明	Person	Finished
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
10000923	Book	恶魔奶爸	Collection	GiveUp
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
10000948	Book	我的治愈系游戏	Collection	OnProcess
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
10000968	TSSummit	VUP_Compile	Event	Finished
10000019	Note	note	Achievement	Finished
10000991	Fantasy	幻想：魔幻战斗考试	Event	Finished
10000992	Live	烧烤	Event	Finished
10000993	Fantasy	幻想：领主纪事之新世界探索	Event	Finished
10000978	TSSummit	STD_Migration	Event	Finished
10000374	TSSummit	上班耗时间	Event	Finished
10000481	TSSummit	会议，勤务	Achievement	Finished
10000384	TSSummit	悬案调查	Achievement	Finished
10000401	TSSummit	段波	Person	Finished
10000175	Game	魔兽争霸3	Collection	Finished
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
10001029	TSSummit	Migration手順書	Event	Finished
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
10001060	Communicate	肖颖儿子双胞胎	Person	Finished
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
10001094	Book	魔临	Collection	OnProcess
10001093	Book	万族之劫	Collection	Finished
10001095	TSSummit	BoAction悬案	Event	OnProcess
10000287	Communicate	大哥	Person	Finished
10001097	TSSummit	週次定例会	Event	Finished
10001098	Account	整理搬家行李	Event	Finished
10001099	Account	租房合同	Event	OnProcess
10001100	Account	退房手续	Event	Finished
10001101	Book	大唐捉妖师	Collection	OnProcess
10000160	Live	吃饭	Event	Finished
10001096	Movie	雪山凶灵	Event	Finished
10001102	Communicate	杨罡	Person	Finished
\.


--
-- Data for Name: event_item; Type: TABLE DATA; Schema: public; Owner: xiao
--

COPY public.event_item (id, date, memo, "time", parent_id) FROM stdin;
11000001	2019-09-18		0.0299999999999999989	10000001
11000002	2019-09-16		0.0200000000000000004	10000001
11000003	2019-09-14		0.0100000000000000002	10000001
11000004	2019-09-13		0.0400000000000000008	10000001
11000005	2019-09-12		0.0200000000000000004	10000001
11000006	2019-08-13		0	10000001
11000007	2019-08-12		0	10000001
11000008	2019-08-10		0	10000001
11000009	2019-08-06		0.0100000000000000002	10000001
11000010	2019-08-04		0.0299999999999999989	10000001
11000011	2019-07-13		0.0299999999999999989	10000001
11000012	2019-07-09		0.0400000000000000008	10000001
11000013	2019-07-08		0.0500000000000000028	10000001
11000014	2019-07-07		0.0200000000000000004	10000001
11000015	2019-07-05		0.100000000000000006	10000001
11000016	2019-07-04		0.0700000000000000067	10000001
11000017	2019-07-03		0.130000000000000004	10000001
11000018	2019-07-01		0.0700000000000000067	10000001
11000019	2019-06-30		0.100000000000000006	10000001
11000020	2019-06-29		0.0400000000000000008	10000001
11000021	2019-06-28		0.0200000000000000004	10000001
11000022	2019-06-27		0.119999999999999996	10000001
11000023	2019-06-26		0.110000000000000001	10000001
11000024	2019-06-25		0.100000000000000006	10000001
11000025	2019-06-24		0.170000000000000012	10000001
11000026	2019-06-23		0.0700000000000000067	10000001
11000027	2019-06-22		0.0500000000000000028	10000001
11000028	2019-06-21		0.149999999999999994	10000001
11000029	2019-06-20		0.110000000000000001	10000001
11000030	2019-06-19		0.100000000000000006	10000001
11000031	2019-06-18		0.589999999999999969	10000001
11000032	2019-06-17		0.190000000000000002	10000001
11000033	2019-06-16		1.01000000000000001	10000001
11000034	2019-06-15		0.0400000000000000008	10000001
11000035	2019-06-14		0.0100000000000000002	10000001
11000036	2019-06-12		0.170000000000000012	10000001
11000037	2019-06-11		0.0200000000000000004	10000001
11000038	2019-06-10		0.0200000000000000004	10000001
11000039	2019-06-09		0.0200000000000000004	10000001
11000040	2019-06-08		0.0200000000000000004	10000001
11000041	2019-06-07		0.0200000000000000004	10000001
11000042	2019-06-06		0.0800000000000000017	10000001
11000043	2019-06-05		0.0200000000000000004	10000001
11000044	2019-06-04		0.0100000000000000002	10000001
11000045	2019-06-03		0	10000001
11000046	2019-06-02		0.0299999999999999989	10000001
11000047	2019-06-01		0.0299999999999999989	10000001
11000048	2019-05-31		0.0100000000000000002	10000001
11000049	2019-05-30		0	10000001
11000050	2019-05-29		0	10000001
11000051	2019-05-28		0.0200000000000000004	10000001
11000052	2019-05-27		0.220000000000000001	10000001
11000053	2019-05-26		0.0200000000000000004	10000001
11000054	2019-05-25		0.0299999999999999989	10000001
11000055	2019-05-23		0.0100000000000000002	10000001
11000056	2019-05-22		0.0100000000000000002	10000001
11000057	2019-05-21		0.0400000000000000008	10000001
11000058	2019-05-20		0.100000000000000006	10000001
11000059	2019-05-19		0.0100000000000000002	10000001
11000060	2019-05-18		0	10000001
11000061	2019-05-17		0.0100000000000000002	10000001
11000062	2019-05-15		0.0200000000000000004	10000001
11000063	2019-05-14		0.0200000000000000004	10000001
11000064	2019-05-13		0.0100000000000000002	10000001
11000065	2019-05-12		0.0100000000000000002	10000001
11000066	2019-05-11		0.0100000000000000002	10000001
11000067	2019-05-10		0.0100000000000000002	10000001
11000068	2019-05-09		0	10000001
11000069	2019-05-08		0.0100000000000000002	10000001
11000070	2019-05-07		0.0599999999999999978	10000001
11000071	2019-05-06		0.0100000000000000002	10000001
11000072	2019-05-05		0.0100000000000000002	10000001
11000073	2019-05-04		0.0100000000000000002	10000001
11000074	2019-05-03		0.0200000000000000004	10000001
11000075	2019-05-02		0.0100000000000000002	10000001
11000076	2019-05-01		0.0100000000000000002	10000001
11000077	2019-04-30		0.0100000000000000002	10000001
11000078	2019-04-29		0.0200000000000000004	10000001
11000079	2019-04-28		0.0299999999999999989	10000001
11000080	2019-04-27		0.179999999999999993	10000001
11000081	2019-04-26		0.0200000000000000004	10000001
11000082	2019-04-25		0.0100000000000000002	10000001
11000083	2019-04-24		0.0100000000000000002	10000001
11000084	2019-04-23		0.0599999999999999978	10000001
11000085	2019-04-22		0.130000000000000004	10000001
11000086	2019-04-21		0.340000000000000024	10000001
11000087	2019-04-20		0.0100000000000000002	10000001
11000088	2019-04-19		0	10000001
11000089	2019-04-18		0.0700000000000000067	10000001
11000090	2019-04-17		0.0100000000000000002	10000001
11000091	2019-04-16		0	10000001
11000092	2019-04-15		0.0299999999999999989	10000001
11000093	2019-04-14		0.299999999999999989	10000001
11000094	2019-04-13		0.190000000000000002	10000001
11000095	2019-04-12		0.0100000000000000002	10000001
11000096	2019-04-11		0.0100000000000000002	10000001
11000097	2019-04-10		0.23000000000000001	10000001
11000098	2019-04-09		0.0100000000000000002	10000001
11000099	2019-04-08		0.0500000000000000028	10000001
11000100	2019-04-07		0.190000000000000002	10000001
11000101	2019-04-06		0.0100000000000000002	10000001
11000102	2019-04-05		0.380000000000000004	10000001
11000103	2019-04-04		0.239999999999999991	10000001
11000104	2019-04-03		0.299999999999999989	10000001
11000105	2019-04-02		0.179999999999999993	10000001
11000106	2019-04-01		0.440000000000000002	10000001
11000107	2019-03-31		0.209999999999999992	10000001
11000108	2019-03-30		0.209999999999999992	10000001
11000109	2019-03-29		0.100000000000000006	10000001
11000110	2019-03-28		0.0299999999999999989	10000001
11000111	2019-03-27		0.359999999999999987	10000001
11000112	2019-03-26		0.0100000000000000002	10000001
11000113	2019-03-25		0.149999999999999994	10000001
11000114	2019-03-24		0.299999999999999989	10000001
11000115	2019-03-23		0.0100000000000000002	10000001
11000116	2019-03-22		0.0100000000000000002	10000001
11000117	2019-03-21		0.209999999999999992	10000001
11000118	2019-03-20		0.100000000000000006	10000001
11000119	2019-03-19		0.5	10000001
11000120	2019-03-18		0.400000000000000022	10000001
11000121	2019-03-14		0.190000000000000002	10000001
11000122	2019-03-13		0.119999999999999996	10000001
11000123	2019-03-12		0.429999999999999993	10000001
11000124	2019-03-11		0.209999999999999992	10000001
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
11001200	2019-06-06		0.200000000000000011	10000026
11001201	2019-06-06		0	10000119
11001202	2019-06-06		7	10000014
11001203	2019-06-06		0.299999999999999989	10000044
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
11001559	2019-07-05		0.200000000000000011	10000005
11001560	2019-07-05		2	10000015
11001561	2019-07-05		0.800000000000000044	10000026
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
11001838	2019-08-11		0.200000000000000011	10000166
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
11002180	2019-09-14		0.200000000000000011	10000225
11002181	2019-09-14	战锤	0.5	10000229
11002182	2019-09-14		0.5	10000072
11002183	2019-09-14		0.5	10000223
11002184	2019-09-14		1	10000106
11002185	2019-09-14	寸寸头，剪过头了	0.5	10000110
11002186	2019-09-14		1.5	10000020
11002187	2019-09-14		0.5	10000160
11002188	2019-09-14		1.30000000000000004	10000133
11002189	2019-09-15		0.5	10000143
11002190	2019-09-15		2	10000231
11002191	2019-09-15		3	10000195
11002192	2019-09-15		2	10000233
11002193	2019-09-15		1.5	10000020
11002194	2019-09-15		0.699999999999999956	10000133
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
11002440	2019-10-06	今天微信打不通，但还是通过文字把自己想表达的传达过去了。不该因为对方不能满足自己的需求，就把该自己主动做的事情给拖延了。做好自己，这就是人际交往最基本的要求。	0.100000000000000006	10000243
11002441	2019-10-06		0.5	10000035
11002442	2019-10-06	打不通，发信息说了换钱回去的事，买房子能用。	0.100000000000000006	10000287
11002443	2019-10-06		0.5	10000130
11002445	2019-10-06		1	10000283
11002446	2019-10-06		0.5	10000291
11002447	2019-10-06	包饺子	1.5	10000290
11002448	2019-10-06	现场不会干	1.5	10000289
11002449	2019-10-06		1	10000293
11002555	2019-10-15		0.5	10000035
11002556	2019-10-16		8.5	10000014
11002450	2019-10-06	初三学习紧张的话题，让我也感到自己该更努力一些了。率直的传达这件事，想给他一个自己的行为会自然而然影响他人的概念。但收到微信的是邓阿姨，也不知道该说好还是不好。	0.100000000000000006	10000278
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
11002478	2019-10-09	忘了，连十分钟都没学到	0.100000000000000006	10000133
11002479	2019-10-09		1	10000294
11002480	2019-10-09	装电脑，各种不习惯，但目标就是去习惯。	1.5	10000301
11002481	2019-10-09		1	10000283
11002482	2019-10-09		0.5	10000160
11002483	2019-10-09		0.5	10000035
11002484	2019-10-09	xiaojianhan16@gmail.com/Xiao2019	0.200000000000000011	10000300
11002485	2019-10-09	xiaojianhan16@gmail.com/Xiao2019	0.200000000000000011	10000299
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
11002501	2019-10-11		0.200000000000000011	10000133
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
11002514	2019-10-12		0.200000000000000011	10000305
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
11002637	2019-10-22		0.100000000000000006	10000009
11002638	2019-10-22		2	10000322
11002639	2019-10-22		0.100000000000000006	10000133
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
11002651	2019-10-23		0.200000000000000011	10000133
11002652	2019-10-23	还有好多bug需要改，这可麻烦了，改完collection，还有fantasy。	1.5	10000286
11002653	2019-10-23		1.5	10000143
11002654	2019-10-23		1	10000322
11002655	2019-10-24	上班也该擦药啊	0.200000000000000011	10000318
11002656	2019-10-24	到晚上网速就不行了。	1.5	10000322
11002657	2019-10-24		2	10000325
11002658	2019-10-24		1	10000160
11002659	2019-10-24		5	10000326
11002660	2019-10-24		0.800000000000000044	10000133
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
11002680	2019-10-26		0.100000000000000006	10000318
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
11002694	2019-10-27		0.200000000000000011	10000133
11002695	2019-10-27		1	10000276
11002696	2019-10-27		0.5	10000330
11002697	2019-10-27		1	10000009
11002698	2019-10-27	补番了啊,墙对面不知道干啥，凌晨不睡觉。	3	10000332
11002699	2019-10-27		8.5	10000014
11002700	2019-10-27		0.299999999999999989	10000331
11002701	2019-10-27		2	10000293
11002702	2019-10-27		5	10000328
11002703	2019-10-27		0.5	10000035
11002704	2019-10-27		0.100000000000000006	10000318
11002705	2019-10-27		3.5	10000077
11002706	2019-10-27		0.5	10000160
11002707	2019-10-27		0.5	10000232
11002708	2019-10-27	历史上因为自毁长城，对我来说她就已经是罪人了。	0.5	10000329
11002709	2019-10-28		0.100000000000000006	10000318
11002710	2019-10-28		4	10000295
11002711	2019-10-28		0.299999999999999989	10000133
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
11002782	2019-11-03		0.200000000000000011	10000133
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
11002798	2019-11-04	没开门，明天还得去。	0.299999999999999989	10000318
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
11002815	2019-11-05		0.100000000000000006	10000318
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
11002893	2019-11-11		0.699999999999999956	10000160
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
11002904	2019-11-11		0.200000000000000011	10000286
11002905	2019-11-11	暂时没得做	0.100000000000000006	10000335
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
11003053	2019-11-22	maven建项目就一上午	3.89999999999999991	10000377
11003054	2019-11-22	放弃	0.100000000000000006	10000372
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
11003083	2019-11-25		0.100000000000000006	10000331
11003084	2019-11-25		0.25	10000009
11003085	2019-11-25		1.5	10000326
11003086	2019-11-25		0.25	10000035
11003087	2019-11-25		3	10000378
11003088	2019-11-25		0.400000000000000022	10000373
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
11003588	2020-01-09		0.149999999999999994	10000443
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
11003586	2020-01-09	过一天就好了，这bug又没找到。	0.100000000000000006	10000286
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
11003719	2020-01-23		0.650000000000000022	10000383
11003720	2020-01-23		0.100000000000000006	10000133
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
11003869	2020-02-03		0.400000000000000022	10000445
11003870	2020-02-03		0.100000000000000006	10000463
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
11005971	2019-10-19		0.100000000000000006	10000582
11005973	2019-10-19		0.100000000000000006	10000584
11005974	2019-10-19		0.100000000000000006	10000585
11005975	2019-10-19		0.100000000000000006	10000586
11005976	2019-10-19		0.100000000000000006	10000587
11005977	2019-10-19		0.100000000000000006	10000588
11005978	2019-10-19		0.100000000000000006	10000589
11005979	2019-10-19		0.100000000000000006	10000590
11005980	2019-10-19		0.100000000000000006	10000591
11005981	2019-12-02		0.100000000000000006	10000592
11005982	2019-12-02		0.100000000000000006	10000593
11005983	2019-12-02		0.100000000000000006	10000594
11005984	2019-12-02		0.100000000000000006	10000595
11005985	2019-12-02		0.100000000000000006	10000596
11005986	2019-12-02		0.100000000000000006	10000597
11005987	2019-12-02		0.100000000000000006	10000598
11005988	2019-12-04		0.100000000000000006	10000599
11005989	2019-12-04		0.100000000000000006	10000600
11005990	2019-12-04		0.100000000000000006	10000601
11005991	2019-12-04		0.100000000000000006	10000602
11005992	2019-12-05		0.100000000000000006	10000603
11005993	2019-12-05		0.100000000000000006	10000604
11005994	2019-12-05		0.100000000000000006	10000605
11005995	2019-12-05		0.100000000000000006	10000606
11005996	2019-12-05		0.100000000000000006	10000607
11005997	2019-12-05		0.100000000000000006	10000608
11005998	2019-12-05		0.100000000000000006	10000609
11005999	2019-12-05		0.100000000000000006	10000610
11006000	2019-12-05		0.100000000000000006	10000611
11006001	2019-12-05		0.100000000000000006	10000612
11006002	2019-12-05		0.100000000000000006	10000613
11006003	2019-12-05		0.100000000000000006	10000614
11006004	2019-12-05		0.100000000000000006	10000615
11006005	2019-12-05		0.100000000000000006	10000616
11006006	2019-12-05		0.100000000000000006	10000617
11006007	2019-12-05		0.100000000000000006	10000618
11006008	2019-12-07		0.100000000000000006	10000619
11006009	2019-12-07		0.100000000000000006	10000620
11006010	2019-12-07		0.100000000000000006	10000621
11006011	2019-12-07		0.100000000000000006	10000622
11006012	2019-12-07		0.100000000000000006	10000623
11006013	2019-12-07		0.100000000000000006	10000624
11006014	2019-12-07		0.100000000000000006	10000625
11006015	2019-12-08		0.100000000000000006	10000626
11006016	2019-12-08		0.100000000000000006	10000627
11006017	2019-12-08		0.100000000000000006	10000628
11006018	2020-07-10		0.100000000000000006	10000629
11006019	2005-10-03		0.100000000000000006	10000630
11006020	1983-10-13		0.100000000000000006	10000631
11006021	1986-02-26		0.100000000000000006	10000632
11006022	1986-10-11		0.100000000000000006	10000633
11006023	1996-01-01		0.100000000000000006	10000634
11006024	1992-10-10		0.100000000000000006	10000635
11006025	1989-04-15		0.100000000000000006	10000636
11006026	1996-04-06		0.100000000000000006	10000637
11006027	1993-04-09		0.100000000000000006	10000638
11006028	0001-01-01		0.100000000000000006	10000639
11006029	0001-01-01		0.100000000000000006	10000640
11006030	1999-03-07		0.100000000000000006	10000641
11006031	0001-01-01		0.100000000000000006	10000642
11006032	0001-01-01		0.100000000000000006	10000643
11006033	0001-01-01		0.100000000000000006	10000644
11006034	0001-01-01		0.100000000000000006	10000645
11006035	0001-01-01		0.100000000000000006	10000646
11006036	1998-04-18		0.100000000000000006	10000647
11006037	0001-01-01		0.100000000000000006	10000648
11006038	0001-01-01		0.100000000000000006	10000649
11006039	0001-01-01		0.100000000000000006	10000650
11006040	0001-01-01		0.100000000000000006	10000651
11006041	0001-01-01		0.100000000000000006	10000652
11006042	0001-01-01		0.100000000000000006	10000653
11006043	0001-01-01		0.100000000000000006	10000654
11006044	0001-01-01		0.100000000000000006	10000655
11006045	1996-01-08		0.100000000000000006	10000656
11006046	0001-01-01		0.100000000000000006	10000657
11006047	0001-01-01		0.100000000000000006	10000658
11006048	2008-04-12		0.100000000000000006	10000659
11006049	0001-01-01		0.100000000000000006	10000660
11006050	2006-01-06		0.100000000000000006	10000661
11006051	0001-01-01		0.100000000000000006	10000662
11006052	0001-01-01		0.100000000000000006	10000663
11006053	0001-01-01		0.100000000000000006	10000664
11006054	0001-01-01		0.100000000000000006	10000665
11006055	2004-09-30		0.100000000000000006	10000666
11006056	2005-10-06		0.100000000000000006	10000667
11006057	0001-01-01		0.100000000000000006	10000668
11006059	2009-10-02		0.100000000000000006	10000670
11006060	2013-10-04		0.100000000000000006	10000671
11006061	2009-04-02		0.100000000000000006	10000672
11006062	2004-04-10		0.100000000000000006	10000673
11006063	0001-01-01		0.100000000000000006	10000674
11006064	2006-10-03		0.100000000000000006	10000675
11005972	2019-10-19		0.100000000000000006	10000435
11006058	2008-10-01		0.100000000000000006	10000540
11006065	2011-09-28		0.100000000000000006	10000676
11006066	2012-04-22		0.100000000000000006	10000677
11006067	2010-07-05		0.100000000000000006	10000678
11006068	0001-01-01		0.100000000000000006	10000679
11006069	0001-01-01		0.100000000000000006	10000680
11006070	0001-01-01		0.100000000000000006	10000681
11006071	0001-01-01		0.100000000000000006	10000682
11006072	0001-01-01		0.100000000000000006	10000683
11006073	0001-01-01		0.100000000000000006	10000684
11006074	0001-01-01		0.100000000000000006	10000685
11006075	0001-01-01		0.100000000000000006	10000686
11006076	0001-01-01		0.100000000000000006	10000687
11006077	2010-02-22		0.100000000000000006	10000688
11006078	2013-10-02		0.100000000000000006	10000689
11006079	2014-04-08		0.100000000000000006	10000690
11006080	0001-01-01		0.100000000000000006	10000691
11006081	2014-10-05		0.100000000000000006	10000692
11006082	2015-07-04		0.100000000000000006	10000693
11006083	2014-07-14		0.100000000000000006	10000694
11006084	2006-07-02		0.100000000000000006	10000695
11006085	2011-04-15		0.100000000000000006	10000696
11006086	2009-10-06		0.100000000000000006	10000697
11006087	0001-01-01		0.100000000000000006	10000698
11006088	0001-01-01		0.100000000000000006	10000699
11006089	2012-10-04		0.100000000000000006	10000700
11006090	2010-07-01		0.100000000000000006	10000701
11006091	0001-01-01		0.100000000000000006	10000702
11006092	0001-01-01		0.100000000000000006	10000703
11006093	0001-01-01		0.100000000000000006	10000704
11006094	0001-01-01		0.100000000000000006	10000705
11006095	2008-04-05		0.100000000000000006	10000706
11006096	2013-07-05		0.100000000000000006	10000707
11006097	0001-01-01		0.100000000000000006	10000708
11006098	0001-01-01		0.100000000000000006	10000709
11006099	2018-01-05		0.100000000000000006	10000710
11006100	1996-10-01		0.100000000000000006	10000711
11006101	1995-10-04		0.100000000000000006	10000712
11006102	1995-04-07		0.100000000000000006	10000713
11006103	1996-04-05		0.100000000000000006	10000714
11006104	0001-01-01		0.100000000000000006	10000715
11006105	2002-10-05		0.100000000000000006	10000716
11006106	1979-01-01		0.100000000000000006	10000717
11006107	2010-02-20		0.100000000000000006	10000718
11006108	0001-01-01		0.100000000000000006	10000719
11006109	0001-01-01		0.100000000000000006	10000720
11006110	0001-01-01		0.100000000000000006	10000721
11006111	2006-10-05		0.100000000000000006	10000722
11006112	2013-10-07		0.100000000000000006	10000723
11006113	2009-01-07		0.100000000000000006	10000724
11006114	2009-04-04		0.100000000000000006	10000725
11006115	0001-01-01		0.100000000000000006	10000726
11006116	0001-01-01		0.100000000000000006	10000727
11006117	0001-01-01		0.100000000000000006	10000728
11006118	0001-01-01		0.100000000000000006	10000729
11006119	0001-01-01		0.100000000000000006	10000730
11006120	0001-01-01		0.100000000000000006	10000731
11006121	0001-01-01		0.100000000000000006	10000732
11006122	0001-01-01		0.100000000000000006	10000733
11006123	0001-01-01		0.100000000000000006	10000734
11006124	0001-01-01		0.100000000000000006	10000735
11006125	0001-01-01		0.100000000000000006	10000736
11006126	0001-01-01		0.100000000000000006	10000737
11006127	0001-01-01		0.100000000000000006	10000738
11006128	0001-01-01		0.100000000000000006	10000739
11006129	0001-01-01		0.100000000000000006	10000740
11006130	0001-01-01		0.100000000000000006	10000741
11006131	0001-01-01		0.100000000000000006	10000742
11006132	0001-01-01		0.100000000000000006	10000743
11006133	0001-01-01		0.100000000000000006	10000744
11006134	0001-01-01		0.100000000000000006	10000745
11006135	0001-01-01		0.100000000000000006	10000746
11006136	0001-01-01		0.100000000000000006	10000747
11006137	0001-01-01		0.100000000000000006	10000748
11006138	0001-01-01		0.100000000000000006	10000749
11006139	0001-01-01		0.100000000000000006	10000750
11006140	0001-01-01		0.100000000000000006	10000751
11006141	0001-01-01		0.100000000000000006	10000752
11006142	0001-01-01		0.100000000000000006	10000753
11006143	0001-01-01		0.100000000000000006	10000754
11006144	0001-01-01		0.100000000000000006	10000755
11006145	0001-01-01		0.100000000000000006	10000756
11006146	0001-01-01		0.100000000000000006	10000757
11006147	0001-01-01		0.100000000000000006	10000758
11006148	0001-01-01		0.100000000000000006	10000759
11006149	0001-01-01		0.100000000000000006	10000760
11006150	0001-01-01		0.100000000000000006	10000761
11006151	0001-01-01		0.100000000000000006	10000762
11006152	0001-01-01		0.100000000000000006	10000763
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
11002686	2019-10-26		0.100000000000000006	10000175
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
11006420	2020-08-16		0.100000000000000006	10000774
11006421	2020-08-16	还是没决定好是增加achievement还是skill	0.900000000000000022	10000286
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
11006491	2020-08-23		0.100000000000000006	10000777
11006492	2020-08-23		0.100000000000000006	10000778
11006493	2020-08-23		0.100000000000000006	10000779
11006505	2020-08-24		6.5	10000014
11006494	2020-08-23		0.5	10000383
11006495	2020-08-23		0.5	10000035
11006496	2020-08-23		1	10000293
11006497	2020-08-23		0.25	10000009
11006498	2020-08-23		0.5	10000505
11006486	2020-08-23	吃饼干当饭	1.5	10000048
11006487	2020-08-23		6.95000000000000018	10000014
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
11008240	2021-03-03		0.100000000000000006	10000898
11008241	2021-03-03		0.100000000000000006	10000899
11008237	2021-03-03		1.5	10000374
11008229	2021-03-03		2	10000894
11008234	2021-03-03	記録を見て、いろいろと思うんだが、果たして行動にうつせるのでしょうか	1.25	10000167
11008242	2021-03-03		0.100000000000000006	10000900
11008243	2021-03-03		0.100000000000000006	10000901
11008244	2021-03-03		0.100000000000000006	10000902
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
11009084	2021-04-30		0.0100000000000000002	10001010
11009091	2021-04-30		0.0100000000000000002	10001017
11009088	2021-04-30		0.0100000000000000002	10001014
11009085	2021-04-30		0.0100000000000000002	10001011
11009072	2021-04-30		0.0100000000000000002	10000998
11009073	2021-04-30		0.0100000000000000002	10000999
11009076	2021-04-30		0.0100000000000000002	10001002
11009061	2021-04-30		8.75	10000014
11009067	2021-04-30		0.75	10000471
11009066	2021-04-30		0.75	10000492
11009095	2021-04-30		0.0100000000000000002	10001021
11009090	2021-04-30		0.0100000000000000002	10001016
11009086	2021-04-30		0.0100000000000000002	10001012
11009087	2021-04-30		0.0100000000000000002	10001013
11009093	2021-04-30		0.0100000000000000002	10001019
11009094	2021-04-30		0.0100000000000000002	10001020
11009097	2021-04-30		0.0100000000000000002	10001023
11009098	2021-04-30		0.0100000000000000002	10001024
11009089	2021-04-30		0.0100000000000000002	10001015
11009080	2021-04-30		0.0100000000000000002	10001006
11009083	2021-04-30		0.0100000000000000002	10001009
11009078	2021-04-30		0.0100000000000000002	10001004
11009081	2021-04-30		0.0100000000000000002	10001007
11009077	2021-04-30		0.0100000000000000002	10001003
11009082	2021-04-30		0.0100000000000000002	10001008
11009079	2021-04-30		0.0100000000000000002	10001005
11009074	2021-04-30		0.0100000000000000002	10001000
11009075	2021-04-30		0.0100000000000000002	10001001
11009099	2021-04-30		0.0100000000000000002	10001025
11009096	2021-04-30		0.0100000000000000002	10001022
11009092	2021-04-30		0.0100000000000000002	10001018
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
11009149	2021-05-02		0.0100000000000000002	10001042
11009150	2021-05-02		0.0100000000000000002	10001043
11009128	2021-05-02	或许我真正想要的状态，是轻松地什么都尝试一下。然而现实总让我感到负担，责任是我讨厌、害怕的东西。我对自己的定位，就是对大局不重要但又有自己特点的配角，即便那是自己的人生，我也愿意当配角。	0.25	10000352
11009152	2021-05-02		0.0100000000000000002	10001045
11009129	2021-05-02		1.25	10000886
11009153	2021-05-02		0.0100000000000000002	10001046
11009132	2021-05-02		0.5	10001031
11009131	2021-05-02	■使用アプリ  Zoom(URL) https://us02web.zoom.us/j/3309092130?pwd=ZGVIS1FnVnh5Z1gvb2tTWU1nVjAzUT09 ■ミーティングID : 330 909 2130 ■パスワード : ut0731	2	10000381
11009133	2021-05-02	其实也是爱过情怀啊	0.25	10001030
11009154	2021-05-02		0.0100000000000000002	10001047
11009135	2021-05-02		0.5	10000963
11009136	2021-05-02	想半天，还是觉得太复杂，不能乱改	0.5	10000286
11009126	2021-05-02		5.25	10000014
11009138	2021-05-02		0.5	10000195
11009137	2021-05-02		0.75	10000287
11009134	2021-05-02		0.75	10000948
11009155	2021-05-02		0.0100000000000000002	10001048
11009157	2021-05-02		0.0100000000000000002	10001050
11009144	2021-05-02		0.0100000000000000002	10001037
11009143	2021-05-02		0.0100000000000000002	10001036
11009142	2021-05-02		0.0100000000000000002	10001035
11009146	2021-05-02		0.0100000000000000002	10001039
11009162	2021-05-02		0.0100000000000000002	10001055
11009158	2021-05-02		0.0100000000000000002	10001051
11009147	2021-05-02		0.0100000000000000002	10001040
11009159	2021-05-02		0.0100000000000000002	10001052
11009160	2021-05-02		0.0100000000000000002	10001053
11009161	2021-05-02		0.0100000000000000002	10001054
11009148	2021-05-02		0.0100000000000000002	10001041
11009145	2021-05-02		0.0100000000000000002	10001038
11009151	2021-05-02		0.0100000000000000002	10001044
11009156	2021-05-02		0.0100000000000000002	10001049
11009140	2021-05-02		0.0100000000000000002	10001033
11009141	2021-05-02		0.0100000000000000002	10001034
11009164	2021-05-02		0.0100000000000000002	10001057
11009163	2021-05-02		0.0100000000000000002	10001056
11009165	2021-05-02		0.75	10001058
11009167	2021-05-02		0.25	10000035
11009166	2021-05-02		1.75	10001059
11009168	2021-05-02		0.100000000000000006	10001060
11009169	2021-05-02		0.100000000000000006	10001061
11009130	2021-05-02		2.25	10000773
11009171	2021-05-02		0.25	10000160
11009170	2021-05-02		2	10000278
11009139	2021-05-02		4.54999999999999982	10001032
11009175	2021-05-03		0.25	10000463
11009176	2021-05-03		0.5	10000948
11009172	2021-05-03		10	10000014
11009174	2021-05-03		6.25	10001032
11009173	2021-05-03		2.25	10000773
11009190	2021-05-03		0.0500000000000000028	10001075
11009193	2021-05-03		0.0500000000000000028	10001078
11009192	2021-05-03		0.0500000000000000028	10001077
11009178	2021-05-03		0.0500000000000000028	10001063
11009198	2021-05-03		0.0500000000000000028	10001083
11009180	2021-05-03		0.0500000000000000028	10001065
11009201	2021-05-03		0.0500000000000000028	10001086
11009189	2021-05-03		0.0500000000000000028	10001074
11009196	2021-05-03		0.0500000000000000028	10001081
11009179	2021-05-03		0.0500000000000000028	10001064
11009195	2021-05-03		0.0500000000000000028	10001080
11009191	2021-05-03		0.0500000000000000028	10001076
11009177	2021-05-03		0.0500000000000000028	10001062
11009188	2021-05-03		0.0500000000000000028	10001073
11009181	2021-05-03		0.0500000000000000028	10001066
11009184	2021-05-03		0.0500000000000000028	10001069
11009199	2021-05-03		0.0500000000000000028	10001084
11009187	2021-05-03		0.0500000000000000028	10001072
11009186	2021-05-03		0.0500000000000000028	10001071
11009204	2021-05-03		0.0500000000000000028	10001089
11009194	2021-05-03		0.0500000000000000028	10001079
11009197	2021-05-03		0.0500000000000000028	10001082
11009182	2021-05-03		0.0500000000000000028	10001067
11009205	2021-05-03		0.0500000000000000028	10001090
11009203	2021-05-03		0.0500000000000000028	10001088
11009202	2021-05-03		0.0500000000000000028	10001087
11009185	2021-05-03		0.0500000000000000028	10001070
11009183	2021-05-03		0.0500000000000000028	10001068
11009200	2021-05-03		0.0500000000000000028	10001085
11009206	2021-05-03		0.0500000000000000028	10001091
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
11009276	2021-05-08		8	10000014
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
21000008		FatherSide	2019-10-19		肖月	二哥		Close
21000009		FatherSide	2019-10-19		肖光	三哥		Close
21000010		FatherSide	2019-10-19		肖坤财	二爷		Close
21000011		FatherSide	2019-10-19		二娘	二娘		Close
21000012		FatherSide	2019-10-19		蒋思源	表哥		Close
21000013		FatherSide	2019-10-19		肖坤慧	三嬢		Close
21000014		FatherSide	2019-10-19		肖影	堂妹		Close
21000015		FatherSide	2019-10-19		肖坤杰	五爷		Close
21000016		FatherSide	2019-10-19		五娘	五娘		Close
21000017		FatherSide	2019-10-19		肖晨晨	堂妹		Close
21000018		FatherSide	2019-10-19		肖坤胜	幺幺		Close
21000019		FatherSide	2019-10-19		谭冽冽	幺妈		Close
21000020		FatherSide	2019-10-19		肖诗言	堂妹		Close
21000021		FatherSide	2019-10-19	都快两岁了吧，还不知道名字。三哥家的小子也是，总记不住。该记下来的。	肖盼盼	堂弟		Close
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
21000065		MontherSide	2019-12-29		卢俊希			
21000087		Neso	2020-07-21		陈琛			
21000089		Neso	2020-08-16		汪明立	Neso社长		
21000067		MontherSide	2020-01-02		吕茹紫嫣			
21000070	微信 天津 	大学	2020-04-30	大学里实质上相处时间最多，最和善的室友。有女朋友的人，最后还是开始跟我们玩游戏。	王国泉	室友		Finished
21000075	微信 辽宁本溪	大学	2020-04-09	毕业后也“留校”的三人，一个出租屋住了接近一年半，算起来比大学里边相处的时间还长了。\r\n也是唯一一个我留意他去处的人，最后还是回家了，照顾老娘，不知道未来会怎么样。	郭志南	室友		Current
21000091	微信	大学	2020-08-23	不得不说的大学同学，自动化的裴浩，也是我所相处的人里唯一一个主张阶级斗争的人。不知道跟他的讨论到底有没有意义，不过我大概是跟他说话说得最多的同学了吧。我觉得我们算是一对，他需要一个斗争对象，我需要一个关注我的人。而且我大学里的生活模式，也有一部分是因为他形成的吧，既跟对面317一起玩耍，又始终保持一定的距离，没进入沉溺游戏模式的一大原因。	裴浩	室友		Finished
21000079		MontherSide	2019-12-31	三嬢是教师，教书育人，虽然一直注意到，其实一直是很和善理性的。小时候总能得到些零花钱，特别是父母离婚后，三嬢每年的拜年钱，都是我很重要的生活费啊。	谢三嬢	三嬢		
21000093		MontherSide	2020-08-23		大舅	大舅		Current
21000077		MontherSide	2019-12-31		幺舅			Finished
21000092		MontherSide	2020-08-23	还记得在川剧院上边的二嬢家，是我最初来永川的地方，小耗儿应该是我的儿时伙伴，却完全不记得了。	谢二嬢	二嬢		Finished
21000074		Family	2019-12-29		肖舒妤	侄女		Finished
21000071		Neso	2019-10-16		王文航	业务		
21000090		Neso	2020-08-20		冯天鸿			
21000080		MontherSide	2019-12-31		陆萍姐			
21000096		新日铁	2020-10-09	新入组员	劉丹奇			
21000082		新日铁	2019-12-19		段波			
21000086		Elife	2020-05-28		翟杰			
21000084		Neso	2020-01-25		张py			
21000101		新日铁	2021-03-03		曹瑞			
21000097		新日铁	2020-12-16	给他讲怎么搭建summit环境	刘丹奇			
21000100		新日铁	2021-02-08		任琼			
21000102		新日铁	2021-03-03		李勝鵬			
21000073		青年部	2019-12-22		社頭来喜			
21000066		MontherSide	2020-01-02		吕叔叔			
21000076		MontherSide	2019-12-29		姻伯			
21000078		MontherSide	2019-12-31		李玟	李医生		
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
21000112		Neso	2021-04-26		徐超			
21000113		新日铁	2021-04-28		高水駿典			
21000114		FatherSide	2021-04-30		邓清丽	邓阿姨		
21000115		MontherSide	2021-04-30		陆川	表哥		
21000116		MontherSide	2021-04-30		聂哥	陆萍姐丈夫		
21000117		MontherSide	2021-04-30		聂梦秋	侄女		
21000119		MontherSide	2021-04-30		沈爷	二孃丈夫		
21000118		MontherSide	2021-04-30		陆爷	三孃丈夫		Complete
21000120		MontherSide	2021-04-30		沈文	表哥		
21000121		MontherSide	2021-04-30		沈静	侄女		
21000122		MontherSide	2021-04-30		沈兵	表哥		
21000123		MontherSide	2021-04-30	同年	沈浩	耗儿		
21000124		MontherSide	2021-04-30		沈立	表哥		
21000125		MontherSide	2021-04-30		沈小蝶	侄女		
21000126		MontherSide	2021-04-30	金龙政府工作	谢光华	表哥	大老表哥哥	
21000127		MontherSide	2021-04-30	出去搞过销售，跟朋友一起开过公司	谢川	表哥	小老表哥哥	
21000128		MontherSide	2021-04-30		大舅娘			Finished
21000129		MontherSide	2021-04-30		幺舅娘			Finished
21000130		MontherSide	2021-04-30		谢四孃	四孃		Complete
21000131		MontherSide	2021-04-30		杨爷	四孃丈夫		Finished
21000132		MontherSide	2021-04-30	记忆中唯一一次玩耍，结果我耐不她的黏劲，觉得麻烦了。现在想起来，对那个看起来挺怕生的小姑娘很不好啊，是我找她玩的，结果我烦了不想跟她玩了。	四孃女儿			Finished
21000133		MontherSide	2021-04-30	跟女儿一起出国，一起去沿海城市，常年不在。15年回来玩过一趟，21年第二趟回永川。	谢八孃	八孃		Finished
21000134		MontherSide	2021-04-30	外语学得好，出国工作过，后来在沿海工作。	李红姐	表姐		Finished
21000135		MontherSide	2021-04-30	说起来还没问过名字	李红姐丈夫			Finished
21000136		MontherSide	2021-04-30	不记得名字，听说比我大，身高很高	李红姐弟弟			Finished
21000137		MontherSide	2021-04-30	母亲唯一的婆婆辈，不认识，好像大哥结婚来过。	三姨婆			Finished
21000138		MontherSide	2021-04-30		谢光英	表姐		Finished
21000139		MontherSide	2021-04-30	小时候贪玩，经常跑过来玩电脑，中学之后好像有点儿流，不知道现在怎么样了。	杨启航	侄儿		Finished
21000140		MontherSide	2021-04-30	还记得小时候去他那里玩，拿到了星际争霸带帝国时代的光盘。	杨哥	光英姐前夫		Finished
21000111		新日铁	2021-04-22		石松俊文			
21000141		MontherSide	2021-04-30		蒋禄申	大哥的大哥		Finished
21000142		FatherSide	2021-05-02		蒋叔叔	三孃丈夫		Finished
21000143		FatherSide	2021-05-02		谭骊咧	幺妈的妹妹		Finished
21000144		FatherSide	2021-05-02		大婆婆	大公家		Finished
21000145		FatherSide	2021-05-02		大公家大大	大公家		Finished
21000146		FatherSide	2021-05-02		大五爷	大公家		Finished
21000147		FatherSide	2021-05-02		五娘	大公家		Finished
21000148		FatherSide	2021-05-02		肖阳	大公家		Finished
21000149		FatherSide	2021-05-02		大幺幺	大公家		Finished
21000150		FatherSide	2021-05-02		幺娘	大公家		Finished
21000151		FatherSide	2021-05-02		肖川	大公家		Finished
21000152		FatherSide	2021-05-02		大大	三公家		Finished
21000153		FatherSide	2021-05-02		三公	三公家		Finished
21000154		FatherSide	2021-05-02		三婆	三公家		Finished
21000155		FatherSide	2021-05-02		肖雨	三公家		Finished
21000156		FatherSide	2021-05-02		五公	五公家		Finished
21000157		FatherSide	2021-05-02		五婆	五公家		Finished
21000159		FatherSide	2021-05-02		保保丈夫	五公家		Finished
21000160		FatherSide	2021-05-02		萧晗	五公家		Finished
21000161		FatherSide	2021-05-02		大二爷	五公家		Finished
21000158		FatherSide	2021-05-02		保保	五公家	肖坤英	Finished
21000162		FatherSide	2021-05-02		幺公	幺公家		Finished
21000163		FatherSide	2021-05-02		幺婆	幺公家		Finished
21000164		FatherSide	2021-05-02		琴孃	幺公家	肖坤琴	Finished
21000165		FatherSide	2021-05-02		琴孃丈夫	幺公家		Finished
21000166		FatherSide	2021-05-02		小二爷	幺公家		Finished
21000167		FatherSide	2021-05-02		三哥妻子	二爷家		Finished
21000168		FatherSide	2021-05-02		肖劲余	二爷家	三哥儿子	Finished
21000169		FatherSide	2021-05-02		肖颖儿子双胞胎			Finished
21000170		FatherSide	2021-05-02		肖颖丈夫			Finished
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
21000194		高中	2021-05-03	田甜一组的女生，偶尔会在放学后一起走路聊到学校门口，宿舍旁。	陈清			Finished
21000195		高中	2021-05-03	最初的同桌，其实相处还算挺融洽吧。	周游			Finished
21000196		高中	2021-05-03	性格认真的班长，可惜不被同学们认同，也算是我同情或者觉得伤感的一个形象呢，想到或许自己也会那样，就总是心里不好受。老师里边，则是蒋崇碧。	谭甲莲			Finished
21000197		高中	2021-05-03	女大十八变，或者毕业后外貌变化最大的女生吧，完全是成功人士的感觉，做设计什么的。	蔡曌宇			Finished
21000198		高中	2021-05-03	还曾经帮我看过我写的诗，或许是曾鼓励过我发展自己的爱好吧，虽然我什么也没做成。	罗家明	语文老师-班主任		Finished
21000199		高中	2021-05-03	新人教师，给我感觉挺好，但也不被学生、家长所接受，高三的时候换成了教学经验丰富的罗斌。	蒋崇碧			Finished
21000200		高中	2021-05-03	印象比较深，但是说对他什么印象的话，好像说不出来。	李界	物理老师		Finished
\.


--
-- Data for Name: person_item; Type: TABLE DATA; Schema: public; Owner: xiao
--

COPY public.person_item (id, date, memo, "time", parent_id) FROM stdin;
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiao
--

SELECT pg_catalog.setval('public.category_id_seq', 40000013, true);


--
-- Name: category_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiao
--

SELECT pg_catalog.setval('public.category_item_id_seq', 41000287, true);


--
-- Name: collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiao
--

SELECT pg_catalog.setval('public.collection_id_seq', 30000538, true);


--
-- Name: collection_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiao
--

SELECT pg_catalog.setval('public.collection_item_id_seq', 31000025, true);


--
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiao
--

SELECT pg_catalog.setval('public.event_id_seq', 10001102, true);


--
-- Name: event_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiao
--

SELECT pg_catalog.setval('public.event_item_id_seq', 11009276, true);


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiao
--

SELECT pg_catalog.setval('public.person_id_seq', 21000200, true);


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

