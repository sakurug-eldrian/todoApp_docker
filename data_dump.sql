failed to get console mode for stdout: The handle is invalid.
--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE todo_db;




--
-- Drop roles
--

DROP ROLE postgres;
DROP ROLE todo_user;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:H9AIuYA5YgM1/CV8jUFw1g==$C9bH1Xn0qY9KHyV/VF7dGAPPiAkQiGZd60iJFcpdj4k=:As8q6kbWB2OfzVNoFBDsKFy+3sZWwYny+ZCjKEkBtqw=';
CREATE ROLE todo_user;
ALTER ROLE todo_user WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:hnpn/ZUg5Pui9uzYH4aRCw==$jgySX75uLO3tkt7+RGZcSe5gEVv+Xd3jR8HBMYd9fm8=:KI44Q9P/M2i8wdYBq8Ock3u64968NuiEytZL4+T00iU=';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.10 (Debian 14.10-1.pgdg120+1)
-- Dumped by pg_dump version 14.10 (Debian 14.10-1.pgdg120+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.10 (Debian 14.10-1.pgdg120+1)
-- Dumped by pg_dump version 14.10 (Debian 14.10-1.pgdg120+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- PostgreSQL database dump complete
--

--
-- Database "todo_db" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.10 (Debian 14.10-1.pgdg120+1)
-- Dumped by pg_dump version 14.10 (Debian 14.10-1.pgdg120+1)

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
-- Name: todo_db; Type: DATABASE; Schema: -; Owner: todo_user
--

CREATE DATABASE todo_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE todo_db OWNER TO todo_user;

\connect todo_db

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
-- Name: todo_items; Type: TABLE; Schema: public; Owner: todo_user
--

CREATE TABLE public.todo_items (
    id integer NOT NULL,
    title character varying(40),
    done_flg numeric(1,0) DEFAULT 0,
    time_limit date
);


ALTER TABLE public.todo_items OWNER TO todo_user;

--
-- Name: todo_items_id_seq; Type: SEQUENCE; Schema: public; Owner: todo_user
--

CREATE SEQUENCE public.todo_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.todo_items_id_seq OWNER TO todo_user;

--
-- Name: todo_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: todo_user
--

ALTER SEQUENCE public.todo_items_id_seq OWNED BY public.todo_items.id;


--
-- Name: todo_items id; Type: DEFAULT; Schema: public; Owner: todo_user
--

ALTER TABLE ONLY public.todo_items ALTER COLUMN id SET DEFAULT nextval('public.todo_items_id_seq'::regclass);


--
-- Data for Name: todo_items; Type: TABLE DATA; Schema: public; Owner: todo_user
--

COPY public.todo_items (id, title, done_flg, time_limit) FROM stdin;
4	Test Data 1	0	2024-02-01
6	Test Data 2	0	2024-02-02
7	Test Data 3	1	0001-01-01 BC
\.


--
-- Name: todo_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: todo_user
--

SELECT pg_catalog.setval('public.todo_items_id_seq', 7, true);


--
-- Name: todo_items todo_items_pkey; Type: CONSTRAINT; Schema: public; Owner: todo_user
--

ALTER TABLE ONLY public.todo_items
    ADD CONSTRAINT todo_items_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

