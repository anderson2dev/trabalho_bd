--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md53175bce1d3201d16594cebf9d7eb3f9d';






--
-- Database creation
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;
CREATE DATABASE trabalho_bd_sql WITH TEMPLATE = template0 OWNER = postgres;
ALTER DATABASE trabalho_bd_sql SET "DateStyle" TO 'dmy';


\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.22
-- Dumped by pg_dump version 9.6.22

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.22
-- Dumped by pg_dump version 9.6.22

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

\connect trabalho_bd_sql

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.22
-- Dumped by pg_dump version 9.6.22

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: tipo_perfil; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tipo_perfil AS ENUM (
    'MENTOR',
    'MENTORADO'
);


ALTER TYPE public.tipo_perfil OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: agendamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agendamento (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    id_mentor uuid NOT NULL,
    id_mentorado uuid NOT NULL,
    id_bloco_tempo uuid,
    concluido boolean DEFAULT false
);


ALTER TABLE public.agendamento OWNER TO postgres;

--
-- Name: avaliacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.avaliacao (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    id_agendamento uuid NOT NULL,
    numero_estrelas integer NOT NULL
);


ALTER TABLE public.avaliacao OWNER TO postgres;

--
-- Name: bloco_tempo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bloco_tempo (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    id_mentor uuid NOT NULL,
    inicio timestamp with time zone NOT NULL,
    fim timestamp with time zone NOT NULL
);


ALTER TABLE public.bloco_tempo OWNER TO postgres;

--
-- Name: habilidades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.habilidades (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    id_usuario uuid NOT NULL,
    nome character varying NOT NULL
);


ALTER TABLE public.habilidades OWNER TO postgres;

--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    tipo public.tipo_perfil,
    email character varying NOT NULL,
    senha character varying NOT NULL,
    nome character varying(255) NOT NULL,
    nascimento timestamp without time zone NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Data for Name: agendamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agendamento (id, id_mentor, id_mentorado, id_bloco_tempo, concluido) FROM stdin;
13b3332d-b52e-46fd-be85-98a06e9e6870	719536fd-e77a-48ee-996b-7f67aa2d6ca8	e98e41e3-9bcb-4c8b-a3a3-f5f27c3734e5	4bac3ce2-ee06-4752-b7c6-790ec35c31dc	t
5e9f1e82-fbe4-4147-8b24-a2011598a377	1f180535-c331-4279-be37-efab4416d61e	209c0678-6b6f-4cea-85c0-61e1f945b8c7	12e2c996-47d4-4652-a73c-80f98454bb7d	f
af22d839-0b2a-44d0-8dd1-cbfba7c4ce3b	35a64eb9-1744-48df-ae8f-4ed38342712e	ff48d416-f57a-4d6f-a093-67843328e063	97b35d2c-aef9-4972-9b45-7906e8651376	t
cc2346fe-c9df-49a2-91aa-b593c95764a3	be386a3e-8c00-4d55-bb2e-c6b3b5c657e1	ebde997a-ee55-4002-8d32-cada793985aa	a8d9983e-087c-49e2-875d-dbd2ea1d0300	f
4f9e429e-307a-4765-9563-8f05fec1b6bd	1f180535-c331-4279-be37-efab4416d61e	38f56250-0978-4960-ba6e-4c4f09dde204	4bac3ce2-ee06-4752-b7c6-790ec35c31dc	f
44f3c0e0-d3cb-42ba-916c-4a4a4962cce5	35a64eb9-1744-48df-ae8f-4ed38342712e	f131075b-01fa-479b-a015-9a82dc44d2b9	bb927ee6-240f-4a01-8b2f-e8ce6aed2cd7	f
aab815bd-26ea-41bc-9193-0fcc77768c72	ee841715-c690-49fe-bae2-cc405053ae56	7f6f5365-ce51-44cb-8908-d4d39cecd0e7	375cdab6-80d6-4b55-9cd8-869006a8f8bd	f
20cde85f-fc05-473c-935d-dede308f5b17	1f180535-c331-4279-be37-efab4416d61e	91fa7e32-389b-4793-9d18-8cc9fcab5b0a	4bac3ce2-ee06-4752-b7c6-790ec35c31dc	t
8868f0c6-dfdd-48a3-9943-689ccf7888d8	be386a3e-8c00-4d55-bb2e-c6b3b5c657e1	f8f0ca80-71fa-4178-965f-5bd02036af96	12e2c996-47d4-4652-a73c-80f98454bb7d	t
af1911df-17db-4ea4-8865-3bd54091bc19	1f180535-c331-4279-be37-efab4416d61e	424b2c44-92ed-495e-8563-e62b8c376f7f	375cdab6-80d6-4b55-9cd8-869006a8f8bd	t
9ce5e087-23ec-4f72-bf5a-ea237dccbd7f	719536fd-e77a-48ee-996b-7f67aa2d6ca8	2d4d876d-1723-4798-9d48-9abdb0f7bd09	c953fa98-86ce-45e3-9b0c-80c70eeda14a	t
32a9b503-8db1-4bc5-8f33-9feae2f4737b	719536fd-e77a-48ee-996b-7f67aa2d6ca8	c56b9bd6-164a-4f36-af34-3fc9cd169840	97b35d2c-aef9-4972-9b45-7906e8651376	f
4d767258-efd3-4e3b-a6a8-ef79e457e420	ee841715-c690-49fe-bae2-cc405053ae56	d187c679-16f3-4c56-aae6-dfcec6565c17	c953fa98-86ce-45e3-9b0c-80c70eeda14a	f
f42f9bba-2792-48de-aabc-1e124e4c109b	ee841715-c690-49fe-bae2-cc405053ae56	cdfa18a3-61cc-47e6-81fc-ae1493768b89	1cec907a-739c-453d-a438-e2e82b2f11e5	t
7e1b79f1-d514-40c7-a597-a6c7c5549eec	ee841715-c690-49fe-bae2-cc405053ae56	7184da25-58f1-4fc0-88ac-9ed177ef2c1d	4bac3ce2-ee06-4752-b7c6-790ec35c31dc	f
d90fa2b3-ce86-4911-83bb-3e0d72d6ded9	1f180535-c331-4279-be37-efab4416d61e	d5f15f46-aa03-4f6f-9b17-a165fdb7f098	12e2c996-47d4-4652-a73c-80f98454bb7d	f
563d4981-da01-4927-9506-6afa7050c354	ee841715-c690-49fe-bae2-cc405053ae56	2d4d876d-1723-4798-9d48-9abdb0f7bd09	97b35d2c-aef9-4972-9b45-7906e8651376	t
103f24c9-e770-47df-a084-dc1b17180556	35a64eb9-1744-48df-ae8f-4ed38342712e	ebde997a-ee55-4002-8d32-cada793985aa	bb927ee6-240f-4a01-8b2f-e8ce6aed2cd7	f
66100008-447c-4866-9e6f-a8d8127fac50	35a64eb9-1744-48df-ae8f-4ed38342712e	38f56250-0978-4960-ba6e-4c4f09dde204	375cdab6-80d6-4b55-9cd8-869006a8f8bd	t
880cbac5-add9-4dc0-b16c-8e3dec7ee877	719536fd-e77a-48ee-996b-7f67aa2d6ca8	209c0678-6b6f-4cea-85c0-61e1f945b8c7	bb927ee6-240f-4a01-8b2f-e8ce6aed2cd7	f
419ddb8b-39b8-4fd7-ac50-da68bbcfb9c5	35a64eb9-1744-48df-ae8f-4ed38342712e	7f6f5365-ce51-44cb-8908-d4d39cecd0e7	4bac3ce2-ee06-4752-b7c6-790ec35c31dc	t
fb7449d3-8edf-4a94-90fd-1ece39195cf4	719536fd-e77a-48ee-996b-7f67aa2d6ca8	3f7b4ce9-c219-4b7f-9989-2bf24843583b	375cdab6-80d6-4b55-9cd8-869006a8f8bd	t
a89dcde3-0986-43b1-8c29-71fbdf7b6bee	be386a3e-8c00-4d55-bb2e-c6b3b5c657e1	a73586cf-e789-4cd0-bd80-88ac44849efe	278f7b4e-873e-42b0-aaaf-54a4a974f334	f
72c97c95-9dc1-42c5-b7f3-c65cbbece165	1f180535-c331-4279-be37-efab4416d61e	a98c24b3-3300-4efc-9049-0685ee144c70	bb927ee6-240f-4a01-8b2f-e8ce6aed2cd7	t
5a67dac3-2dab-4729-ba18-d7862a6c5324	ee841715-c690-49fe-bae2-cc405053ae56	c5c8f3c6-bd3e-4aa2-9bf8-0b0840ab2bc5	c953fa98-86ce-45e3-9b0c-80c70eeda14a	f
05ca0d6a-8332-4df8-a1f4-c95f9e7813b5	35a64eb9-1744-48df-ae8f-4ed38342712e	424b2c44-92ed-495e-8563-e62b8c376f7f	79249865-3b02-48a8-9b3c-b76667084192	t
67fb141f-f09a-44e2-8ed3-02700fa4832f	719536fd-e77a-48ee-996b-7f67aa2d6ca8	7f6f5365-ce51-44cb-8908-d4d39cecd0e7	278f7b4e-873e-42b0-aaaf-54a4a974f334	t
f611d7b6-bd83-486f-8f02-e46e993aa10d	be386a3e-8c00-4d55-bb2e-c6b3b5c657e1	fccb1af4-5d8b-4a60-bba9-6c91562cf933	a8d9983e-087c-49e2-875d-dbd2ea1d0300	f
aa6d462c-2b27-4719-ab65-f4adca78bc86	be386a3e-8c00-4d55-bb2e-c6b3b5c657e1	b78d9575-ecfa-4390-b2bd-00436c17042d	375cdab6-80d6-4b55-9cd8-869006a8f8bd	f
eccd7a99-7b4b-4172-93ac-a0dd92bb0474	be386a3e-8c00-4d55-bb2e-c6b3b5c657e1	a233ebfd-6e9f-4f02-837e-f3c8832e24be	1cec907a-739c-453d-a438-e2e82b2f11e5	t
b4d4ea11-53b4-474b-b0b9-018bfd1068cf	719536fd-e77a-48ee-996b-7f67aa2d6ca8	5083dda0-2834-4c39-9af1-87a5218c8850	97b35d2c-aef9-4972-9b45-7906e8651376	t
8faa2378-74ed-4771-af15-1ae11a30729c	1f180535-c331-4279-be37-efab4416d61e	7995f239-b288-4cbd-8274-06035dc0a9db	1cec907a-739c-453d-a438-e2e82b2f11e5	f
e69a0423-7566-4423-9ebf-08dda1835fb1	be386a3e-8c00-4d55-bb2e-c6b3b5c657e1	7995f239-b288-4cbd-8274-06035dc0a9db	4bac3ce2-ee06-4752-b7c6-790ec35c31dc	f
392eea4f-4e22-43ab-93b8-5c7c4ec723dc	719536fd-e77a-48ee-996b-7f67aa2d6ca8	5083dda0-2834-4c39-9af1-87a5218c8850	1cec907a-739c-453d-a438-e2e82b2f11e5	f
a7b58f31-0be7-436c-a3c4-9c60c561b656	35a64eb9-1744-48df-ae8f-4ed38342712e	54754345-a886-4948-bd48-d1f1c506f0f3	1cec907a-739c-453d-a438-e2e82b2f11e5	t
3defe59e-dffa-4aa9-9bba-efd71c1b81e2	719536fd-e77a-48ee-996b-7f67aa2d6ca8	a05da0cd-477d-479f-9d50-e35e1f936cd1	c953fa98-86ce-45e3-9b0c-80c70eeda14a	f
d5eceeaf-be3c-474f-abb4-bfbc4a2e03aa	1f180535-c331-4279-be37-efab4416d61e	7f91e792-e10e-418d-a9aa-d7fdf70eb961	375cdab6-80d6-4b55-9cd8-869006a8f8bd	f
7fff8a29-0415-4bb4-a021-5800d9061d2f	ee841715-c690-49fe-bae2-cc405053ae56	91fa7e32-389b-4793-9d18-8cc9fcab5b0a	278f7b4e-873e-42b0-aaaf-54a4a974f334	f
2ad7cdb3-f2ed-4a74-8478-9f3aae96cf66	1f180535-c331-4279-be37-efab4416d61e	424b2c44-92ed-495e-8563-e62b8c376f7f	97b35d2c-aef9-4972-9b45-7906e8651376	f
4b8f4ec2-f234-4808-a848-f61baf459ccb	1f180535-c331-4279-be37-efab4416d61e	7995f239-b288-4cbd-8274-06035dc0a9db	97b35d2c-aef9-4972-9b45-7906e8651376	t
99bd5fb9-3759-49ad-a4e7-ef0a02153dc1	be386a3e-8c00-4d55-bb2e-c6b3b5c657e1	e7746110-e755-47fa-bdd1-4999ffc62b5f	a8d9983e-087c-49e2-875d-dbd2ea1d0300	t
179e6015-ebf4-4ba0-9248-782ce7ca1f4b	1f180535-c331-4279-be37-efab4416d61e	d3c2d21c-5467-4be4-b216-bb9be9a21423	4bac3ce2-ee06-4752-b7c6-790ec35c31dc	t
a730af3c-3ec4-47ff-99e9-cba05048d5ab	35a64eb9-1744-48df-ae8f-4ed38342712e	8cd7346a-f236-4b22-b699-371a34d90cde	4bac3ce2-ee06-4752-b7c6-790ec35c31dc	t
71a5d0b9-9733-4690-a143-4bc90e5aec24	ee841715-c690-49fe-bae2-cc405053ae56	325a8c7e-63b2-4666-8cea-9857ff52a568	97b35d2c-aef9-4972-9b45-7906e8651376	t
7efd8ff9-01b2-4278-a7e2-c5bf5996f4d2	719536fd-e77a-48ee-996b-7f67aa2d6ca8	f8f0ca80-71fa-4178-965f-5bd02036af96	79249865-3b02-48a8-9b3c-b76667084192	f
c23ffffa-7f99-41b1-862b-696d68f89c8b	be386a3e-8c00-4d55-bb2e-c6b3b5c657e1	26b22e1b-3995-4eb5-93c0-571e0a1ac771	c953fa98-86ce-45e3-9b0c-80c70eeda14a	t
8d57a201-3e7e-401e-ae81-9a4f71ba31d8	1f180535-c331-4279-be37-efab4416d61e	b88dae8c-efaa-49fb-af67-61bf3a125a15	a8d9983e-087c-49e2-875d-dbd2ea1d0300	t
80759a37-57de-437d-893b-4d73ee8bb3f4	ee841715-c690-49fe-bae2-cc405053ae56	2d4d876d-1723-4798-9d48-9abdb0f7bd09	c953fa98-86ce-45e3-9b0c-80c70eeda14a	f
b7585e86-b8a2-4049-8ea2-7fe6d052e265	1f180535-c331-4279-be37-efab4416d61e	ff48d416-f57a-4d6f-a093-67843328e063	375cdab6-80d6-4b55-9cd8-869006a8f8bd	t
857eb5e9-6a5d-4ee7-8748-20c9bc9f3e3e	719536fd-e77a-48ee-996b-7f67aa2d6ca8	17b7f1ee-19b0-4a3e-9730-9749f1758674	1cec907a-739c-453d-a438-e2e82b2f11e5	t
d611d6e8-108e-409c-95c0-cfee3e96b6cf	1f180535-c331-4279-be37-efab4416d61e	97a4c3e5-1222-4cf7-a81d-c7886605495f	4bac3ce2-ee06-4752-b7c6-790ec35c31dc	f
b57ad2d9-6319-41d8-afa4-aea4d9e6b870	719536fd-e77a-48ee-996b-7f67aa2d6ca8	cba79650-ce51-412f-8699-5dcc3c45046a	97b35d2c-aef9-4972-9b45-7906e8651376	f
18a547e3-5c38-4160-a2f1-18f949eb15f5	35a64eb9-1744-48df-ae8f-4ed38342712e	f5a8d1a9-8832-4e77-8c81-e845c95595fd	278f7b4e-873e-42b0-aaaf-54a4a974f334	t
a1931023-1885-4324-abad-5f89567d34b9	35a64eb9-1744-48df-ae8f-4ed38342712e	bec6bdb0-62c7-4000-a6de-eef9d12dddec	12e2c996-47d4-4652-a73c-80f98454bb7d	f
5420a157-bdae-4e20-8dd4-19eac8f76bc2	1f180535-c331-4279-be37-efab4416d61e	af3aa457-b5d2-4d71-906a-d0125db285fa	bb927ee6-240f-4a01-8b2f-e8ce6aed2cd7	t
cf660839-efaf-4ef5-ab89-43ea45f07c65	35a64eb9-1744-48df-ae8f-4ed38342712e	dbbcd523-a016-4c2b-a418-74550fdc83d7	1cec907a-739c-453d-a438-e2e82b2f11e5	t
1139351a-677f-4ed4-9250-4fa3ec3df67f	be386a3e-8c00-4d55-bb2e-c6b3b5c657e1	19e9eeac-da94-4ec4-96d5-6ea12396c03e	a8d9983e-087c-49e2-875d-dbd2ea1d0300	f
902eafb0-fae4-4608-87fb-518f17bc2df0	35a64eb9-1744-48df-ae8f-4ed38342712e	9a0821bb-58a1-44e5-8d60-ae5093f8b375	375cdab6-80d6-4b55-9cd8-869006a8f8bd	t
f3f1cb80-f9a3-4c5c-9f34-c423e028d2d1	ee841715-c690-49fe-bae2-cc405053ae56	dbbcd523-a016-4c2b-a418-74550fdc83d7	1cec907a-739c-453d-a438-e2e82b2f11e5	t
49433bda-5767-4bc8-9be8-8266984b2563	ee841715-c690-49fe-bae2-cc405053ae56	e98e41e3-9bcb-4c8b-a3a3-f5f27c3734e5	12e2c996-47d4-4652-a73c-80f98454bb7d	t
\.


--
-- Data for Name: avaliacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.avaliacao (id, id_agendamento, numero_estrelas) FROM stdin;
cf4f22e4-3f04-4cc8-8f9e-b4b418f77aba	13b3332d-b52e-46fd-be85-98a06e9e6870	0
14f7c30e-884e-4512-a333-ea24a6fd632b	5e9f1e82-fbe4-4147-8b24-a2011598a377	4
da33c868-e94f-4bb8-88ab-d1fb7c7aa8a7	af22d839-0b2a-44d0-8dd1-cbfba7c4ce3b	4
b1132b44-946a-443a-9d34-2b1f927f64c0	cc2346fe-c9df-49a2-91aa-b593c95764a3	4
919acf09-f750-4fe1-83a6-beaccc3a6fd4	4f9e429e-307a-4765-9563-8f05fec1b6bd	2
c8c9a916-ce88-46de-8b17-659f5e6fadc5	44f3c0e0-d3cb-42ba-916c-4a4a4962cce5	2
96cad880-cddf-4905-a804-905f2a7343e1	aab815bd-26ea-41bc-9193-0fcc77768c72	0
e61411a4-8e1a-487a-b777-e491af9ce849	20cde85f-fc05-473c-935d-dede308f5b17	4
e2d961d3-3839-4db3-83cc-fc5c1170cc6d	8868f0c6-dfdd-48a3-9943-689ccf7888d8	1
40fb3dd2-5d26-4ff7-8645-a9578c0b04c2	af1911df-17db-4ea4-8865-3bd54091bc19	4
518c478d-7e63-4bb6-9f17-de72f858ecad	9ce5e087-23ec-4f72-bf5a-ea237dccbd7f	4
f007124b-3f58-4003-830d-f7e15ff0742f	32a9b503-8db1-4bc5-8f33-9feae2f4737b	1
46882f01-5da5-4222-8419-373855837464	4d767258-efd3-4e3b-a6a8-ef79e457e420	0
0a8cecec-1685-4c8e-9ebe-4f4f54838fb0	f42f9bba-2792-48de-aabc-1e124e4c109b	4
80fb8533-3df3-4a96-bf74-0f5d0c2245a2	7e1b79f1-d514-40c7-a597-a6c7c5549eec	2
f479606e-6812-4250-9874-ee1fa3ec99cc	d90fa2b3-ce86-4911-83bb-3e0d72d6ded9	0
ba94eb1c-e7a2-4b29-a19e-f5fd3d7cd02c	563d4981-da01-4927-9506-6afa7050c354	4
f637eb77-43bc-49e1-baf8-425859c12902	103f24c9-e770-47df-a084-dc1b17180556	4
482cfe76-7b22-450b-b592-406161e53fe6	66100008-447c-4866-9e6f-a8d8127fac50	3
0025f6b5-9d3e-41ff-ba5e-2f1e2dc9f503	880cbac5-add9-4dc0-b16c-8e3dec7ee877	3
936d33b1-0975-493e-ae9c-62527d79c48c	419ddb8b-39b8-4fd7-ac50-da68bbcfb9c5	3
6a25df81-fb01-47f3-99fa-7514337f0cee	fb7449d3-8edf-4a94-90fd-1ece39195cf4	0
0bab2b9f-436d-4453-bc18-4fb3221d2cd3	a89dcde3-0986-43b1-8c29-71fbdf7b6bee	3
8ac262c2-4b26-4810-be9e-256ae5de3c08	72c97c95-9dc1-42c5-b7f3-c65cbbece165	1
6ebe414f-3a36-40f7-9696-c16b51943751	5a67dac3-2dab-4729-ba18-d7862a6c5324	0
ca87ecdd-3f68-4b66-b8d8-ec02e2cf956d	05ca0d6a-8332-4df8-a1f4-c95f9e7813b5	2
6f429d33-88ce-4a08-a7ff-f2b3c3986f1c	67fb141f-f09a-44e2-8ed3-02700fa4832f	1
eb00ad46-3897-4ef1-ae42-ad76920fe844	f611d7b6-bd83-486f-8f02-e46e993aa10d	3
416da6bb-32b6-4084-943a-8512d49b9c3d	aa6d462c-2b27-4719-ab65-f4adca78bc86	0
d8c94bec-2c46-4033-bcd1-4c72806685c4	eccd7a99-7b4b-4172-93ac-a0dd92bb0474	4
425d65f8-e925-45d2-844a-a4019e65553b	b4d4ea11-53b4-474b-b0b9-018bfd1068cf	1
35499053-73e7-458b-b5cd-59b6866f803c	8faa2378-74ed-4771-af15-1ae11a30729c	4
afa27698-d194-4b51-aab8-360fe6f7c21d	e69a0423-7566-4423-9ebf-08dda1835fb1	3
dc6c528c-6406-4674-a486-8bb692e132ec	392eea4f-4e22-43ab-93b8-5c7c4ec723dc	1
c36a6703-f09c-4aaf-8ea1-81b1cac90c5c	a7b58f31-0be7-436c-a3c4-9c60c561b656	3
e25b2186-daf4-442e-ac6a-b266a9b0a504	3defe59e-dffa-4aa9-9bba-efd71c1b81e2	4
da79d8db-70f9-448c-aa29-27d269835113	d5eceeaf-be3c-474f-abb4-bfbc4a2e03aa	2
c93a4c2e-7cdc-4655-a53f-349b1699b577	7fff8a29-0415-4bb4-a021-5800d9061d2f	3
fbbaa886-a264-4966-9bd0-09ae6e13f6c5	2ad7cdb3-f2ed-4a74-8478-9f3aae96cf66	4
d4524d85-784f-4ad1-b637-0251a4c08575	4b8f4ec2-f234-4808-a848-f61baf459ccb	1
43e79ac1-1902-474b-970f-79d328941944	99bd5fb9-3759-49ad-a4e7-ef0a02153dc1	0
f6a13890-2f2e-4e14-ad7c-54a2802fe8be	179e6015-ebf4-4ba0-9248-782ce7ca1f4b	4
a191c4fe-cb4f-4a31-a65c-e567af31d637	a730af3c-3ec4-47ff-99e9-cba05048d5ab	1
271b3ac9-62f3-41b7-958c-aa7efdb621bc	71a5d0b9-9733-4690-a143-4bc90e5aec24	0
4fef1942-9734-467d-b414-cceaed23f0d5	7efd8ff9-01b2-4278-a7e2-c5bf5996f4d2	3
5ed5a348-3dc0-4768-a12e-8367269df4c8	c23ffffa-7f99-41b1-862b-696d68f89c8b	4
e0c64bff-e385-4b37-99ed-eff3f35b31ef	8d57a201-3e7e-401e-ae81-9a4f71ba31d8	1
f663b3d6-7a69-4b5c-9969-2720951e5fb8	80759a37-57de-437d-893b-4d73ee8bb3f4	2
c2f4b227-d431-4ccc-b558-b8989c51ce58	b7585e86-b8a2-4049-8ea2-7fe6d052e265	2
975ad45e-1dc8-4594-9161-d5d5abf00bd2	857eb5e9-6a5d-4ee7-8748-20c9bc9f3e3e	2
840a67eb-260b-4600-9ba6-41794325c624	d611d6e8-108e-409c-95c0-cfee3e96b6cf	3
f37458dc-8d8f-44a1-8573-78bee47e5672	b57ad2d9-6319-41d8-afa4-aea4d9e6b870	2
197b38a2-ff17-4626-b007-66b038eb8821	18a547e3-5c38-4160-a2f1-18f949eb15f5	1
24bee979-3448-4382-98e1-2a55296b56f9	a1931023-1885-4324-abad-5f89567d34b9	1
0da80ad7-1732-46e4-b2d5-8c5032e05b3a	5420a157-bdae-4e20-8dd4-19eac8f76bc2	3
96d0b197-41d1-4be4-b9df-74003b53a904	cf660839-efaf-4ef5-ab89-43ea45f07c65	2
16cd4845-f271-4be4-bd94-5dd37c5def85	1139351a-677f-4ed4-9250-4fa3ec3df67f	0
c6dd020d-0846-42cc-af60-ed223138350c	902eafb0-fae4-4608-87fb-518f17bc2df0	1
55dc9ce1-aca0-49ca-9d36-d9fd91932327	f3f1cb80-f9a3-4c5c-9f34-c423e028d2d1	0
3633d0ca-d624-4f7f-9581-d4aaa8a0282a	49433bda-5767-4bc8-9be8-8266984b2563	2
\.


--
-- Data for Name: bloco_tempo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bloco_tempo (id, id_mentor, inicio, fim) FROM stdin;
4bac3ce2-ee06-4752-b7c6-790ec35c31dc	719536fd-e77a-48ee-996b-7f67aa2d6ca8	2003-08-16 14:49:38+00	2025-11-07 20:14:58+00
c953fa98-86ce-45e3-9b0c-80c70eeda14a	35a64eb9-1744-48df-ae8f-4ed38342712e	2001-03-17 02:10:14+00	2014-07-15 16:41:50+00
79249865-3b02-48a8-9b3c-b76667084192	be386a3e-8c00-4d55-bb2e-c6b3b5c657e1	2002-04-14 09:29:55+00	2003-10-14 22:06:04+00
278f7b4e-873e-42b0-aaaf-54a4a974f334	be386a3e-8c00-4d55-bb2e-c6b3b5c657e1	2018-02-08 16:03:38+00	2019-06-05 22:13:11+00
97b35d2c-aef9-4972-9b45-7906e8651376	1f180535-c331-4279-be37-efab4416d61e	2006-04-11 12:40:36+00	2019-01-27 02:10:18+00
1cec907a-739c-453d-a438-e2e82b2f11e5	ee841715-c690-49fe-bae2-cc405053ae56	2012-05-04 19:32:16+00	2006-08-07 12:58:36+00
a8d9983e-087c-49e2-875d-dbd2ea1d0300	1f180535-c331-4279-be37-efab4416d61e	2012-05-04 19:32:16+00	2012-10-06 15:22:00+00
375cdab6-80d6-4b55-9cd8-869006a8f8bd	be386a3e-8c00-4d55-bb2e-c6b3b5c657e1	2020-05-10 11:51:04+00	2022-02-17 21:35:05+00
bb927ee6-240f-4a01-8b2f-e8ce6aed2cd7	35a64eb9-1744-48df-ae8f-4ed38342712e	2016-08-19 15:47:45+00	2017-07-14 12:06:04+00
12e2c996-47d4-4652-a73c-80f98454bb7d	719536fd-e77a-48ee-996b-7f67aa2d6ca8	2016-02-11 01:27:16+00	2017-01-27 01:55:12+00
\.


--
-- Data for Name: habilidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.habilidades (id, id_usuario, nome) FROM stdin;
0e56e4db-c776-4c22-ad7d-abba43135bb6	ee841715-c690-49fe-bae2-cc405053ae56	dança
43f9603d-5f41-4737-bb16-9fa9329255c9	1f180535-c331-4279-be37-efab4416d61e	comunicacao
0e59d76e-29d4-4545-a0fb-f0f45d479178	719536fd-e77a-48ee-996b-7f67aa2d6ca8	c
d11c48ca-4738-45f3-b853-4229d3572d6a	be386a3e-8c00-4d55-bb2e-c6b3b5c657e1	c
456a3631-a950-4394-a4bb-f6fc1fcfde15	35a64eb9-1744-48df-ae8f-4ed38342712e	dança
89402142-773e-4006-bf54-3499948dcf0d	325a8c7e-63b2-4666-8cea-9857ff52a568	comunicacao
c752cb1a-9d25-40cf-8f4e-69e4adad0eb2	a05da0cd-477d-479f-9d50-e35e1f936cd1	javascript
7f3ebcf6-75aa-426c-9159-e990f5ee4391	9a0821bb-58a1-44e5-8d60-ae5093f8b375	javascript
d1181910-36c9-4026-b5da-6cd76620eedf	be033dac-5f0c-4777-9a71-38526decc958	java
a7231474-4a94-4fef-a472-ab76766b2184	7d4c699c-95ee-4299-86c7-b2be4e9fa6b4	c++
2b08aec3-eff7-4ec1-a1b7-37605cb6d091	a2cd9b1a-bd8b-4422-9eba-1e359e9cc199	c++
0a969b7c-8ae2-469f-8c11-3f08b049bc3a	5083dda0-2834-4c39-9af1-87a5218c8850	c
7ae6c826-b956-4ca4-9ffb-e41968cfe974	3813105b-533c-43cb-bf1c-82207a816dc5	javascript
ccb69d0b-640d-4642-a61e-b5a393fdc798	7f6f5365-ce51-44cb-8908-d4d39cecd0e7	c++
b9138489-a957-465b-b320-5e57b48d0d91	ed6dcb91-ab70-4d20-852e-654d36a5683a	dança
1640edc8-8479-48b8-b323-05cce139d674	127b9448-b596-453b-ba80-7de2012038d6	java
384eaa62-2c84-450a-b6dd-7ae36aa3e546	38f56250-0978-4960-ba6e-4c4f09dde204	futebol
73bf6895-e2b8-4755-8164-3b9e344dc9a1	c66f21e5-23a6-4b4c-a799-cc936f9f863d	c
7ee794ea-0096-4ff3-8035-786e578980fb	b88dae8c-efaa-49fb-af67-61bf3a125a15	futebol
87a39226-6a27-4926-927d-0529d00d15e2	fccb1af4-5d8b-4a60-bba9-6c91562cf933	c++
ecc464ff-1a97-4c79-a759-6f61a9affb20	7f91e792-e10e-418d-a9aa-d7fdf70eb961	comunicacao
d07b8c5b-e28f-4d15-b6c2-7558f3df3deb	54754345-a886-4948-bd48-d1f1c506f0f3	java
e5ffba78-81a3-4e60-8b23-55dc0ccf61fb	b00ecf91-8243-41a3-bf7c-73769624a65b	javascript
96086dbb-e229-4bdf-ad2c-abbb3929c912	9c827a98-d695-4a02-8e01-f0c1987975b2	dança
4d087fa7-8f45-4a3a-b3c3-c24b3b5c95d6	d5f15f46-aa03-4f6f-9b17-a165fdb7f098	comunicacao
29663f30-3a35-457b-9fef-ac2465ecf962	ebde997a-ee55-4002-8d32-cada793985aa	javascript
1c411627-f699-4665-9137-b0930c37aed3	384e85f4-cf23-486f-b9eb-d3668115a6d8	c++
fc8b17dd-690d-4a91-a17d-f1e656ee5156	209c0678-6b6f-4cea-85c0-61e1f945b8c7	c
0334aed2-e186-4e56-8fa2-fffe3954c679	40b783fb-6f6e-4125-b654-a6c22f853297	c
b205eda4-fc5f-40a3-8533-c848741be47e	0b67ce6e-cb80-4563-99b9-2e92f7c0bc99	dança
8c19476e-117c-4d1c-a02b-b20817b9889d	4a284d1c-db52-4d74-8a25-54f0aae23b85	c
f6ebeab9-e62a-4c1e-9104-2e79b406a324	3502f30f-3801-4383-b9aa-1bfa746b9182	futebol
d72b2767-0e46-4a98-a014-6a5a86614f74	a46df483-8af2-480b-ac99-96a4114bf648	javascript
806a61f5-cb92-4d19-b7e8-dd1764d08426	a233ebfd-6e9f-4f02-837e-f3c8832e24be	java
35e384e6-9b9c-4253-a3b5-3159c51c8067	91de3594-3957-408d-b93c-d84c5e50864f	c
a5114734-5773-4db7-987c-85296cf49266	7d5740a4-4a59-4553-be4c-736eed479946	javascript
b7f71e64-3a44-4b55-946e-527211763f65	d405d504-5457-4eea-a8e8-d63ef7e9f3db	c++
c576f2d1-682c-451f-9011-dd3f49b609a0	a3dace08-654c-4243-bbc3-81e3f6751a44	c++
c505ba9d-6cfa-494f-a53f-44b638055d69	1986c8d9-c41f-4303-b5ce-86997c815af2	dança
c929731d-562e-4574-a3c9-bc8e0fa0f6cb	9638cbe1-6fe1-497c-bb04-f3558f750bb7	c++
2c8d64b9-e7c5-4921-959e-b510cc51261e	38f217b9-a57b-4049-9518-b2e4dd2c8e48	javascript
437b31b2-cd45-4705-8ba2-0ad787bcc1e3	de20e905-abd4-49ae-9a48-665b59717781	c++
e420ec4d-f655-434c-915d-4f32fec8964b	e7746110-e755-47fa-bdd1-4999ffc62b5f	videogame
83f3bce1-05bc-4f60-bfbc-6b4d8370ef1b	2d4d876d-1723-4798-9d48-9abdb0f7bd09	dança
179367f5-bbfb-411a-bee4-832e9c18fbe6	f5a8d1a9-8832-4e77-8c81-e845c95595fd	comunicacao
ca7a8439-a855-48ce-93ea-806dda2c2615	9a7ad448-b6b5-492c-be55-9460bbce5505	futebol
2c42ed61-0b39-422d-a171-46a74282421e	96e6e961-ca2e-40b2-a84e-bcdc746beccd	c
7ebc8884-8fdf-4e5b-9572-4e0484c253c8	3f7b4ce9-c219-4b7f-9989-2bf24843583b	comunicacao
60b46785-a9d7-4f8b-bebf-d42f325fd907	a81ca17b-aff3-422f-b7a2-e2e749201446	java
dedab86b-30f2-4c8c-88de-7c5b3e14d20c	ff48d416-f57a-4d6f-a093-67843328e063	c
d5c09e51-1209-493a-9603-13c05f6a4880	17b7f1ee-19b0-4a3e-9730-9749f1758674	comunicacao
186b909d-6dd5-4477-a835-2c630178bf4f	a98c24b3-3300-4efc-9049-0685ee144c70	c++
debae630-ec2d-4ad6-8e64-d16dc52d0984	2ce4de77-10d6-46f8-a4cd-c3511346aa8d	comunicacao
546a68f1-23db-4a95-9088-729783003f95	f60005f4-bc4d-43a6-a1d5-d1e6f0cab4e7	javascript
2bdb2d3d-2124-4c98-ab78-5cee056cd0df	b07dfd1a-a5ee-43d5-8c43-ccd333614c8e	videogame
907841fe-b045-455e-929b-1df0ac53737f	2957199a-cac7-40e2-90f9-aa1e6dc0c7d9	comunicacao
136cba56-7501-4a6e-90da-d05dfde18a20	97a4c3e5-1222-4cf7-a81d-c7886605495f	dança
fbad78e9-79cc-4a59-8cff-e92189f61a98	7184da25-58f1-4fc0-88ac-9ed177ef2c1d	c++
950619ff-9389-4f94-8261-0bcaa321552b	9a886f48-3e87-420a-9ec7-00697978633f	comunicacao
c7832196-a23c-4cdc-a242-3c2cf3eb9b5b	6adef979-eec5-4e13-a15d-700400aaf577	dança
615b10d1-905c-410e-b047-0e7737f01015	19e9eeac-da94-4ec4-96d5-6ea12396c03e	videogame
f9beab3e-959e-45f1-8445-8fe82e7c6321	c0918470-2662-4fa0-8c9a-f94f3a5f098e	javascript
75fdb062-1e72-4d3f-81f4-29fc9d465715	cdfa18a3-61cc-47e6-81fc-ae1493768b89	java
71bee0f3-8378-4ba9-9c35-7fcb51905a31	c56b9bd6-164a-4f36-af34-3fc9cd169840	c
20bf0738-8ec2-42d5-bfe2-e8903686111b	a8b7006d-2460-42a7-88f1-1c5a96d47b04	dança
7ac4664b-c5aa-4b6d-85ec-359db4c5d47c	96bcdd3f-7534-4285-84d7-a63b0b2a1597	videogame
d9007524-eb8f-4735-b370-57a269eacfcf	8191a0a3-d418-426f-9855-b8b213321e59	futebol
afa0b3ed-8c4a-4c54-b4b0-876e17fe5d80	4d065862-fb79-4237-8122-dcbddb295f14	c
2f008fa9-d7e9-45f1-aa15-31b443d0d59e	0ee551e8-976c-4e26-b8aa-a9d02273e446	futebol
2233bba3-1e7a-4225-8a0a-f4bea0940f62	d187c679-16f3-4c56-aae6-dfcec6565c17	c++
e7668765-d317-4d47-a61b-03533e56f7ad	a73586cf-e789-4cd0-bd80-88ac44849efe	futebol
7e903a8d-a511-493c-a654-6633e1ef3f9a	dfa9af26-ea9b-47f4-b012-e50714ec0c7c	dança
0d046640-613a-40ae-b645-2fc96534ce71	d3c2d21c-5467-4be4-b216-bb9be9a21423	javascript
f20ba0dc-38fe-4630-9f51-ed5243abf087	3e662d70-4921-4a25-8520-b995d5610f76	futebol
c270fa21-0154-4d70-90ef-00d8c679d0c7	f131075b-01fa-479b-a015-9a82dc44d2b9	javascript
b9a8c9f5-4f06-4fe8-a517-b85e0dd787ee	da303c9e-68b9-43a9-ad64-ff61412f6880	videogame
66254893-dd42-4ec1-9207-f4a4d8e00590	c3699bc4-623e-48f2-81be-16e3f8a82680	c
a35e8391-0815-4490-9a1a-b9cd3b04dbda	91fa7e32-389b-4793-9d18-8cc9fcab5b0a	comunicacao
32442ea5-5b35-420f-8f2d-2b5a4d68fd90	a518bbf6-ec3b-4eee-ad58-0989f2f3b6b0	javascript
c5d1853f-4ef5-4ab1-83a8-61dec8204cd3	7995f239-b288-4cbd-8274-06035dc0a9db	dança
2032e490-a237-4760-b49d-b1b041d5a854	4b4e4bbe-e5c4-488e-8096-e6f79fb407be	java
72b19222-7b5c-4f2d-a510-ab9573335a58	c5c8f3c6-bd3e-4aa2-9bf8-0b0840ab2bc5	java
46cd36bc-5043-4dbd-a991-69994679c923	209bc93a-66a0-49b6-9061-a8b9695021c7	javascript
83d44910-3fa0-4992-bae0-3886b721187c	c4398548-52ac-4a2f-9f98-2409205a5fa3	javascript
fdb0fed1-139d-4222-97be-d5f604f64a71	cba79650-ce51-412f-8699-5dcc3c45046a	futebol
368ebc12-f579-453c-9f29-fc583c91142d	6aef14dd-b368-401a-9fce-890217431027	java
96d4dbd2-a05e-4388-8064-efa691015d3d	424b2c44-92ed-495e-8563-e62b8c376f7f	dança
21440304-c7e3-4b02-8b4e-f5306c6609e8	8cd7346a-f236-4b22-b699-371a34d90cde	videogame
da4c1761-3b20-40f7-bda1-ae8400fb9a9e	7a4ea5fe-d6ad-4ed1-bd1b-f4c8fa88c941	videogame
438a1b96-44e6-4dfa-97dc-90a165b567ef	66a28927-a104-4e36-893c-310d9153e7d5	java
006542bf-2237-4bfd-81c4-660c80aeaeb1	26b22e1b-3995-4eb5-93c0-571e0a1ac771	java
2daa6531-4963-4f7e-9235-0599316f03ae	2155b820-7f06-4ba2-a148-6e654f803e01	c++
16be2ddf-933c-47a7-9bd9-e03aad142ba5	e98e41e3-9bcb-4c8b-a3a3-f5f27c3734e5	javascript
ce7c51f5-e87d-476f-ae68-6920c7e09382	dbbcd523-a016-4c2b-a418-74550fdc83d7	dança
396b275b-91b9-4593-aed8-fb4e9db8d084	4f6a93c7-9848-4c3c-9c0b-51dd5cf84efd	dança
af091c43-2b93-43e1-9bd4-3fd8b89d40ed	a6a04e96-b82b-4d7d-af25-06b149715ace	comunicacao
c079b81f-5c06-4248-99ff-21bf1428fc7a	af3aa457-b5d2-4d71-906a-d0125db285fa	java
e766fe65-6c42-4ac7-94e4-47c1ee3e26c6	4d3f62b8-f034-4ef3-bdc7-6d41f06beb7e	javascript
31e2ecc2-743b-4ec7-8e1a-8cb4f5d18f45	b78d9575-ecfa-4390-b2bd-00436c17042d	futebol
54a19083-7044-4519-aa89-87eabbad800b	e1b63476-7294-405a-a3f9-6c6814d64026	futebol
f18cba24-5c38-45e3-a3d2-1fbffbaabca2	11f9e802-505a-47a8-ade0-268a50604924	futebol
b023ed15-1c25-4657-aa52-a40ae002bf36	f8f0ca80-71fa-4178-965f-5bd02036af96	videogame
1c472524-2703-4b2c-83c3-3c3e31e06a66	46316e76-fc22-4899-840e-b4d87afa4906	videogame
7543a6e6-26ad-4df6-a0cb-3a0c5793f7c1	b36ff96e-fe2b-4112-bacd-c0fbc36fa740	comunicacao
5a45d04a-2e8b-420f-9f08-e6d19baa6dac	bec6bdb0-62c7-4000-a6de-eef9d12dddec	c++
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, tipo, email, senha, nome, nascimento) FROM stdin;
ee841715-c690-49fe-bae2-cc405053ae56	MENTOR	Karim@gmail.com	8q6m24ubd3	Yassin Ross	2005-11-23 15:29:30
1f180535-c331-4279-be37-efab4416d61e	MENTOR	Ali@hotmail.com	56ww29u4m3	Abdallah Chavez	2023-09-03 08:50:12
719536fd-e77a-48ee-996b-7f67aa2d6ca8	MENTOR	Ibrahim@gmail.com	j57aln6wou	Halim Myers	2022-08-09 02:16:41
be386a3e-8c00-4d55-bb2e-c6b3b5c657e1	MENTOR	Omar@hotmail.com	w3u71hwjip	Omar Kelly	2020-01-11 07:23:48
35a64eb9-1744-48df-ae8f-4ed38342712e	MENTOR	Bilal@gmail.com	3t6o1eanst	Ahmed Morgan	2017-11-20 04:55:54
325a8c7e-63b2-4666-8cea-9857ff52a568	MENTORADO	Ali@hotmail.com	ny2in948fx	Ahmed Morgan	2011-07-04 11:27:04
a05da0cd-477d-479f-9d50-e35e1f936cd1	MENTORADO	Yassin@hotmail.com	ghuar9e0b7	Abdallah Bennet	2020-08-18 07:44:46
9a0821bb-58a1-44e5-8d60-ae5093f8b375	MENTORADO	Halim@org.com	0etd2y3nph	Abdallah Collins	2023-03-07 19:04:54
be033dac-5f0c-4777-9a71-38526decc958	MENTORADO	Omar@ufba.com	lskocxyhv8	Selim Morgan	2012-05-04 19:32:16
7d4c699c-95ee-4299-86c7-b2be4e9fa6b4	MENTORADO	Ahmed@hotmail.com	lg0rw29kru	Mustafa Murphy	2005-06-24 11:48:04
a2cd9b1a-bd8b-4422-9eba-1e359e9cc199	MENTORADO	Taha@ufba.com	ljugagebjx	Ali Bailey	2002-10-22 11:57:54
5083dda0-2834-4c39-9af1-87a5218c8850	MENTORADO	Yassin@ufba.com	fhfwy8p7hp	Ibrahim Diaz	2015-01-23 18:29:16
3813105b-533c-43cb-bf1c-82207a816dc5	MENTORADO	Bilal@hotmail.com	d9zeq576dr	Ibrahim Rogers	2021-11-03 13:23:17
7f6f5365-ce51-44cb-8908-d4d39cecd0e7	MENTORADO	Yassin@org.com	447fio35kc	Murad Price	2008-10-12 04:21:25
ed6dcb91-ab70-4d20-852e-654d36a5683a	MENTORADO	Hussein@hotmail.com	68j88r76oi	Omar Wood	2002-01-18 20:13:09
127b9448-b596-453b-ba80-7de2012038d6	MENTORADO	Ali@hotmail.com	j48hwpdv66	Mohamed Ross	2001-01-09 15:08:40
38f56250-0978-4960-ba6e-4c4f09dde204	MENTORADO	Hassan@gmail.com	xrgrjoldam	Omar Howard	2012-05-04 19:32:16
c66f21e5-23a6-4b4c-a799-cc936f9f863d	MENTORADO	Selim@hotmail.com	syftge6mlq	Ali Ruiz	2012-05-04 19:32:16
b88dae8c-efaa-49fb-af67-61bf3a125a15	MENTORADO	NaN@hotmail.com	9itbtwvuhs	Abdallah Bennet	2014-01-15 17:14:31
fccb1af4-5d8b-4a60-bba9-6c91562cf933	MENTORADO	Hamza@org.com	qwgofwmoyz	Halim Ramos	2014-09-17 17:20:18
7f91e792-e10e-418d-a9aa-d7fdf70eb961	MENTORADO	Mohamed@hotmail.com	j20agxlhy1	Bilal Castillo	2024-02-19 19:25:24
54754345-a886-4948-bd48-d1f1c506f0f3	MENTORADO	Omar@org.com	wyfy22jjv7	Mahmoud Mendoza	2002-07-26 12:53:33
b00ecf91-8243-41a3-bf7c-73769624a65b	MENTORADO	Khaled@ufba.com	l5d70mace6	Selim Ruiz	2008-06-11 05:39:02
9c827a98-d695-4a02-8e01-f0c1987975b2	MENTORADO	Mohamed@hotmail.com	mr5esrw6hg	Tareq Wood	2012-05-04 19:32:16
d5f15f46-aa03-4f6f-9b17-a165fdb7f098	MENTORADO	Halim@gmail.com	0qlj529l0j	Tareq Hughes	2001-01-02 13:04:37
ebde997a-ee55-4002-8d32-cada793985aa	MENTORADO	Murad@org.com	adpzr8a3pw	Omar Sanders	2003-09-07 22:48:39
384e85f4-cf23-486f-b9eb-d3668115a6d8	MENTORADO	Tareq@ufba.com	yu5pnzphbt	Mustafa Ortiz	2014-06-20 04:19:27
209c0678-6b6f-4cea-85c0-61e1f945b8c7	MENTORADO	Mustafa@gmail.com	sj8ckwhnu6	Ali Parker	2014-08-12 02:40:34
40b783fb-6f6e-4125-b654-a6c22f853297	MENTORADO	Selim@hotmail.com	3ma94o22l3	Yassin Morris	2010-01-03 17:48:15
0b67ce6e-cb80-4563-99b9-2e92f7c0bc99	MENTORADO	NaN@gmail.com	rmw8y1hnh2	Hassan Diaz	2022-01-23 00:40:49
4a284d1c-db52-4d74-8a25-54f0aae23b85	MENTORADO	Youssef@gmail.com	sqe2tr2ath	NaN Kim	2021-08-06 04:08:11
3502f30f-3801-4383-b9aa-1bfa746b9182	MENTORADO	Ibrahim@hotmail.com	pnkerhtxtg	Bilal Welsh	2022-07-08 17:06:37
a46df483-8af2-480b-ac99-96a4114bf648	MENTORADO	Bilal@ufba.com	tqzlkyaypz	NaN Murphy	2013-04-03 17:40:16
a233ebfd-6e9f-4f02-837e-f3c8832e24be	MENTORADO	Tareq@org.com	kg7t83ljkd	Ibrahim Murphy	2024-01-11 16:03:16
91de3594-3957-408d-b93c-d84c5e50864f	MENTORADO	Omar@gmail.com	x2ml6w396a	Abdallah Parker	2012-01-18 13:36:19
7d5740a4-4a59-4553-be4c-736eed479946	MENTORADO	Mahmoud@org.com	7tst1y74q2	Murad Ward	2013-05-11 21:15:04
d405d504-5457-4eea-a8e8-d63ef7e9f3db	MENTORADO	Hassan@hotmail.com	cgxeeyc0va	Ahmed Richardson	2010-10-26 08:17:09
a3dace08-654c-4243-bbc3-81e3f6751a44	MENTORADO	Youssef@gmail.com	k671x8jnz2	Ibrahim Reed	2012-05-04 19:32:16
1986c8d9-c41f-4303-b5ce-86997c815af2	MENTORADO	Ibrahim@org.com	8mfwn2cr3s	Hussein Morales	2021-10-06 12:43:00
9638cbe1-6fe1-497c-bb04-f3558f750bb7	MENTORADO	NaN@hotmail.com	kqeo0q6vrp	Halim Wood	2012-05-04 19:32:16
38f217b9-a57b-4049-9518-b2e4dd2c8e48	MENTORADO	Hamza@org.com	3flkop5qwq	Murad Ortiz	2019-06-15 20:28:02
de20e905-abd4-49ae-9a48-665b59717781	MENTORADO	Khaled@hotmail.com	2hcvq4qlsa	Abdallah Collins	2005-02-07 18:45:09
e7746110-e755-47fa-bdd1-4999ffc62b5f	MENTORADO	Youssef@org.com	b3gv8ofvx5	Abdallah Myers	2006-02-26 05:53:16
2d4d876d-1723-4798-9d48-9abdb0f7bd09	MENTORADO	Taha@org.com	68l6ych2zb	Hussein Ross	2007-03-18 13:35:55
f5a8d1a9-8832-4e77-8c81-e845c95595fd	MENTORADO	Murad@org.com	vm89648e59	Khaled James	2012-11-25 03:26:36
9a7ad448-b6b5-492c-be55-9460bbce5505	MENTORADO	Youssef@gmail.com	55bvm94n9c	NaN James	2008-07-08 00:32:53
96e6e961-ca2e-40b2-a84e-bcdc746beccd	MENTORADO	Khaled@hotmail.com	8tkd0koccc	Mahmoud Cook	2023-04-19 16:13:26
3f7b4ce9-c219-4b7f-9989-2bf24843583b	MENTORADO	NaN@gmail.com	mq1ilmgu7v	Omar Bennet	2023-02-03 21:49:55
a81ca17b-aff3-422f-b7a2-e2e749201446	MENTORADO	Hamza@org.com	37mtcqjh15	Mahmoud James	2004-06-06 12:40:35
ff48d416-f57a-4d6f-a093-67843328e063	MENTORADO	Hassan@gmail.com	izwcnod5we	Hamza Price	2015-08-09 01:46:52
17b7f1ee-19b0-4a3e-9730-9749f1758674	MENTORADO	Selim@ufba.com	vdfla3hme2	Ibrahim Myers	2003-03-10 00:50:43
a98c24b3-3300-4efc-9049-0685ee144c70	MENTORADO	NaN@hotmail.com	52adoh9uep	Hamza Gutierrez	2003-11-04 17:18:33
2ce4de77-10d6-46f8-a4cd-c3511346aa8d	MENTORADO	Selim@gmail.com	vw7ng0kkfq	Hamza Chavez	2008-11-08 20:32:05
f60005f4-bc4d-43a6-a1d5-d1e6f0cab4e7	MENTORADO	Halim@org.com	fj9knuujca	Yassin Brooks	2020-06-01 10:45:16
b07dfd1a-a5ee-43d5-8c43-ccd333614c8e	MENTORADO	Karim@org.com	3dv0byidn4	Bilal Wood	2009-09-25 09:30:22
2957199a-cac7-40e2-90f9-aa1e6dc0c7d9	MENTORADO	Selim@gmail.com	y1uls6264p	Tareq Morales	2022-07-06 02:36:46
97a4c3e5-1222-4cf7-a81d-c7886605495f	MENTORADO	Hassan@gmail.com	gkclwyubfa	Mahmoud Gutierrez	2022-02-09 01:15:48
7184da25-58f1-4fc0-88ac-9ed177ef2c1d	MENTORADO	Ali@org.com	4elv483gad	Mahmoud Howard	2013-01-13 00:49:28
9a886f48-3e87-420a-9ec7-00697978633f	MENTORADO	Halim@ufba.com	kfl64m3ljv	Khaled Bennet	2022-11-09 21:27:38
6adef979-eec5-4e13-a15d-700400aaf577	MENTORADO	Selim@ufba.com	tpyncq3ru8	Selim Patel	2004-08-15 02:43:23
19e9eeac-da94-4ec4-96d5-6ea12396c03e	MENTORADO	Ali@ufba.com	l6x5g9gwgv	Omar Stewart	2012-05-04 19:32:16
c0918470-2662-4fa0-8c9a-f94f3a5f098e	MENTORADO	NaN@hotmail.com	xmf8r09p59	Omar Brooks	2000-01-21 21:29:33
cdfa18a3-61cc-47e6-81fc-ae1493768b89	MENTORADO	Ibrahim@ufba.com	uj3lbg55vt	Ahmed Mendoza	2015-07-16 02:55:08
c56b9bd6-164a-4f36-af34-3fc9cd169840	MENTORADO	Halim@hotmail.com	mks33o1v6d	Bilal Watson	2015-08-11 15:12:51
a8b7006d-2460-42a7-88f1-1c5a96d47b04	MENTORADO	Yassin@gmail.com	28gnk11k72	Khaled Reed	2007-01-09 01:20:21
96bcdd3f-7534-4285-84d7-a63b0b2a1597	MENTORADO	Ibrahim@org.com	6wnc5f6083	Karim Mendoza	2012-05-04 19:32:16
8191a0a3-d418-426f-9855-b8b213321e59	MENTORADO	Hamza@ufba.com	bns9emt5h2	Hassan Hughes	2022-07-11 21:47:09
4d065862-fb79-4237-8122-dcbddb295f14	MENTORADO	Ahmed@gmail.com	d9gorabbpu	Abdallah Welsh	2018-07-15 17:10:19
0ee551e8-976c-4e26-b8aa-a9d02273e446	MENTORADO	Hassan@hotmail.com	k5k6ba1ugv	Ahmed Cox	2006-11-25 04:09:13
d187c679-16f3-4c56-aae6-dfcec6565c17	MENTORADO	Tareq@org.com	vfm3ji99ic	Mohamed Cruz	2012-05-04 19:32:16
a73586cf-e789-4cd0-bd80-88ac44849efe	MENTORADO	Omar@hotmail.com	qv58pql1l9	Yassin Ramos	2012-03-15 15:10:15
dfa9af26-ea9b-47f4-b012-e50714ec0c7c	MENTORADO	Karim@ufba.com	ptkwudm7pl	Bilal Edwards	2003-06-20 17:48:42
d3c2d21c-5467-4be4-b216-bb9be9a21423	MENTORADO	Murad@org.com	yk1p3f6wwj	Murad Peterson	2010-06-26 08:37:18
3e662d70-4921-4a25-8520-b995d5610f76	MENTORADO	Bilal@org.com	2s119miipg	Hassan Collins	2004-09-19 01:01:00
f131075b-01fa-479b-a015-9a82dc44d2b9	MENTORADO	Bilal@hotmail.com	5gzkt0neo9	Murad Parker	2007-08-01 02:16:52
da303c9e-68b9-43a9-ad64-ff61412f6880	MENTORADO	Ali@org.com	0o8jphmcso	Murad Reyes	2011-05-16 01:46:57
c3699bc4-623e-48f2-81be-16e3f8a82680	MENTORADO	Mohamed@hotmail.com	fnf05mc3vt	NaN Ortiz	2002-04-06 20:43:48
91fa7e32-389b-4793-9d18-8cc9fcab5b0a	MENTORADO	Bilal@hotmail.com	rqfbwg3qqb	Mahmoud Reed	2012-03-13 02:32:53
a518bbf6-ec3b-4eee-ad58-0989f2f3b6b0	MENTORADO	Youssef@ufba.com	4bpppksz8n	Hassan Collins	2009-04-17 02:40:07
7995f239-b288-4cbd-8274-06035dc0a9db	MENTORADO	Ali@org.com	l4rz5ls2g4	Youssef Gray	2012-05-14 03:58:16
4b4e4bbe-e5c4-488e-8096-e6f79fb407be	MENTORADO	Youssef@hotmail.com	sfzbujy59s	Omar Stewart	2021-01-08 09:35:25
c5c8f3c6-bd3e-4aa2-9bf8-0b0840ab2bc5	MENTORADO	Ahmed@hotmail.com	xqfjoc6ema	Mustafa Brooks	2012-05-04 19:32:16
209bc93a-66a0-49b6-9061-a8b9695021c7	MENTORADO	Bilal@hotmail.com	w5l9h8mtx6	Selim Sanders	2015-01-03 04:38:25
c4398548-52ac-4a2f-9f98-2409205a5fa3	MENTORADO	Ahmed@hotmail.com	u27l8koxzd	Mohamed Howard	2018-10-17 07:35:13
cba79650-ce51-412f-8699-5dcc3c45046a	MENTORADO	Ahmed@ufba.com	9r1t4uum57	Bilal Howard	2004-05-01 00:15:32
6aef14dd-b368-401a-9fce-890217431027	MENTORADO	Omar@hotmail.com	5nca1apa32	Taha Ruiz	2007-09-03 08:09:35
424b2c44-92ed-495e-8563-e62b8c376f7f	MENTORADO	Ali@hotmail.com	an84my61h5	Murad Ross	2002-09-02 16:57:00
8cd7346a-f236-4b22-b699-371a34d90cde	MENTORADO	Halim@ufba.com	x6q09npscp	Karim Welsh	2019-01-05 02:55:51
7a4ea5fe-d6ad-4ed1-bd1b-f4c8fa88c941	MENTORADO	Mahmoud@gmail.com	k0pg5l393p	Hassan Cook	2003-02-23 03:31:37
66a28927-a104-4e36-893c-310d9153e7d5	MENTORADO	Hamza@hotmail.com	dleu9qmd6r	Hamza Collins	2010-09-17 00:58:27
26b22e1b-3995-4eb5-93c0-571e0a1ac771	MENTORADO	Ali@ufba.com	8ptt58ii37	NaN Diaz	2014-06-04 21:27:38
2155b820-7f06-4ba2-a148-6e654f803e01	MENTORADO	Tareq@org.com	ewnnpj82bx	Selim Cook	2004-05-22 21:27:07
e98e41e3-9bcb-4c8b-a3a3-f5f27c3734e5	MENTORADO	Mahmoud@org.com	472fq7gtmd	Hussein Mendoza	2005-11-14 18:33:48
dbbcd523-a016-4c2b-a418-74550fdc83d7	MENTORADO	Halim@gmail.com	dg08fgqsta	Bilal Gray	2022-03-02 18:22:34
4f6a93c7-9848-4c3c-9c0b-51dd5cf84efd	MENTORADO	Mustafa@gmail.com	nt6ttp5mfs	Mahmoud Bennet	2012-03-02 04:02:46
a6a04e96-b82b-4d7d-af25-06b149715ace	MENTORADO	Hussein@ufba.com	sn378vgl6k	Taha Myers	2012-05-04 19:32:16
af3aa457-b5d2-4d71-906a-d0125db285fa	MENTORADO	Mustafa@gmail.com	eu5p4jy947	Hussein Morales	2006-09-20 04:07:15
4d3f62b8-f034-4ef3-bdc7-6d41f06beb7e	MENTORADO	Yassin@gmail.com	wm9vw25ubh	Halim Rogers	2007-08-22 11:54:22
b78d9575-ecfa-4390-b2bd-00436c17042d	MENTORADO	Mohamed@org.com	gyjj4cdx6s	Bilal Cook	2005-08-09 12:29:32
e1b63476-7294-405a-a3f9-6c6814d64026	MENTORADO	Hamza@ufba.com	nak813fdhz	Tareq Stewart	2014-05-20 12:26:02
11f9e802-505a-47a8-ade0-268a50604924	MENTORADO	Hamza@gmail.com	64bs71k2qd	Tareq Howard	2012-08-18 12:26:12
f8f0ca80-71fa-4178-965f-5bd02036af96	MENTORADO	Halim@ufba.com	u334wehhmd	Yassin Kelly	2012-08-07 02:11:21
46316e76-fc22-4899-840e-b4d87afa4906	MENTORADO	Yassin@hotmail.com	qt3tb1yzy4	Abdallah Price	2018-11-10 09:09:25
b36ff96e-fe2b-4112-bacd-c0fbc36fa740	MENTORADO	NaN@hotmail.com	ojldc184ru	Murad Parker	2019-02-10 18:40:00
bec6bdb0-62c7-4000-a6de-eef9d12dddec	MENTORADO	Taha@gmail.com	y34g0waekm	Yassin Ross	2012-05-04 19:32:16
\.


--
-- Name: agendamento agendamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agendamento
    ADD CONSTRAINT agendamento_pkey PRIMARY KEY (id);


--
-- Name: avaliacao avaliacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacao
    ADD CONSTRAINT avaliacao_pkey PRIMARY KEY (id);


--
-- Name: bloco_tempo bloco_tempo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bloco_tempo
    ADD CONSTRAINT bloco_tempo_pkey PRIMARY KEY (id);


--
-- Name: habilidades habilidades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habilidades
    ADD CONSTRAINT habilidades_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: agendamento_nao_concluido_com_horario_de_tempo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX agendamento_nao_concluido_com_horario_de_tempo ON public.agendamento USING btree (id) WHERE ((concluido = false) AND (id_bloco_tempo IS NOT NULL));


--
-- Name: avaliacao_sessao; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX avaliacao_sessao ON public.avaliacao USING btree (id) WHERE (id_agendamento IS NOT NULL);


--
-- Name: habilidade_usuario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX habilidade_usuario ON public.habilidades USING btree (id);


--
-- Name: usuario_mentor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX usuario_mentor ON public.usuarios USING btree (id) WHERE (tipo = 'MENTOR'::public.tipo_perfil);


--
-- Name: avaliacao fk_agendamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacao
    ADD CONSTRAINT fk_agendamento FOREIGN KEY (id_agendamento) REFERENCES public.agendamento(id);


--
-- Name: agendamento fk_bloco_de_tempo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agendamento
    ADD CONSTRAINT fk_bloco_de_tempo FOREIGN KEY (id_bloco_tempo) REFERENCES public.bloco_tempo(id);


--
-- Name: bloco_tempo fk_mentor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bloco_tempo
    ADD CONSTRAINT fk_mentor FOREIGN KEY (id_mentor) REFERENCES public.usuarios(id);


--
-- Name: agendamento fk_mentor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agendamento
    ADD CONSTRAINT fk_mentor FOREIGN KEY (id_mentor) REFERENCES public.usuarios(id);


--
-- Name: agendamento fk_mentorado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agendamento
    ADD CONSTRAINT fk_mentorado FOREIGN KEY (id_mentorado) REFERENCES public.usuarios(id);


--
-- Name: habilidades fk_usuarios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habilidades
    ADD CONSTRAINT fk_usuarios FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

