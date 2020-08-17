--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.21
-- Dumped by pg_dump version 9.5.21

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
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
40000001	2019-01-01	2000-01-01	Event	2000-01-01	41000001
40000002	2019-01-10	2019-01-01	Event	2019-01-01	41000023
40000003	2019-02-01	2019-01-10	Event	2019-01-10	41000043
40000004	2019-02-10	2019-02-01	Event	2019-02-01	41000065
40000005	2019-03-01	2019-02-10	Event	2019-02-10	41000086
40000007	9999-12-31	2019-10-17	Person\t	2019-10-17	41000132
40000008	2019-10-26	2019-10-20	Collection	2019-10-20	41000169
40000009	9999-12-31	2019-10-21	Fantasy	2019-10-21	41000193
40000006	2019-11-10	2019-03-01	Event	2019-03-01	41000109
40000011	9999-12-31	2019-11-10	Event	2019-11-10	41000235
40000010	2020-07-26	2019-10-26	Collection	2019-10-26	41000200
40000012	9999-12-30	2020-07-26	Collection	2020-07-26	41000259
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiao
--

SELECT pg_catalog.setval('public.category_id_seq', 40000013, false);


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
41000150	SJI	41000132	41000144
41000151	Rest	41000132	41000138
41000152	武术馆	41000132	41000151
41000153	广电局	41000132	41000151
41000154	天行者	41000132	41000151
41000155	早起会	41000132	41000151
41000156	青年部	41000132	41000155
41000157	高岛平会场	41000132	41000155
41000158	本部	41000132	41000155
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
\.


--
-- Name: category_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiao
--

SELECT pg_catalog.setval('public.category_item_id_seq', 41000268, true);


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
\.


--
-- Name: collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiao
--

SELECT pg_catalog.setval('public.collection_id_seq', 30000162, false);


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
\.


--
-- Name: collection_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiao
--

SELECT pg_catalog.setval('public.collection_item_id_seq', 31000016, false);


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
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: xiao
--

COPY public.event (id, category, name, sorted, status) FROM stdin;
10000002	Language	Harry Potter		Finished
10000003	Language	Toeic		Finished
10000004	Language	The Lord of the Rings		Finished
10000005	Language	language		Finished
10000006	Language	KoKo English		Finished
10000007	Language	O.Henry		Finished
10000008	Book	纵兵夺鼎		Finished
10000009	Game	プリコネ		OnProcess
10000010	Project	Diary.exe		Finished
10000011	Note	diary		Finished
10000012	Game	game		Finished
10000013	Book	book		Finished
10000014	Live	睡眠		Regular
10000015	Live	live		Finished
10000016	Project	project		Finished
10000017	Discipline	discipline		Finished
10000018	TSSummit	business		Finished
10000019	Note	note		Finished
10000020	Discipline	早起会		Regular
10000021	Language	Grimm's fairy tales		Finished
10000022	Language	The Arabian Nights		Finished
10000023	TSSummit	NSReporter		Finished
10000024	Erotism	ero		Finished
10000025	Game	San7		Finished
10000026	Communicate	communication		Finished
10000027	TSSummit	TSSummit		Finished
10000028	Language	Aesop's Fables		Finished
10000029	Language	Summary of Famous Works		Finished
10000030	Animation	animation		Finished
10000031	Animation	吸血鬼骑士		Finished
10000032	Animation	宅男腐女恋爱真难		Finished
10000033	Discipline	ユース会		Finished
10000034	Live	刷牙		Finished
10000035	Live	洗澡		Regular
10000036	Movie	宝贝老板		Finished
10000037	Book	名著简介		Finished
10000038	Animation	火影忍者		Finished
10000039	Game	大话西游		Finished
10000040	Project	DNF服务器		Finished
10000041	Account	租房		Finished
10000042	Animation	海贼王		Finished
10000043	Account	other		Finished
10000044	Exercise	exercise		Finished
10000045	Movie	电影原声		Finished
10000046	Account	办签证		Finished
10000047	Language	英语电影		Finished
10000048	Live	做饭		Finished
10000049	Book	天行		Finished
10000050	Animation	一拳超人		Finished
10000052	Movie	功夫熊猫		Finished
10000053	Game	卧龙吟		Finished
10000054	Game	DNF		Finished
10000055	Communicate	肖体松Python比赛		Finished
10000056	Communicate	平板锅阳台烤肉		Finished
10000057	Animation	classroom crisis		Finished
10000058	Live	搬家后熟悉环境		Finished
10000059	Note	三年总结		Finished
10000060	Movie	抖音		OnProcess
10000061	Account	美国AppleId		Finished
10000062	Movie	加勒比海盗		Finished
10000063	Movie	抖音-武打		Finished
10000064	Account	app排行-七麦数据		Finished
10000065	Movie	剪刀手		Finished
10000066	Movie	金刚		Finished
10000067	Book	Fate/Apocrypha		Finished
10000068	Fantasy	圣剑传说-数据		Finished
10000069	Movie	海底总动员		Finished
10000070	Movie	黑客帝国		Finished
10000071	Movie	抖音-他人生活		Finished
10000072	Animation	钻石王牌		Finished
10000073	Animation	贤者之孙		Finished
10000074	Animation	盾之勇者		Finished
10000076	Animation	我们无法一起学习		Finished
10000077	Game	英雄联盟		OnProcess
10000078	Animation	MIX		Finished
10000079	Animation	关于我转生变成史莱姆这档事		Finished
10000080	Communicate	爸的生日		Finished
10000081	Note	旅行-看海		Finished
10000082	Project	卧龙吟服务器		Finished
10000083	Live	洗衣服		Regular
10000084	Animation	刀使巫女		Finished
10000085	Animation	心跳回忆OL		Finished
10000086	Account	购物		Finished
10000087	Game	PS4-高达		Finished
10000088	Account	签证		Finished
10000089	Game	魔兽争霸		Finished
10000090	Game	梦塔防自走棋		Finished
10000091	Discipline	练成会		Finished
10000092	Communicate	节日祝福		Finished
10000093	Language	英语网站		Finished
10000094	Game	Steam		Finished
10000095	Movie	权力的游戏		Finished
10000096	Discipline	錬成		Finished
10000097	Note	野外炊事		Finished
10000098	Account	入台手续		Finished
10000099	Account	缴费-房租，医保		Finished
10000100	Account	亚马逊快递		Finished
10000101	Exercise	瘦身腰带		Finished
10000102	Note	diary.exe		Finished
10000103	Language	A Song of Ice and Fire		Finished
10000104	Animation	4月新番		Finished
10000105	Movie	小鬼当家		Finished
10000106	Movie	老友记		Finished
10000107	Movie	众神之锤		Finished
10000108	Movie	盗梦空间		Finished
10000109	Movie	少年斯派维的奇异旅行		Finished
10000110	Live	剪头发		Finished
10000111	Communicate	蹦迪		Finished
10000112	Account	丢钥匙		Finished
10000113	Movie	绝命毒师		Finished
10000114	Movie	换子疑云.Changeling		Finished
10000115	Movie	终结者		Finished
10000116	Movie	楚门的世界.The.Truman.Show		Finished
10000117	Project	Photoshop		Finished
10000118	Exercise	Diet Belt		Finished
10000119	Account	Amazon criticism		Finished
10000120	Language	TOEIC 800		Finished
10000121	Communicate	卡拉OK.Karaoke		Completed
10000122	Account	Hard Disk		Finished
10000123	Movie	王者少年.The.Kid.Who.Would.Be.King		GiveUp
10000051	Book	赘婿		Finished
10000124	Movie	movie		Finished
10000125	Communicate	青年留宿		Completed
10000126	Movie	卡萨布兰卡.Casablanca		Completed
10000127	Movie	狮子王.The.Lion.King.SP		Completed
10000128	Movie	这个杀手不太冷加长版.Leon.The.Professional		Finished
10000129	Movie	闪灵.The.Shining		Completed
10000130	Live	收拾房间		Regular
10000131	Game	黑暗之魂3.DarkSoulsIII		Finished
10000132	Game	暗黑2		Finished
10000133	Language	极光单词		Regular
10000134	Project	GitHub		Finished
10000135	Language	耶鲁大学公开课		Finished
10000136	Game	轮回之剑		Finished
10000137	Account	配钥匙		Finished
10000138	Game	巫师3		Finished
10000139	Language	耶鲁大学公开课_流行病		Finished
10000140	Language	耶鲁大学公开课_古典音乐		Finished
10000141	Project	游戏编程_Unity		Finished
10000142	Project	机器学习和数据挖掘		Finished
10000143	Discipline	Harvard Open Course : Positive Psychology		LookBack
10000144	Game	找游戏		Finished
10000145	Project	C# Basic		Finished
10000146	Game	怪物猎人：世界		Finished
10000147	Discipline	早起会原稿		Finished
10000148	Discipline	座談会		Finished
10000149	Account	取快递		Finished
10000150	Note	台湾旅游		Finished
10000151	Account	丢东西找东西		Finished
10000152	Note	台湾网吧		Finished
10000153	Game	\t怪物猎人：世界\t\t		Finished
10000154	Game	Sword.Art.Online.Fatal.Bullet.Dissonance.of.the.Nexus		Finished
10000155	Live	看病——皮肤病		Finished
10000156	Book	天醒之路		GiveUp
10000157	Communicate	肖体松学日语		Finished
10000158	Discipline	青年部		Finished
10000159	Game	魔兽3：困兽之斗		Finished
10000160	Live	吃饭		Regular
10000161	Live	Clean		Finished
10000162	Communicate	Communication		Finished
10000163	Discipline	Discipline		Finished
10000164	Erotism	Erotism		Finished
10000165	Project	Project		Finished
10000166	Language	Language		Finished
10000167	Note	Note		Finished
10000168	Animation	Animation		Finished
10000169	Book	Book		Finished
10000170	Game	Game		Finished
10000171	Exercise	Exercise		Finished
10000172	Project	AWS_VPN		Finished
10000173	TSSummit	Work		Finished
10000174	Account	softbank契约		Finished
10000175	Game	War3		OnProcess
10000176	Book	民国往事		Finished
10000177	Fantasy	Fantasy		Finished
10000178	Animation	盾之勇者成名录		Completed
10000181	Animation	COP CRAFT		GiveUp
10000182	Animation	在地下城寻求邂逅是否搞错了什么 第二季		GiveUp
10000183	Animation	君主·埃尔梅罗二世事件簿 魔眼收集列车 Grace not		Finished
10000184	Animation	重来吧，魔王大人！		GiveUp
10000185	Book	平凡职业造就世界最强		Finished
10000186	Game	英雄联盟自走棋		Finished
10000187	Account	拿钥匙		Finished
10000188	Game	Princess Connect		Finished
10000189	Animation	实况主的逃脱游戏		GiveUp
10000190	Animation	BEM		GiveUp
10000191	Live	收拾行李		Finished
10000192	Discipline	课题原稿		Finished
10000193	Note	坐飞机回东京		Finished
10000194	Book	民国投机者		Finished
10000195	Game	英雄联盟-云顶之弈		OnProcess
10000196	Communicate	肖体松的初三毕业旅行		Finished
10000197	Book	夜天子		Finished
10000198	TSSummit	回家拿出入证		Finished
10000199	Account	补鞋、处理硬币		Completed
10000200	Account	缴费		Completed
10000201	Account	Other		Finished
10000202	Project	日记程序		Finished
10000203	Account	SoftBank契约		Finished
10000204	Communicate	抖音		Finished
10000205	Animation	埃尔梅罗二世事件簿		Finished
10000206	Book	大宋北斗司		Finished
10000207	Exercise	负重步行		Finished
10000209	Project	LOLZiZouQi.exe		Finished
10000210	Language	哈利波特		Finished
10000211	Book	醉枕江山		Finished
10000212	Animation	Fate		Finished
10000213	Communicate	范小龙寄宿		Finished
10000214	Communicate	飲み会		Finished
10000215	Book	回到明朝当王爷		Finished
10000216	Note	修理硬盘		Finished
10000217	Animation	平凡职业造就最强		Finished
10000218	Game	英雄无敌3		OnProcess
10000219	Book	步步生莲		Finished
10000220	Exercise	爬富士山		Finished
10000221	Communicate	刘洋来日旅游		Finished
10000222	Account	挤电车		Finished
10000223	Erotism	买人偶		Finished
10000224	Book	平凡职业造就最强		Finished
10000225	Erotism	琉璃神社		OnProcess
10000226	Exercise	跑步		Finished
10000227	Note	找文库		Finished
10000228	Project	Unity开发		Finished
10000229	Movie	游戏动画		Finished
10000230	Communicate	联系家里		Finished
10000231	Project	Unity3D教学视频		Finished
10000233	Game	碧蓝幻想		Finished
10000234	Game	碧蓝幻想Game		Finished
10000235	Exercise	跑步—>走路		Finished
10000236	Account	打钱回国		Finished
10000237	Account	考虑买苹果电脑		Finished
10000238	Fantasy	幻想_勇者召唤		Finished
10000239	Game	游戏修改_满足欲望的设计		Finished
10000240	Communicate	生日		Finished
10000208	Fantasy	城市恋曲		Finished
10000232	Animation	碧蓝幻想		GiveUp
10000180	Animation	柯南		Finished
10000241	Movie	英语电影		Finished
10000242	Fantasy	勇者召唤之风骑士		Finished
10000244	Note	整理download		Finished
10000245	Animation	教室危机		Finished
10000246	Erotism	少女映畫		Finished
10000247	Account	电脑送修		Finished
10000248	Live	肚子痛		Finished
10000249	Account	玩手机		Finished
10000250	Discipline	思考自我		Finished
10000251	Book	钢壳都市雷吉欧斯-小说		Finished
10000252	Live	皮肤病		Finished
10000253	Language	喜马拉雅-英语听力		Finished
10000254	Discipline	早起会-大会		Finished
10000255	Note	逛中华街		Finished
10000256	Account	买衣服鞋子		Finished
10000257	Account	换钱		Finished
10000258	Account	购买Mac		Finished
10000259	Language	哲学课：死亡		Finished
10000260	Language	欧亨利小说		Finished
10000261	Fantasy	幻兽传说		Finished
10000263	Animation	高达seed		Finished
10000265	Fantasy	旅者之歌		Finished
10000266	Communicate	家人		Finished
10000267	Project	拆电脑		Finished
10000268	Account	电话卡取消		Finished
10000269	Account	softbank解约		Finished
10000270	Animation	mix		Finished
10000271	Communicate	同学		Finished
10000272	Account	vpn		Finished
10000273	Account	浪费时间		Finished
10000274	Note	做计划		Finished
10000275	Account	二手货软件		Finished
10000276	Language	励志英语		Finished
10000277	Project	移动硬盘		Finished
10000278	Communicate	肖体松		OnProcess
10000279	Live	坏肚子		Finished
10000280	Animation	Fate/Apocraphy		Finished
10000281	Neso	公司拿钥匙		Finished
10000282	Note	数据备份		Finished
10000283	Animation	宇宙的星路		Finished
10000284	Language	英语音乐		Finished
10000285	Note	日记		Finished
10000286	Project	MyNote		OnProcess
10000287	Communicate	大哥		OnProcess
10000288	Communicate	妈		OnProcess
10000289	Communicate	赫飞龙		Finished
10000290	Communicate	李致国		Finished
10000291	Live	补衣服		Completed
10000292	Account	SoftBank解约		Completed
10000293	Note	MyNote记录		OnProcess
10000294	Animation	Kokoro Connect		Finished
10000295	TSSummit	SWIFT电文		Finished
10000296	Account	买电脑		Finished
10000297	Account	邮局换钱		Finished
10000298	Account	OCN电话名义更改		Finished
10000299	Project	阿里云日服		Finished
10000300	Project	AWS		Finished
10000301	Project	Mac OS		Finished
10000302	Animation	10月新番		Finished
10000303	Animation	Assasin’s Pride		Finished
10000304	Animation	超人高中生们即使在异世界也能从容生存！		Finished
10000305	Animation	碧蓝航线		Finished
10000306	Animation	这个勇者明明超强却过分谨慎		Finished
10000307	Animation	爱书的下克上：为了成为图书管理员不择手段！		Finished
10000308	Note	Account整理		Finished
10000309	Account	NordVPN		Finished
10000310	Animation	Fate Grand Order		Finished
10000311	TSSummit	貸金IF		Finished
10000312	TSSummit	電文取込対応		Finished
10000314	Communicate	王文航		Finished
10000315	Animation	天才麻将少女		Finished
10000316	Animation	动漫音乐-网易云		Finished
10000317	TSSummit	定例会		Finished
10000318	Account	治疗皮肤痒		Finished
10000319	Account	自行车打气		Finished
10000320	Game	魔兽争霸3		Completed
10000322	Animation	传颂之物		Completed
10000323	Book	怪盗圣少女		Finished
10000324	TSSummit	Import_MarginCall.exe		Finished
10000325	Note	胡思乱想		Finished
10000326	TSSummit	障害对应		Finished
10000328	Animation	四叶游戏		Completed
10000329	Book	武则天		Finished
10000330	Project	swift编程		Finished
10000332	Animation	食戟之灵		Finished
10000333	Book	历史知识		Finished
10000334	Animation	重装武器		Completed
10000335	TSSummit	OpenSourceRisk		GiveUp
10000336	Movie	英语音乐		Finished
10000337	Erotism	风月大陆		Finished
10000338	Project	VPN连接专网		GiveUp
10000339	Animation	氷菓		Completed
10000340	Project	Angular		GiveUp
10000341	Animation	钢之炼金术师		Completed
10000342	Animation	灼眼的夏娜		Completed
10000343	Animation	らき☆すた		Completed
10000344	Animation	黑之契约者		Completed
10000345	Animation	初音岛		Completed
10000346	Animation	武装炼金		GiveUp
10000347	Animation	初夏		GiveUp
10000348	Animation	魂链		Finished
10000349	Animation	干物妹		Finished
10000352	Note	Ego随想		OnProcess
10000353	TSSummit	工作勤务		Finished
10000354	Discipline	巡回早起会		Finished
10000355	Exercise	骑车逛街		Finished
10000356	Live	发呆		Finished
10000357	Leisure	赖床		Finished
10000358	Game	找网吧-新大久保		Finished
10000313	Animation	我，不是说了能力要平均值吗！		Finished
10000351	Book	因为我是开武器店的大叔		GiveUp
10000327	Live	购物		Finished
10000243	Communicate	微信		Finished
10000359	Animation	魔弹之王与战姬		Completed
10000360	Neso	年末调整		Finished
10000361	Live	散步		Finished
10000362	Note	历史知识		Finished
10000363	Note	梦记录		OnProcess
10000364	Game	卧龙吟_设计		GiveUp
10000365	TSSummit	坐立不安		Finished
10000366	Project	WlyParser.exe		Finished
10000367	Project	Mac的win10网卡驱动		Finished
10000368	Note	社会知识		Finished
10000369	Communicate	请客吃饭		Finished
10000370	Communicate	KTV		Finished
10000371	Project	Git项目管理		GiveUp
10000372	Project	c#后台程序		GiveUp
10000373	Language	英语考试听力		Finished
10000375	Game	迅游加速器		Finished
10000376	Note	Win10整理		Finished
10000377	TSSummit	SVRS程序重构		Finished
10000378	Book	谁与争锋		Finished
10000379	TSSummit	服务器管理		Finished
10000380	Erotism	Konachan		Finished
10000381	Discipline	青年の集い		Finished
10000382	Account	定期券变更申请		Finished
10000383	Live	日常		Regular
10000384	TSSummit	悬案调查		Regular
10000385	Neso	neso忘年会		Finished
10000386	Book	美女班的男助教		Completed
10000387	Book	爱书的下克上		Finished
10000388	Animation	钢琴-动漫主题曲		Finished
10000389	Account	收别人的包裹		Finished
10000391	Communicate	早起会-圣诞		Finished
10000392	Communicate	婆婆去世		Finished
10000393	Book	轻小说目录		Finished
10000394	Animation	斩赤红之瞳		Completed
10000396	Account	体检		Finished
10000397	Animation	战斗动画		Finished
10000398	Animation	皇帝圣印战记		Finished
10000399	Book	皇帝圣印战记		Finished
10000400	TSSummit	勤务		Finished
10000401	TSSummit	段波		Regular
10000402	TSSummit	账票更新Fba工具开发		Finished
10000403	TSSummit	安装新电脑		Finished
10000404	Game	英雄联盟-大哥		OnProcess
10000405	Book	网络小说		Finished
10000406	Communicate	社頭来喜		Finished
10000407	Communicate	尾山たけし		Finished
10000408	Communicate	青年部忘年会		Finished
10000409	Communicate	阿曽田鷹茂		Finished
10000410	Communicate	小倉さん		Finished
10000411	Communicate	江連孝文		Finished
10000413	Project	XAML		Finished
10000414	Note	飞机回国		Finished
10000415	Live	吃零食		Finished
10000416	Communicate	姻伯		Finished
10000417	Communicate	肖舒妤		Finished
10000418	Communicate	萧皓然		Finished
10000419	Communicate	卢俊希		Finished
10000420	Live	无聊		Finished
10000421	Communicate	婆婆		Finished
10000422	Communicate	肖坤杰		Finished
10000423	Movie	哪吒之魔童降世		Finished
10000424	Communicate	谢三嬢		Finished
10000425	Communicate	陆萍姐		Finished
10000426	Communicate	幺舅		Finished
10000427	Communicate	李哥		Finished
10000428	Account	助学贷款		OnProcess
10000429	Communicate	爸		Finished
10000430	Communicate	吕茹紫嫣		Finished
10000431	Communicate	吕叔叔		Finished
10000432	Account	苹果电脑		Finished
10000433	Communicate	肖坤胜		Finished
10000434	Communicate	肖坤慧		Finished
10000435	Communicate	肖体月		Finished
10000436	Live	感冒		Finished
10000437	Animation	虫师		Finished
10000438	Animation	夏目友人帐		Finished
10000439	Account	加湿器		Finished
10000440	Animation	南家三姐妹		Completed
10000441	Neso	CreateAccount.exe		Finished
10000442	Animation	Re：从零开始的异世界生活		OnProcess
10000443	Erotism	风车动漫		Finished
10000444	Animation	怕痛的我，把防御力点满就对了		GiveUp
10000445	Animation	某科学的超电磁炮		Finished
10000446	Language	托业考试		Finished
10000447	Book	问题儿童来自异世界		Finished
10000448	Animation	问题儿童来自异世界		Completed
10000449	Note	收拾旧电脑		Finished
10000450	Book	魔弹之王与战姬		Finished
10000451	Neso	DXOClient		Finished
10000452	Erotism	ロマンスは剣の輝き		Completed
10000453	Exercise	健身房		GiveUp
10000454	Animation	无限系统树		GiveUp
10000455	Account	手机国际漫游		Finished
10000456	TSSummit	OIS対応		Finished
10000457	Game	炎龙骑士团2		Finished
10000458	Discipline	室井一起		Finished
10000459	Exercise	旗手行進		OnProcess
10000460	Discipline	社頭来喜		Finished
10000461	Communicate	杨罡		Finished
10000462	Note	东京塔		Finished
10000463	Erotism	Gelbooru		OnProcess
10000464	Neso	张py		Finished
10000465	Account	强力胶		Finished
10000466	Animation	Fate/Zero		Finished
10000467	TSSummit	EUC帳票改修		Finished
10000468	TSSummit	為替取引補完対応		Finished
10000469	TSSummit	席替え		Finished
10000471	Erotism	EroHonn		OnProcess
10000472	Communicate	肖光		Finished
10000475	Leisure	日常蹲厕所		Finished
10000476	Account	信用卡还款		Finished
10000395	Book	被卷入了勇者召唤事件却发现异世界很和平		GiveUp
10000390	TSSummit	上班无聊		Finished
10000374	TSSummit	上班耗时间		OnProcess
10000477	Communicate	蒋思源		Finished
10000478	Neso	田云峰		Finished
10000479	Neso	DXOClient编程		Finished
10000480	Book	骑士&魔法		Finished
10000481	TSSummit	会议，勤务		OnProcess
10000482	TSSummit	板仓新		Finished
10000483	Neso	周san		Finished
10000484	Animation	猎龙飞船		Finished
10000485	Animation	提亚拉之泪		Completed
10000486	Game	ShadowVerse		Finished
10000487	Erotism	快播		GiveUp
10000488	Animation	凉宫春日的忧郁		Completed
10000489	TSSummit	DLine本番障害		Finished
10000490	Game	Johnny Trigger		Finished
10000492	Animation	番剧介绍		Finished
10000493	Game	郭志南		Finished
10000494	Communicate	郭志南		OnProcess
10000495	Game	曹操传Mode-岳飞传		Finished
10000496	TSSummit	金融大学		Finished
10000497	Social	抖音		Finished
10000499	Animation	转生乙女破灭flag		Finished
10000500	Game	魔兽世界		Finished
10000502	Account	装电脑		Finished
10000503	Discipline	青年部Skype		Regular
10000504	TSSummit	FatPC		Finished
10000505	Leisure	时间丢失		Regular
10000506	TSSummit	自動NoAssign対応		Finished
10000507	Movie	流浪地球		Finished
10000508	Communicate	王国泉		Finished
10000509	Movie	半路夫妻		Finished
10000510	Movie	我是特种兵		Finished
10000511	Social	社会知识		OnProcess
10000513	Movie	火蓝刀锋		Finished
10000514	Movie	音乐		OnProcess
10000515	Movie	天地粮人		Finished
10000516	Social	周恩来		Finished
10000517	Movie	海棠依旧		Finished
10000518	TSSummit	VBA工数计算工具		Finished
10000519	Language	Harvard Open Course : Positive Psychology		OnProcess
10000520	Movie	饥饿站台		Finished
10000521	Game	徐老师来巡山		Finished
10000522	Movie	电影-抖音短片		OnProcess
10000524	Movie	非正式会议		Finished
10000525	Movie	我的团长我的团		Finished
10000526	Movie	周星驰		Finished
10000527	Animation	八男？别闹了！		Finished
10000528	Exercise	室内运动		OnProcess
10000529	Social	这就是中国		GiveUp
10000530	Animation	动漫音乐ktv		Finished
10000531	Movie	天下无诈		Finished
10000532	Work	自动Assign		Finished
10000534	Movie	红歌		Finished
10000535	Neso	翟杰		Finished
10000536	Movie	爱情保卫战		GiveUp
10000537	Movie	前任攻略		Finished
10000540	Animation	某魔法的禁书目录		OnProcess
10000541	Movie	牧马城市		Finished
10000542	TSSummit	ETF对应		Finished
10000543	Animation	驱魔少年		Finished
10000544	Social	黑人抗议		Finished
10000545	Book	抗战之重生雪豹周卫国		GiveUp
10000546	Note	翻看日记		OnProcess
10000547	Project	微信小程序-车票系统		GiveUp
10000548	Animation	灌篮高手		Finished
10000549	Live	喝酒		Finished
10000550	Game	三国群英传7		Finished
10000551	Game	Dota		Finished
10000552	Communicate	田Tina		GiveUp
10000553	Animation	黑子的篮球		Finished
10000554	Animation	恶魔奶爸		Finished
10000555	Project	微信小程序-LiteStore		GiveUp
10000556	Animation	路人女主		Finished
10000558	Book	至尊无赖		Finished
10000560	Book	禁区之门-地狱黑客		GiveUp
10000562	Game	VR Game		Finished
10000563	Animation	暗杀教室		Finished
10000564	Book	龙王的女婿		GiveUp
10000566	Project	Excel		Finished
10000567	Book	我有一个恐怖屋		OnProcess
10000568	TSSummit	NSReporter新对应		OnProcess
10000569	Account	电脑设备		Finished
10000570	TSSummit	时价导入		Finished
10000572	Account	车票		Finished
10000573	Account	定期券退款		Finished
10000574	Neso	陈琛		OnProcess
10000575	Language	The Science of Well-Being		OnProcess
10000576	Discipline	The Science of Well-Being		OnProcess
10000577	Language	美国动画		Finished
10000578	Animation	终结的炽天使		Completed
10000581	Account	手机音乐		OnProcess
10000582	Communicate	蒋禄红	Person	Finished
10000583	Communicate	肖月	Person	Finished
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
10000594	Communicate	星克成	Person	Finished
10000512	Language	英语新闻		Finished
10000557	Book	我能看见状态栏		OnProcess
10000538	Animation	柯南剧场版		Finished
10000580	Book	欢迎来到实力至上主义的教室		GiveUp
10000498	Animation	プリコネ		Finished
10000565	Erotism	AV		OnProcess
10000533	TSSummit	自动Assign		Finished
10000579	Account	亚马逊测评		Finished
10000561	Language	TikTok		Finished
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
10000608	Communicate	陈静	Person	Finished
10000609	Communicate	张淼	Person	Finished
10000610	Communicate	刘恋	Person	Finished
10000611	Communicate	张海成	Person	Finished
10000612	Communicate	高瑞	Person	Finished
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
10000630	Animation	ToHeart2	Collection	Finished
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
10000665	Animation	魔法少女奈叶	Collection	Finished
10000666	Animation	舞-HIME	Collection	Finished
10000667	Animation	舞-乙HIME	Collection	Finished
10000668	Animation	风之圣痕	Collection	Finished
10000669	Animation	魔法禁书目录	Collection	Finished
10000670	Animation	科学的超电磁炮	Collection	Finished
10000671	Animation	噬血狂袭	Collection	Finished
10000672	Animation	潘多拉之心	Collection	Finished
10000673	Animation	无头骑士异闻录	Collection	Finished
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
10000740	Book	唐砖	Collection	Finished
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
10000179	Game	英雄联盟——视频		Finished
10000491	Movie	Harry Potter		Finished
10000473	Social	新型冠状病毒		Finished
10000331	Language	英语故事		Finished
10000559	Language	英语网课		Finished
10000350	Fantasy	Fantasy随想		Finished
10000001	Note	Diary	Diary	Finished
10000412	Erotism	異世界でハレム		Finished
10000321	Animation	Fate：绝对魔兽战线		GiveUp
10000264	Animation	动漫音乐		Finished
10000075	Book	埃尔梅罗二世事件簿		Finished
10000571	Game	刺客信条		GiveUp
10000539	Game	宙斯		Finished
10000523	Erotism	EroGame		Finished
10000470	Erotism	NiceMoe		Finished
10000262	Erotism	喵绅士		Finished
10000474	Leisure	不知道玩什么		Finished
10000501	Leisure	小知识		Finished
10000764	Leisure	下棋	Event	OnProcess
10000765	Animation	死神	1	LookBack
10000766	Neso	EB債クーポン計算	1	OnProcess
10000767	Movie	我爱男保姆	1	OnProcess
10000768	Project	PHP	1	OnProcess
10000769	Animation	7月新番	Event	OnProcess
10000770	Account	特別定額給付金申請	Event	Finished
10000771	Animation	弩级战队H×EROS	1	OnProcess
10000772	Movie	只要平凡	1	Finished
\.


--
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiao
--

SELECT pg_catalog.setval('public.event_id_seq', 10000772, true);


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
11000635	2019-04-21		0	10000057
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
11000648	2019-04-22		0	10000057
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
11000870	2019-05-10		0	10000089
11000871	2019-05-10		2	10000015
11000872	2019-05-11		6	10000013
11000873	2019-05-11		1	10000015
11000874	2019-05-11		3	10000012
11000875	2019-05-11		2	10000017
11000876	2019-05-11		1	10000026
11000877	2019-05-11		0	10000089
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
11000892	2019-05-12		0	10000089
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
11000915	2019-05-14		0	10000089
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
11000945	2019-05-17		0	10000089
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
11001101	2019-05-29		0	10000089
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
11001114	2019-05-30		0	10000089
11001115	2019-05-31		0	10000023
11001116	2019-05-31		0.5	10000024
11001117	2019-05-31		1	10000005
11001118	2019-05-31		1	10000013
11001119	2019-05-31		0	10000009
11001120	2019-05-31		7.5	10000014
11001121	2019-05-31		0	10000103
11001122	2019-05-31		2	10000015
11001123	2019-05-31		0	10000089
11001124	2019-05-31		8	10000018
11001125	2019-05-31		4	10000012
11001126	2019-06-01		1	10000026
11001127	2019-06-01		0	10000103
11001128	2019-06-01		4	10000043
11001129	2019-06-01		4	10000012
11001130	2019-06-01		6	10000014
11001131	2019-06-01		1	10000024
11001132	2019-06-01		0	10000089
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
11001158	2019-06-03		0	10000089
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
11001174	2019-06-04		0	10000089
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
11001516	2019-07-01		0	10000153
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
11001581	2019-07-06		0	10000159
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
11001644	2019-07-10		0	10000174
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
11001661	2019-07-11		0	10000174
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
11001681	2019-07-13		0	10000178
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
11001705	2019-07-14		0	10000185
11001706	2019-07-14		0	10000186
11001707	2019-07-14		2	10000168
11001708	2019-07-14		0.5	10000164
11001709	2019-07-14		0	10000188
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
11001721	2019-07-15		0	10000186
11001722	2019-07-16		0.5	10000166
11001723	2019-07-16		0	10000077
11001724	2019-07-16		1	10000160
11001725	2019-07-16		0	10000186
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
11001743	2019-07-17		0	10000186
11001744	2019-07-17		6.5	10000014
11001745	2019-07-18		0.5	10000166
11001746	2019-07-18		9	10000173
11001747	2019-07-18		0	10000020
11001748	2019-07-18		0	10000023
11001749	2019-07-18		5.5	10000014
11001750	2019-07-18		0	10000192
11001751	2019-07-18		0	10000186
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
11001856	2019-08-12		0	10000188
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
11002210	2019-09-16		2	10000234
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
11002444	2019-10-06	邮寄机器	0.5	10000292
11002445	2019-10-06		1	10000283
11002446	2019-10-06		0.5	10000291
11002447	2019-10-06	包饺子	1.5	10000290
11002448	2019-10-06	现场不会干	1.5	10000289
11002449	2019-10-06		1	10000293
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
11002555	2019-10-15		0.5	10000035
11002556	2019-10-16		8.5	10000014
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
11002611	2019-10-20	安装了半天，还是解决不了大地图问题，果然已经与这个游戏的环境脱节了。	2	10000320
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
11002686	2019-10-26		0.100000000000000006	10000320
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
11003588	2020-01-09		0.149999999999999994	10000443
11003589	2020-01-09		1	10000160
11003590	2020-01-09		0.5	10000383
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
11005194	2020-05-25		1.5	10000532
11005195	2020-05-25		0.5	10000160
11005196	2020-05-25		1.5	10000533
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
11005380	2020-06-08		3	10000550
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
11005938	2020-07-26	无线耳机	0.25	10000579
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
11005956	2020-07-27		0.25	10000160
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
11005972	2019-10-19		0.100000000000000006	10000583
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
11006058	2008-10-01		0.100000000000000006	10000669
11006059	2009-10-02		0.100000000000000006	10000670
11006060	2013-10-04		0.100000000000000006	10000671
11006061	2009-04-02		0.100000000000000006	10000672
11006062	2004-04-10		0.100000000000000006	10000673
11006063	0001-01-01		0.100000000000000006	10000674
11006064	2006-10-03		0.100000000000000006	10000675
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
11006255	2020-08-03		0.5	10000579
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
11006305	2020-08-07		3	10000286
11006302	2020-08-07		0.75	10000160
11006304	2020-08-07	看个op合集，果然我所看的动漫故事就能构成一个世界观，大千世界	2	10000264
11006308	2020-08-07		0.5	10000772
11006300	2020-08-07	没什么可看了	3.5	10000060
\.


--
-- Name: event_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiao
--

SELECT pg_catalog.setval('public.event_item_id_seq', 11006308, true);


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
\.


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xiao
--

SELECT pg_catalog.setval('public.person_id_seq', 21000065, false);


--
-- Data for Name: person_item; Type: TABLE DATA; Schema: public; Owner: xiao
--

COPY public.person_item (id, date, memo, "time", parent_id) FROM stdin;
\.


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
-- Name: category_item_pkey; Type: CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.category_item
    ADD CONSTRAINT category_item_pkey PRIMARY KEY (id);


--
-- Name: category_pkey; Type: CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: collection_item_pkey; Type: CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.collection_item
    ADD CONSTRAINT collection_item_pkey PRIMARY KEY (id);


--
-- Name: collection_pkey; Type: CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_pkey PRIMARY KEY (id);


--
-- Name: diary_pkey; Type: CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.diary
    ADD CONSTRAINT diary_pkey PRIMARY KEY (date);


--
-- Name: event_item_pkey; Type: CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.event_item
    ADD CONSTRAINT event_item_pkey PRIMARY KEY (id);


--
-- Name: event_pkey; Type: CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- Name: person_item_pkey; Type: CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.person_item
    ADD CONSTRAINT person_item_pkey PRIMARY KEY (id);


--
-- Name: person_pkey; Type: CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: fk864sl4h1avqb8aem17sgxssqg; Type: FK CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.person_item
    ADD CONSTRAINT fk864sl4h1avqb8aem17sgxssqg FOREIGN KEY (parent_id) REFERENCES public.person(id);


--
-- Name: fkc55uc5tlmjwpxnmji5onqubxy; Type: FK CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.category_item
    ADD CONSTRAINT fkc55uc5tlmjwpxnmji5onqubxy FOREIGN KEY (parent_id) REFERENCES public.category_item(id);


--
-- Name: fkcbdeyw4hsxw60iw7cfh6krix7; Type: FK CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.collection_item
    ADD CONSTRAINT fkcbdeyw4hsxw60iw7cfh6krix7 FOREIGN KEY (parent_id) REFERENCES public.collection(id);


--
-- Name: fkclk0pp6p3qr3mtwvk06nu2dwk; Type: FK CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.event_item
    ADD CONSTRAINT fkclk0pp6p3qr3mtwvk06nu2dwk FOREIGN KEY (parent_id) REFERENCES public.event(id);


--
-- Name: fkge26ktd35v1ef6000re6hshgy; Type: FK CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT fkge26ktd35v1ef6000re6hshgy FOREIGN KEY (item_id) REFERENCES public.category_item(id);


--
-- Name: fkpm79wpr25nh2y3njnskjo41hh; Type: FK CONSTRAINT; Schema: public; Owner: xiao
--

ALTER TABLE ONLY public.collection_parent_bean_tags
    ADD CONSTRAINT fkpm79wpr25nh2y3njnskjo41hh FOREIGN KEY (collection_parent_bean_id) REFERENCES public.collection(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

