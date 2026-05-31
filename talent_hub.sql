--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
    project_id integer,
    requester_id integer NOT NULL,
    description text,
    address character varying(200),
    payment_account_id integer
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
-- Name: finance_paymentaccount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.finance_paymentaccount (
    id integer NOT NULL,
    platform character varying(10) NOT NULL,
    address character varying(250) NOT NULL,
    display_name character varying(30)
);


ALTER TABLE public.finance_paymentaccount OWNER TO postgres;

--
-- Name: finance_paymentaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.finance_paymentaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.finance_paymentaccount_id_seq OWNER TO postgres;

--
-- Name: finance_paymentaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.finance_paymentaccount_id_seq OWNED BY public.finance_paymentaccount.id;


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
    weekly_limit integer
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
    created_at date,
    gross_amount double precision NOT NULL,
    net_amount double precision NOT NULL,
    financial_request_id integer,
    payment_account_id integer NOT NULL
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
-- Name: notification_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notification_notification (
    id integer NOT NULL,
    message text,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    creator_id integer NOT NULL,
    notify_to_id integer NOT NULL,
    read_at timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    CONSTRAINT notification_notification_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.notification_notification OWNER TO postgres;

--
-- Name: notification_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notification_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notification_notification_id_seq OWNER TO postgres;

--
-- Name: notification_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notification_notification_id_seq OWNED BY public.notification_notification.id;


--
-- Name: reporting_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reporting_log (
    id integer NOT NULL,
    plan text,
    achievements text,
    created_at date NOT NULL,
    "interval" character varying(20) NOT NULL,
    owner_id integer NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.reporting_log OWNER TO postgres;

--
-- Name: reporting_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reporting_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reporting_log_id_seq OWNER TO postgres;

--
-- Name: reporting_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reporting_log_id_seq OWNED BY public.reporting_log.id;


--
-- Name: user_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_account (
    id integer NOT NULL,
    platform_type character varying(30) NOT NULL,
    password character varying(50) NOT NULL,
    location character varying(200) NOT NULL,
    url character varying(200) NOT NULL,
    profile_id integer NOT NULL,
    email character varying(254) NOT NULL,
    extra_info character varying(1024)
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
    user_id integer NOT NULL,
    extra_info character varying(1024)
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
-- Name: finance_paymentaccount id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_paymentaccount ALTER COLUMN id SET DEFAULT nextval('public.finance_paymentaccount_id_seq'::regclass);


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
-- Name: notification_notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification_notification ALTER COLUMN id SET DEFAULT nextval('public.notification_notification_id_seq'::regclass);


--
-- Name: reporting_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporting_log ALTER COLUMN id SET DEFAULT nextval('public.reporting_log_id_seq'::regclass);


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
61	Can add log	16	add_log
62	Can change log	16	change_log
63	Can delete log	16	delete_log
64	Can view log	16	view_log
65	Can add notification	17	add_notification
66	Can change notification	17	change_notification
67	Can delete notification	17	delete_notification
68	Can view notification	17	view_notification
69	Can add payment account	18	add_paymentaccount
70	Can change payment account	18	change_paymentaccount
71	Can delete payment account	18	delete_paymentaccount
72	Can view payment account	18	view_paymentaccount
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
330	2021-09-16 04:10:21.039473+09	42	Nam Il (developer@example.com)	2	[{"changed": {"fields": ["username"]}}]	1	41
333	2021-09-16 04:12:40.219349+09	35	developer3 team2 (developer3@example.com)	2	[{"changed": {"fields": ["username", "email"]}}]	1	41
343	2021-09-16 04:23:49.402593+09	41	user admin (admin@example.com)	2	[]	1	41
346	2021-09-16 05:59:33.311848+09	34	manager2 team2 (manager2@example.com)	2	[{"changed": {"fields": ["username", "email"]}}]	1	41
354	2021-09-16 06:47:29.678023+09	41	user admin (admin@example.com)	2	[]	1	41
357	2021-09-16 06:54:22.645349+09	45	developer3 team1 (developer3@example.com)	1	[{"added": {}}]	1	41
360	2021-09-16 06:56:56.076981+09	48	developer6 team2 (developer6@example.com)	1	[{"added": {}}]	1	41
363	2021-09-16 07:29:05.786043+09	62	req=developer1 team1 (developer1@example.com)  project=Fix bugs of Betasmartz site(3)	3		7	41
364	2021-09-16 07:29:05.911352+09	61	req=developer1 team1 (developer1@example.com)  project=Implement Web of Microsoft company(2)	3		7	41
365	2021-09-16 07:29:05.914661+09	60	req=developer1 team1 (developer1@example.com)  project=Fix bugs of Betasmartz site(3)	3		7	41
366	2021-09-16 07:29:05.918909+09	59	req=developer1 team1 (developer1@example.com)  project=None	3		7	41
367	2021-09-16 07:29:05.922617+09	58	req=developer1 team1 (developer1@example.com)  project=Implement Web of Microsoft company(2)	3		7	41
371	2021-09-16 08:09:31.591698+09	91	{{creator}} canceled a {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
372	2021-09-16 08:09:31.593786+09	90	{{creator}} canceled a {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
373	2021-09-16 08:09:31.594892+09	89	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
374	2021-09-16 08:09:31.596699+09	88	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
375	2021-09-16 08:09:31.597859+09	87	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
376	2021-09-16 08:09:31.598849+09	86	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
377	2021-09-16 08:09:31.59988+09	85	{{creator}} updated a {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
378	2021-09-16 08:09:31.600799+09	84	{{creator}} updated a {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
379	2021-09-16 08:09:31.601872+09	83	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
380	2021-09-16 08:09:31.602827+09	82	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
381	2021-09-16 08:09:31.60374+09	81	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
382	2021-09-16 08:09:31.604601+09	80	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
383	2021-09-16 08:09:31.605531+09	79	{{creator}} updated a {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
384	2021-09-16 08:09:31.606543+09	78	{{creator}} updated a {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
385	2021-09-16 08:09:31.607511+09	77	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
386	2021-09-16 08:09:31.608619+09	76	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
387	2021-09-16 08:09:31.609619+09	75	{{creator}} updated a {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
388	2021-09-16 08:09:31.610643+09	74	{{creator}} updated a {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
389	2021-09-16 08:09:31.611587+09	73	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
390	2021-09-16 08:09:31.612682+09	72	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
391	2021-09-16 08:09:31.613935+09	71	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
392	2021-09-16 08:09:31.615007+09	70	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
393	2021-09-16 08:09:31.615954+09	69	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
394	2021-09-16 08:09:31.616905+09	68	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
395	2021-09-16 08:09:31.666633+09	67	{{creator}} started his {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
396	2021-09-16 08:09:31.669517+09	66	{{creator}} started his {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
397	2021-09-16 08:09:31.671992+09	65	{{creator}} started his {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
398	2021-09-16 08:09:31.674312+09	64	{{creator}} started his {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
413	2021-09-17 01:25:52.052628+09	74	req=developer1 team1 (developer1@example.com)  project=Implement Web of Microsoft company(2)	2	[]	7	41
416	2021-09-17 01:27:32.82901+09	73	req=developer1 team1 (developer1@example.com)  project=Fix bugs of Betasmartz site(3)	2	[]	7	41
417	2021-09-17 07:42:02.600538+09	79	req=developer2 team1 (developer2@example.com)  project=Talent Hub(2)	3		7	41
418	2021-09-17 07:42:02.709026+09	70	req=developer1 team1 (developer1@example.com)  project=Implement Web of Microsoft company(2)	3		7	41
420	2021-09-17 07:43:13.494407+09	80	req=developer2 team1 (developer2@example.com)  project=Talent Hub(2)	2	[{"changed": {"fields": ["status"]}}]	7	41
422	2021-09-17 07:43:26.162836+09	77	req=developer1 team1 (developer1@example.com)  project=Fix bugs of Betasmartz site(3)	2	[{"changed": {"fields": ["status"]}}]	7	41
424	2021-09-17 07:43:36.743127+09	75	req=developer1 team1 (developer1@example.com)  project=None	2	[{"changed": {"fields": ["status"]}}]	7	41
425	2021-09-17 09:09:11.05085+09	80	req=developer2 team1 (developer2@example.com)  project=Talent Hub(2)	3		7	41
426	2021-09-17 09:09:11.056328+09	76	req=developer1 team1 (developer1@example.com)  project=Implement Web of Microsoft company(2)	3		7	41
427	2021-09-17 09:09:11.057547+09	75	req=developer1 team1 (developer1@example.com)  project=None	3		7	41
428	2021-09-17 09:09:11.061818+09	74	req=developer1 team1 (developer1@example.com)  project=Implement Web of Microsoft company(2)	3		7	41
430	2021-09-17 09:09:33.328844+09	72	req=developer1 team1 (developer1@example.com)  project=None	2	[{"changed": {"fields": ["status"]}}]	7	41
432	2021-09-17 09:09:41.695099+09	77	req=developer1 team1 (developer1@example.com)  project=Fix bugs of Betasmartz site(3)	2	[{"changed": {"fields": ["status"]}}]	7	41
434	2021-09-17 09:12:36.711635+09	27	developer1 team1 (developer1@example.com) None	3		10	41
284	2021-09-16 04:07:00.827843+09	33	Nuclear(2)	3		9	41
287	2021-09-16 04:07:00.964936+09	7	testasf(2)	3		9	41
331	2021-09-16 04:10:58.593829+09	32	developer1 team1 (developer1@example.com)	2	[{"changed": {"fields": ["username"]}}]	1	41
334	2021-09-16 04:21:10.396778+09	17	kevin@gmail.com(bitbucket)	3		3	41
335	2021-09-16 04:21:10.577019+09	16	kevin@gmail.com(github)	3		3	41
336	2021-09-16 04:21:10.580239+09	14	masao@gmail.com(skype)	3		3	41
337	2021-09-16 04:21:10.583084+09	13	masao.kiba@gmail.com(github)	3		3	41
344	2021-09-16 04:24:05.477385+09	40	developer4 team2 (developer4@gmail.com)	3		1	41
347	2021-09-16 06:40:23.257026+09	32	developer1 team1 (developer1@example.com)	2	[{"changed": {"fields": ["username"]}}]	1	41
355	2021-09-16 06:52:28.815516+09	43	developer1 team1 (developer1@example.com)	1	[{"added": {}}]	1	41
358	2021-09-16 06:55:13.361762+09	46	developer4 team2 (developer4@example.com)	1	[{"added": {}}]	1	41
361	2021-09-16 06:58:36.393162+09	49	manager1 team1 (manager1@example.com)	1	[{"added": {}}]	1	41
368	2021-09-16 07:31:32.173493+09	64	req=developer1 team1 (developer1@example.com)  project=Implement Web of Microsoft company(2)	3		7	41
369	2021-09-16 07:31:32.17707+09	63	req=developer1 team1 (developer1@example.com)  project=Implement Web of Microsoft company(2)	3		7	41
399	2021-09-16 08:15:25.166352+09	101	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
400	2021-09-16 08:15:25.169294+09	100	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
401	2021-09-16 08:15:25.170714+09	99	{{creator}} updated a {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
402	2021-09-16 08:15:25.172247+09	98	{{creator}} updated a {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
403	2021-09-16 08:15:25.174027+09	97	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
404	2021-09-16 08:15:25.176049+09	96	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
405	2021-09-16 08:15:25.177465+09	95	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
406	2021-09-16 08:15:25.178708+09	94	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
407	2021-09-16 08:15:25.180054+09	93	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
408	2021-09-16 08:15:25.181293+09	92	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
414	2021-09-17 01:26:16.805312+09	74	req=developer1 team1 (developer1@example.com)  project=Implement Web of Microsoft company(2)	2	[]	7	41
419	2021-09-17 07:42:17.599665+09	78	req=developer1 team1 (developer1@example.com)  project=None	2	[]	7	41
421	2021-09-17 07:43:20.959019+09	78	req=developer1 team1 (developer1@example.com)  project=None	2	[{"changed": {"fields": ["status"]}}]	7	41
423	2021-09-17 07:43:31.654939+09	76	req=developer1 team1 (developer1@example.com)  project=Implement Web of Microsoft company(2)	2	[{"changed": {"fields": ["status"]}}]	7	41
429	2021-09-17 09:09:27.160076+09	71	req=developer1 team1 (developer1@example.com)  project=Implement Web of Microsoft company(2)	2	[{"changed": {"fields": ["status"]}}]	7	41
431	2021-09-17 09:09:37.536653+09	73	req=developer1 team1 (developer1@example.com)  project=Fix bugs of Betasmartz site(3)	2	[{"changed": {"fields": ["status"]}}]	7	41
433	2021-09-17 09:09:45.885579+09	78	req=developer1 team1 (developer1@example.com)  project=None	2	[{"changed": {"fields": ["status"]}}]	7	41
435	2021-09-17 09:12:36.71352+09	25	developer1 team1 (developer1@example.com) Fix bugs of Betasmartz site(3)	3		10	41
436	2021-09-17 09:12:36.714694+09	22	developer1 team1 (developer1@example.com) None	3		10	41
437	2021-09-17 09:12:36.715642+09	21	developer1 team1 (developer1@example.com) Fix bugs of Betasmartz site(3)	3		10	41
442	2021-09-17 12:49:10.554569+09	41	Talent Hub(2)	2	[]	9	41
119	2021-08-26 04:23:06.111765+09	41	user admin (admin@example.com)	2	[{"changed": {"fields": ["role"]}}]	1	41
120	2021-09-01 09:28:34.027878+09	1	weekly log for user admin (admin@example.com) (2021-08-16)	1	[{"added": {}}]	16	41
121	2021-09-01 09:29:42.721542+09	2	daily log for user admin (admin@example.com) (2021-08-13)	1	[{"added": {}}]	16	41
122	2021-09-01 09:31:25.468273+09	3	daily log for manager1 team1 (manager1@gmail.com) (2021-08-14)	1	[{"added": {}}]	16	41
123	2021-09-01 09:33:13.202134+09	4	daily log for developer2 team1 (developer2@gmail.com) (2021-08-22)	1	[{"added": {}}]	16	41
124	2021-09-01 09:33:57.222832+09	2	monthly log for developer1 team1 (developer1@gmail.com) (2021-08-01)	2	[{"changed": {"fields": ["owner", "plan", "created_at", "interval"]}}]	16	41
125	2021-09-02 00:39:52.235727+09	1	weekly log for user admin (admin@example.com) (2021-08-16)	2	[]	16	41
126	2021-09-02 03:22:20.973708+09	2	monthly log for developer1 team1 (developer1@gmail.com) (2021-08-01)	2	[]	16	41
127	2021-09-02 03:32:53.878102+09	2	monthly log for developer1 team1 (developer1@gmail.com) (2021-09-01)	2	[{"changed": {"fields": ["created_at"]}}]	16	41
128	2021-09-02 03:40:02.134011+09	2	monthly log for developer1 team1 (developer1@gmail.com) (2021-09-01)	2	[]	16	41
129	2021-09-02 03:41:27.083697+09	5	monthly log for developer2 team1 (developer2@gmail.com) (2021-07-01)	1	[{"added": {}}]	16	41
130	2021-09-02 04:11:21.180962+09	6	daily log for developer4 team2 (developer4@gmail.com) (2021-09-01)	1	[{"added": {}}]	16	41
131	2021-09-02 04:13:13.273289+09	7	daily log for manager1 team1 (manager1@gmail.com) (2021-08-28)	1	[{"added": {}}]	16	41
132	2021-09-02 04:52:06.380825+09	48	req=developer2 team1 (developer2@gmail.com)  project=Betasmartz(1)	1	[{"added": {}}]	7	41
133	2021-09-02 06:54:18.713839+09	8	daily log for manager2 team2 (manager2@gmail.com) (2021-09-01)	1	[{"added": {}}]	16	41
134	2021-09-02 09:20:01.420941+09	7	daily log for manager1 team1 (manager1@gmail.com) (2021-08-28)	2	[{"changed": {"fields": ["achievements"]}}]	16	41
135	2021-09-02 09:23:08.198445+09	4	daily log for developer2 team1 (developer2@gmail.com) (2021-08-22)	2	[{"changed": {"fields": ["plan"]}}]	16	41
136	2021-09-02 09:24:57.358165+09	4	daily log for developer2 team1 (developer2@gmail.com) (2021-08-22)	2	[{"changed": {"fields": ["achievements"]}}]	16	41
137	2021-09-03 07:44:21.775164+09	1	QWERTYUU created by developer2 team1 (developer2@gmail.com)	1	[{"added": {}}]	17	41
138	2021-09-03 07:44:51.861119+09	1	QWERTYUU created by developer2 team1 (developer2@gmail.com)	2	[]	17	41
139	2021-09-03 07:45:33.858204+09	2	I wannsadfaiuf sadfj created by user admin (admin@example.com)	1	[{"added": {}}]	17	41
140	2021-09-03 07:48:52.0506+09	1	QWERTYUU created by manager1 team1 (manager1@gmail.com)	2	[{"changed": {"fields": ["creator", "object_id"]}}]	17	41
141	2021-09-03 07:50:05.90416+09	1	QWERTYUU created by manager1 team1 (manager1@gmail.com)	2	[{"changed": {"fields": ["read_at"]}}]	17	41
142	2021-09-03 15:49:15.703037+09	9	monthly log for developer2 team1 (developer2@gmail.com) (2021-09-01)	1	[{"added": {}}]	16	41
286	2021-09-16 04:07:00.961023+09	31	TTT(1)	3		9	41
143	2021-09-04 02:48:08.637701+09	4	daily log for developer2 team1 (developer2@gmail.com) (2021-08-22)	2	[{"changed": {"fields": ["plan", "achievements"]}}]	16	41
144	2021-09-04 04:42:15.597469+09	10	monthly log for developer4 team2 (developer4@gmail.com) (2021-07-01)	1	[{"added": {}}]	16	41
145	2021-09-05 03:32:29.219248+09	1	QWERTYUU created by manager1 team1 (manager1@gmail.com)	2	[{"changed": {"fields": ["read_at"]}}]	17	41
146	2021-09-05 03:33:47.888322+09	2	I wannsadfaiuf sadfj created by user admin (admin@example.com)	2	[{"changed": {"fields": ["read_at"]}}]	17	41
147	2021-09-05 03:34:13.720026+09	2	I wannsadfaiuf sadfj created by user admin (admin@example.com)	2	[]	17	41
148	2021-09-05 03:35:18.429056+09	2	I wannsadfaiuf sadfj created by user admin (admin@example.com)	2	[]	17	41
149	2021-09-05 03:42:01.341175+09	1	QWERTYUU created by manager1 team1 (manager1@gmail.com)	2	[]	17	41
150	2021-09-05 03:42:09.045304+09	2	I wannsadfaiuf sadfj created by user admin (admin@example.com)	2	[]	17	41
151	2021-09-05 03:42:36.918611+09	2	I wannsadfaiuf sadfj created by manager2 team2 (manager2@gmail.com)	2	[{"changed": {"fields": ["notify_to", "creator"]}}]	17	41
152	2021-09-05 03:48:20.818548+09	2	I wannsadfaiuf sadfj created by manager2 team2 (manager2@gmail.com)	2	[{"changed": {"fields": ["content_type", "object_id"]}}]	17	41
153	2021-09-08 02:59:05.346713+09	49	daily log for user admin (admin@example.com) (2021-09-07)	3		16	41
154	2021-09-08 02:59:15.878758+09	12	weekly log for user admin (admin@example.com) (2021-09-06)	3		16	41
155	2021-09-08 03:00:16.013128+09	53	daily log for user admin (admin@example.com) (None)	3		16	41
156	2021-09-08 03:00:26.881288+09	42	daily log for user admin (admin@example.com) (None)	3		16	41
157	2021-09-08 03:01:05.033232+09	44	daily log for user admin (admin@example.com) (None)	3		16	41
158	2021-09-08 03:01:13.866294+09	54	daily log for user admin (admin@example.com) (None)	3		16	41
159	2021-09-08 03:01:19.121674+09	51	weekly log for user admin (admin@example.com) (2021-08-23)	2	[]	16	41
160	2021-09-08 03:01:51.269659+09	48	daily log for user admin (admin@example.com) (None)	3		16	41
161	2021-09-08 03:01:51.272193+09	47	daily log for user admin (admin@example.com) (None)	3		16	41
162	2021-09-08 03:01:51.273659+09	46	daily log for user admin (admin@example.com) (None)	3		16	41
163	2021-09-08 03:01:51.275172+09	45	daily log for user admin (admin@example.com) (None)	3		16	41
164	2021-09-08 08:36:45.05389+09	2	I wannsadfaiuf sadfj created by manager2 team2 (manager2@gmail.com)	2	[{"changed": {"fields": ["read_at"]}}]	17	41
165	2021-09-08 08:37:10.642306+09	2	I wannsadfaiuf sadfj created by manager2 team2 (manager2@gmail.com)	2	[{"changed": {"fields": ["read_at"]}}]	17	41
166	2021-09-08 12:49:02.987015+09	2	I wannsadfaiuf sadfj created by manager2 team2 (manager2@gmail.com)	2	[{"changed": {"fields": ["read_at"]}}]	17	41
167	2021-09-08 12:49:30.202365+09	2	I wannsadfaiuf sadfj created by manager2 team2 (manager2@gmail.com)	2	[{"changed": {"fields": ["read_at"]}}]	17	41
168	2021-09-09 02:09:55.125366+09	3	adsf created by developer1 team1 (developer1@gmail.com)	1	[{"added": {}}]	17	41
169	2021-09-11 02:42:34.316701+09	3	adsf created by developer1 team1 (developer1@gmail.com)	2	[]	17	41
170	2021-09-11 02:43:43.54162+09	3	adsf created by developer1 team1 (developer1@gmail.com)	2	[]	17	41
171	2021-09-11 03:10:33.751269+09	53	req=developer3 team2 (developer3@gmail.com)  project=Pro Evolution(2)	1	[{"added": {}}]	7	41
172	2021-09-11 03:11:24.590298+09	53	req=developer3 team2 (developer3@gmail.com)  project=Pro Evolution(2)	3		7	41
173	2021-09-11 03:11:24.592137+09	52	req=developer2 team1 (developer2@gmail.com)  project=Betasmartz(1)	3		7	41
174	2021-09-11 03:11:24.593365+09	47	req=developer3 team2 (developer3@gmail.com)  project=Jogging Tracker(2)	3		7	41
175	2021-09-11 03:11:24.594489+09	46	req=developer3 team2 (developer3@gmail.com)  project=Pro Evolution(2)	3		7	41
176	2021-09-11 03:11:24.59582+09	45	req=developer3 team2 (developer3@gmail.com)  project=None	3		7	41
177	2021-09-11 03:12:25.329395+09	54	req=developer1 team1 (developer1@gmail.com)  project=Pro Evolution(2)	1	[{"added": {}}]	7	41
178	2021-09-11 03:56:21.860487+09	7	testasf(2)	2	[]	9	41
179	2021-09-11 03:57:17.130377+09	7	testasf(2)	2	[]	9	41
180	2021-09-11 03:58:01.230122+09	7	testasf(2)	2	[]	9	41
181	2021-09-11 03:59:05.73337+09	2	Jogging Tracker(2)	2	[]	9	41
182	2021-09-11 03:59:53.915937+09	8	Altitude(2)	1	[{"added": {}}]	9	41
183	2021-09-11 04:01:06.63583+09	9	Pro Evolution(2)	1	[{"added": {}}]	9	41
184	2021-09-11 04:01:57.563639+09	10	TTT(2)	1	[{"added": {}}]	9	41
185	2021-09-11 04:29:05.063396+09	11	TTT(1)	1	[{"added": {}}]	9	41
186	2021-09-11 04:35:57.925579+09	11	TTT(1)	3		9	41
187	2021-09-11 04:35:57.928152+09	10	TTT(2)	3		9	41
188	2021-09-11 04:35:57.929365+09	9	Pro Evolution(2)	3		9	41
189	2021-09-11 04:36:25.072645+09	8	Altitude(2)	2	[]	9	41
190	2021-09-11 04:36:34.13001+09	8	Altitude(2)	2	[]	9	41
191	2021-09-11 04:37:50.414823+09	8	Altitude(2)	2	[]	9	41
192	2021-09-11 04:38:00.699859+09	7	testasf(2)	2	[]	9	41
193	2021-09-11 04:39:59.845024+09	8	Altitude(2)	2	[{"changed": {"fields": ["status"]}}]	9	41
194	2021-09-11 04:40:29.181843+09	8	Altitude(3)	2	[{"changed": {"fields": ["type"]}}]	9	41
195	2021-09-11 04:41:38.070748+09	8	Altitude(3)	2	[{"changed": {"fields": ["client", "participants"]}}]	9	41
196	2021-09-11 04:43:34.122396+09	6	Pro Evolution(2)	2	[{"changed": {"fields": ["status"]}}]	9	41
197	2021-09-11 04:43:52.098245+09	8	Altitude(3)	2	[{"changed": {"fields": ["status"]}}]	9	41
198	2021-09-11 04:45:28.285451+09	5	blog(3)	2	[{"changed": {"fields": ["status"]}}]	9	41
199	2021-09-11 04:58:29.468504+09	8	Altitude(3)	2	[{"changed": {"fields": ["status"]}}]	9	41
200	2021-09-11 05:00:22.588416+09	8	Altitude(3)	2	[{"changed": {"fields": ["status"]}}]	9	41
201	2021-09-11 05:01:05.034111+09	8	Altitude(3)	2	[{"changed": {"fields": ["status"]}}]	9	41
202	2021-09-11 05:36:22.716819+09	12	TTT(2)	1	[{"added": {}}]	9	41
203	2021-09-11 05:36:41.717868+09	13	Pro Evolution(1)	1	[{"added": {}}]	9	41
204	2021-09-11 05:37:38.545592+09	14	Pro Evolution(1)	1	[{"added": {}}]	9	41
205	2021-09-11 06:02:22.990313+09	15	Pro Evolution(2)	1	[{"added": {}}]	9	41
206	2021-09-11 06:02:47.218187+09	16	TTT(2)	1	[{"added": {}}]	9	41
207	2021-09-11 06:03:19.561865+09	16	TTT(2)	3		9	41
208	2021-09-11 06:03:19.564504+09	15	Pro Evolution(2)	3		9	41
209	2021-09-11 06:03:19.565968+09	14	Pro Evolution(1)	3		9	41
210	2021-09-11 06:03:19.567301+09	13	Pro Evolution(1)	3		9	41
211	2021-09-11 06:03:19.568676+09	12	TTT(2)	3		9	41
212	2021-09-11 06:03:19.571023+09	8	Altitude(3)	3		9	41
213	2021-09-11 06:38:56.657028+09	20	TTT(2)	1	[{"added": {}}]	9	41
214	2021-09-11 06:39:17.269679+09	13	{{creator}} started his {{object}}. created by developer3 team2 (developer3@gmail.com)	3		17	41
285	2021-09-16 04:07:00.958338+09	32	Subway(2)	3		9	41
215	2021-09-11 06:39:17.272844+09	12	{{creator}} started his {{object}}. created by developer3 team2 (developer3@gmail.com)	3		17	41
216	2021-09-11 06:39:17.283836+09	3	adsf created by developer1 team1 (developer1@gmail.com)	3		17	41
217	2021-09-11 06:39:27.333081+09	2	I wannsadfaiuf sadfj created by manager2 team2 (manager2@gmail.com)	3		17	41
218	2021-09-11 06:39:27.33503+09	1	QWERTYUU created by manager1 team1 (manager1@gmail.com)	3		17	41
219	2021-09-11 06:40:19.162167+09	21	Pro Evolution(2)	1	[{"added": {}}]	9	41
220	2021-09-11 06:45:53.780515+09	21	Pro Evolution(2)	2	[{"changed": {"fields": ["status"]}}]	9	41
221	2021-09-11 06:46:16.926525+09	20	TTT(2)	2	[{"changed": {"fields": ["status"]}}]	9	41
222	2021-09-11 06:53:40.605669+09	22	Pro Evolution(2)	1	[{"added": {}}]	9	41
223	2021-09-11 06:55:34.544823+09	23	Pro Evolution(3)	1	[{"added": {}}]	9	41
224	2021-09-11 06:56:46.018599+09	24	Pro Evolution(2)	1	[{"added": {}}]	9	41
225	2021-09-11 06:58:09.51036+09	24	Pro Evolution(2)	3		9	41
226	2021-09-11 06:58:09.513306+09	23	Pro Evolution(3)	3		9	41
227	2021-09-11 06:58:09.514587+09	22	Pro Evolution(2)	3		9	41
228	2021-09-11 06:58:09.515871+09	21	Pro Evolution(2)	3		9	41
229	2021-09-11 06:58:09.517004+09	20	TTT(2)	3		9	41
230	2021-09-11 06:58:35.112505+09	25	Pro Evolution(2)	1	[{"added": {}}]	9	41
231	2021-09-11 07:00:24.695169+09	24	{{creator}} started his {{object}}. created by developer1 team1 (developer1@gmail.com)	3		17	41
232	2021-09-11 07:00:24.863976+09	23	{{creator}} started his {{object}}. created by developer1 team1 (developer1@gmail.com)	3		17	41
233	2021-09-11 07:00:24.866168+09	22	{{creator}} started his {{object}}. created by developer3 team2 (developer3@gmail.com)	3		17	41
234	2021-09-11 07:00:24.868596+09	21	{{creator}} started his {{object}}. created by developer3 team2 (developer3@gmail.com)	3		17	41
235	2021-09-11 07:00:24.870168+09	20	{{creator}} started his {{object}}. created by developer1 team1 (developer1@gmail.com)	3		17	41
236	2021-09-11 07:00:24.87276+09	19	{{creator}} started his {{object}}. created by developer1 team1 (developer1@gmail.com)	3		17	41
237	2021-09-11 07:00:24.875343+09	18	{{creator}} started his {{object}}. created by developer1 team1 (developer1@gmail.com)	3		17	41
238	2021-09-11 07:00:24.876649+09	17	{{creator}} started his {{object}}. created by developer1 team1 (developer1@gmail.com)	3		17	41
239	2021-09-11 07:00:24.878148+09	15	{{creator}} started his {{object}}. created by developer3 team2 (developer3@gmail.com)	3		17	41
240	2021-09-11 07:00:24.87953+09	14	{{creator}} started his {{object}}. created by developer3 team2 (developer3@gmail.com)	3		17	41
241	2021-09-11 07:01:03.726543+09	27	TTT(2)	1	[{"added": {}}]	9	41
242	2021-09-11 07:06:06.076021+09	28	TTT(2)	1	[{"added": {}}]	9	41
243	2021-09-11 07:07:01.570244+09	28	{{creator}} started his {{object}}. created by developer2 team1 (developer2@gmail.com)	3		17	41
244	2021-09-11 07:07:01.572329+09	27	{{creator}} started his {{object}}. created by developer2 team1 (developer2@gmail.com)	3		17	41
245	2021-09-11 07:07:01.573554+09	26	{{creator}} started his {{object}}. created by developer1 team1 (developer1@gmail.com)	3		17	41
246	2021-09-11 07:07:01.574645+09	25	{{creator}} started his {{object}}. created by developer1 team1 (developer1@gmail.com)	3		17	41
247	2021-09-11 07:07:29.13157+09	29	Pro Evolution(2)	1	[{"added": {}}]	9	41
248	2021-09-11 07:07:39.962521+09	31	{{creator}} started his {{object}}. created by developer1 team1 (developer1@gmail.com)	3		17	41
249	2021-09-11 07:07:39.964826+09	30	{{creator}} started his {{object}}. created by developer1 team1 (developer1@gmail.com)	3		17	41
250	2021-09-11 07:07:39.967686+09	29	{{creator}} started his {{object}}. created by developer1 team1 (developer1@gmail.com)	3		17	41
251	2021-09-11 07:07:55.588308+09	29	Pro Evolution(2)	2	[{"changed": {"fields": ["status"]}}]	9	41
252	2021-09-11 07:08:09.921685+09	34	{{creator}} paused his {{object}}. created by developer1 team1 (developer1@gmail.com)	3		17	41
253	2021-09-11 07:08:09.923754+09	33	{{creator}} paused his {{object}}. created by developer1 team1 (developer1@gmail.com)	3		17	41
254	2021-09-11 07:08:09.924967+09	32	{{creator}} paused his {{object}}. created by developer1 team1 (developer1@gmail.com)	3		17	41
255	2021-09-11 07:08:32.947026+09	29	Pro Evolution(2)	2	[{"changed": {"fields": ["status"]}}]	9	41
256	2021-09-11 07:51:40.449813+09	30	TTT(3)	1	[{"added": {}}]	9	41
257	2021-09-11 08:00:18.162495+09	40	{{creator}} started his {{object}}. created by developer2 team1 (developer2@gmail.com)	3		17	41
258	2021-09-11 08:00:18.167664+09	39	{{creator}} started his {{object}}. created by developer2 team1 (developer2@gmail.com)	3		17	41
259	2021-09-11 08:00:18.169617+09	38	{{creator}} started his {{object}}. created by developer2 team1 (developer2@gmail.com)	3		17	41
260	2021-09-11 08:00:18.171031+09	37	{{creator}} stopped his {{object}}. created by developer1 team1 (developer1@gmail.com)	3		17	41
261	2021-09-11 08:00:18.172986+09	36	{{creator}} stopped his {{object}}. created by developer1 team1 (developer1@gmail.com)	3		17	41
262	2021-09-11 08:00:18.17472+09	35	{{creator}} stopped his {{object}}. created by developer1 team1 (developer1@gmail.com)	3		17	41
263	2021-09-11 08:00:29.972855+09	30	TTT(3)	3		9	41
264	2021-09-11 08:00:29.974722+09	29	Pro Evolution(2)	3		9	41
265	2021-09-11 08:00:29.975974+09	28	TTT(2)	3		9	41
266	2021-09-11 08:00:29.977088+09	27	TTT(2)	3		9	41
267	2021-09-11 08:00:29.97827+09	25	Pro Evolution(2)	3		9	41
268	2021-09-11 08:00:46.466175+09	31	TTT(1)	1	[{"added": {}}]	9	41
269	2021-09-11 08:02:41.638385+09	31	TTT(1)	2	[{"changed": {"fields": ["status"]}}]	9	41
270	2021-09-14 06:40:34.310945+09	42	Nam Il (developer@example.com)	1	[{"added": {}}]	1	41
271	2021-09-16 04:05:28.623661+09	54	req=developer1 team1 (developer1@example.com)  project=Pro Evolution(2)	3		7	41
272	2021-09-16 04:05:32.904341+09	50	req=developer2 team1 (developer2@gmail.com)  project=Betasmartz(1)	3		7	41
273	2021-09-16 04:05:42.196712+09	51	req=developer2 team1 (developer2@gmail.com)  project=Betasmartz(1)	3		7	41
274	2021-09-16 04:05:42.198732+09	49	req=user admin (admin@example.com)  project=None	3		7	41
275	2021-09-16 04:05:42.199828+09	48	req=developer2 team1 (developer2@gmail.com)  project=Betasmartz(1)	3		7	41
276	2021-09-16 04:05:42.20082+09	33	req=developer3 team2 (developer3@gmail.com)  project=Jogging Tracker(2)	3		7	41
277	2021-09-16 04:05:42.201794+09	32	req=developer3 team2 (developer3@gmail.com)  project=Jogging Tracker(2)	3		7	41
278	2021-09-16 04:05:42.202893+09	31	req=manager2 team2 (manager2@gmail.com)  project=Jogging Tracker(2)	3		7	41
279	2021-09-16 04:07:00.794349+09	38	Add redux store and saga(2)	3		9	41
280	2021-09-16 04:07:00.823239+09	37	Fix console warning(2)	3		9	41
281	2021-09-16 04:07:00.824539+09	36	Fix console warning(2)	3		9	41
282	2021-09-16 04:07:00.825623+09	35	Add AuthRoute and PrivateRoute(2)	3		9	41
283	2021-09-16 04:07:00.826794+09	34	UpWork(2)	3		9	41
288	2021-09-16 04:07:00.968146+09	6	Pro Evolution(2)	3		9	41
289	2021-09-16 04:07:00.97121+09	5	blog(3)	3		9	41
290	2021-09-16 04:07:00.973847+09	3	Betasmartz(1)	3		9	41
291	2021-09-16 04:07:00.976238+09	2	Jogging Tracker(2)	3		9	41
292	2021-09-16 04:07:32.448227+09	63	{{creator}} updated a {{object}}. created by developer2 team1 (developer2@gmail.com)	3		17	41
293	2021-09-16 04:07:32.450301+09	62	{{creator}} updated a {{object}}. created by developer2 team1 (developer2@gmail.com)	3		17	41
294	2021-09-16 04:07:32.451492+09	61	{{creator}} updated a {{object}}. created by developer2 team1 (developer2@gmail.com)	3		17	41
295	2021-09-16 04:07:32.452811+09	60	{{creator}} started his {{object}}. created by Nam Il (developer@example.com)	3		17	41
296	2021-09-16 04:07:32.453874+09	59	{{creator}} started his {{object}}. created by Nam Il (developer@example.com)	3		17	41
297	2021-09-16 04:07:32.454836+09	58	{{creator}} started his {{object}}. created by Nam Il (developer@example.com)	3		17	41
298	2021-09-16 04:07:32.455828+09	57	{{creator}} started his {{object}}. created by Nam Il (developer@example.com)	3		17	41
299	2021-09-16 04:07:32.456799+09	56	{{creator}} started his {{object}}. created by Nam Il (developer@example.com)	3		17	41
300	2021-09-16 04:07:32.511633+09	55	{{creator}} started his {{object}}. created by Nam Il (developer@example.com)	3		17	41
301	2021-09-16 04:07:32.512821+09	54	{{creator}} started his {{object}}. created by Nam Il (developer@example.com)	3		17	41
302	2021-09-16 04:07:32.513797+09	53	{{creator}} started his {{object}}. created by Nam Il (developer@example.com)	3		17	41
303	2021-09-16 04:07:32.514768+09	52	{{creator}} started his {{object}}. created by Nam Il (developer@example.com)	3		17	41
304	2021-09-16 04:07:32.515718+09	51	{{creator}} started his {{object}}. created by Nam Il (developer@example.com)	3		17	41
305	2021-09-16 04:07:32.5167+09	50	{{creator}} started his {{object}}. created by Nam Il (developer@example.com)	3		17	41
306	2021-09-16 04:07:32.51769+09	49	{{creator}} started his {{object}}. created by Nam Il (developer@example.com)	3		17	41
307	2021-09-16 04:07:32.518757+09	48	{{creator}} started his {{object}}. created by developer4 team2 (developer4@gmail.com)	3		17	41
308	2021-09-16 04:07:32.519675+09	47	{{creator}} started his {{object}}. created by developer4 team2 (developer4@gmail.com)	3		17	41
309	2021-09-16 04:07:32.520577+09	46	{{creator}} paused his {{object}}. created by developer2 team1 (developer2@gmail.com)	3		17	41
310	2021-09-16 04:07:32.521475+09	45	{{creator}} paused his {{object}}. created by developer2 team1 (developer2@gmail.com)	3		17	41
311	2021-09-16 04:07:32.522384+09	44	{{creator}} paused his {{object}}. created by developer2 team1 (developer2@gmail.com)	3		17	41
312	2021-09-16 04:07:32.523278+09	43	{{creator}} started his {{object}}. created by developer2 team1 (developer2@gmail.com)	3		17	41
313	2021-09-16 04:07:32.524186+09	42	{{creator}} started his {{object}}. created by developer2 team1 (developer2@gmail.com)	3		17	41
314	2021-09-16 04:07:32.525323+09	41	{{creator}} started his {{object}}. created by developer2 team1 (developer2@gmail.com)	3		17	41
315	2021-09-16 04:07:50.71501+09	55	weekly log for user admin (admin@example.com) (2021-09-06)	3		16	41
316	2021-09-16 04:07:50.717564+09	52	monthly log for user admin (admin@example.com) (2021-09-01)	3		16	41
317	2021-09-16 04:07:50.719515+09	51	weekly log for user admin (admin@example.com) (2021-08-23)	3		16	41
318	2021-09-16 04:07:50.721195+09	11	daily log for user admin (admin@example.com) (2021-09-05)	3		16	41
319	2021-09-16 04:07:50.722565+09	10	monthly log for developer4 team2 (developer4@gmail.com) (2021-07-01)	3		16	41
320	2021-09-16 04:07:50.723874+09	9	monthly log for developer2 team1 (developer2@gmail.com) (2021-09-01)	3		16	41
321	2021-09-16 04:07:50.725269+09	8	daily log for manager2 team2 (manager2@gmail.com) (2021-09-01)	3		16	41
322	2021-09-16 04:07:50.726495+09	7	daily log for manager1 team1 (manager1@gmail.com) (2021-08-28)	3		16	41
323	2021-09-16 04:07:50.727666+09	6	daily log for developer4 team2 (developer4@gmail.com) (2021-09-01)	3		16	41
324	2021-09-16 04:07:50.728767+09	5	monthly log for developer2 team1 (developer2@gmail.com) (2021-07-01)	3		16	41
325	2021-09-16 04:07:50.729912+09	4	daily log for developer2 team1 (developer2@gmail.com) (2021-08-22)	3		16	41
326	2021-09-16 04:07:50.731049+09	3	daily log for manager1 team1 (manager1@gmail.com) (2021-08-14)	3		16	41
327	2021-09-16 04:07:50.732216+09	2	monthly log for developer1 team1 (developer1@example.com) (2021-09-01)	3		16	41
328	2021-09-16 04:07:50.733528+09	1	weekly log for user admin (admin@example.com) (2021-08-16)	3		16	41
329	2021-09-16 04:09:37.153753+09	31	neymar jr (admin@gmail.com)	3		1	41
332	2021-09-16 04:11:57.09971+09	42	developer5 team2 (developer5@example.com)	2	[{"changed": {"fields": ["username", "first_name", "last_name", "email"]}}]	1	41
338	2021-09-16 04:21:23.238764+09	31	Jordi Alba	3		2	41
339	2021-09-16 04:21:23.243286+09	30	Luiz Suarez	3		2	41
340	2021-09-16 04:21:23.246404+09	29	Alexis Sanchez	3		2	41
341	2021-09-16 04:21:23.249531+09	27	Kevin Muller	3		2	41
342	2021-09-16 04:21:23.252233+09	26	Masao Kiba	3		2	41
345	2021-09-16 05:58:49.807637+09	39	manager1 team1 (manager1@example.com)	2	[{"changed": {"fields": ["email"]}}]	1	41
348	2021-09-16 06:40:38.021613+09	32	developer1 team1 (developer1@example.com)	3		1	41
349	2021-09-16 06:40:38.023382+09	33	developer2 team1 (developer2@gmail.com)	3		1	41
350	2021-09-16 06:40:38.024493+09	35	developer3 team2 (developer3@example.com)	3		1	41
351	2021-09-16 06:40:38.025413+09	42	developer5 team2 (developer5@example.com)	3		1	41
352	2021-09-16 06:40:38.026344+09	39	manager1 team1 (manager1@example.com)	3		1	41
353	2021-09-16 06:40:38.027246+09	34	manager2 team2 (manager2@example.com)	3		1	41
356	2021-09-16 06:53:33.994191+09	44	developer2 team1 (developer2@example.com)	1	[{"added": {}}]	1	41
359	2021-09-16 06:56:13.319032+09	47	developer5 team2 (developer5@example.com)	1	[{"added": {}}]	1	41
362	2021-09-16 06:59:27.517462+09	50	manager2 team2 (manager2@example.com)	1	[{"added": {}}]	1	41
370	2021-09-16 08:08:34.470626+09	65	req=developer1 team1 (developer1@example.com)  project=Fix bugs of Betasmartz site(3)	3		7	41
409	2021-09-16 08:16:02.440175+09	69	req=developer1 team1 (developer1@example.com)  project=Implement Web of Microsoft company(2)	3		7	41
410	2021-09-16 08:16:02.442196+09	68	req=developer1 team1 (developer1@example.com)  project=Implement Web of Microsoft company(2)	3		7	41
411	2021-09-16 08:16:02.443264+09	67	req=developer1 team1 (developer1@example.com)  project=Implement Web of Microsoft company(2)	3		7	41
412	2021-09-16 08:16:02.444753+09	66	req=developer1 team1 (developer1@example.com)  project=Implement Web of Microsoft company(2)	3		7	41
415	2021-09-17 01:26:23.200082+09	73	req=developer1 team1 (developer1@example.com)  project=Fix bugs of Betasmartz site(3)	2	[]	7	41
438	2021-09-17 09:12:36.716622+09	17	developer1 team1 (developer1@example.com) Fix bugs of Betasmartz site(3)	3		10	41
439	2021-09-17 09:12:36.717691+09	16	developer1 team1 (developer1@example.com) None	3		10	41
440	2021-09-17 09:12:36.718623+09	15	developer1 team1 (developer1@example.com) Implement Web of Microsoft company(2)	3		10	41
441	2021-09-17 09:14:31.393778+09	72	req=developer1 team1 (developer1@example.com)  project=None	2	[{"changed": {"fields": ["amount"]}}]	7	41
443	2021-09-17 12:49:18.768249+09	40	Fix bugs of Betasmartz site(3)	2	[]	9	41
444	2021-09-18 02:59:07.143512+09	81	req=developer2 team1 (developer2@example.com)  project=Implement Web of Microsoft company(2)	1	[{"added": {}}]	7	41
445	2021-09-18 03:00:47.638089+09	81	req=developer2 team1 (developer2@example.com)  project=Implement Web of Microsoft company(2)	3		7	41
446	2021-09-18 11:35:58.526522+09	83	req=developer1 team1 (developer1@example.com)  project=Implement Web of Microsoft company(2)	1	[{"added": {}}]	7	41
447	2021-09-18 11:36:18.784745+09	84	req=developer2 team1 (developer2@example.com)  project=None	1	[{"added": {}}]	7	41
448	2021-09-18 11:36:36.664437+09	85	req=developer4 team2 (developer4@example.com)  project=None	1	[{"added": {}}]	7	41
449	2021-09-18 11:39:58.27659+09	85	req=developer4 team2 (developer4@example.com)  project=Talent Hub(2)	2	[{"changed": {"fields": ["project"]}}]	7	41
450	2021-09-18 11:40:03.918747+09	84	req=developer2 team1 (developer2@example.com)  project=Talent Hub(2)	2	[{"changed": {"fields": ["project"]}}]	7	41
451	2021-09-18 11:40:08.761259+09	83	req=developer1 team1 (developer1@example.com)  project=Implement Web of Microsoft company(2)	2	[]	7	41
452	2021-09-18 11:55:38.458297+09	85	req=developer4 team2 (developer4@example.com)  project=Talent Hub(2)	3		7	41
453	2021-09-18 11:55:38.461416+09	84	req=developer2 team1 (developer2@example.com)  project=Talent Hub(2)	3		7	41
454	2021-09-18 11:55:38.462999+09	83	req=developer1 team1 (developer1@example.com)  project=Implement Web of Microsoft company(2)	3		7	41
455	2021-09-18 11:55:53.889769+09	82	req=developer2 team1 (developer2@example.com)  project=Talent Hub(2)	3		7	41
456	2021-09-18 11:56:17.84945+09	78	req=developer1 team1 (developer1@example.com)  project=None	3		7	41
457	2021-09-18 11:56:17.851904+09	77	req=developer1 team1 (developer1@example.com)  project=Fix bugs of Betasmartz site(3)	3		7	41
458	2021-09-18 11:56:17.853435+09	73	req=developer1 team1 (developer1@example.com)  project=Fix bugs of Betasmartz site(3)	3		7	41
459	2021-09-18 11:56:17.854804+09	72	req=developer1 team1 (developer1@example.com)  project=None	3		7	41
460	2021-09-18 11:56:17.856211+09	71	req=developer1 team1 (developer1@example.com)  project=Implement Web of Microsoft company(2)	3		7	41
461	2021-09-18 11:59:20.47427+09	168	{{creator}} updated a {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
462	2021-09-18 11:59:20.476302+09	167	{{creator}} updated a {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
463	2021-09-18 11:59:20.477358+09	166	{{creator}} updated a {{object}}. created by developer4 team2 (developer4@example.com)	3		17	41
464	2021-09-18 11:59:20.478335+09	165	{{creator}} updated a {{object}}. created by developer4 team2 (developer4@example.com)	3		17	41
465	2021-09-18 11:59:20.479326+09	164	{{creator}} created a new {{object}}. created by developer4 team2 (developer4@example.com)	3		17	41
466	2021-09-18 11:59:20.480303+09	163	{{creator}} created a new {{object}}. created by developer4 team2 (developer4@example.com)	3		17	41
467	2021-09-18 11:59:20.48133+09	162	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
468	2021-09-18 11:59:20.482248+09	161	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
469	2021-09-18 11:59:20.483182+09	160	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
470	2021-09-18 11:59:20.484074+09	159	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
471	2021-09-18 11:59:20.484992+09	158	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
472	2021-09-18 11:59:20.485898+09	157	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
473	2021-09-18 11:59:20.48704+09	156	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
474	2021-09-18 11:59:20.48844+09	155	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
475	2021-09-18 11:59:20.48954+09	154	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
476	2021-09-18 11:59:20.490498+09	153	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
477	2021-09-18 11:59:20.491596+09	152	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
478	2021-09-18 11:59:20.492526+09	151	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
479	2021-09-18 11:59:20.493421+09	150	{{creator}} updated a {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
480	2021-09-18 11:59:20.494311+09	149	{{creator}} updated a {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
481	2021-09-18 11:59:20.495215+09	148	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
482	2021-09-18 11:59:20.49613+09	147	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
483	2021-09-18 11:59:20.497075+09	146	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
484	2021-09-18 11:59:20.497968+09	145	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
485	2021-09-18 11:59:20.498951+09	144	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
486	2021-09-18 11:59:20.499928+09	143	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
487	2021-09-18 11:59:20.50094+09	142	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
488	2021-09-18 11:59:20.501877+09	141	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
489	2021-09-18 11:59:20.502762+09	140	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
490	2021-09-18 11:59:20.5037+09	139	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
491	2021-09-18 11:59:20.504823+09	138	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
492	2021-09-18 11:59:20.505766+09	137	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
493	2021-09-18 11:59:20.506805+09	136	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
494	2021-09-18 11:59:20.507721+09	135	{{creator}} started his {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
495	2021-09-18 11:59:20.508619+09	134	{{creator}} started his {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
496	2021-09-18 11:59:20.509499+09	133	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
497	2021-09-18 11:59:20.510392+09	132	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
498	2021-09-18 11:59:20.511296+09	131	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
499	2021-09-18 11:59:20.512192+09	130	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
500	2021-09-18 11:59:20.513361+09	129	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
501	2021-09-18 11:59:20.514402+09	128	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
502	2021-09-18 11:59:20.515348+09	127	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
503	2021-09-18 11:59:20.516292+09	126	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
504	2021-09-18 11:59:20.517358+09	125	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
505	2021-09-18 11:59:20.518628+09	124	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
506	2021-09-18 11:59:20.519704+09	123	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
507	2021-09-18 11:59:20.520754+09	122	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
508	2021-09-18 11:59:20.609747+09	121	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
509	2021-09-18 11:59:20.612563+09	120	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
510	2021-09-18 11:59:20.614779+09	119	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
511	2021-09-18 11:59:20.616842+09	118	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
512	2021-09-18 11:59:20.618887+09	117	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
513	2021-09-18 11:59:20.620994+09	116	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
514	2021-09-18 11:59:20.623809+09	115	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
515	2021-09-18 11:59:20.626212+09	114	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
516	2021-09-18 11:59:20.628475+09	113	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
517	2021-09-18 11:59:20.630564+09	112	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
518	2021-09-18 11:59:20.632586+09	111	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
519	2021-09-18 11:59:20.634628+09	110	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
520	2021-09-18 11:59:20.636837+09	109	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
521	2021-09-18 11:59:20.639343+09	108	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
522	2021-09-18 11:59:20.641586+09	107	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
523	2021-09-18 11:59:20.64416+09	106	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
524	2021-09-18 11:59:20.646803+09	105	{{creator}} updated a {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
525	2021-09-18 11:59:20.649252+09	104	{{creator}} updated a {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
526	2021-09-18 11:59:20.651719+09	103	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
527	2021-09-18 11:59:20.684282+09	102	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
528	2021-09-18 12:46:35.960917+09	86	req=developer1 team1 (developer1@example.com)  project=None	1	[{"added": {}}]	7	41
529	2021-09-18 12:46:53.080297+09	87	req=developer1 team1 (developer1@example.com)  project=None	1	[{"added": {}}]	7	41
530	2021-09-18 12:47:08.127581+09	88	req=developer2 team1 (developer2@example.com)  project=None	1	[{"added": {}}]	7	41
531	2021-09-18 12:47:24.360506+09	89	req=developer4 team2 (developer4@example.com)  project=None	1	[{"added": {}}]	7	41
532	2021-09-19 04:38:12.784605+09	89	req=developer4 team2 (developer4@example.com)  project=None	2	[{"changed": {"fields": ["status"]}}]	7	41
533	2021-09-19 04:38:17.319848+09	88	req=developer2 team1 (developer2@example.com)  project=None	2	[{"changed": {"fields": ["status"]}}]	7	41
534	2021-09-19 04:38:21.761049+09	87	req=developer1 team1 (developer1@example.com)  project=None	2	[{"changed": {"fields": ["status"]}}]	7	41
535	2021-09-19 04:38:26.792967+09	86	req=developer1 team1 (developer1@example.com)  project=None	2	[{"changed": {"fields": ["status"]}}]	7	41
536	2021-09-19 06:52:02.171054+09	89	req=developer4 team2 (developer4@example.com)  project=None	2	[{"changed": {"fields": ["status"]}}]	7	41
537	2021-09-19 06:52:38.381557+09	89	req=developer4 team2 (developer4@example.com)  project=None	2	[{"changed": {"fields": ["status"]}}]	7	41
538	2021-09-19 07:32:06.326067+09	89	req=developer4 team2 (developer4@example.com)  project=None	3		7	41
539	2021-09-19 07:32:06.328974+09	88	req=developer2 team1 (developer2@example.com)  project=None	3		7	41
540	2021-09-19 07:32:06.330735+09	87	req=developer1 team1 (developer1@example.com)  project=None	3		7	41
541	2021-09-19 07:32:06.332187+09	86	req=developer1 team1 (developer1@example.com)  project=None	3		7	41
542	2021-10-09 07:42:43.291146+09	109	req=developer4 team2 (developer4@example.com)  project=Implement Web of Microsoft company(2)	1	[{"added": {}}]	7	41
543	2021-10-09 07:43:18.323422+09	40	developer4 team2 (developer4@example.com) Implement Web of Microsoft company(2)	1	[{"added": {}}]	10	41
544	2021-12-08 21:22:59.909798+09	42	Jogging Tracker(2)	1	[{"added": {}}]	9	41
545	2021-12-08 21:27:44.36356+09	43	Altitude Network(1)	1	[{"added": {}}]	9	41
546	2021-12-08 21:28:32.731209+09	44	Betasmartz(4)	1	[{"added": {}}]	9	41
547	2021-12-08 21:44:19.793818+09	44	Betasmartz(4)	3		9	41
548	2021-12-08 21:44:19.797699+09	43	Altitude Network(1)	3		9	41
549	2021-12-08 21:44:19.799287+09	42	Jogging Tracker(2)	3		9	41
550	2021-12-08 22:00:36.401837+09	48	developer6 team2 (developer6@example.com)	2	[{"changed": {"fields": ["username"]}}]	1	41
551	2021-12-08 22:00:47.169507+09	49	manager1 team1 (manager1@example.com)	2	[{"changed": {"fields": ["username"]}}]	1	41
552	2021-12-08 22:03:22.676503+09	43	developer1 team1 (developer1@example.com)	3		1	41
553	2021-12-08 22:07:29.617631+09	51	  (developer1@example.com)	1	[{"added": {}}]	1	41
554	2021-12-08 23:05:18.420253+09	51	developer1 team1 (developer1@example.com)	2	[{"changed": {"fields": ["first_name", "last_name"]}}]	1	41
555	2021-12-08 23:05:18.473667+09	51	developer1 team1 (developer1@example.com)	2	[]	1	41
556	2021-12-10 21:13:08.065468+09	1	paypal(paypal.com/david)	1	[{"added": {}}]	18	41
557	2021-12-11 00:09:51.3527+09	4	bitcoin(0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0MSwidXNlcm5hbWUiOiJhZ)	3		18	41
558	2021-12-11 00:10:36.910983+09	5	bitcoin(0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0MSwidXNlcm5hbWUiOiJhZ)	3		18	41
559	2021-12-13 21:31:24.033465+09	342	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
560	2021-12-13 21:31:24.134256+09	341	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
561	2021-12-13 21:31:24.135248+09	340	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
562	2021-12-13 21:31:24.136149+09	339	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
563	2021-12-13 21:31:24.136998+09	338	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
564	2021-12-13 21:31:24.137893+09	337	{{creator}} created a new {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
565	2021-12-13 21:31:24.138766+09	336	{{creator}} started his {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
566	2021-12-13 21:31:24.139672+09	335	{{creator}} started his {{object}}. created by developer1 team1 (developer1@example.com)	3		17	41
567	2021-12-13 21:31:24.141327+09	334	{{creator}} started his {{object}}. created by developer3 team1 (developer3@example.com)	3		17	41
568	2021-12-13 21:31:24.143422+09	333	{{creator}} started his {{object}}. created by developer3 team1 (developer3@example.com)	3		17	41
569	2021-12-13 21:31:24.14471+09	332	{{creator}} started his {{object}}. created by developer4 team2 (developer4@example.com)	3		17	41
570	2021-12-13 21:31:24.145595+09	331	{{creator}} started his {{object}}. created by developer4 team2 (developer4@example.com)	3		17	41
571	2021-12-13 21:31:24.146549+09	330	{{creator}} started his {{object}}. created by developer4 team2 (developer4@example.com)	3		17	41
572	2021-12-13 21:31:24.14737+09	329	{{creator}} started his {{object}}. created by developer4 team2 (developer4@example.com)	3		17	41
573	2021-12-13 21:31:24.148105+09	265	{{creator}} logged his {{object}} created by manager1 team1 (manager1@example.com)	3		17	41
574	2021-12-13 21:31:24.148942+09	264	{{creator}} logged his {{object}} created by manager1 team1 (manager1@example.com)	3		17	41
575	2021-12-13 21:31:24.149722+09	263	{{creator}} created a new {{object}}. created by developer4 team2 (developer4@example.com)	3		17	41
576	2021-12-13 21:31:24.150444+09	262	{{creator}} created a new {{object}}. created by developer4 team2 (developer4@example.com)	3		17	41
577	2021-12-13 21:31:24.151258+09	254	{{creator}} logged his {{object}} created by manager1 team1 (manager1@example.com)	3		17	41
578	2021-12-13 21:31:24.152043+09	253	{{creator}} canceled a {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
579	2021-12-13 21:31:24.152835+09	252	{{creator}} canceled a {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
580	2021-12-13 21:31:24.153628+09	251	{{object}} has been declined created by user admin (admin@example.com)	3		17	41
581	2021-12-13 21:31:24.154475+09	250	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
582	2021-12-13 21:31:24.155337+09	249	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
583	2021-12-13 21:31:24.156551+09	248	{{creator}} canceled a {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
584	2021-12-13 21:31:24.158117+09	247	{{creator}} canceled a {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
585	2021-12-13 21:31:24.159087+09	246	{{creator}} canceled a {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
586	2021-12-13 21:31:24.160011+09	245	{{creator}} canceled a {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
587	2021-12-13 21:31:24.161403+09	244	{{object}} has been declined created by user admin (admin@example.com)	3		17	41
588	2021-12-13 21:31:24.164376+09	243	{{object}} has been declined created by user admin (admin@example.com)	3		17	41
589	2021-12-13 21:31:24.166093+09	242	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
590	2021-12-13 21:31:24.167199+09	241	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
591	2021-12-13 21:31:24.168413+09	240	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
592	2021-12-13 21:31:24.16936+09	239	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
593	2021-12-13 21:31:24.170182+09	238	{{creator}} canceled a {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
594	2021-12-13 21:31:24.171157+09	237	{{creator}} canceled a {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
595	2021-12-13 21:31:24.172039+09	236	{{object}} has been declined created by user admin (admin@example.com)	3		17	41
596	2021-12-13 21:31:24.173142+09	235	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
597	2021-12-13 21:31:24.174671+09	234	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
598	2021-12-13 21:31:24.176242+09	233	{{creator}} canceled a {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
599	2021-12-13 21:31:24.177333+09	232	{{creator}} canceled a {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
600	2021-12-13 21:31:24.178225+09	231	{{object}} has been declined created by user admin (admin@example.com)	3		17	41
601	2021-12-13 21:31:24.179093+09	230	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
602	2021-12-13 21:31:24.180108+09	229	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
603	2021-12-13 21:31:24.181019+09	228	{{creator}} canceled a {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
604	2021-12-13 21:31:24.182162+09	227	{{creator}} canceled a {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
605	2021-12-13 21:31:24.183086+09	226	{{object}} has been declined created by user admin (admin@example.com)	3		17	41
606	2021-12-13 21:31:24.184051+09	225	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
607	2021-12-13 21:31:24.185129+09	224	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
608	2021-12-13 21:31:24.186032+09	223	{{creator}} canceled a {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
609	2021-12-13 21:31:24.18854+09	222	{{creator}} canceled a {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
610	2021-12-13 21:31:24.189897+09	221	{{object}} has been declined created by user admin (admin@example.com)	3		17	41
611	2021-12-13 21:31:24.192557+09	213	{{creator}} logged his {{object}} created by developer2 team1 (developer2@example.com)	3		17	41
612	2021-12-13 21:31:24.193941+09	212	{{creator}} logged his {{object}} created by developer2 team1 (developer2@example.com)	3		17	41
613	2021-12-13 21:31:24.195585+09	209	{{creator}} logged his {{object}} created by developer2 team1 (developer2@example.com)	3		17	41
614	2021-12-13 21:31:24.197172+09	208	{{creator}} logged his {{object}} created by developer2 team1 (developer2@example.com)	3		17	41
615	2021-12-13 21:31:24.199056+09	207	{{creator}} logged his {{object}} created by developer2 team1 (developer2@example.com)	3		17	41
616	2021-12-13 21:31:24.200593+09	204	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
617	2021-12-13 21:31:24.201527+09	203	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
618	2021-12-13 21:31:24.202411+09	202	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
619	2021-12-13 21:31:24.203314+09	201	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
620	2021-12-13 21:31:24.204304+09	200	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
621	2021-12-13 21:31:24.205299+09	199	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
622	2021-12-13 21:31:24.2064+09	198	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
623	2021-12-13 21:31:24.207839+09	197	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
624	2021-12-13 21:31:24.210429+09	181	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
625	2021-12-13 21:31:24.211881+09	178	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
626	2021-12-13 21:31:24.212923+09	177	{{object}} has been approved. created by user admin (admin@example.com)	3		17	41
627	2021-12-13 21:31:24.214153+09	176	{{creator}} created a new {{object}}. created by developer4 team2 (developer4@example.com)	3		17	41
628	2021-12-13 21:31:24.216051+09	175	{{creator}} created a new {{object}}. created by developer4 team2 (developer4@example.com)	3		17	41
629	2021-12-13 21:31:24.218202+09	174	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
630	2021-12-13 21:31:24.219481+09	173	{{creator}} created a new {{object}}. created by developer2 team1 (developer2@example.com)	3		17	41
631	2021-12-13 21:31:34.782718+09	15	David Rodman(1)	3		6	41
632	2021-12-13 21:31:34.784374+09	14	David(2)	3		6	41
633	2021-12-13 21:31:58.681286+09	6	paypal(bill.gates@gmail.com)	3		18	41
634	2021-12-13 21:31:58.683166+09	3	bitcoin(0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0MSwidXNlcm5hbWUiOiJhZ)	3		18	41
635	2021-12-13 21:31:58.684717+09	2	payoneer(payoneer.com/david)	3		18	41
636	2021-12-13 21:31:58.685715+09	1	paypal(paypal.com/david)	3		18	41
637	2021-12-13 21:32:15.676203+09	104	req=developer2 team1 (developer2@example.com)  project=None	3		7	41
638	2021-12-13 21:32:15.678036+09	102	req=developer2 team1 (developer2@example.com)  project=None	3		7	41
639	2021-12-13 21:44:48.842003+09	118	req=developer1 team1 (developer1@example.com)  project=Developing Apple Dashboard(2)	3		7	41
640	2021-12-13 22:56:43.475894+09	52	  (developer@example.com)	1	[{"added": {}}]	1	41
641	2021-12-13 23:42:23.628751+09	7	payoneer(bil.gates@gmail.com)	1	[{"added": {}}]	18	41
642	2021-12-14 02:15:58.121383+09	42	developer1 team1 (developer1@example.com) Investing Banks(2)	1	[{"added": {}}]	10	41
643	2021-12-14 02:19:53.561748+09	43	developer1 team1 (developer1@example.com) Investing Banks(2)	1	[{"added": {}}]	10	41
644	2021-12-14 04:40:59.755325+09	42	developer1 team1 (developer1@example.com) Investing Banks(2)	3		10	41
645	2021-12-14 05:05:28.553708+09	8	bitcoin(adsuf9823gr8g29301y13r1f)	1	[{"added": {}}]	18	41
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
16	reporting	log
17	notification	notification
18	finance	paymentaccount
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-01-21 08:37:19.586739+09
2	contenttypes	0002_remove_content_type_name	2021-01-21 08:37:19.601812+09
3	auth	0001_initial	2021-01-21 08:37:19.6285+09
4	auth	0002_alter_permission_name_max_length	2021-01-21 08:37:19.652275+09
5	auth	0003_alter_user_email_max_length	2021-01-21 08:37:19.661064+09
6	auth	0004_alter_user_username_opts	2021-01-21 08:37:19.669977+09
7	auth	0005_alter_user_last_login_null	2021-01-21 08:37:19.678381+09
8	auth	0006_require_contenttypes_0002	2021-01-21 08:37:19.680589+09
9	auth	0007_alter_validators_add_error_messages	2021-01-21 08:37:19.691814+09
10	auth	0008_alter_user_username_max_length	2021-01-21 08:37:19.70242+09
11	auth	0009_alter_user_last_name_max_length	2021-01-21 08:37:19.710819+09
12	auth	0010_alter_group_name_max_length	2021-01-21 08:37:19.719241+09
13	auth	0011_update_proxy_permissions	2021-01-21 08:37:19.727589+09
14	user	0001_initial	2021-01-21 08:37:19.751828+09
15	admin	0001_initial	2021-01-21 08:37:19.784427+09
16	admin	0002_logentry_remove_auto_add	2021-01-21 08:37:19.801289+09
17	admin	0003_logentry_add_action_flag_choices	2021-01-21 08:37:19.814136+09
18	finance	0001_initial	2021-01-21 08:37:19.876349+09
19	sessions	0001_initial	2021-01-21 08:37:19.904167+09
20	user	0002_auto_20201223_1640	2021-01-21 08:37:19.943604+09
21	user	0003_account_accountsecurityqa	2021-01-21 08:37:20.019537+09
22	user	0004_auto_20201224_1351	2021-01-21 08:37:20.051739+09
23	user	0005_auto_20210117_0248	2021-01-21 08:37:20.07713+09
24	user	0006_auto_20210117_0303	2021-01-21 08:37:20.125678+09
25	finance	0002_project_weakly_limit	2021-01-23 12:52:20.822044+09
28	finance	0003_auto_20210124_0249	2021-01-24 11:49:40.395984+09
29	finance	0004_auto_20210126_2308	2021-01-27 08:09:09.11747+09
30	finance	0005_auto_20210129_1453	2021-01-29 23:53:48.642281+09
33	finance	0006_auto_20210131_1501	2021-02-01 00:04:49.451312+09
35	finance	0007_auto_20210131_1513	2021-02-01 00:13:53.735131+09
36	finance	0008_auto_20210131_1943	2021-02-01 04:45:26.847497+09
37	finance	0009_auto_20210202_1841	2021-02-03 03:41:46.30254+09
38	user	0007_auto_20210202_1841	2021-02-03 03:41:46.829153+09
39	finance	0010_auto_20210202_2101	2021-02-03 06:01:13.378002+09
40	finance	0011_financialrequest_description	2021-02-26 04:17:10.661423+09
41	finance	0012_auto_20210318_1011	2021-08-25 09:48:32.857035+09
42	finance	0013_auto_20210319_0548	2021-08-25 09:48:32.870038+09
43	finance	0014_auto_20210322_0732	2021-08-25 09:48:32.882955+09
44	finance	0015_auto_20210322_0733	2021-08-25 09:48:32.932888+09
45	user	0008_auto_20210316_2148	2021-08-25 09:48:32.974607+09
46	user	0009_profile_extra_info	2021-08-25 09:48:32.994384+09
47	notification	0001_initial	2021-09-01 08:50:34.769444+09
48	notification	0002_auto_20210831_1822	2021-09-01 08:50:35.343068+09
49	reporting	0001_initial	2021-09-01 08:50:35.370664+09
50	reporting	0002_auto_20210831_0427	2021-09-01 08:50:35.433089+09
51	reporting	0003_auto_20210901_0007	2021-09-01 09:09:07.136531+09
52	reporting	0004_auto_20210903_0516	2021-09-04 23:39:51.51502+09
53	notification	0003_notification_created_at	2021-09-11 01:21:54.826322+09
54	reporting	0005_auto_20210908_2039	2021-09-11 01:21:55.186876+09
55	finance	0016_auto_20210913_2307	2021-09-14 08:07:52.174695+09
56	user	0010_auto_20210913_2307	2021-09-14 08:07:52.22742+09
58	user	0011_auto_20210915_1915	2021-09-16 06:40:04.992847+09
59	user	0012_auto_20210918_2308	2021-09-19 08:08:11.09712+09
60	finance	0017_paymentaccount	2021-12-10 12:10:28.237139+09
61	finance	0018_auto_20211213_1422	2021-12-13 23:22:20.451787+09
62	finance	0019_auto_20211213_1850	2021-12-14 03:50:40.250887+09
63	finance	0018_auto_20211213_1914	2021-12-14 04:41:35.64334+09
64	finance	0019_auto_20211213_1921	2021-12-14 04:41:35.668482+09
65	finance	0020_remove_transaction_payment_platform	2021-12-14 05:00:45.415939+09
66	finance	0018_auto_20211214_0048	2021-12-14 09:48:55.347609+09
67	finance	0020_merge_20211214_0114	2021-12-14 10:15:48.302114+09
68	finance	0021_auto_20211214_0115	2021-12-14 10:15:48.554463+09
69	finance	0022_auto_20211214_0219	2021-12-14 11:19:31.833264+09
70	finance	0021_merge_20211214_0245	2021-12-14 11:45:39.555417+09
71	finance	0022_auto_20211214_0245	2021-12-14 11:45:39.560921+09
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
dyzc2uy7dyp0oz8vyvo4i0a2s9tkrgem	MDFjNmZkNGIwZWY2MTA4YzFjZjZiNWMxODk4MDI4NTg4OGMzZjAzNTp7Il9hdXRoX3VzZXJfaWQiOiIzMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWFjZDVlNTM0YzEwODNlYzczNjNjODllODA3MGIzYTVmYzMwMTMwYSJ9	2021-02-04 10:14:06.328742+09
9jrlkn5nyw1r1haxpbmo58znkhrh8wc2	MDFjNmZkNGIwZWY2MTA4YzFjZjZiNWMxODk4MDI4NTg4OGMzZjAzNTp7Il9hdXRoX3VzZXJfaWQiOiIzMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWFjZDVlNTM0YzEwODNlYzczNjNjODllODA3MGIzYTVmYzMwMTMwYSJ9	2021-02-19 00:35:07.525459+09
nuy9yzc7wdzb0cgr1kznikvqdtg5edlf	MDFjNmZkNGIwZWY2MTA4YzFjZjZiNWMxODk4MDI4NTg4OGMzZjAzNTp7Il9hdXRoX3VzZXJfaWQiOiIzMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWFjZDVlNTM0YzEwODNlYzczNjNjODllODA3MGIzYTVmYzMwMTMwYSJ9	2021-02-24 12:01:22.784129+09
9ztoxszzgscfljbm4pcj8rbulo2twsxw	MzM2NWYwMDlmYzA3MjE2NDU2YjQwZDZlNDQyNzcyNjE1NzEyZWIzMDp7Il9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjU2ZDk1YWQyNTAxM2U0YjNlY2MxZTRiZDU0ZTYyMTgzNmNmMzA2OCJ9	2021-09-09 04:22:14.028945+09
laomcxsg5qspe0dgyrmpr34rb883553g	MzM2NWYwMDlmYzA3MjE2NDU2YjQwZDZlNDQyNzcyNjE1NzEyZWIzMDp7Il9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjU2ZDk1YWQyNTAxM2U0YjNlY2MxZTRiZDU0ZTYyMTgzNmNmMzA2OCJ9	2021-09-25 01:23:41.413174+09
10cm0jucoa06uwxmaz9lq4idljz57i3l	MzY3NjBlNTUyMjIxYTBiMGJmYmRhZThlY2E1OTg1MDcyMjcxOGMzNTp7Il9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2JlZjk4MWY1OWY2NDg2M2RmZGMzNzgyMDU4MDJiYzk1ZjgzMTA0OCJ9	2021-09-30 03:39:06.046556+09
l5y6f95huaatz6ic68ng3exepsh6maug	MzY3NjBlNTUyMjIxYTBiMGJmYmRhZThlY2E1OTg1MDcyMjcxOGMzNTp7Il9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2JlZjk4MWY1OWY2NDg2M2RmZGMzNzgyMDU4MDJiYzk1ZjgzMTA0OCJ9	2021-10-05 01:19:24.856456+09
rhw5h0d14j9wxly503nebrx7pntjj2zf	MzY3NjBlNTUyMjIxYTBiMGJmYmRhZThlY2E1OTg1MDcyMjcxOGMzNTp7Il9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2JlZjk4MWY1OWY2NDg2M2RmZGMzNzgyMDU4MDJiYzk1ZjgzMTA0OCJ9	2021-10-15 13:07:08.782335+09
89hd221gvszc0d5cv8rlqajhmyesf0ly	MzY3NjBlNTUyMjIxYTBiMGJmYmRhZThlY2E1OTg1MDcyMjcxOGMzNTp7Il9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2JlZjk4MWY1OWY2NDg2M2RmZGMzNzgyMDU4MDJiYzk1ZjgzMTA0OCJ9	2021-10-23 07:41:08.836652+09
sj2ms0pdfxkury77oajlw319itg4j3ld	MzY3NjBlNTUyMjIxYTBiMGJmYmRhZThlY2E1OTg1MDcyMjcxOGMzNTp7Il9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2JlZjk4MWY1OWY2NDg2M2RmZGMzNzgyMDU4MDJiYzk1ZjgzMTA0OCJ9	2021-12-22 21:17:25.857464+09
\.


--
-- Data for Name: finance_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.finance_client (id, type, full_name, company_name, started_at, owner_id) FROM stdin;
16	1	Steve Job		2021-08-02	51
17	2	Bill Gates	Microsoft	2021-09-15	51
\.


--
-- Data for Name: finance_financialrequest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.finance_financialrequest (id, type, status, amount, requested_at, project_id, requester_id, description, address, payment_account_id) FROM stdin;
119	1	1	5000	2021-12-13 23:42:30.299227+09	46	51	ibdaibfaidusf	bill.gates@gmail.com	7
\.


--
-- Data for Name: finance_partner; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.finance_partner (id, full_name, email, address, dob, phone_num, contact_method, owner_id) FROM stdin;
\.


--
-- Data for Name: finance_paymentaccount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.finance_paymentaccount (id, platform, address, display_name) FROM stdin;
8	bitcoin	adsuf9823gr8g29301y13r1f	Anita's bank address
9	paypal	king@gmail.com	Anita's bank address
7	payoneer	bil.gates@gmail.com	dsaytwaet
\.


--
-- Data for Name: finance_project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.finance_project (id, title, type, price, started_at, ended_at, status, client_id, project_starter_id, weekly_limit) FROM stdin;
46	Investing Banks	2	45	2021-10-10	\N	1	16	51	40
47	Developing Apple Dashboard	2	35	2021-07-21	\N	1	17	51	45
\.


--
-- Data for Name: finance_project_participants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.finance_project_participants (id, project_id, user_id) FROM stdin;
52	46	51
53	47	51
\.


--
-- Data for Name: finance_transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.finance_transaction (id, description, created_at, gross_amount, net_amount, financial_request_id, payment_account_id) FROM stdin;
45	Create a transaction	2021-12-11	5000	3700	119	8
46	Create a transaction without financial request	2021-12-14	12000	11000	\N	8
47	Create a transaction sadfdsaf	2021-11-14	1233	1100	\N	8
\.


--
-- Data for Name: notification_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notification_notification (id, message, object_id, content_type_id, creator_id, notify_to_id, read_at, created_at) FROM stdin;
343	{{creator}} started his {{object}}.	46	9	51	49	\N	2021-12-13 21:41:31.716916+09
344	{{creator}} started his {{object}}.	46	9	51	41	\N	2021-12-13 21:41:31.7264+09
345	{{creator}} started his {{object}}.	47	9	51	49	\N	2021-12-13 21:42:26.871428+09
346	{{creator}} started his {{object}}.	47	9	51	41	\N	2021-12-13 21:42:26.873788+09
347	{{creator}} created a new {{object}}.	118	7	51	49	\N	2021-12-13 21:44:13.085735+09
348	{{creator}} created a new {{object}}.	118	7	51	41	\N	2021-12-13 21:44:13.09019+09
349	{{creator}} created a new {{object}}.	119	7	51	49	\N	2021-12-13 23:42:30.315889+09
350	{{creator}} created a new {{object}}.	119	7	51	41	\N	2021-12-13 23:42:30.32+09
\.


--
-- Data for Name: reporting_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reporting_log (id, plan, achievements, created_at, "interval", owner_id, updated_at) FROM stdin;
57	developer 2 team 1 's Plan	developer 2 's Achievements	2021-09-01	monthly	44	2021-09-21 08:08:00.209518+09
59	Developer 2 's Plan	Developer 2 's Achievements	2021-09-20	daily	44	2021-09-21 08:11:06.958154+09
60	9월 24일의 계획	2021년 09월 24일의 업적	2021-09-24	daily	41	2021-09-25 06:52:39.017496+09
61	나의 2021년 09월 의 계획	Administrator's 2021년 09월의 수행한 정형	2021-09-01	monthly	41	2021-09-25 07:33:58.09638+09
62	MADNFKB;knlkdsnfaoia df,\n FHho;ih;oidsaf\n;OIAHDF; IASDF;L09U1Y20YU\noc\nadvj\noj		2021-09-01	monthly	49	2021-09-26 08:09:35.572234+09
63	XXXXXXXXXXXXXXXX	YYYYYYYYYYYYYYY	2021-10-08	daily	49	2021-10-10 05:39:04.130593+09
96	I gonna stay awake until 4 am.	I didn't sleep until 5 AM	2021-12-08	daily	41	2021-12-08 23:08:09.268518+09
\.


--
-- Data for Name: user_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_account (id, platform_type, password, location, url, profile_id, email, extra_info) FROM stdin;
22	ms_team	password123456789	Italy	Nakamura@gmail.com	35	developer1@example.com	Gmail, Address
\.


--
-- Data for Name: user_accountsecurityqa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_accountsecurityqa (id, question, answer, account_id) FROM stdin;
\.


--
-- Data for Name: user_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_profile (id, profile_type, first_name, last_name, address, country, dob, gender, user_id, extra_info) FROM stdin;
34	1	James	Bond	Developer Street No30	German	1988-03-22	1	44	phon2:444-6326-2365
35	1	Nakamura	Genji	Nan Yang	Japan	1993-07-11	1	51	Slack
36	2	Aomori	Hwang	Tokyo	Jaon	1989-01-23	1	51	Teamviewer
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
45	pbkdf2_sha256$150000$uTqtIrqTCdhS$zJ+3cH8/wxpqm6FtssAAX7R53brX83iDZvl3behwkbI=	\N	f	developer3	developer3	team1	developer3@example.com	f	t	2021-09-16 06:54:22.526709+09	3	36
50	pbkdf2_sha256$150000$WGi1QdUEXaSs$ImnVPH/DI6ospLpxs5u9DDMyVUioGhb7jI4umbxXmbc=	2021-09-30 02:17:10.728041+09	f	manager2	manager2	team2	manager2@example.com	f	t	2021-09-16 06:59:27.404032+09	2	37
47	pbkdf2_sha256$150000$RCuo68KvocVb$j1NABnmqAhhsLGmrAMqqy0NS1RDS4+rHZ5/raZYXTro=	\N	f	developer5	developer5	team2	developer5@example.com	f	t	2021-09-16 06:56:13.190739+09	3	37
46	pbkdf2_sha256$150000$HT88xmyyByYo$Ieboiiq2/xDNWuWO7XIdGkhtqmhJ2AlaTdEHg2cxdp8=	2021-09-29 08:55:59.387663+09	f	developer4	developer4	team2	developer4@example.com	f	t	2021-09-16 06:55:13.243825+09	3	37
48	pbkdf2_sha256$150000$yCp7xTvvLyZA$i6KVU9UfAeJdnP6ICQpdyVSEfDAE4GnHif9+5uIQ8UM=	\N	f	developer6	developer6	team2	developer6@example.com	f	t	2021-09-16 06:56:55+09	3	37
44	pbkdf2_sha256$150000$g1lpjSvWyC6g$ZoNSvWwEkWEJH/0pEpyvywNOZ/lQaFcBUa/U/M74fyc=	2021-12-08 22:07:03.974212+09	f	developer2	developer2	team1	developer2@example.com	f	t	2021-09-16 06:53:33.872603+09	3	36
53	pbkdf2_sha256$150000$jXYfB00xGXZc$+ofijS+BJrCQYkgOKRITdi9yMfL1GqUcaUuR4kMox7A=	\N	f	developer@example.com	developer	team	developer@example.com	f	t	2021-12-13 23:09:36.458069+09	3	36
41	pbkdf2_sha256$150000$ExfV1usIha80$BgAtY5fVo1TcWpXi97zRVwzTNG3Zo0Sj4Qxq4cgchX0=	2021-12-14 02:21:55.287624+09	t	Administrator	user	admin	admin@example.com	t	t	2021-08-25 10:42:02+09	1	\N
51	pbkdf2_sha256$150000$KErHMTN0q2md$PLUguBnxMP7u8siLpZNJ5fbFbLPa+r967w+91crL7cg=	2021-12-14 10:29:24.013655+09	f	developer1	developer1	team1	developer1@example.com	f	t	2021-12-08 22:07:29+09	3	36
49	pbkdf2_sha256$150000$MNc1XZnywk1j$u/lia+L2BllCQw0j1fNIx0eFgcF0Kj8OcSKYqB3Gpsc=	2021-12-11 00:10:44.686327+09	f	manager1	manager1	team1	manager1@example.com	f	t	2021-09-16 06:58:36+09	2	36
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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 72, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 645, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 18, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 71, true);


--
-- Name: finance_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.finance_client_id_seq', 17, true);


--
-- Name: finance_financialrequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.finance_financialrequest_id_seq', 121, true);


--
-- Name: finance_partner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.finance_partner_id_seq', 4, true);


--
-- Name: finance_paymentaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.finance_paymentaccount_id_seq', 9, true);


--
-- Name: finance_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.finance_project_id_seq', 47, true);


--
-- Name: finance_project_participants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.finance_project_participants_id_seq', 53, true);


--
-- Name: finance_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.finance_transaction_id_seq', 47, true);


--
-- Name: notification_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notification_notification_id_seq', 350, true);


--
-- Name: reporting_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reporting_log_id_seq', 96, true);


--
-- Name: user_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_account_id_seq', 22, true);


--
-- Name: user_accountsecurityqa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_accountsecurityqa_id_seq', 1, false);


--
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_profile_id_seq', 36, true);


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

SELECT pg_catalog.setval('public.user_user_id_seq', 53, true);


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
-- Name: finance_paymentaccount finance_paymentaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_paymentaccount
    ADD CONSTRAINT finance_paymentaccount_pkey PRIMARY KEY (id);


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
-- Name: notification_notification notification_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification_notification
    ADD CONSTRAINT notification_notification_pkey PRIMARY KEY (id);


--
-- Name: reporting_log reporting_log_owner_id_created_at_interval_2b43e0f2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporting_log
    ADD CONSTRAINT reporting_log_owner_id_created_at_interval_2b43e0f2_uniq UNIQUE (owner_id, created_at, "interval");


--
-- Name: reporting_log reporting_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporting_log
    ADD CONSTRAINT reporting_log_pkey PRIMARY KEY (id);


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
-- Name: finance_financialrequest_payment_account_id_d5f9b5a1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX finance_financialrequest_payment_account_id_d5f9b5a1 ON public.finance_financialrequest USING btree (payment_account_id);


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
-- Name: finance_transaction_payment_account_id_ba7c7c0c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX finance_transaction_payment_account_id_ba7c7c0c ON public.finance_transaction USING btree (payment_account_id);


--
-- Name: finance_transaction_related_financial_id_743f1d0e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX finance_transaction_related_financial_id_743f1d0e ON public.finance_transaction USING btree (financial_request_id);


--
-- Name: notification_notification_content_type_id_fb7eaecb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notification_notification_content_type_id_fb7eaecb ON public.notification_notification USING btree (content_type_id);


--
-- Name: notification_notification_creator_id_7a05bc20; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notification_notification_creator_id_7a05bc20 ON public.notification_notification USING btree (creator_id);


--
-- Name: notification_notification_notify_to_id_0ed312af; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notification_notification_notify_to_id_0ed312af ON public.notification_notification USING btree (notify_to_id);


--
-- Name: reporting_log_owner_id_35b99f84; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reporting_log_owner_id_35b99f84 ON public.reporting_log USING btree (owner_id);


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
-- Name: finance_financialrequest finance_financialreq_payment_account_id_d5f9b5a1_fk_finance_p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_financialrequest
    ADD CONSTRAINT finance_financialreq_payment_account_id_d5f9b5a1_fk_finance_p FOREIGN KEY (payment_account_id) REFERENCES public.finance_paymentaccount(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: finance_transaction finance_transaction_payment_account_id_ba7c7c0c_fk_finance_p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_transaction
    ADD CONSTRAINT finance_transaction_payment_account_id_ba7c7c0c_fk_finance_p FOREIGN KEY (payment_account_id) REFERENCES public.finance_paymentaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notification_notification notification_notific_content_type_id_fb7eaecb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification_notification
    ADD CONSTRAINT notification_notific_content_type_id_fb7eaecb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notification_notification notification_notification_creator_id_7a05bc20_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification_notification
    ADD CONSTRAINT notification_notification_creator_id_7a05bc20_fk_user_user_id FOREIGN KEY (creator_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notification_notification notification_notification_notify_to_id_0ed312af_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification_notification
    ADD CONSTRAINT notification_notification_notify_to_id_0ed312af_fk_user_user_id FOREIGN KEY (notify_to_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reporting_log reporting_log_owner_id_35b99f84_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporting_log
    ADD CONSTRAINT reporting_log_owner_id_35b99f84_fk_user_user_id FOREIGN KEY (owner_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


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

