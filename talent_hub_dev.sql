--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: finance_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.finance_client (
    id integer NOT NULL,
    type integer NOT NULL,
    full_name character varying(50) NOT NULL,
    company_name character varying(100),
    started_at date NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.finance_client OWNER TO postgres;

--
-- Name: finance_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.finance_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.finance_client_id_seq OWNER TO postgres;

--
-- Name: finance_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.finance_client_id_seq OWNED BY public.finance_client.id;


--
-- Name: finance_financialrequest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.finance_financialrequest (
    id integer NOT NULL,
    type integer NOT NULL,
    status integer NOT NULL,
    amount double precision,
    requested_at timestamp with time zone NOT NULL,
    counter_party_type_id integer NOT NULL,
    counter_party_id integer NOT NULL,
    project_id integer,
    requester_id integer NOT NULL,
    description text,
    CONSTRAINT finance_financialrequest_counter_party_id_cb1a779e_check CHECK ((counter_party_id >= 0))
);


ALTER TABLE public.finance_financialrequest OWNER TO postgres;

--
-- Name: finance_financialrequest_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.finance_financialrequest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.finance_financialrequest_id_seq OWNER TO postgres;

--
-- Name: finance_financialrequest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.finance_financialrequest_id_seq OWNED BY public.finance_financialrequest.id;


--
-- Name: finance_partner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.finance_partner (
    id integer NOT NULL,
    full_name character varying(50) NOT NULL,
    email character varying(254) NOT NULL,
    address character varying(200),
    dob date,
    phone_num character varying(50),
    contact_method text NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.finance_partner OWNER TO postgres;

--
-- Name: finance_partner_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.finance_partner_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.finance_partner_id_seq OWNER TO postgres;

--
-- Name: finance_partner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.finance_partner_id_seq OWNED BY public.finance_partner.id;


--
-- Name: finance_project; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.finance_project (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    type integer NOT NULL,
    price double precision,
    started_at date,
    ended_at date,
    status integer NOT NULL,
    client_id integer NOT NULL,
    project_starter_id integer NOT NULL,
    weakly_limit integer
);


ALTER TABLE public.finance_project OWNER TO postgres;

--
-- Name: finance_project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.finance_project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.finance_project_id_seq OWNER TO postgres;

--
-- Name: finance_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.finance_project_id_seq OWNED BY public.finance_project.id;


--
-- Name: finance_project_participants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.finance_project_participants (
    id integer NOT NULL,
    project_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.finance_project_participants OWNER TO postgres;

--
-- Name: finance_project_participants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.finance_project_participants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.finance_project_participants_id_seq OWNER TO postgres;

--
-- Name: finance_project_participants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.finance_project_participants_id_seq OWNED BY public.finance_project_participants.id;


--
-- Name: finance_transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.finance_transaction (
    id integer NOT NULL,
    description text,
    created_at timestamp with time zone NOT NULL,
    gross_amount double precision NOT NULL,
    net_amount double precision NOT NULL,
    payment_platform character varying(10) NOT NULL,
    financial_request_id integer NOT NULL
);


ALTER TABLE public.finance_transaction OWNER TO postgres;

--
-- Name: finance_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.finance_transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.finance_transaction_id_seq OWNER TO postgres;

--
-- Name: finance_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.finance_transaction_id_seq OWNED BY public.finance_transaction.id;


--
-- Name: user_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_account (
    id integer NOT NULL,
    platform_type character varying(30) NOT NULL,
    password character varying(50) NOT NULL,
    location character varying(200) NOT NULL,
    recovery_email character varying(254) NOT NULL,
    url character varying(200) NOT NULL,
    profile_id integer NOT NULL,
    email character varying(254)
);


ALTER TABLE public.user_account OWNER TO postgres;

--
-- Name: user_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_account_id_seq OWNER TO postgres;

--
-- Name: user_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_account_id_seq OWNED BY public.user_account.id;


--
-- Name: user_accountsecurityqa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_accountsecurityqa (
    id integer NOT NULL,
    question character varying(200) NOT NULL,
    answer character varying(200) NOT NULL,
    account_id integer NOT NULL
);


ALTER TABLE public.user_accountsecurityqa OWNER TO postgres;

--
-- Name: user_accountsecurityqa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_accountsecurityqa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_accountsecurityqa_id_seq OWNER TO postgres;

--
-- Name: user_accountsecurityqa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_accountsecurityqa_id_seq OWNED BY public.user_accountsecurityqa.id;


--
-- Name: user_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_profile (
    id integer NOT NULL,
    profile_type integer NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    address character varying(200),
    country character varying(50) NOT NULL,
    dob date,
    gender integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.user_profile OWNER TO postgres;

--
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_profile_id_seq OWNER TO postgres;

--
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_profile_id_seq OWNED BY public.user_profile.id;


--
-- Name: user_team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_team (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.user_team OWNER TO postgres;

--
-- Name: user_team_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_team_id_seq OWNER TO postgres;

--
-- Name: user_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_team_id_seq OWNED BY public.user_team.id;


--
-- Name: user_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    role integer NOT NULL,
    team_id integer
);


ALTER TABLE public.user_user OWNER TO postgres;

--
-- Name: user_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.user_user_groups OWNER TO postgres;

--
-- Name: user_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_groups_id_seq OWNER TO postgres;

--
-- Name: user_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_user_groups_id_seq OWNED BY public.user_user_groups.id;


--
-- Name: user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_id_seq OWNER TO postgres;

--
-- Name: user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_user_id_seq OWNED BY public.user_user.id;


--
-- Name: user_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.user_user_user_permissions OWNER TO postgres;

--
-- Name: user_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: user_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_user_user_permissions_id_seq OWNED BY public.user_user_user_permissions.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: finance_client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_client ALTER COLUMN id SET DEFAULT nextval('public.finance_client_id_seq'::regclass);


--
-- Name: finance_financialrequest id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_financialrequest ALTER COLUMN id SET DEFAULT nextval('public.finance_financialrequest_id_seq'::regclass);


--
-- Name: finance_partner id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_partner ALTER COLUMN id SET DEFAULT nextval('public.finance_partner_id_seq'::regclass);


--
-- Name: finance_project id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_project ALTER COLUMN id SET DEFAULT nextval('public.finance_project_id_seq'::regclass);


--
-- Name: finance_project_participants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_project_participants ALTER COLUMN id SET DEFAULT nextval('public.finance_project_participants_id_seq'::regclass);


--
-- Name: finance_transaction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_transaction ALTER COLUMN id SET DEFAULT nextval('public.finance_transaction_id_seq'::regclass);


--
-- Name: user_account id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account ALTER COLUMN id SET DEFAULT nextval('public.user_account_id_seq'::regclass);


--
-- Name: user_accountsecurityqa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_accountsecurityqa ALTER COLUMN id SET DEFAULT nextval('public.user_accountsecurityqa_id_seq'::regclass);


--
-- Name: user_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profile ALTER COLUMN id SET DEFAULT nextval('public.user_profile_id_seq'::regclass);


--
-- Name: user_team id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_team ALTER COLUMN id SET DEFAULT nextval('public.user_team_id_seq'::regclass);


--
-- Name: user_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user ALTER COLUMN id SET DEFAULT nextval('public.user_user_id_seq'::regclass);


--
-- Name: user_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user_groups ALTER COLUMN id SET DEFAULT nextval('public.user_user_groups_id_seq'::regclass);


--
-- Name: user_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.user_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add user	1	add_user
2	Can change user	1	change_user
3	Can delete user	1	delete_user
4	Can view user	1	view_user
5	Can add profile	2	add_profile
6	Can change profile	2	change_profile
7	Can delete profile	2	delete_profile
8	Can view profile	2	view_profile
9	Can add account	3	add_account
10	Can change account	3	change_account
11	Can delete account	3	delete_account
12	Can view account	3	view_account
13	Can add account security qa	4	add_accountsecurityqa
14	Can change account security qa	4	change_accountsecurityqa
15	Can delete account security qa	4	delete_accountsecurityqa
16	Can view account security qa	4	view_accountsecurityqa
17	Can add team	5	add_team
18	Can change team	5	change_team
19	Can delete team	5	delete_team
20	Can view team	5	view_team
21	Can add client	6	add_client
22	Can change client	6	change_client
23	Can delete client	6	delete_client
24	Can view client	6	view_client
25	Can add financial request	7	add_financialrequest
26	Can change financial request	7	change_financialrequest
27	Can delete financial request	7	delete_financialrequest
28	Can view financial request	7	view_financialrequest
29	Can add partner	8	add_partner
30	Can change partner	8	change_partner
31	Can delete partner	8	delete_partner
32	Can view partner	8	view_partner
33	Can add project	9	add_project
34	Can change project	9	change_project
35	Can delete project	9	delete_project
36	Can view project	9	view_project
37	Can add transaction	10	add_transaction
38	Can change transaction	10	change_transaction
39	Can delete transaction	10	delete_transaction
40	Can view transaction	10	view_transaction
41	Can add log entry	11	add_logentry
42	Can change log entry	11	change_logentry
43	Can delete log entry	11	delete_logentry
44	Can view log entry	11	view_logentry
45	Can add permission	12	add_permission
46	Can change permission	12	change_permission
47	Can delete permission	12	delete_permission
48	Can view permission	12	view_permission
49	Can add group	13	add_group
50	Can change group	13	change_group
51	Can delete group	13	delete_group
52	Can view group	13	view_group
53	Can add content type	14	add_contenttype
54	Can change content type	14	change_contenttype
55	Can delete content type	14	delete_contenttype
56	Can view content type	14	view_contenttype
57	Can add session	15	add_session
58	Can change session	15	change_session
59	Can delete session	15	delete_session
60	Can view session	15	view_session
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-01-23 18:53:28.333868-08	1	1 1	1	[{"added": {}}]	7	31
2	2021-01-26 13:33:37.261848-08	2	2 1	1	[{"added": {}}]	7	31
3	2021-01-26 15:52:45.980948-08	10	1 1	3		7	31
4	2021-01-26 15:55:00.239466-08	11	1 1	3		7	31
5	2021-01-26 16:24:15.62685-08	12	1 1	3		7	31
6	2021-01-26 16:26:11.110857-08	13	1 1	3		7	31
7	2021-01-26 16:26:55.091921-08	14	1 1	3		7	31
8	2021-01-26 16:27:40.12808-08	15	1 1	3		7	31
9	2021-01-26 16:30:42.775679-08	16	1 1	3		7	31
10	2021-01-26 16:32:29.713773-08	17	1 1	3		7	31
11	2021-01-26 16:35:41.18479-08	18	1 1	3		7	31
12	2021-01-26 16:37:17.785163-08	19	1 1	3		7	31
13	2021-01-26 16:40:14.127543-08	20	1 1	3		7	31
14	2021-01-26 17:21:06.566223-08	21	1 1	3		7	31
15	2021-01-26 17:21:57.269302-08	22	1 1	3		7	31
16	2021-01-26 17:34:39.340676-08	1	partner1(partner1@gmail.com)	2	[{"changed": {"fields": ["address", "phone_num", "contact_method"]}}]	8	31
17	2021-01-28 08:27:36.932182-08	25	1 1	3		7	31
18	2021-01-28 08:34:23.757211-08	26	1 1	3		7	31
19	2021-01-28 11:00:27.646349-08	30	1 1	1	[{"added": {}}]	7	31
20	2021-01-28 11:23:39.539256-08	31	3 1	1	[{"added": {}}]	7	31
21	2021-01-28 13:13:51.928933-08	1	1 1	2	[{"changed": {"fields": ["status"]}}]	7	31
22	2021-01-28 13:14:46.001805-08	1	1 1	2	[{"changed": {"fields": ["status"]}}]	7	31
23	2021-01-28 13:16:17.662646-08	1	1 1	2	[{"changed": {"fields": ["status"]}}]	7	31
24	2021-01-28 13:37:20.415805-08	30	1 1	2	[{"changed": {"fields": ["status"]}}]	7	31
25	2021-01-28 13:51:44.341767-08	1	1 1	2	[{"changed": {"fields": ["status"]}}]	7	31
26	2021-01-29 08:51:46.009527-08	2	2 1	3		7	31
27	2021-01-31 07:10:39.926805-08	2	partner1(partner1@gmail.com)	1	[{"added": {}}]	8	31
28	2021-01-31 07:12:24.381667-08	2	partner1(partner1@gmail.com)	2	[{"changed": {"fields": ["contact_method"]}}]	8	31
29	2021-01-31 07:13:59.548088-08	3	partner2(partner2@gmail.com)	1	[{"added": {}}]	8	31
30	2021-01-31 07:17:26.431507-08	6	client-ronaldo(2)	2	[{"changed": {"fields": ["owner"]}}]	6	31
31	2021-01-31 07:17:31.71233-08	5	client-messi(2)	2	[{"changed": {"fields": ["owner"]}}]	6	31
32	2021-01-31 07:18:06.801805-08	4	partner3(partner3@gmail.com)	1	[{"added": {}}]	8	31
33	2021-02-02 10:02:45.083529-08	32	developer1 user1 (developer1@gmail.com)	2	[{"changed": {"fields": ["username", "first_name", "last_name", "email"]}}]	1	31
34	2021-02-02 10:03:17.221644-08	33	developer2 user (developer2@gmail.com)	2	[{"changed": {"fields": ["username", "first_name", "email"]}}]	1	31
35	2021-02-02 10:04:01.081087-08	34	manager2 user (manager2@gmail.com)	2	[{"changed": {"fields": ["username", "first_name", "email"]}}]	1	31
36	2021-02-02 10:04:53.903039-08	38	test5 user (test5@gmail.com)	3		1	31
37	2021-02-02 10:05:35.600094-08	39	manager1 user (manager1@gmail.com)	1	[{"added": {}}]	1	31
38	2021-02-02 10:05:52.390924-08	39	manager1 user (manager1@gmail.com)	2	[{"changed": {"fields": ["username"]}}]	1	31
39	2021-02-02 10:06:38.344165-08	35	developer3 user (developer3@gmail.com)	2	[{"changed": {"fields": ["username", "first_name", "email"]}}]	1	31
40	2021-02-02 10:07:12.663477-08	31	neymar jr (admin@gmail.com)	2	[]	1	31
41	2021-02-02 10:07:47.090658-08	31	neymar jr (admin@gmail.com)	2	[{"changed": {"fields": ["team"]}}]	1	31
42	2021-02-02 10:11:12.643274-08	31	neymar jr (admin@gmail.com)	2	[]	1	31
43	2021-02-02 10:12:28.414525-08	40	developer4 user (developer4@gmail.com)	1	[{"added": {}}]	1	31
44	2021-02-02 10:26:09.180639-08	27	Kevin Muller	2	[{"changed": {"fields": ["user"]}}]	2	31
45	2021-02-02 10:26:14.049785-08	26	Masao Kiba	2	[{"changed": {"fields": ["user"]}}]	2	31
46	2021-02-02 10:27:13.355571-08	29	Alexis Sanchez	1	[{"added": {}}]	2	31
47	2021-02-02 10:28:14.501605-08	30	Luiz Suarez	1	[{"added": {}}]	2	31
48	2021-02-02 10:28:49.93148-08	31	Jordi Alba	1	[{"added": {}}]	2	31
49	2021-02-02 10:39:07.788665-08	1	Talent Hub(2)	2	[{"changed": {"fields": ["participants"]}}]	9	31
50	2021-02-02 10:39:15.381139-08	2	Jogging Tracker(2)	2	[{"changed": {"fields": ["participants"]}}]	9	31
51	2021-02-02 10:49:42.666378-08	3	Betasmartz(1)	1	[{"added": {}}]	9	31
52	2021-02-02 10:53:12.485527-08	32	developer1 team1 (developer1@gmail.com)	2	[{"changed": {"fields": ["last_name"]}}]	1	31
53	2021-02-02 10:53:23.563261-08	33	developer2 team1 (developer2@gmail.com)	2	[{"changed": {"fields": ["last_name"]}}]	1	31
54	2021-02-02 10:53:32.941923-08	35	developer3 team2 (developer3@gmail.com)	2	[{"changed": {"fields": ["last_name"]}}]	1	31
55	2021-02-02 10:53:43.514168-08	40	developer4 team2 (developer4@gmail.com)	2	[{"changed": {"fields": ["last_name"]}}]	1	31
56	2021-02-02 10:53:52.137247-08	39	manager1 team1 (manager1@gmail.com)	2	[{"changed": {"fields": ["last_name"]}}]	1	31
57	2021-02-02 10:54:00.496835-08	34	manager2 team2 (manager2@gmail.com)	2	[{"changed": {"fields": ["last_name"]}}]	1	31
58	2021-02-02 10:54:56.021146-08	1	Talent Hub(2)	2	[{"changed": {"fields": ["project_starter"]}}]	9	31
59	2021-02-02 10:55:20.669418-08	2	Jogging Tracker(2)	2	[{"changed": {"fields": ["participants", "project_starter"]}}]	9	31
60	2021-02-02 10:55:33.152679-08	1	Talent Hub(2)	2	[{"changed": {"fields": ["participants", "project_starter"]}}]	9	31
61	2021-02-02 10:56:37.019572-08	10	client-rikimaru(2)	1	[{"added": {}}]	6	31
62	2021-02-02 10:56:50.023856-08	4	AltitudeNetworks(4)	1	[{"added": {}}]	9	31
63	2021-02-02 11:02:30.177739-08	1	1 1	2	[{"changed": {"fields": ["requester"]}}]	7	31
64	2021-02-02 11:02:49.356332-08	1	1 1	2	[]	7	31
65	2021-02-02 11:03:11.830708-08	1	1 1	2	[{"changed": {"fields": ["counter_party_id"]}}]	7	31
66	2021-02-02 11:04:25.351871-08	29	1 1	2	[{"changed": {"fields": ["requester"]}}]	7	31
67	2021-02-02 11:05:22.06893-08	30	1 4	2	[{"changed": {"fields": ["counter_party_id", "project"]}}]	7	31
68	2021-02-02 11:07:17.344707-08	32	1 1	1	[{"added": {}}]	7	31
69	2021-02-02 11:07:54.656149-08	32	1 1	2	[{"changed": {"fields": ["requester"]}}]	7	31
70	2021-02-02 11:08:44.667867-08	33	3 2	1	[{"added": {}}]	7	31
71	2021-02-02 11:16:11.649776-08	33	3 1	2	[{"changed": {"fields": ["status"]}}]	7	31
72	2021-02-02 12:34:32.318631-08	6	paypal	3		10	31
73	2021-02-02 12:34:32.412185-08	5	paypal	3		10	31
74	2021-02-02 12:34:32.414775-08	4	paypal	3		10	31
75	2021-02-02 12:38:00.320002-08	2	partner1(partner1@gmail.com)	2	[{"changed": {"fields": ["contact_method", "owner"]}}]	8	31
76	2021-02-02 12:42:57.804105-08	34	2 1	3		7	31
77	2021-02-02 13:01:46.03066-08	38	2 1	3		7	31
78	2021-02-02 13:03:39.620533-08	39	2 1	3		7	31
79	2021-02-02 13:05:35.269965-08	42	2 1	3		7	31
80	2021-02-02 13:05:35.272431-08	41	2 1	3		7	31
81	2021-02-02 13:05:35.274541-08	40	2 1	3		7	31
82	2021-02-02 13:23:53.173087-08	4	AltitudeNetworks(4)	2	[{"changed": {"fields": ["started_at"]}}]	9	31
83	2021-02-02 13:24:14.949479-08	3	Betasmartz(1)	2	[{"changed": {"fields": ["started_at"]}}]	9	31
84	2021-02-03 10:52:52.884925-08	5	blog(3)	1	[{"added": {}}]	9	31
85	2021-02-03 11:22:41.861322-08	5	blog(3)	2	[{"changed": {"fields": ["started_at"]}}]	9	31
86	2021-02-03 11:37:36.760816-08	2	Jogging Tracker(2)	2	[{"changed": {"fields": ["started_at"]}}]	9	31
87	2021-02-03 12:19:49.590485-08	3	Betasmartz(1)	2	[{"changed": {"fields": ["ended_at"]}}]	9	31
88	2021-02-03 13:11:24.15795-08	3	Betasmartz(1)	2	[{"changed": {"fields": ["status"]}}]	9	31
89	2021-02-03 13:11:47.837806-08	3	Betasmartz(1)	2	[{"changed": {"fields": ["status"]}}]	9	31
90	2021-02-03 13:16:52.576699-08	5	blog(3)	2	[{"changed": {"fields": ["status"]}}]	9	31
91	2021-02-03 13:17:23.976792-08	2	Jogging Tracker(2)	2	[{"changed": {"fields": ["participants", "project_starter"]}}]	9	31
92	2021-02-03 13:18:43.987302-08	5	blog(3)	2	[{"changed": {"fields": ["status"]}}]	9	31
93	2021-02-03 13:19:01.488888-08	5	blog(3)	2	[{"changed": {"fields": ["started_at"]}}]	9	31
94	2021-02-04 11:13:15.309601-08	3	Betasmartz(1)	2	[{"changed": {"fields": ["ended_at"]}}]	9	31
95	2021-02-04 11:14:04.795288-08	3	Betasmartz(1)	2	[{"changed": {"fields": ["ended_at"]}}]	9	31
96	2021-02-04 11:14:31.858094-08	3	Betasmartz(2)	2	[{"changed": {"fields": ["type", "weakly_limit", "price"]}}]	9	31
97	2021-02-04 12:10:01.530045-08	3	Betasmartz(1)	2	[{"changed": {"fields": ["type", "ended_at"]}}]	9	31
98	2021-02-04 12:10:34.739778-08	3	Betasmartz(1)	2	[{"changed": {"fields": ["weakly_limit", "price"]}}]	9	31
99	2021-02-04 12:11:20.343091-08	5	blog(3)	2	[{"changed": {"fields": ["started_at"]}}]	9	31
100	2021-02-04 12:12:02.866589-08	3	Betasmartz(1)	2	[{"changed": {"fields": ["ended_at"]}}]	9	31
101	2021-02-04 12:22:02.844624-08	3	Betasmartz(1)	2	[{"changed": {"fields": ["ended_at"]}}]	9	31
102	2021-02-04 12:22:21.023113-08	3	Betasmartz(1)	2	[{"changed": {"fields": ["ended_at"]}}]	9	31
103	2021-02-04 12:25:33.768721-08	3	Betasmartz(1)	2	[{"changed": {"fields": ["ended_at"]}}]	9	31
104	2021-02-04 12:29:02.000543-08	3	Betasmartz(1)	2	[]	9	31
105	2021-02-04 12:31:30.522846-08	3	Betasmartz(1)	2	[{"changed": {"fields": ["ended_at"]}}]	9	31
106	2021-02-04 12:31:44.737732-08	3	Betasmartz(1)	2	[{"changed": {"fields": ["price"]}}]	9	31
107	2021-02-05 08:49:39.165542-08	10	client-rikimaru(2)	2	[{"changed": {"fields": ["owner"]}}]	6	31
108	2021-02-05 11:16:39.958967-08	2	Jogging Tracker(2)	2	[{"changed": {"fields": ["participants"]}}]	9	31
109	2021-02-10 08:03:47.621747-08	30	req=developer3 team2 (developer3@gmail.com) counter=client-rikimaru(2) project=AltitudeNetworks(4)	2	[{"changed": {"fields": ["status"]}}]	7	31
110	2021-02-09 19:01:45.17607-08	43	req=developer1 team1 (developer1@gmail.com) counter=partner1(partner1@gmail.com) project=None	3		7	31
111	2021-02-20 12:19:51.637825-08	45	req=developer3 team2 (developer3@gmail.com) counter=partner3(partner3@gmail.com) project=None	1	[{"added": {}}]	7	31
112	2021-02-22 13:18:05.02972-08	6	Pro Evolution(2)	1	[{"added": {}}]	9	31
113	2021-02-22 13:18:41.398849-08	46	req=developer3 team2 (developer3@gmail.com) counter=client-messi(2) project=Pro Evolution(2)	1	[{"added": {}}]	7	31
114	2021-02-22 13:18:52.206521-08	46	req=developer3 team2 (developer3@gmail.com) counter=client-messi(2) project=Pro Evolution(2)	2	[{"changed": {"fields": ["status"]}}]	7	31
115	2021-02-22 13:19:03.264498-08	46	req=developer3 team2 (developer3@gmail.com) counter=client-messi(2) project=Pro Evolution(2)	2	[{"changed": {"fields": ["status"]}}]	7	31
116	2021-02-22 13:19:51.902805-08	11	developer3 team2 (developer3@gmail.com) Pro Evolution(2)	3		10	31
117	2021-02-22 13:22:08.415689-08	12	developer3 team2 (developer3@gmail.com) Pro Evolution(2)	3		10	31
118	2021-02-22 13:23:53.845194-08	2	Jogging Tracker(2)	2	[{"changed": {"fields": ["project_starter"]}}]	9	31
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	user	user
2	user	profile
3	user	account
4	user	accountsecurityqa
5	user	team
6	finance	client
7	finance	financialrequest
8	finance	partner
9	finance	project
10	finance	transaction
11	admin	logentry
12	auth	permission
13	auth	group
14	contenttypes	contenttype
15	sessions	session
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-01-20 15:37:19.586739-08
2	contenttypes	0002_remove_content_type_name	2021-01-20 15:37:19.601812-08
3	auth	0001_initial	2021-01-20 15:37:19.6285-08
4	auth	0002_alter_permission_name_max_length	2021-01-20 15:37:19.652275-08
5	auth	0003_alter_user_email_max_length	2021-01-20 15:37:19.661064-08
6	auth	0004_alter_user_username_opts	2021-01-20 15:37:19.669977-08
7	auth	0005_alter_user_last_login_null	2021-01-20 15:37:19.678381-08
8	auth	0006_require_contenttypes_0002	2021-01-20 15:37:19.680589-08
9	auth	0007_alter_validators_add_error_messages	2021-01-20 15:37:19.691814-08
10	auth	0008_alter_user_username_max_length	2021-01-20 15:37:19.70242-08
11	auth	0009_alter_user_last_name_max_length	2021-01-20 15:37:19.710819-08
12	auth	0010_alter_group_name_max_length	2021-01-20 15:37:19.719241-08
13	auth	0011_update_proxy_permissions	2021-01-20 15:37:19.727589-08
14	user	0001_initial	2021-01-20 15:37:19.751828-08
15	admin	0001_initial	2021-01-20 15:37:19.784427-08
16	admin	0002_logentry_remove_auto_add	2021-01-20 15:37:19.801289-08
17	admin	0003_logentry_add_action_flag_choices	2021-01-20 15:37:19.814136-08
18	finance	0001_initial	2021-01-20 15:37:19.876349-08
19	sessions	0001_initial	2021-01-20 15:37:19.904167-08
20	user	0002_auto_20201223_1640	2021-01-20 15:37:19.943604-08
21	user	0003_account_accountsecurityqa	2021-01-20 15:37:20.019537-08
22	user	0004_auto_20201224_1351	2021-01-20 15:37:20.051739-08
23	user	0005_auto_20210117_0248	2021-01-20 15:37:20.07713-08
24	user	0006_auto_20210117_0303	2021-01-20 15:37:20.125678-08
25	finance	0002_project_weakly_limit	2021-01-22 19:52:20.822044-08
28	finance	0003_auto_20210124_0249	2021-01-23 18:49:40.395984-08
29	finance	0004_auto_20210126_2308	2021-01-26 15:09:09.11747-08
30	finance	0005_auto_20210129_1453	2021-01-29 06:53:48.642281-08
33	finance	0006_auto_20210131_1501	2021-01-31 07:04:49.451312-08
35	finance	0007_auto_20210131_1513	2021-01-31 07:13:53.735131-08
36	finance	0008_auto_20210131_1943	2021-01-31 11:45:26.847497-08
37	finance	0009_auto_20210202_1841	2021-02-02 10:41:46.30254-08
38	user	0007_auto_20210202_1841	2021-02-02 10:41:46.829153-08
39	finance	0010_auto_20210202_2101	2021-02-02 13:01:13.378002-08
40	finance	0011_financialrequest_description	2021-02-25 11:17:10.661423-08
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
dyzc2uy7dyp0oz8vyvo4i0a2s9tkrgem	MDFjNmZkNGIwZWY2MTA4YzFjZjZiNWMxODk4MDI4NTg4OGMzZjAzNTp7Il9hdXRoX3VzZXJfaWQiOiIzMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWFjZDVlNTM0YzEwODNlYzczNjNjODllODA3MGIzYTVmYzMwMTMwYSJ9	2021-02-03 17:14:06.328742-08
9jrlkn5nyw1r1haxpbmo58znkhrh8wc2	MDFjNmZkNGIwZWY2MTA4YzFjZjZiNWMxODk4MDI4NTg4OGMzZjAzNTp7Il9hdXRoX3VzZXJfaWQiOiIzMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWFjZDVlNTM0YzEwODNlYzczNjNjODllODA3MGIzYTVmYzMwMTMwYSJ9	2021-02-18 07:35:07.525459-08
nuy9yzc7wdzb0cgr1kznikvqdtg5edlf	MDFjNmZkNGIwZWY2MTA4YzFjZjZiNWMxODk4MDI4NTg4OGMzZjAzNTp7Il9hdXRoX3VzZXJfaWQiOiIzMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWFjZDVlNTM0YzEwODNlYzczNjNjODllODA3MGIzYTVmYzMwMTMwYSJ9	2021-02-23 19:01:22.784129-08
\.


--
-- Data for Name: finance_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.finance_client (id, type, full_name, company_name, started_at, owner_id) FROM stdin;
6	2	client-ronaldo	Real Madrid	2021-01-20	34
5	2	client-messi	FC Barcelona	2021-01-20	35
10	2	client-rikimaru	warcraft	2021-02-02	35
\.


--
-- Data for Name: finance_financialrequest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.finance_financialrequest (id, type, status, amount, requested_at, counter_party_type_id, counter_party_id, project_id, requester_id, description) FROM stdin;
32	1	1	3500	2021-02-02 11:07:17.265163-08	6	5	2	35	\N
31	3	2	123	2021-01-28 11:23:39.537476-08	6	6	2	34	\N
33	3	2	3500	2021-02-02 11:08:44.665596-08	6	5	2	35	\N
45	2	2	20	2021-02-20 12:19:51.443293-08	8	4	\N	35	\N
46	3	2	500	2021-02-22 13:18:41.300257-08	6	5	6	35	\N
\.


--
-- Data for Name: finance_partner; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.finance_partner (id, full_name, email, address, dob, phone_num, contact_method, owner_id) FROM stdin;
3	partner2	partner2@gmail.com	\N	\N	\N	[{"type":"Whatsapp","id":"partner2@whatsapp.com"},{"type":"Skype","id":"partner2@skype.com"}]	34
4	partner3	partner3@gmail.com	\N	\N	\N	[{"type":"Whatsapp","id":"partner3@whatsapp.com"},{"type":"Skype","id":"partner3@skype.com"}]	35
2	partner1	partner1@gmail.com	Hirosima	1985-02-15	111	[{"type":"Whatsapp","id":"partner1@whatsapp.com"},{"type":"Skype","id":"partner1@skype.com"}]	32
\.


--
-- Data for Name: finance_project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.finance_project (id, title, type, price, started_at, ended_at, status, client_id, project_starter_id, weakly_limit) FROM stdin;
5	blog	3	30	2021-01-31	\N	1	10	35	20
3	Betasmartz	1	3000	2020-12-18	2021-02-06	1	6	34	\N
6	Pro Evolution	2	36	2021-02-15	\N	1	5	35	40
2	Jogging Tracker	2	100	2021-02-03	\N	1	5	35	40
\.


--
-- Data for Name: finance_project_participants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.finance_project_participants (id, project_id, user_id) FROM stdin;
6	3	40
7	3	34
8	3	35
12	5	35
14	2	35
15	6	35
\.


--
-- Data for Name: finance_transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.finance_transaction (id, description, created_at, gross_amount, net_amount, payment_platform, financial_request_id) FROM stdin;
7	Transaction from client-ronaldo for test3-user	2021-02-02 12:34:35.989732-08	143	123	paypal	31
8	Transaction from client-messi for developer3-team2	2021-02-02 12:35:30.138388-08	3500	3300	paypal	33
10	Transaction from developer3 for partner3	2021-02-20 12:21:29.846112-08	22	20	paypal	45
13	Transaction from developer3 for client-messi	2021-02-02 13:23:10.694597-08	510	500	paypal	46
\.


--
-- Data for Name: user_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_account (id, platform_type, password, location, recovery_email, url, profile_id, email) FROM stdin;
13	github	password	Japan Tokyo	masao@gmail.com	www.github.com	26	masao@gmail.com
14	skype	password	Japan Tokyo	masao@gmail.com	www.skype.com	26	masao@gmail.com
16	github	password	German Munchen	kevin@gmail.com	www.github.com	27	kevin@gmail.com
17	bitbucket	password	German Munchen	kevin@gmail.com	www.bitbucket.com	27	kevin@gmail.com
\.


--
-- Data for Name: user_accountsecurityqa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_accountsecurityqa (id, question, answer, account_id) FROM stdin;
\.


--
-- Data for Name: user_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_profile (id, profile_type, first_name, last_name, address, country, dob, gender, user_id) FROM stdin;
27	2	Kevin	Muller	Munchen	German	1999-10-10	1	33
26	2	Masao	Kiba	Tokyo	Japan	1999-12-12	1	35
29	2	Alexis	Sanchez	Boston	Chile	1989-07-02	1	40
30	2	Luiz	Suarez	Joska	Uruguay	1987-03-02	1	39
31	2	Jordi	Alba	Barcelona	Spain	1989-06-22	1	34
\.


--
-- Data for Name: user_team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_team (id, name) FROM stdin;
36	team1
37	team2
\.


--
-- Data for Name: user_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, role, team_id) FROM stdin;
33	pbkdf2_sha256$150000$P5fLyTKwSiV8$qnLbUYAIL3xeYHW3PW+v+ETYPDtsQPJ/LV0ljKIe1q8=	\N	f	developer2	developer2	team1	developer2@gmail.com	f	t	2020-12-31 19:48:16-08	3	36
34	pbkdf2_sha256$150000$IcjYfbnuPHeQ$pRUlslqObe5ZJNlIaAnwoQAnBXCG/kRF0DVvajpi7kw=	2021-02-10 08:04:30.237056-08	f	manager2	manager2	team2	manager2@gmail.com	f	t	2020-12-31 19:50:28-08	2	37
40	pbkdf2_sha256$150000$KG0S2Gktzst7$55DWy51MRDSQrRlNjbL7o4diGtRDJPvuTvcZ1khpY5k=	\N	f	developer4	developer4	team2	developer4@gmail.com	f	t	2021-02-02 10:12:28-08	3	37
32	pbkdf2_sha256$150000$H5xUVy0woLJz$7aCDbVKMGuKOPhDZ0Y9RPzR5WwoNwF89lhLGIpgx/oI=	2021-02-02 12:41:57.324602-08	f	developer1	developer1	team1	developer1@gmail.com	f	t	2020-12-31 19:45:19-08	3	36
39	pbkdf2_sha256$150000$S02WrU601kIf$0IPEjNW+dNnkLFmGH21xtHq4EjYiNYL9VTAOgIoZd9I=	2021-02-05 12:20:18.865503-08	f	manager1	manager1	team1	manager1@gmail.com	f	t	2021-02-02 10:05:35-08	2	36
35	pbkdf2_sha256$150000$P8jHxgSOfsnm$dFgW0QXX7xJthb1RAILGB6IX5id79yOnvjadnhIydk8=	2021-02-20 12:13:57.051852-08	f	developer3	developer3	team2	developer3@gmail.com	f	t	2020-12-31 19:50:44-08	3	37
31	pbkdf2_sha256$150000$gZ19X8FQMSpK$TfPEodxsAFe83V/oTsSgZUmpYTXXjRQYz0LnNXl8jNA=	2021-02-25 11:38:48.843443-08	t	admin	neymar	jr	admin@gmail.com	t	t	2020-12-31 19:43:42-08	1	\N
\.


--
-- Data for Name: user_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: user_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 60, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 118, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 40, true);


--
-- Name: finance_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.finance_client_id_seq', 10, true);


--
-- Name: finance_financialrequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.finance_financialrequest_id_seq', 46, true);


--
-- Name: finance_partner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.finance_partner_id_seq', 4, true);


--
-- Name: finance_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.finance_project_id_seq', 6, true);


--
-- Name: finance_project_participants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.finance_project_participants_id_seq', 15, true);


--
-- Name: finance_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.finance_transaction_id_seq', 13, true);


--
-- Name: user_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_account_id_seq', 18, true);


--
-- Name: user_accountsecurityqa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_accountsecurityqa_id_seq', 1, false);


--
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_profile_id_seq', 31, true);


--
-- Name: user_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_team_id_seq', 37, true);


--
-- Name: user_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_user_groups_id_seq', 1, false);


--
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_user_id_seq', 40, true);


--
-- Name: user_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: finance_client finance_client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_client
    ADD CONSTRAINT finance_client_pkey PRIMARY KEY (id);


--
-- Name: finance_financialrequest finance_financialrequest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_financialrequest
    ADD CONSTRAINT finance_financialrequest_pkey PRIMARY KEY (id);


--
-- Name: finance_partner finance_partner_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_partner
    ADD CONSTRAINT finance_partner_email_key UNIQUE (email);


--
-- Name: finance_partner finance_partner_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_partner
    ADD CONSTRAINT finance_partner_pkey PRIMARY KEY (id);


--
-- Name: finance_project_participants finance_project_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_project_participants
    ADD CONSTRAINT finance_project_participants_pkey PRIMARY KEY (id);


--
-- Name: finance_project_participants finance_project_participants_project_id_user_id_3a3f7eff_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_project_participants
    ADD CONSTRAINT finance_project_participants_project_id_user_id_3a3f7eff_uniq UNIQUE (project_id, user_id);


--
-- Name: finance_project finance_project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_project
    ADD CONSTRAINT finance_project_pkey PRIMARY KEY (id);


--
-- Name: finance_transaction finance_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_transaction
    ADD CONSTRAINT finance_transaction_pkey PRIMARY KEY (id);


--
-- Name: user_account user_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT user_account_pkey PRIMARY KEY (id);


--
-- Name: user_account user_account_profile_id_email_platform_type_4850bca7_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT user_account_profile_id_email_platform_type_4850bca7_uniq UNIQUE (profile_id, email, platform_type);


--
-- Name: user_accountsecurityqa user_accountsecurityqa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_accountsecurityqa
    ADD CONSTRAINT user_accountsecurityqa_pkey PRIMARY KEY (id);


--
-- Name: user_profile user_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_pkey PRIMARY KEY (id);


--
-- Name: user_team user_team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_team
    ADD CONSTRAINT user_team_pkey PRIMARY KEY (id);


--
-- Name: user_user user_user_email_1c6f3d1a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user
    ADD CONSTRAINT user_user_email_1c6f3d1a_uniq UNIQUE (email);


--
-- Name: user_user_groups user_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_pkey PRIMARY KEY (id);


--
-- Name: user_user_groups user_user_groups_user_id_group_id_bb60391f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_user_id_group_id_bb60391f_uniq UNIQUE (user_id, group_id);


--
-- Name: user_user user_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user
    ADD CONSTRAINT user_user_pkey PRIMARY KEY (id);


--
-- Name: user_user_user_permissions user_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: user_user_user_permissions user_user_user_permissions_user_id_permission_id_64f4d5b8_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_user_id_permission_id_64f4d5b8_uniq UNIQUE (user_id, permission_id);


--
-- Name: user_user user_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user
    ADD CONSTRAINT user_user_username_key UNIQUE (username);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: finance_client_owner_id_3c7da3b9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX finance_client_owner_id_3c7da3b9 ON public.finance_client USING btree (owner_id);


--
-- Name: finance_financialrequest_content_type_id_3e660a83; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX finance_financialrequest_content_type_id_3e660a83 ON public.finance_financialrequest USING btree (counter_party_type_id);


--
-- Name: finance_financialrequest_project_id_44c1e423; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX finance_financialrequest_project_id_44c1e423 ON public.finance_financialrequest USING btree (project_id);


--
-- Name: finance_financialrequest_requester_id_ddf78e1d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX finance_financialrequest_requester_id_ddf78e1d ON public.finance_financialrequest USING btree (requester_id);


--
-- Name: finance_partner_email_191bb5ab_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX finance_partner_email_191bb5ab_like ON public.finance_partner USING btree (email varchar_pattern_ops);


--
-- Name: finance_partner_owner_id_15938130; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX finance_partner_owner_id_15938130 ON public.finance_partner USING btree (owner_id);


--
-- Name: finance_project_client_id_78f727f1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX finance_project_client_id_78f727f1 ON public.finance_project USING btree (client_id);


--
-- Name: finance_project_participants_project_id_8c982cae; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX finance_project_participants_project_id_8c982cae ON public.finance_project_participants USING btree (project_id);


--
-- Name: finance_project_participants_user_id_4c1672ca; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX finance_project_participants_user_id_4c1672ca ON public.finance_project_participants USING btree (user_id);


--
-- Name: finance_project_project_starter_id_d3110b86; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX finance_project_project_starter_id_d3110b86 ON public.finance_project USING btree (project_starter_id);


--
-- Name: finance_transaction_related_financial_id_743f1d0e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX finance_transaction_related_financial_id_743f1d0e ON public.finance_transaction USING btree (financial_request_id);


--
-- Name: user_account_profile_id_77c32cf8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_account_profile_id_77c32cf8 ON public.user_account USING btree (profile_id);


--
-- Name: user_accountsecurityqa_account_id_9c47cbde; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_accountsecurityqa_account_id_9c47cbde ON public.user_accountsecurityqa USING btree (account_id);


--
-- Name: user_profile_user_id_8fdce8e2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_profile_user_id_8fdce8e2 ON public.user_profile USING btree (user_id);


--
-- Name: user_user_email_1c6f3d1a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_user_email_1c6f3d1a_like ON public.user_user USING btree (email varchar_pattern_ops);


--
-- Name: user_user_groups_group_id_c57f13c0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_user_groups_group_id_c57f13c0 ON public.user_user_groups USING btree (group_id);


--
-- Name: user_user_groups_user_id_13f9a20d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_user_groups_user_id_13f9a20d ON public.user_user_groups USING btree (user_id);


--
-- Name: user_user_team_id_cc3cf5ef; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_user_team_id_cc3cf5ef ON public.user_user USING btree (team_id);


--
-- Name: user_user_user_permissions_permission_id_ce49d4de; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_user_user_permissions_permission_id_ce49d4de ON public.user_user_user_permissions USING btree (permission_id);


--
-- Name: user_user_user_permissions_user_id_31782f58; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_user_user_permissions_user_id_31782f58 ON public.user_user_user_permissions USING btree (user_id);


--
-- Name: user_user_username_e2bdfe0c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_user_username_e2bdfe0c_like ON public.user_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: finance_client finance_client_owner_id_3c7da3b9_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_client
    ADD CONSTRAINT finance_client_owner_id_3c7da3b9_fk_user_user_id FOREIGN KEY (owner_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: finance_financialrequest finance_financialreq_counter_party_type_i_e1f09e96_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_financialrequest
    ADD CONSTRAINT finance_financialreq_counter_party_type_i_e1f09e96_fk_django_co FOREIGN KEY (counter_party_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: finance_financialrequest finance_financialreq_project_id_44c1e423_fk_finance_p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_financialrequest
    ADD CONSTRAINT finance_financialreq_project_id_44c1e423_fk_finance_p FOREIGN KEY (project_id) REFERENCES public.finance_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: finance_financialrequest finance_financialrequest_requester_id_ddf78e1d_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_financialrequest
    ADD CONSTRAINT finance_financialrequest_requester_id_ddf78e1d_fk_user_user_id FOREIGN KEY (requester_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: finance_partner finance_partner_owner_id_15938130_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_partner
    ADD CONSTRAINT finance_partner_owner_id_15938130_fk_user_user_id FOREIGN KEY (owner_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: finance_project finance_project_client_id_78f727f1_fk_finance_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_project
    ADD CONSTRAINT finance_project_client_id_78f727f1_fk_finance_client_id FOREIGN KEY (client_id) REFERENCES public.finance_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: finance_project_participants finance_project_part_project_id_8c982cae_fk_finance_p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_project_participants
    ADD CONSTRAINT finance_project_part_project_id_8c982cae_fk_finance_p FOREIGN KEY (project_id) REFERENCES public.finance_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: finance_project_participants finance_project_participants_user_id_4c1672ca_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_project_participants
    ADD CONSTRAINT finance_project_participants_user_id_4c1672ca_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: finance_project finance_project_project_starter_id_d3110b86_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_project
    ADD CONSTRAINT finance_project_project_starter_id_d3110b86_fk_user_user_id FOREIGN KEY (project_starter_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: finance_transaction finance_transaction_financial_request_id_d7a54aa1_fk_finance_f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_transaction
    ADD CONSTRAINT finance_transaction_financial_request_id_d7a54aa1_fk_finance_f FOREIGN KEY (financial_request_id) REFERENCES public.finance_financialrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_account user_account_profile_id_77c32cf8_fk_user_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT user_account_profile_id_77c32cf8_fk_user_profile_id FOREIGN KEY (profile_id) REFERENCES public.user_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_accountsecurityqa user_accountsecurityqa_account_id_9c47cbde_fk_user_account_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_accountsecurityqa
    ADD CONSTRAINT user_accountsecurityqa_account_id_9c47cbde_fk_user_account_id FOREIGN KEY (account_id) REFERENCES public.user_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_profile user_profile_user_id_8fdce8e2_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_user_id_8fdce8e2_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_groups user_user_groups_group_id_c57f13c0_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_group_id_c57f13c0_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_groups user_user_groups_user_id_13f9a20d_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_user_id_13f9a20d_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user user_user_team_id_cc3cf5ef_fk_user_team_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user
    ADD CONSTRAINT user_user_team_id_cc3cf5ef_fk_user_team_id FOREIGN KEY (team_id) REFERENCES public.user_team(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_user_permissions user_user_user_permi_permission_id_ce49d4de_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permi_permission_id_ce49d4de_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_user_permissions user_user_user_permissions_user_id_31782f58_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_user_id_31782f58_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

