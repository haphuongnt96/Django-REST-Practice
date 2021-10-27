--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4 (Debian 13.4-1.pgdg100+1)
-- Dumped by pg_dump version 13.4 (Debian 13.4-1.pgdg100+1)

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
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO approval_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: approval_user
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO approval_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: approval_user
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO approval_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: approval_user
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO approval_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: approval_user
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO approval_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: approval_user
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO approval_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: approval_user
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO approval_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: approval_user
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO approval_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: approval_user
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO approval_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: approval_user
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO approval_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: approval_user
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO approval_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: approval_user
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO approval_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: approval_user
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO approval_user;

--
-- Name: m_approval_post; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.m_approval_post (
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    approval_post_cd character varying(3) NOT NULL,
    approval_post_nm character varying(10) NOT NULL
);


ALTER TABLE public.m_approval_post OWNER TO approval_user;

--
-- Name: m_business_unit; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.m_business_unit (
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    business_unit_id character varying(2) NOT NULL,
    business_unit_nm character varying(10) NOT NULL
);


ALTER TABLE public.m_business_unit OWNER TO approval_user;

--
-- Name: m_department; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.m_department (
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    department_id character varying(3) NOT NULL,
    department_nm character varying(10) NOT NULL
);


ALTER TABLE public.m_department OWNER TO approval_user;

--
-- Name: m_division; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.m_division (
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    division_id character varying(2) NOT NULL,
    division_nm character varying(10) NOT NULL
);


ALTER TABLE public.m_division OWNER TO approval_user;

--
-- Name: m_emp; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.m_emp (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    email character varying(254),
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    deleted_flg boolean NOT NULL,
    emp_cd character varying(7) NOT NULL,
    emp_nm character varying(10) NOT NULL
);


ALTER TABLE public.m_emp OWNER TO approval_user;

--
-- Name: m_emp_groups; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.m_emp_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.m_emp_groups OWNER TO approval_user;

--
-- Name: m_emp_user_permissions; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.m_emp_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.m_emp_user_permissions OWNER TO approval_user;

--
-- Name: m_request_status; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.m_request_status (
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    status_id character varying(1) NOT NULL,
    status_nm character varying(5) NOT NULL
);


ALTER TABLE public.m_request_status OWNER TO approval_user;

--
-- Name: m_segment; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.m_segment (
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    segment_id character varying(3) NOT NULL,
    segment_nm character varying(10) NOT NULL
);


ALTER TABLE public.m_segment OWNER TO approval_user;

--
-- Name: t_approval_route; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.t_approval_route (
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    approval_route_id integer NOT NULL,
    approval_type_cd character varying(5) NOT NULL,
    judgement_cd character varying(1),
    request_emp_id bigint,
    request_id_id integer NOT NULL,
    business_unit_id character varying(2),
    department_id character varying(3),
    division_id character varying(2),
    segment_id character varying(3)
);


ALTER TABLE public.t_approval_route OWNER TO approval_user;

--
-- Name: t_approval_route_approval_route_id_seq; Type: SEQUENCE; Schema: public; Owner: approval_user
--

CREATE SEQUENCE public.t_approval_route_approval_route_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_approval_route_approval_route_id_seq OWNER TO approval_user;

--
-- Name: t_approval_route_approval_route_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: approval_user
--

ALTER SEQUENCE public.t_approval_route_approval_route_id_seq OWNED BY public.t_approval_route.approval_route_id;


--
-- Name: t_approval_route_comment; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.t_approval_route_comment (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    comment_no integer NOT NULL,
    comment character varying(100) NOT NULL,
    approval_route_id integer NOT NULL,
    ins_emp_id bigint,
    request_id integer NOT NULL
);


ALTER TABLE public.t_approval_route_comment OWNER TO approval_user;

--
-- Name: t_approval_route_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: approval_user
--

CREATE SEQUENCE public.t_approval_route_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_approval_route_comment_id_seq OWNER TO approval_user;

--
-- Name: t_approval_route_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: approval_user
--

ALTER SEQUENCE public.t_approval_route_comment_id_seq OWNED BY public.t_approval_route_comment.id;


--
-- Name: t_approval_route_detail; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.t_approval_route_detail (
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    detail_no integer NOT NULL,
    required_num_approvals integer,
    "order" integer NOT NULL,
    notification character varying(1),
    approval_status character varying(1) NOT NULL,
    approval_date date,
    approval_emp_cd_id bigint,
    approval_post_cd_id character varying(3) NOT NULL,
    approval_route_id_id integer NOT NULL,
    department_cd_id character varying(3),
    division_cd_id character varying(2),
    segment_cd_id character varying(3)
);


ALTER TABLE public.t_approval_route_detail OWNER TO approval_user;

--
-- Name: t_approval_route_detail_detail_no_seq; Type: SEQUENCE; Schema: public; Owner: approval_user
--

CREATE SEQUENCE public.t_approval_route_detail_detail_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_approval_route_detail_detail_no_seq OWNER TO approval_user;

--
-- Name: t_approval_route_detail_detail_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: approval_user
--

ALTER SEQUENCE public.t_approval_route_detail_detail_no_seq OWNED BY public.t_approval_route_detail.detail_no;


--
-- Name: t_reuqest; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.t_reuqest (
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    request_id integer NOT NULL,
    request_title character varying(50) NOT NULL,
    status_id character varying(1)
);


ALTER TABLE public.t_reuqest OWNER TO approval_user;

--
-- Name: t_reuqest_request_id_seq; Type: SEQUENCE; Schema: public; Owner: approval_user
--

CREATE SEQUENCE public.t_reuqest_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_reuqest_request_id_seq OWNER TO approval_user;

--
-- Name: t_reuqest_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: approval_user
--

ALTER SEQUENCE public.t_reuqest_request_id_seq OWNED BY public.t_reuqest.request_id;


--
-- Name: token_blacklist_blacklistedtoken; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.token_blacklist_blacklistedtoken (
    id bigint NOT NULL,
    blacklisted_at timestamp with time zone NOT NULL,
    token_id bigint NOT NULL
);


ALTER TABLE public.token_blacklist_blacklistedtoken OWNER TO approval_user;

--
-- Name: token_blacklist_blacklistedtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: approval_user
--

CREATE SEQUENCE public.token_blacklist_blacklistedtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.token_blacklist_blacklistedtoken_id_seq OWNER TO approval_user;

--
-- Name: token_blacklist_blacklistedtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: approval_user
--

ALTER SEQUENCE public.token_blacklist_blacklistedtoken_id_seq OWNED BY public.token_blacklist_blacklistedtoken.id;


--
-- Name: token_blacklist_outstandingtoken; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.token_blacklist_outstandingtoken (
    id bigint NOT NULL,
    token text NOT NULL,
    created_at timestamp with time zone,
    expires_at timestamp with time zone NOT NULL,
    user_id bigint,
    jti character varying(255) NOT NULL
);


ALTER TABLE public.token_blacklist_outstandingtoken OWNER TO approval_user;

--
-- Name: token_blacklist_outstandingtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: approval_user
--

CREATE SEQUENCE public.token_blacklist_outstandingtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.token_blacklist_outstandingtoken_id_seq OWNER TO approval_user;

--
-- Name: token_blacklist_outstandingtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: approval_user
--

ALTER SEQUENCE public.token_blacklist_outstandingtoken_id_seq OWNED BY public.token_blacklist_outstandingtoken.id;


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: approval_user
--

CREATE SEQUENCE public.users_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO approval_user;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: approval_user
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.m_emp_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: approval_user
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO approval_user;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: approval_user
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.m_emp.id;


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: approval_user
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO approval_user;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: approval_user
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.m_emp_user_permissions.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: m_emp id; Type: DEFAULT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_emp ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: m_emp_groups id; Type: DEFAULT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_emp_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: m_emp_user_permissions id; Type: DEFAULT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_emp_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Name: t_approval_route approval_route_id; Type: DEFAULT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route ALTER COLUMN approval_route_id SET DEFAULT nextval('public.t_approval_route_approval_route_id_seq'::regclass);


--
-- Name: t_approval_route_comment id; Type: DEFAULT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route_comment ALTER COLUMN id SET DEFAULT nextval('public.t_approval_route_comment_id_seq'::regclass);


--
-- Name: t_approval_route_detail detail_no; Type: DEFAULT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route_detail ALTER COLUMN detail_no SET DEFAULT nextval('public.t_approval_route_detail_detail_no_seq'::regclass);


--
-- Name: t_reuqest request_id; Type: DEFAULT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_reuqest ALTER COLUMN request_id SET DEFAULT nextval('public.t_reuqest_request_id_seq'::regclass);


--
-- Name: token_blacklist_blacklistedtoken id; Type: DEFAULT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken ALTER COLUMN id SET DEFAULT nextval('public.token_blacklist_blacklistedtoken_id_seq'::regclass);


--
-- Name: token_blacklist_outstandingtoken id; Type: DEFAULT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken ALTER COLUMN id SET DEFAULT nextval('public.token_blacklist_outstandingtoken_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add approval post	6	add_approvalpost
22	Can change approval post	6	change_approvalpost
23	Can delete approval post	6	delete_approvalpost
24	Can view approval post	6	view_approvalpost
25	Can add approval route	7	add_approvalroute
26	Can change approval route	7	change_approvalroute
27	Can delete approval route	7	delete_approvalroute
28	Can view approval route	7	view_approvalroute
29	Can add approval route detail	8	add_approvalroutedetail
30	Can change approval route detail	8	change_approvalroutedetail
31	Can delete approval route detail	8	delete_approvalroutedetail
32	Can view approval route detail	8	view_approvalroutedetail
33	Can add business unit	9	add_businessunit
34	Can change business unit	9	change_businessunit
35	Can delete business unit	9	delete_businessunit
36	Can view business unit	9	view_businessunit
37	Can add department	10	add_department
38	Can change department	10	change_department
39	Can delete department	10	delete_department
40	Can view department	10	view_department
41	Can add division	11	add_division
42	Can change division	11	change_division
43	Can delete division	11	delete_division
44	Can view division	11	view_division
45	Can add request	12	add_request
46	Can change request	12	change_request
47	Can delete request	12	delete_request
48	Can view request	12	view_request
49	Can add segment	13	add_segment
50	Can change segment	13	change_segment
51	Can delete segment	13	delete_segment
52	Can view segment	13	view_segment
53	Can add User	14	add_user
54	Can change User	14	change_user
55	Can delete User	14	delete_user
56	Can view User	14	view_user
57	Can add blacklisted token	15	add_blacklistedtoken
58	Can change blacklisted token	15	change_blacklistedtoken
59	Can delete blacklisted token	15	delete_blacklistedtoken
60	Can view blacklisted token	15	view_blacklistedtoken
61	Can add outstanding token	16	add_outstandingtoken
62	Can change outstanding token	16	change_outstandingtoken
63	Can delete outstanding token	16	delete_outstandingtoken
64	Can view outstanding token	16	view_outstandingtoken
65	Can add approval route comment	17	add_approvalroutecomment
66	Can change approval route comment	17	change_approvalroutecomment
67	Can delete approval route comment	17	delete_approvalroutecomment
68	Can view approval route comment	17	view_approvalroutecomment
69	Can add request status	18	add_requeststatus
70	Can change request status	18	change_requeststatus
71	Can delete request status	18	delete_requeststatus
72	Can view request status	18	view_requeststatus
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-09-22 03:44:48.945851+00	2	parkhyunwook@planaria.co.jp	1	[{"added": {}}]	14	1
2	2021-09-22 03:45:19.662532+00	2	parkhyunwook@planaria.co.jp	2	[{"changed": {"fields": ["First name", "Last name"]}}]	14	1
3	2021-09-22 04:51:42.204241+00	2	ai@example.com	2	[{"changed": {"fields": ["password"]}}]	14	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	core	approvalpost
7	core	approvalroute
8	core	approvalroutedetail
9	core	businessunit
10	core	department
11	core	division
12	core	request
13	core	segment
14	users	user
15	token_blacklist	blacklistedtoken
16	token_blacklist	outstandingtoken
17	core	approvalroutecomment
18	core	requeststatus
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-09-22 00:54:29.057331+00
2	contenttypes	0002_remove_content_type_name	2021-09-22 00:54:29.086832+00
3	auth	0001_initial	2021-09-22 00:54:29.201833+00
4	auth	0002_alter_permission_name_max_length	2021-09-22 00:54:29.21883+00
5	auth	0003_alter_user_email_max_length	2021-09-22 00:54:29.238833+00
6	auth	0004_alter_user_username_opts	2021-09-22 00:54:29.257331+00
7	auth	0005_alter_user_last_login_null	2021-09-22 00:54:29.277829+00
8	auth	0006_require_contenttypes_0002	2021-09-22 00:54:29.28883+00
9	auth	0007_alter_validators_add_error_messages	2021-09-22 00:54:29.307343+00
10	auth	0008_alter_user_username_max_length	2021-09-22 00:54:29.324832+00
11	auth	0009_alter_user_last_name_max_length	2021-09-22 00:54:29.361831+00
12	auth	0010_alter_group_name_max_length	2021-09-22 00:54:29.38383+00
13	auth	0011_update_proxy_permissions	2021-09-22 00:54:29.403833+00
14	auth	0012_alter_user_first_name_max_length	2021-09-22 00:54:29.419332+00
15	users	0001_initial	2021-09-22 00:54:29.53084+00
16	admin	0001_initial	2021-09-22 00:54:29.587329+00
17	admin	0002_logentry_remove_auto_add	2021-09-22 00:54:29.607831+00
18	admin	0003_logentry_add_action_flag_choices	2021-09-22 00:54:29.62433+00
19	core	0001_initial	2021-09-22 00:54:29.740834+00
20	core	0002_initial	2021-09-22 00:54:29.942381+00
21	sessions	0001_initial	2021-09-22 00:54:29.983382+00
22	token_blacklist	0001_initial	2021-09-27 10:58:34.513201+00
23	token_blacklist	0002_outstandingtoken_jti_hex	2021-09-27 10:58:34.541204+00
24	token_blacklist	0003_auto_20171017_2007	2021-09-27 10:58:34.584201+00
25	token_blacklist	0004_auto_20171017_2013	2021-09-27 10:58:34.623211+00
26	token_blacklist	0005_remove_outstandingtoken_jti	2021-09-27 10:58:34.649201+00
27	token_blacklist	0006_auto_20171017_2113	2021-09-27 10:58:34.719204+00
28	token_blacklist	0007_auto_20171017_2214	2021-09-27 10:58:34.776701+00
29	token_blacklist	0008_migrate_to_bigautofield	2021-09-27 10:58:34.880704+00
30	token_blacklist	0010_fix_migrate_to_bigautofield	2021-09-27 10:58:34.9172+00
31	token_blacklist	0011_linearizes_history	2021-09-27 10:58:34.925212+00
32	users	0002_auto_20210926_0206	2021-09-27 10:58:35.142706+00
33	core	0002_approvalroutecomment	2021-10-26 06:59:28.117192+00
34	core	0002_alter_division_division_cd	2021-10-26 07:27:18.601236+00
35	core	0002_auto_20211026_1745	2021-10-26 08:45:51.102135+00
36	core	0003_request_status	2021-10-26 08:47:27.345651+00
37	core	0004_rename_business_unit_cd_businessunit_business_unit_id	2021-10-26 08:58:28.34386+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
yigkgqjbcblyj2kpe7pu8lmemsyrdilg	.eJxVjMsOwiAQRf-FtSHSoTxcuvcbyMwAUjWQlHZl_HfbpAvdnnPufYuA61LC2tMcpiguQonTLyPkZ6q7iA-s9ya51WWeSO6JPGyXtxbT63q0fwcFe9nWdIYM1no2xmkzkiFiNsDegyKKdkA_Zj-qnL3V2cHAeYOk0GrtEEF8vt-MN-o:1mSuEQ:hq6EKgyBgorOQ5MCJ2sRGsU0xMe0_OWc9hyLLCR9Lz8	2021-10-06 04:51:42.239745+00
ihx16sdmo21hminnfw3eisnykee4dcha	.eJxVjMsOwiAQRf-FtSHSoTxcuvcbyMwAUjWQlHZl_HfbpAvdnnPufYuA61LC2tMcpiguQonTLyPkZ6q7iA-s9ya51WWeSO6JPGyXtxbT63q0fwcFe9nWdIYM1no2xmkzkiFiNsDegyKKdkA_Zj-qnL3V2cHAeYOk0GrtEEF8vt-MN-o:1mV27a:jRpvK8lAur5PUTtuPD_StdV9imefYq1NXX6tNs7s5f4	2021-10-12 01:41:26.094011+00
\.


--
-- Data for Name: m_approval_post; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.m_approval_post (created, modified, approval_post_cd, approval_post_nm) FROM stdin;
2021-09-22 02:38:00.458+00	2021-09-22 02:38:04.152+00	100	やくしょく1
2021-09-22 02:38:00.458+00	2021-09-22 02:38:04.152+00	200	やくしょく2
2021-09-22 02:38:00.458+00	2021-09-22 02:38:04.152+00	300	総務部　総務課　執行
\.


--
-- Data for Name: m_business_unit; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.m_business_unit (created, modified, business_unit_id, business_unit_nm) FROM stdin;
2021-10-26 08:52:48.869+00	2021-10-26 08:52:52.346+00	01	事業部1
\.


--
-- Data for Name: m_department; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.m_department (created, modified, department_id, department_nm) FROM stdin;
2021-10-26 08:53:25.13+00	2021-10-26 08:53:28.863+00	100	部門100
\.


--
-- Data for Name: m_division; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.m_division (created, modified, division_id, division_nm) FROM stdin;
2021-10-26 08:54:12.051+00	2021-10-26 08:54:15.217+00	01	課01
\.


--
-- Data for Name: m_emp; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.m_emp (id, password, last_login, is_superuser, created, modified, email, is_staff, is_active, deleted_flg, emp_cd, emp_nm) FROM stdin;
1	pbkdf2_sha256$260000$L2gggWSh35FU8DaCpjSizv$U/PEZ3ckieXr5KeJUCwv+GB5+XZOkwEoLmLMmjet1Xw=	2021-09-28 01:41:26.087986+00	t	2021-09-22 03:43:00.644272+00	2021-09-27 10:58:35.037229+00	admin@example.com	t	t	f	0000001	あどみん
2	pbkdf2_sha256$260000$1DZJ22YKKNTGSelK2Ti3CI$SKJPYqfH3bv3UH3AkkJeVpeMbWcdN5eZVvaJqxbN5Ps=	\N	f	2021-09-22 03:44:48.939363+00	2021-09-27 10:58:35.040219+00	ai@example.com	f	t	f	0000002	あいうえお
\.


--
-- Data for Name: m_emp_groups; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.m_emp_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: m_emp_user_permissions; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.m_emp_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: m_request_status; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.m_request_status (created, modified, status_id, status_nm) FROM stdin;
2021-10-26 08:47:01.422+00	2021-10-26 08:47:04.61+00	1	下書き
\.


--
-- Data for Name: m_segment; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.m_segment (created, modified, segment_id, segment_nm) FROM stdin;
2021-10-26 08:54:37.912+00	2021-10-26 08:54:41.625+00	100	セグメント100
\.


--
-- Data for Name: t_approval_route; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.t_approval_route (created, modified, approval_route_id, approval_type_cd, judgement_cd, request_emp_id, request_id_id, business_unit_id, department_id, division_id, segment_id) FROM stdin;
2021-09-22 02:38:59.177+00	2021-09-22 02:39:03.113+00	1	00001	\N	2	1	01	100	01	100
2021-09-22 02:39:59.177+00	2021-09-22 02:39:03.113+00	2	00001	\N	2	1	01	100	01	100
\.


--
-- Data for Name: t_approval_route_comment; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.t_approval_route_comment (id, created, modified, comment_no, comment, approval_route_id, ins_emp_id, request_id) FROM stdin;
1	2021-09-22 11:38:59.177+00	2021-09-22 11:38:59.177+00	1	comment 1st tell you something.	1	1	1
2	2021-09-22 12:38:59.177+00	2021-09-22 12:38:59.177+00	2	comment 2nd reply you something.	1	2	1
\.


--
-- Data for Name: t_approval_route_detail; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.t_approval_route_detail (created, modified, detail_no, required_num_approvals, "order", notification, approval_status, approval_date, approval_emp_cd_id, approval_post_cd_id, approval_route_id_id, department_cd_id, division_cd_id, segment_cd_id) FROM stdin;
2021-09-22 03:46:47.06+00	2021-09-22 03:46:50.216+00	1	1	1	\N	1	2021-09-22	2	100	1	\N	\N	\N
2021-09-22 03:46:47.06+00	2021-09-22 03:46:50.216+00	2	1	2	\N	1	2021-09-22	1	100	1	\N	\N	\N
2021-09-22 03:46:47.06+00	2021-09-22 03:46:50.216+00	3	1	3	\N	1	\N	2	200	1	\N	\N	\N
2021-09-22 03:46:47.06+00	2021-09-22 03:46:50.216+00	4	1	4	\N	1	\N	2	300	1	\N	\N	\N
2021-09-22 03:46:47.06+00	2021-09-22 03:46:50.216+00	5	1	5	\N	1	\N	2	300	2	\N	\N	\N
\.


--
-- Data for Name: t_reuqest; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.t_reuqest (created, modified, request_id, request_title, status_id) FROM stdin;
2021-09-22 03:46:24.386+00	2021-09-22 03:46:27.946+00	1	申請タイトル	1
\.


--
-- Data for Name: token_blacklist_blacklistedtoken; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.token_blacklist_blacklistedtoken (id, blacklisted_at, token_id) FROM stdin;
1	2021-09-28 02:22:00.909682+00	1
2	2021-09-28 07:24:53.568582+00	2
3	2021-09-28 07:46:01.315791+00	3
4	2021-10-26 08:50:27.45527+00	4
5	2021-10-26 08:57:05.659839+00	5
\.


--
-- Data for Name: token_blacklist_outstandingtoken; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) FROM stdin;
1	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYzMjg4MDIwMSwianRpIjoiNTE4YjlmYWJjNDBlNDA5YjkzMDdjZjA1ZTdiNWY3NzMiLCJ1c2VyX2lkIjoxfQ.ffCp0jAyMb0ntY4amzrtySVCJZuVirinPRVJpvm8fgc	2021-09-28 01:50:01.235012+00	2021-09-29 01:50:01+00	1	518b9fabc40e409b9307cf05e7b5f773
2	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYzMjg5NzIzNSwianRpIjoiOTY3Njg1ODQxZTI2NDM5ZWExOWI5YmZlZDFkMWE3OTIiLCJ1c2VyX2lkIjoxfQ.HYcniCwAI61yAW-zuPNYZU8Jllpe0torT1sVfwDCEz4	\N	2021-09-29 06:33:55+00	\N	967685841e26439ea19b9bfed1d1a792
3	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYzMjkwMDI5MywianRpIjoiMjYyYzJjNDM0OTM2NDk1MTk0MjVhZjdmNDY3M2JmNTciLCJ1c2VyX2lkIjoxfQ.Lzkjos4OSSGp72UKUK8RtFp034CB8lL3YCG0nJciZxE	\N	2021-09-29 07:24:53+00	\N	262c2c43493649519425af7f4673bf57
4	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYzNTMxNDEyMCwianRpIjoiM2QxZTEzNTVhNWZhNDdkZjgzZjhiNDQ3NjA3MjFjMjAiLCJ1c2VyX2lkIjoxfQ.niYZ3S-QZDJiIUzujbWBx7kDR7z1gALR503-nkKeZ2s	\N	2021-10-27 05:55:20+00	\N	3d1e1355a5fa47df83f8b44760721c20
5	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYzNTMyNDYyNywianRpIjoiNGRkYTgxNjMzMTZhNDRhMzg1N2EyODQ3YTdiODVhNmEiLCJ1c2VyX2lkIjoxfQ.RSSd0YzTAcnUEqTIISps1_OZf-X5EvSJrhL60hoAU0g	\N	2021-10-27 08:50:27+00	\N	4dda8163316a44a3857a2847a7b85a6a
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 72, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 3, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 18, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 37, true);


--
-- Name: t_approval_route_approval_route_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.t_approval_route_approval_route_id_seq', 1, false);


--
-- Name: t_approval_route_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.t_approval_route_comment_id_seq', 1, false);


--
-- Name: t_approval_route_detail_detail_no_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.t_approval_route_detail_detail_no_seq', 1, false);


--
-- Name: t_reuqest_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.t_reuqest_request_id_seq', 1, false);


--
-- Name: token_blacklist_blacklistedtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.token_blacklist_blacklistedtoken_id_seq', 5, true);


--
-- Name: token_blacklist_outstandingtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.token_blacklist_outstandingtoken_id_seq', 5, true);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.users_user_id_seq', 2, true);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: m_approval_post m_approval_post_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_approval_post
    ADD CONSTRAINT m_approval_post_pkey PRIMARY KEY (approval_post_cd);


--
-- Name: m_business_unit m_business_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_business_unit
    ADD CONSTRAINT m_business_unit_pkey PRIMARY KEY (business_unit_id);


--
-- Name: m_department m_department_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_department
    ADD CONSTRAINT m_department_pkey PRIMARY KEY (department_id);


--
-- Name: m_division m_division_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_division
    ADD CONSTRAINT m_division_pkey PRIMARY KEY (division_id);


--
-- Name: m_request_status m_request_status_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_request_status
    ADD CONSTRAINT m_request_status_pkey PRIMARY KEY (status_id);


--
-- Name: m_segment m_segment_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_segment
    ADD CONSTRAINT m_segment_pkey PRIMARY KEY (segment_id);


--
-- Name: t_approval_route_comment t_approval_route_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route_comment
    ADD CONSTRAINT t_approval_route_comment_pkey PRIMARY KEY (id);


--
-- Name: t_approval_route_detail t_approval_route_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route_detail
    ADD CONSTRAINT t_approval_route_detail_pkey PRIMARY KEY (detail_no);


--
-- Name: t_approval_route t_approval_route_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route
    ADD CONSTRAINT t_approval_route_pkey PRIMARY KEY (approval_route_id);


--
-- Name: t_reuqest t_reuqest_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_reuqest
    ADD CONSTRAINT t_reuqest_pkey PRIMARY KEY (request_id);


--
-- Name: token_blacklist_blacklistedtoken token_blacklist_blacklistedtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_pkey PRIMARY KEY (id);


--
-- Name: token_blacklist_blacklistedtoken token_blacklist_blacklistedtoken_token_id_key; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_token_id_key UNIQUE (token_id);


--
-- Name: token_blacklist_outstandingtoken token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq UNIQUE (jti);


--
-- Name: token_blacklist_outstandingtoken token_blacklist_outstandingtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outstandingtoken_pkey PRIMARY KEY (id);


--
-- Name: m_emp users_user_email_key; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_emp
    ADD CONSTRAINT users_user_email_key UNIQUE (email);


--
-- Name: m_emp users_user_emp_cd_key; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_emp
    ADD CONSTRAINT users_user_emp_cd_key UNIQUE (emp_cd);


--
-- Name: m_emp_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_emp_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: m_emp_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_emp_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: m_emp users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_emp
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: m_emp_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_emp_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: m_emp_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_emp_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: m_approval_post_approval_post_cd_2fcf98d8_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_approval_post_approval_post_cd_2fcf98d8_like ON public.m_approval_post USING btree (approval_post_cd varchar_pattern_ops);


--
-- Name: m_business_unit_business_unit_cd_29f642a3_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_business_unit_business_unit_cd_29f642a3_like ON public.m_business_unit USING btree (business_unit_id varchar_pattern_ops);


--
-- Name: m_department_department_cd_0bb8db7b_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_department_department_cd_0bb8db7b_like ON public.m_department USING btree (department_id varchar_pattern_ops);


--
-- Name: m_division_division_cd_4f4969ee_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_division_division_cd_4f4969ee_like ON public.m_division USING btree (division_id varchar_pattern_ops);


--
-- Name: m_emp_emp_cd_68c49e31_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_emp_emp_cd_68c49e31_like ON public.m_emp USING btree (emp_cd varchar_pattern_ops);


--
-- Name: m_request_status_status_id_b88e49fa_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_request_status_status_id_b88e49fa_like ON public.m_request_status USING btree (status_id varchar_pattern_ops);


--
-- Name: m_segment_segment_cd_75427e7d_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_segment_segment_cd_75427e7d_like ON public.m_segment USING btree (segment_id varchar_pattern_ops);


--
-- Name: t_approval_route_business_unit_id_b2cf9416; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_business_unit_id_b2cf9416 ON public.t_approval_route USING btree (business_unit_id);


--
-- Name: t_approval_route_business_unit_id_b2cf9416_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_business_unit_id_b2cf9416_like ON public.t_approval_route USING btree (business_unit_id varchar_pattern_ops);


--
-- Name: t_approval_route_comment_approval_route_id_ca08c4b4; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_comment_approval_route_id_ca08c4b4 ON public.t_approval_route_comment USING btree (approval_route_id);


--
-- Name: t_approval_route_comment_ins_emp_id_a8d597f2; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_comment_ins_emp_id_a8d597f2 ON public.t_approval_route_comment USING btree (ins_emp_id);


--
-- Name: t_approval_route_comment_request_id_8cbe311f; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_comment_request_id_8cbe311f ON public.t_approval_route_comment USING btree (request_id);


--
-- Name: t_approval_route_department_id_f29e62b1; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_department_id_f29e62b1 ON public.t_approval_route USING btree (department_id);


--
-- Name: t_approval_route_department_id_f29e62b1_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_department_id_f29e62b1_like ON public.t_approval_route USING btree (department_id varchar_pattern_ops);


--
-- Name: t_approval_route_detail_approval_emp_cd_id_c690a825; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_detail_approval_emp_cd_id_c690a825 ON public.t_approval_route_detail USING btree (approval_emp_cd_id);


--
-- Name: t_approval_route_detail_approval_post_cd_id_e91b1b51; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_detail_approval_post_cd_id_e91b1b51 ON public.t_approval_route_detail USING btree (approval_post_cd_id);


--
-- Name: t_approval_route_detail_approval_post_cd_id_e91b1b51_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_detail_approval_post_cd_id_e91b1b51_like ON public.t_approval_route_detail USING btree (approval_post_cd_id varchar_pattern_ops);


--
-- Name: t_approval_route_detail_approval_route_id_id_340dda9e; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_detail_approval_route_id_id_340dda9e ON public.t_approval_route_detail USING btree (approval_route_id_id);


--
-- Name: t_approval_route_detail_department_cd_id_ea63abf1; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_detail_department_cd_id_ea63abf1 ON public.t_approval_route_detail USING btree (department_cd_id);


--
-- Name: t_approval_route_detail_department_cd_id_ea63abf1_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_detail_department_cd_id_ea63abf1_like ON public.t_approval_route_detail USING btree (department_cd_id varchar_pattern_ops);


--
-- Name: t_approval_route_detail_division_cd_id_b137c8d1; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_detail_division_cd_id_b137c8d1 ON public.t_approval_route_detail USING btree (division_cd_id);


--
-- Name: t_approval_route_detail_division_cd_id_b137c8d1_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_detail_division_cd_id_b137c8d1_like ON public.t_approval_route_detail USING btree (division_cd_id varchar_pattern_ops);


--
-- Name: t_approval_route_detail_segment_cd_id_f8cf4a3a; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_detail_segment_cd_id_f8cf4a3a ON public.t_approval_route_detail USING btree (segment_cd_id);


--
-- Name: t_approval_route_detail_segment_cd_id_f8cf4a3a_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_detail_segment_cd_id_f8cf4a3a_like ON public.t_approval_route_detail USING btree (segment_cd_id varchar_pattern_ops);


--
-- Name: t_approval_route_division_id_38453696; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_division_id_38453696 ON public.t_approval_route USING btree (division_id);


--
-- Name: t_approval_route_division_id_38453696_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_division_id_38453696_like ON public.t_approval_route USING btree (division_id varchar_pattern_ops);


--
-- Name: t_approval_route_request_emp_cd_id_52020950; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_request_emp_cd_id_52020950 ON public.t_approval_route USING btree (request_emp_id);


--
-- Name: t_approval_route_request_id_id_8c99be6d; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_request_id_id_8c99be6d ON public.t_approval_route USING btree (request_id_id);


--
-- Name: t_approval_route_segment_id_65a5c02f; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_segment_id_65a5c02f ON public.t_approval_route USING btree (segment_id);


--
-- Name: t_approval_route_segment_id_65a5c02f_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_segment_id_65a5c02f_like ON public.t_approval_route USING btree (segment_id varchar_pattern_ops);


--
-- Name: t_reuqest_status_id_7484f8ec; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_reuqest_status_id_7484f8ec ON public.t_reuqest USING btree (status_id);


--
-- Name: t_reuqest_status_id_7484f8ec_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_reuqest_status_id_7484f8ec_like ON public.t_reuqest USING btree (status_id varchar_pattern_ops);


--
-- Name: token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_like ON public.token_blacklist_outstandingtoken USING btree (jti varchar_pattern_ops);


--
-- Name: token_blacklist_outstandingtoken_user_id_83bc629a; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX token_blacklist_outstandingtoken_user_id_83bc629a ON public.token_blacklist_outstandingtoken USING btree (user_id);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.m_emp_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.m_emp_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.m_emp_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.m_emp_user_permissions USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.m_emp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_approval_route t_approval_route_business_unit_id_b2cf9416_fk_m_busines; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route
    ADD CONSTRAINT t_approval_route_business_unit_id_b2cf9416_fk_m_busines FOREIGN KEY (business_unit_id) REFERENCES public.m_business_unit(business_unit_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_approval_route_comment t_approval_route_com_approval_route_id_ca08c4b4_fk_t_approva; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route_comment
    ADD CONSTRAINT t_approval_route_com_approval_route_id_ca08c4b4_fk_t_approva FOREIGN KEY (approval_route_id) REFERENCES public.t_approval_route(approval_route_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_approval_route_comment t_approval_route_com_request_id_8cbe311f_fk_t_reuqest; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route_comment
    ADD CONSTRAINT t_approval_route_com_request_id_8cbe311f_fk_t_reuqest FOREIGN KEY (request_id) REFERENCES public.t_reuqest(request_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_approval_route_comment t_approval_route_comment_ins_emp_id_a8d597f2_fk_m_emp_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route_comment
    ADD CONSTRAINT t_approval_route_comment_ins_emp_id_a8d597f2_fk_m_emp_id FOREIGN KEY (ins_emp_id) REFERENCES public.m_emp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_approval_route t_approval_route_department_id_f29e62b1_fk_m_departm; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route
    ADD CONSTRAINT t_approval_route_department_id_f29e62b1_fk_m_departm FOREIGN KEY (department_id) REFERENCES public.m_department(department_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_approval_route_detail t_approval_route_det_approval_emp_cd_id_c690a825_fk_users_use; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route_detail
    ADD CONSTRAINT t_approval_route_det_approval_emp_cd_id_c690a825_fk_users_use FOREIGN KEY (approval_emp_cd_id) REFERENCES public.m_emp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_approval_route_detail t_approval_route_det_approval_post_cd_id_e91b1b51_fk_m_approva; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route_detail
    ADD CONSTRAINT t_approval_route_det_approval_post_cd_id_e91b1b51_fk_m_approva FOREIGN KEY (approval_post_cd_id) REFERENCES public.m_approval_post(approval_post_cd) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_approval_route_detail t_approval_route_det_approval_route_id_id_340dda9e_fk_t_approva; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route_detail
    ADD CONSTRAINT t_approval_route_det_approval_route_id_id_340dda9e_fk_t_approva FOREIGN KEY (approval_route_id_id) REFERENCES public.t_approval_route(approval_route_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_approval_route_detail t_approval_route_det_department_cd_id_ea63abf1_fk_m_departm; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route_detail
    ADD CONSTRAINT t_approval_route_det_department_cd_id_ea63abf1_fk_m_departm FOREIGN KEY (department_cd_id) REFERENCES public.m_department(department_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_approval_route_detail t_approval_route_det_segment_cd_id_f8cf4a3a_fk_m_segment; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route_detail
    ADD CONSTRAINT t_approval_route_det_segment_cd_id_f8cf4a3a_fk_m_segment FOREIGN KEY (segment_cd_id) REFERENCES public.m_segment(segment_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_approval_route_detail t_approval_route_detail_division_cd_id_b137c8d1_fk; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route_detail
    ADD CONSTRAINT t_approval_route_detail_division_cd_id_b137c8d1_fk FOREIGN KEY (division_cd_id) REFERENCES public.m_division(division_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_approval_route t_approval_route_division_id_38453696_fk_m_division_division_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route
    ADD CONSTRAINT t_approval_route_division_id_38453696_fk_m_division_division_id FOREIGN KEY (division_id) REFERENCES public.m_division(division_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_approval_route t_approval_route_request_emp_id_05c78f16_fk_m_emp_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route
    ADD CONSTRAINT t_approval_route_request_emp_id_05c78f16_fk_m_emp_id FOREIGN KEY (request_emp_id) REFERENCES public.m_emp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_approval_route t_approval_route_request_id_id_8c99be6d_fk_t_reuqest_request_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route
    ADD CONSTRAINT t_approval_route_request_id_id_8c99be6d_fk_t_reuqest_request_id FOREIGN KEY (request_id_id) REFERENCES public.t_reuqest(request_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_approval_route t_approval_route_segment_id_65a5c02f_fk_m_segment_segment_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route
    ADD CONSTRAINT t_approval_route_segment_id_65a5c02f_fk_m_segment_segment_id FOREIGN KEY (segment_id) REFERENCES public.m_segment(segment_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_reuqest t_reuqest_status_id_7484f8ec_fk_m_request_status_status_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_reuqest
    ADD CONSTRAINT t_reuqest_status_id_7484f8ec_fk_m_request_status_status_id FOREIGN KEY (status_id) REFERENCES public.m_request_status(status_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: token_blacklist_blacklistedtoken token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk FOREIGN KEY (token_id) REFERENCES public.token_blacklist_outstandingtoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: token_blacklist_outstandingtoken token_blacklist_outs_user_id_83bc629a_fk_users_use; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outs_user_id_83bc629a_fk_users_use FOREIGN KEY (user_id) REFERENCES public.m_emp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: m_emp_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_emp_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: m_emp_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_emp_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.m_emp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: m_emp_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_emp_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: m_emp_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_emp_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.m_emp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

