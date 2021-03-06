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
-- Name: m_approval_class; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.m_approval_class (
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    approval_class_id character varying(1) NOT NULL,
    approval_class_nm character varying(10) NOT NULL
);


ALTER TABLE public.m_approval_class OWNER TO approval_user;

--
-- Name: m_approval_post; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.m_approval_post (
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    approval_post_id character varying(3) NOT NULL,
    approval_post_nm character varying(10) NOT NULL
);


ALTER TABLE public.m_approval_post OWNER TO approval_user;

--
-- Name: m_approval_status; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.m_approval_status (
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    approval_status_id character varying(1) NOT NULL,
    approval_status_nm character varying(5) NOT NULL
);


ALTER TABLE public.m_approval_status OWNER TO approval_user;

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
-- Name: m_choices; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.m_choices (
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    choice_id character varying(2) NOT NULL,
    choice_nm character varying(10) NOT NULL,
    request_column_id character varying(4)
);


ALTER TABLE public.m_choices OWNER TO approval_user;

--
-- Name: m_column_type; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.m_column_type (
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    column_type_id character varying(2) NOT NULL,
    column_type_nm character varying(10) NOT NULL
);


ALTER TABLE public.m_column_type OWNER TO approval_user;

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
-- Name: m_emp_affiliation; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.m_emp_affiliation (
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    emp_affiliation_id integer NOT NULL,
    main_flg boolean NOT NULL,
    business_unit_id character varying(2),
    department_id character varying(3),
    division_id character varying(2),
    emp_id bigint,
    segment_id character varying(3)
);


ALTER TABLE public.m_emp_affiliation OWNER TO approval_user;

--
-- Name: m_emp_affiliation_emp_affiliation_id_seq; Type: SEQUENCE; Schema: public; Owner: approval_user
--

CREATE SEQUENCE public.m_emp_affiliation_emp_affiliation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.m_emp_affiliation_emp_affiliation_id_seq OWNER TO approval_user;

--
-- Name: m_emp_affiliation_emp_affiliation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: approval_user
--

ALTER SEQUENCE public.m_emp_affiliation_emp_affiliation_id_seq OWNED BY public.m_emp_affiliation.emp_affiliation_id;


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
-- Name: m_news; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.m_news (
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    news_id integer NOT NULL,
    news character varying(200) NOT NULL,
    delete_flag boolean NOT NULL
);


ALTER TABLE public.m_news OWNER TO approval_user;

--
-- Name: m_notification_type; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.m_notification_type (
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    notification_type_id character varying(2) NOT NULL,
    notification_type_nm character varying(10) NOT NULL
);


ALTER TABLE public.m_notification_type OWNER TO approval_user;

--
-- Name: m_property; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.m_property (
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    property_id integer NOT NULL,
    property_nm character varying(50) NOT NULL,
    address character varying(200) NOT NULL,
    tel_number character varying(13) NOT NULL,
    department_id character varying(3) NOT NULL,
    division_id character varying(2) NOT NULL,
    emp_id bigint NOT NULL,
    segment_id character varying(3) NOT NULL
);


ALTER TABLE public.m_property OWNER TO approval_user;

--
-- Name: m_request_detail; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.m_request_detail (
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    request_column_id character varying(4) NOT NULL,
    required boolean NOT NULL,
    max_length integer NOT NULL,
    column_nm character varying(30) NOT NULL,
    notes character varying(50) NOT NULL,
    approval_type_id character varying(4),
    column_type_id character varying(2),
    parent_column_id character varying(4),
    CONSTRAINT m_request_detail_max_length_check CHECK ((max_length >= 0))
);


ALTER TABLE public.m_request_detail OWNER TO approval_user;

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
-- Name: mm_approval_route; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.mm_approval_route (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    judge_cd character varying(1) NOT NULL,
    "order" integer NOT NULL,
    notification character varying(1),
    required_num_approvals integer NOT NULL,
    approval_post_id character varying(3),
    approval_type_id character varying(4) NOT NULL,
    department_id character varying(3),
    division_id character varying(2),
    emp_id bigint,
    segment_id character varying(3),
    CONSTRAINT mm_approval_route_order_check CHECK (("order" >= 0)),
    CONSTRAINT mm_approval_route_required_num_approvals_check CHECK ((required_num_approvals >= 0))
);


ALTER TABLE public.mm_approval_route OWNER TO approval_user;

--
-- Name: mm_approval_route_id_seq; Type: SEQUENCE; Schema: public; Owner: approval_user
--

CREATE SEQUENCE public.mm_approval_route_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mm_approval_route_id_seq OWNER TO approval_user;

--
-- Name: mm_approval_route_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: approval_user
--

ALTER SEQUENCE public.mm_approval_route_id_seq OWNED BY public.mm_approval_route.id;


--
-- Name: mm_approval_type; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.mm_approval_type (
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    approval_type_id character varying(4) NOT NULL,
    approval_type_nm character varying(30) NOT NULL,
    can_read character varying(1) NOT NULL,
    approval_class_id character varying(1),
    division_id character varying(2),
    segment_id character varying(3)
);


ALTER TABLE public.mm_approval_type OWNER TO approval_user;

--
-- Name: t_approval_route; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.t_approval_route (
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    approval_route_id integer NOT NULL,
    judgement_cd character varying(1),
    request_emp_id bigint,
    business_unit_id character varying(2),
    department_id character varying(3),
    division_id character varying(2),
    segment_id character varying(3),
    approval_type_id character varying(4),
    request_id integer,
    request_dt timestamp with time zone
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
    approval_status_id character varying(1),
    approval_date date,
    approval_emp_id bigint,
    approval_post_id character varying(3) NOT NULL,
    approval_route_id integer NOT NULL,
    current_order_flg boolean NOT NULL,
    default_flg boolean NOT NULL
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
-- Name: t_notification_record; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.t_notification_record (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    emp_id bigint NOT NULL,
    notification_type_id character varying(2),
    request_id integer,
    confirm_dt timestamp with time zone
);


ALTER TABLE public.t_notification_record OWNER TO approval_user;

--
-- Name: t_notification_record_id_seq; Type: SEQUENCE; Schema: public; Owner: approval_user
--

CREATE SEQUENCE public.t_notification_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_notification_record_id_seq OWNER TO approval_user;

--
-- Name: t_notification_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: approval_user
--

ALTER SEQUENCE public.t_notification_record_id_seq OWNED BY public.t_notification_record.id;


--
-- Name: t_notifier; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.t_notifier (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    confirm_dt timestamp with time zone,
    notify_emp_id bigint,
    request_id integer
);


ALTER TABLE public.t_notifier OWNER TO approval_user;

--
-- Name: t_notifier_id_seq; Type: SEQUENCE; Schema: public; Owner: approval_user
--

CREATE SEQUENCE public.t_notifier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_notifier_id_seq OWNER TO approval_user;

--
-- Name: t_notifier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: approval_user
--

ALTER SEQUENCE public.t_notifier_id_seq OWNED BY public.t_notifier.id;


--
-- Name: t_request; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.t_request (
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    request_id integer NOT NULL,
    request_title character varying(50) NOT NULL,
    status_id character varying(1),
    approval_type_id character varying(4)
);


ALTER TABLE public.t_request OWNER TO approval_user;

--
-- Name: t_request_detail; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.t_request_detail (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    request_column_val character varying(20) NOT NULL,
    request_id integer,
    request_column_id character varying(4)
);


ALTER TABLE public.t_request_detail OWNER TO approval_user;

--
-- Name: t_request_detail_hist; Type: TABLE; Schema: public; Owner: approval_user
--

CREATE TABLE public.t_request_detail_hist (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    request_column_val character varying(20) NOT NULL,
    request_id integer,
    request_column_id character varying(4)
);


ALTER TABLE public.t_request_detail_hist OWNER TO approval_user;

--
-- Name: t_request_detail_hist_id_seq; Type: SEQUENCE; Schema: public; Owner: approval_user
--

CREATE SEQUENCE public.t_request_detail_hist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_request_detail_hist_id_seq OWNER TO approval_user;

--
-- Name: t_request_detail_hist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: approval_user
--

ALTER SEQUENCE public.t_request_detail_hist_id_seq OWNED BY public.t_request_detail_hist.id;


--
-- Name: t_request_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: approval_user
--

CREATE SEQUENCE public.t_request_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_request_detail_id_seq OWNER TO approval_user;

--
-- Name: t_request_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: approval_user
--

ALTER SEQUENCE public.t_request_detail_id_seq OWNED BY public.t_request_detail.id;


--
-- Name: t_request_request_id_seq; Type: SEQUENCE; Schema: public; Owner: approval_user
--

CREATE SEQUENCE public.t_request_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_request_request_id_seq OWNER TO approval_user;

--
-- Name: t_request_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: approval_user
--

ALTER SEQUENCE public.t_request_request_id_seq OWNED BY public.t_request.request_id;


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
-- Name: m_emp_affiliation emp_affiliation_id; Type: DEFAULT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_emp_affiliation ALTER COLUMN emp_affiliation_id SET DEFAULT nextval('public.m_emp_affiliation_emp_affiliation_id_seq'::regclass);


--
-- Name: m_emp_groups id; Type: DEFAULT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_emp_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: m_emp_user_permissions id; Type: DEFAULT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_emp_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Name: mm_approval_route id; Type: DEFAULT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.mm_approval_route ALTER COLUMN id SET DEFAULT nextval('public.mm_approval_route_id_seq'::regclass);


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
-- Name: t_notification_record id; Type: DEFAULT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_notification_record ALTER COLUMN id SET DEFAULT nextval('public.t_notification_record_id_seq'::regclass);


--
-- Name: t_notifier id; Type: DEFAULT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_notifier ALTER COLUMN id SET DEFAULT nextval('public.t_notifier_id_seq'::regclass);


--
-- Name: t_request request_id; Type: DEFAULT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_request ALTER COLUMN request_id SET DEFAULT nextval('public.t_request_request_id_seq'::regclass);


--
-- Name: t_request_detail id; Type: DEFAULT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_request_detail ALTER COLUMN id SET DEFAULT nextval('public.t_request_detail_id_seq'::regclass);


--
-- Name: t_request_detail_hist id; Type: DEFAULT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_request_detail_hist ALTER COLUMN id SET DEFAULT nextval('public.t_request_detail_hist_id_seq'::regclass);


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
73	Can add choices	19	add_choices
74	Can change choices	19	change_choices
75	Can delete choices	19	delete_choices
76	Can view choices	19	view_choices
77	Can add approval class	20	add_approvalclass
78	Can change approval class	20	change_approvalclass
79	Can delete approval class	20	delete_approvalclass
80	Can view approval class	20	view_approvalclass
81	Can add approval route master	21	add_approvalroutemaster
82	Can change approval route master	21	change_approvalroutemaster
83	Can delete approval route master	21	delete_approvalroutemaster
84	Can view approval route master	21	view_approvalroutemaster
85	Can add request detail master	22	add_requestdetailmaster
86	Can change request detail master	22	change_requestdetailmaster
87	Can delete request detail master	22	delete_requestdetailmaster
88	Can view request detail master	22	view_requestdetailmaster
89	Can add column type	23	add_columntype
90	Can change column type	23	change_columntype
91	Can delete column type	23	delete_columntype
92	Can view column type	23	view_columntype
93	Can add approval type	24	add_approvaltype
94	Can change approval type	24	change_approvaltype
95	Can delete approval type	24	delete_approvaltype
96	Can view approval type	24	view_approvaltype
97	Can add emp affiliation	25	add_empaffiliation
98	Can change emp affiliation	25	change_empaffiliation
99	Can delete emp affiliation	25	delete_empaffiliation
100	Can view emp affiliation	25	view_empaffiliation
101	Can add property	26	add_property
102	Can change property	26	change_property
103	Can delete property	26	delete_property
104	Can view property	26	view_property
105	Can add choice	27	add_choice
106	Can change choice	27	change_choice
107	Can delete choice	27	delete_choice
108	Can view choice	27	view_choice
109	Can add business unit	28	add_businessunit
110	Can change business unit	28	change_businessunit
111	Can delete business unit	28	delete_businessunit
112	Can view business unit	28	view_businessunit
113	Can add department	29	add_department
114	Can change department	29	change_department
115	Can delete department	29	delete_department
116	Can view department	29	view_department
117	Can add division	30	add_division
118	Can change division	30	change_division
119	Can delete division	30	delete_division
120	Can view division	30	view_division
121	Can add segment	31	add_segment
122	Can change segment	31	change_segment
123	Can delete segment	31	delete_segment
124	Can view segment	31	view_segment
125	Can add request detail	32	add_requestdetail
126	Can change request detail	32	change_requestdetail
127	Can delete request detail	32	delete_requestdetail
128	Can view request detail	32	view_requestdetail
129	Can add notification record	33	add_notificationrecord
130	Can change notification record	33	change_notificationrecord
131	Can delete notification record	33	delete_notificationrecord
132	Can view notification record	33	view_notificationrecord
133	Can add notification type	34	add_notificationtype
134	Can change notification type	34	change_notificationtype
135	Can delete notification type	34	delete_notificationtype
136	Can view notification type	34	view_notificationtype
137	Can add news	35	add_news
138	Can change news	35	change_news
139	Can delete news	35	delete_news
140	Can view news	35	view_news
141	Can add request detail hist	36	add_requestdetailhist
142	Can change request detail hist	36	change_requestdetailhist
143	Can delete request detail hist	36	delete_requestdetailhist
144	Can view request detail hist	36	view_requestdetailhist
145	Can add approval status	37	add_approvalstatus
146	Can change approval status	37	change_approvalstatus
147	Can delete approval status	37	delete_approvalstatus
148	Can view approval status	37	view_approvalstatus
149	Can add t_notifier/T_?????????	38	add_notifier
150	Can change t_notifier/T_?????????	38	change_notifier
151	Can delete t_notifier/T_?????????	38	delete_notifier
152	Can view t_notifier/T_?????????	38	view_notifier
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-09-22 03:44:48.945851+00	2	parkhyunwook@planaria.co.jp	1	[{"added": {}}]	14	1
2	2021-09-22 03:45:19.662532+00	2	parkhyunwook@planaria.co.jp	2	[{"changed": {"fields": ["First name", "Last name"]}}]	14	1
3	2021-09-22 04:51:42.204241+00	2	ai@example.com	2	[{"changed": {"fields": ["password"]}}]	14	1
4	2021-11-11 04:23:28.011156+00	01	01:??????	1	[{"added": {}}]	34	1
5	2021-11-11 04:23:32.402559+00	02	02:???????????????	1	[{"added": {}}]	34	1
6	2021-11-11 04:23:39.332247+00	03	03:??????	1	[{"added": {}}]	34	1
7	2021-11-11 04:23:46.395636+00	04	04:????????????	1	[{"added": {}}]	34	1
8	2021-11-11 04:23:53.383676+00	09	09:???????????????	1	[{"added": {}}]	34	1
9	2021-11-11 16:39:41.632879+00	1	Request object (1)	3		12	1
10	2021-11-11 16:40:05.201597+00	1	Request object (1)	1	[{"added": {}}, {"added": {"name": "approval route", "object": "ApprovalRoute object (1)"}}]	12	1
11	2021-11-11 16:40:31.72207+00	2	Request object (2)	1	[{"added": {}}, {"added": {"name": "approval route", "object": "ApprovalRoute object (2)"}}]	12	1
12	2021-11-11 16:40:50.805143+00	1	Request object (1):0000001 - ????????????:02:???????????????	1	[{"added": {}}]	33	1
13	2021-11-18 04:03:12.65647+00	100	??????????????????????????????	2	[{"changed": {"fields": ["Approval_post_nm/\\u627f\\u8a8d\\u5f79\\u8077\\u540d"]}}]	6	1
14	2021-11-18 04:03:30.287722+00	300	??????????????????????????????	2	[{"changed": {"fields": ["Approval_post_nm/\\u627f\\u8a8d\\u5f79\\u8077\\u540d"]}}]	6	1
15	2021-11-18 04:05:41.774257+00	01	????????????	2	[{"changed": {"fields": ["Business_unit_nm/\\u4e8b\\u696d\\u90e8\\u540d"]}}]	28	1
16	2021-11-18 04:05:59.111123+00	100	100 - ?????????	2	[{"changed": {"fields": ["Department_nm/\\u90e8\\u9580\\u540d"]}}]	29	1
17	2021-11-18 04:06:12.452252+00	200	200 - ???????????????	1	[{"added": {}}]	29	1
18	2021-11-18 04:06:28.813761+00	300	300 - ?????????	1	[{"added": {}}]	29	1
19	2021-11-18 04:06:53.914375+00	100	?????????	2	[{"changed": {"fields": ["Segment_nm/\\u30bb\\u30b0\\u30e1\\u30f3\\u30c8\\u540d"]}}]	31	1
20	2021-11-18 04:07:06.808585+00	200	?????????	1	[{"added": {}}]	31	1
21	2021-11-18 04:07:22.794386+00	300	??????????????????	1	[{"added": {}}]	31	1
22	2021-11-18 04:07:56.319934+00	400	?????????	1	[{"added": {}}]	31	1
23	2021-11-18 04:12:01.950358+00	4	0000003 - ???????????????	1	[{"added": {}}, {"added": {"name": "emp affiliation", "object": "EmpAffiliation object (2)"}}]	14	1
24	2021-11-18 04:13:07.272122+00	5	0000004 - ???????????????	1	[{"added": {}}, {"added": {"name": "emp affiliation", "object": "EmpAffiliation object (3)"}}]	14	1
25	2021-11-18 04:14:12.534315+00	1	Request object (1)	2	[{"changed": {"name": "approval route", "object": "ApprovalRoute object (1)", "fields": ["Request_dt/\\u7533\\u8acb\\u65e5\\u6642"]}}]	12	1
26	2021-11-18 05:23:52.930362+00	3	?????????	1	[{"added": {}}]	18	1
27	2021-11-18 05:25:01.882275+00	4	?????????	1	[{"added": {}}]	18	1
28	2021-11-18 05:35:56.298485+00	2	Request object (1):0000002 - ???????????????:03:??????	1	[{"added": {}}]	33	1
29	2021-11-18 05:36:13.188805+00	1	Request object (1):0000004 - ???????????????	1	[{"added": {}}]	38	1
30	2021-11-18 05:38:50.337555+00	1	Request object (1)	2	[{"added": {"name": "approval route", "object": "ApprovalRoute object (3)"}}, {"added": {"name": "approval route", "object": "ApprovalRoute object (4)"}}]	12	1
31	2021-11-18 05:39:28.747576+00	200	??????????????????????????????	2	[{"changed": {"fields": ["Approval_post_nm/\\u627f\\u8a8d\\u5f79\\u8077\\u540d"]}}]	6	1
32	2021-11-18 05:56:47.328867+00	1	1:??????	1	[{"added": {}}]	37	1
33	2021-11-19 00:46:57.021607+00	02	??????????????????????????????	1	[{"added": {}}]	28	1
34	2021-11-19 01:22:35.102923+00	400	400 - ?????????	1	[{"added": {}}]	29	1
35	2021-11-19 01:22:50.985917+00	500	500 - ???????????????	1	[{"added": {}}]	29	1
36	2021-11-19 01:23:13.285134+00	600	600 - ???????????????	1	[{"added": {}}]	29	1
37	2021-11-19 01:23:30.538668+00	700	700 - ???????????????	1	[{"added": {}}]	29	1
38	2021-11-19 01:23:43.831618+00	800	800 - ???????????????	1	[{"added": {}}]	29	1
39	2021-11-19 01:24:12.089517+00	900	900 - ????????????	1	[{"added": {}}]	29	1
40	2021-11-19 01:24:35.274677+00	101	101 - ????????????????????????	1	[{"added": {}}]	29	1
41	2021-11-19 01:24:57.60872+00	102	102 - ????????????	1	[{"added": {}}]	29	1
42	2021-11-19 01:25:13.433631+00	103	103 - ???????????????	1	[{"added": {}}]	29	1
43	2021-11-19 01:25:37.68088+00	104	104 - ???????????????	1	[{"added": {}}]	29	1
44	2021-11-19 01:26:06.72469+00	105	105 - ???????????????	1	[{"added": {}}]	29	1
45	2021-11-19 01:26:22.696777+00	106	106 - ???????????????	1	[{"added": {}}]	29	1
46	2021-11-19 01:26:34.597811+00	106	106 - ???????????????	3		29	1
47	2021-11-19 01:26:56.041799+00	106	106 - ?????????????????????	1	[{"added": {}}]	29	1
48	2021-11-19 01:27:16.39733+00	107	107 - ????????????????????????	1	[{"added": {}}]	29	1
49	2021-11-19 01:50:42.197319+00	500	????????????	1	[{"added": {}}]	31	1
50	2021-11-19 01:51:01.650939+00	500	???????????????	2	[{"changed": {"fields": ["Segment_nm/\\u30bb\\u30b0\\u30e1\\u30f3\\u30c8\\u540d"]}}]	31	1
51	2021-11-19 01:52:54.898346+00	600	?????????	1	[{"added": {}}]	31	1
52	2021-11-19 01:53:50.458037+00	700	??????	1	[{"added": {}}]	31	1
53	2021-11-19 01:54:10.681913+00	800	???????????????	1	[{"added": {}}]	31	1
54	2021-11-19 01:54:34.902214+00	900	???????????????	1	[{"added": {}}]	31	1
55	2021-11-19 01:54:55.617402+00	101	????????????????????????	1	[{"added": {}}]	31	1
56	2021-11-19 01:55:16.461115+00	102	??????????????????????????????	1	[{"added": {}}]	31	1
57	2021-11-19 01:55:56.899689+00	103	???????????????24?????????	1	[{"added": {}}]	31	1
58	2021-11-19 01:56:18.170145+00	104	?????????	1	[{"added": {}}]	31	1
59	2021-11-19 01:56:28.579299+00	105	?????????	1	[{"added": {}}]	31	1
60	2021-11-19 01:56:43.635186+00	106	??????	1	[{"added": {}}]	31	1
61	2021-11-19 01:56:54.184667+00	107	???????????????	1	[{"added": {}}]	31	1
62	2021-11-19 02:01:08.258489+00	108	??????	1	[{"added": {}}]	31	1
63	2021-11-19 02:01:37.80313+00	109	???????????????	1	[{"added": {}}]	31	1
64	2021-11-19 02:02:05.51716+00	110	???????????????	1	[{"added": {}}]	31	1
65	2021-11-19 02:02:28.301212+00	111	??????	1	[{"added": {}}]	31	1
66	2021-11-19 02:03:47.15953+00	112	?????????	1	[{"added": {}}]	31	1
67	2021-11-19 02:04:09.041979+00	113	???????????????	1	[{"added": {}}]	31	1
68	2021-11-19 02:05:18.290469+00	114	????????????	1	[{"added": {}}]	31	1
69	2021-11-19 02:07:24.03693+00	115	????????????	1	[{"added": {}}]	31	1
70	2021-11-19 02:07:41.526724+00	116	??????FM????????????	1	[{"added": {}}]	31	1
71	2021-11-19 02:11:12.923506+00	117	?????????????????????	1	[{"added": {}}]	31	1
72	2021-11-19 02:11:35.019665+00	119	??????????????????	1	[{"added": {}}]	31	1
73	2021-11-19 02:12:07.457075+00	120	??????????????????????????????	1	[{"added": {}}]	31	1
74	2021-11-19 02:13:13.605875+00	2	2:??????	1	[{"added": {}}]	37	1
75	2021-11-19 02:15:50.885934+00	400	????????????????????????	1	[{"added": {}}]	6	1
76	2021-11-19 02:16:13.652291+00	500	????????????????????????	1	[{"added": {}}]	6	1
77	2021-11-19 02:17:06.090497+00	1	ApprovalRouteMaster object (1)	1	[{"added": {}}]	21	1
78	2021-11-19 02:19:17.499961+00	1	ApprovalRouteMaster object (1)	2	[]	21	1
79	2021-11-19 02:19:59.016211+00	2	ApprovalRouteMaster object (2)	1	[{"added": {}}]	21	1
80	2021-11-19 02:21:20.161398+00	3	ApprovalRouteMaster object (3)	1	[{"added": {}}]	21	1
81	2021-11-19 02:47:56.233282+00	2	0000002 - ????????????	2	[{"changed": {"fields": ["Employee name/\\u793e\\u54e1\\u540d", "Email/E\\u30e1\\u30fc\\u30eb"]}}]	14	1
82	2021-11-19 02:48:33.280721+00	4	0000003 - ???????????????	2	[{"changed": {"fields": ["Employee name/\\u793e\\u54e1\\u540d", "Email/E\\u30e1\\u30fc\\u30eb"]}}]	14	1
83	2021-11-19 02:49:05.011346+00	2	0000002 - ????????????	2	[{"added": {"name": "emp affiliation", "object": "EmpAffiliation object (4)"}}, {"added": {"name": "emp affiliation", "object": "EmpAffiliation object (5)"}}]	14	1
84	2021-11-19 02:50:37.47581+00	5	0000004 - ???????????????	2	[{"changed": {"fields": ["Employee name/\\u793e\\u54e1\\u540d", "Email/E\\u30e1\\u30fc\\u30eb"]}}, {"changed": {"name": "emp affiliation", "object": "EmpAffiliation object (3)", "fields": ["Department/\\u90e8\\u9580", "Segment/\\u30bb\\u30b0\\u30e1\\u30f3\\u30c8"]}}]	14	1
85	2021-11-19 02:51:36.713798+00	6	0000005 - ???????????????	1	[{"added": {}}, {"added": {"name": "emp affiliation", "object": "EmpAffiliation object (6)"}}]	14	1
86	2021-11-19 02:52:51.576988+00	7	0000006 - ???????????????	1	[{"added": {}}, {"added": {"name": "emp affiliation", "object": "EmpAffiliation object (7)"}}]	14	1
87	2021-11-19 02:55:03.598727+00	8	0000007 - ???????????????	1	[{"added": {}}, {"added": {"name": "emp affiliation", "object": "EmpAffiliation object (8)"}}, {"added": {"name": "emp affiliation", "object": "EmpAffiliation object (9)"}}, {"added": {"name": "emp affiliation", "object": "EmpAffiliation object (10)"}}]	14	1
88	2021-11-19 02:56:28.252748+00	9	0000008 - ???????????????	1	[{"added": {}}, {"added": {"name": "emp affiliation", "object": "EmpAffiliation object (11)"}}]	14	1
89	2021-11-19 02:56:58.469891+00	01	????????????	2	[{"changed": {"fields": ["Division_nm/\\u8ab2\\u540d"]}}]	30	1
90	2021-11-19 02:57:23.079585+00	02	???????????????	1	[{"added": {}}]	30	1
91	2021-11-19 02:57:46.511992+00	03	????????????	1	[{"added": {}}]	30	1
92	2021-11-19 04:07:06.225111+00	1	??????????????????????????????????????????	2	[{"changed": {"fields": ["Property_nm/\\u7269\\u4ef6\\u540d", "Department/\\u90e8\\u9580ID", "Segment/\\u30bb\\u30b0\\u30e1\\u30f3\\u30c8ID", "Address/\\u4f4f\\u6240", "Emp/\\u793e\\u54e1ID"]}}]	26	1
93	2021-11-19 04:08:05.618386+00	2	OTC??????????????????????????????	1	[{"added": {}}]	26	1
94	2021-11-19 04:08:50.230196+00	1002201	??????????????????????????????????????????	2	[{"changed": {"fields": ["Property_id/\\u7269\\u4ef6ID"]}}]	26	1
95	2021-11-19 04:09:02.007846+00	1004501	OTC??????????????????????????????	2	[{"changed": {"fields": ["Property_id/\\u7269\\u4ef6ID"]}}]	26	1
96	2021-11-19 04:10:04.417766+00	1	??????????????????????????????????????????	3		26	1
97	2021-11-19 04:10:12.196515+00	2	OTC??????????????????????????????	3		26	1
98	2021-11-19 04:11:21.314787+00	1005601	???????????????????????????????????????????????????	1	[{"added": {}}]	26	1
99	2021-11-19 04:12:19.26658+00	1000301	???????????????????????????????????????????????????	1	[{"added": {}}]	26	1
100	2021-11-19 04:13:14.743374+00	1002001	??????????????????????????????????????????	1	[{"added": {}}]	26	1
101	2021-11-19 04:14:38.701303+00	1	ApprovalRouteComment object (1)	1	[{"added": {}}]	17	1
102	2021-11-19 04:18:50.858317+00	1	1:???????????????	1	[{"added": {}}]	20	1
103	2021-11-19 04:19:04.255528+00	2	2:?????????	1	[{"added": {}}]	20	1
104	2021-11-19 04:19:18.680117+00	3	3:?????????	1	[{"added": {}}]	20	1
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
19	core	choices
20	core	approvalclass
21	core	approvalroutemaster
22	core	requestdetailmaster
23	core	columntype
24	core	approvaltype
25	users	empaffiliation
26	core	property
27	core	choice
28	users	businessunit
29	users	department
30	users	division
31	users	segment
32	core	requestdetail
33	core	notificationrecord
34	core	notificationtype
35	core	news
36	core	requestdetailhist
37	core	approvalstatus
38	core	notifier
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
38	core	0002_approvalclass_approvalroutemaster_approvaltype_choices_columntype_requestdetailmaster	2021-10-28 07:53:52.925167+00
39	users	0002_empaffiliation	2021-11-02 06:31:07.399318+00
40	core	0002_property	2021-11-02 06:43:59.056341+00
41	core	0003_auto_20211104_0643	2021-11-08 01:55:45.184651+00
42	core	0002_auto_20211109_1106	2021-11-09 02:06:45.664545+00
43	core	0002_alter_request_table	2021-11-11 04:12:53.703316+00
44	core	0003_notificationrecord_notificationtype	2021-11-11 04:16:13.677236+00
45	core	0002_notificationrecord_confirm_dt	2021-11-11 08:21:23.720256+00
46	core	0002_news	2021-11-11 12:35:04.490807+00
47	core	0002_alter_notificationrecord_confirm_dt	2021-11-11 16:35:35.891122+00
48	core	0002_auto_20211117_1546	2021-11-17 06:46:17.573624+00
49	core	0002_auto_20211118_1129	2021-11-18 02:29:38.183898+00
50	core	0003_alter_approvalroutedetail_approval_date	2021-11-18 02:35:24.460754+00
51	core	0002_alter_approvalroute_request_dt	2021-11-18 02:39:33.90068+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
yigkgqjbcblyj2kpe7pu8lmemsyrdilg	.eJxVjMsOwiAQRf-FtSHSoTxcuvcbyMwAUjWQlHZl_HfbpAvdnnPufYuA61LC2tMcpiguQonTLyPkZ6q7iA-s9ya51WWeSO6JPGyXtxbT63q0fwcFe9nWdIYM1no2xmkzkiFiNsDegyKKdkA_Zj-qnL3V2cHAeYOk0GrtEEF8vt-MN-o:1mSuEQ:hq6EKgyBgorOQ5MCJ2sRGsU0xMe0_OWc9hyLLCR9Lz8	2021-10-06 04:51:42.239745+00
ihx16sdmo21hminnfw3eisnykee4dcha	.eJxVjMsOwiAQRf-FtSHSoTxcuvcbyMwAUjWQlHZl_HfbpAvdnnPufYuA61LC2tMcpiguQonTLyPkZ6q7iA-s9ya51WWeSO6JPGyXtxbT63q0fwcFe9nWdIYM1no2xmkzkiFiNsDegyKKdkA_Zj-qnL3V2cHAeYOk0GrtEEF8vt-MN-o:1mV27a:jRpvK8lAur5PUTtuPD_StdV9imefYq1NXX6tNs7s5f4	2021-10-12 01:41:26.094011+00
spdp6uqocyi05kvh6jlmgycgx7ffj28t	.eJxVjMsOwiAQRf-FtSHSoTxcuvcbyMwAUjWQlHZl_HfbpAvdnnPufYuA61LC2tMcpiguQonTLyPkZ6q7iA-s9ya51WWeSO6JPGyXtxbT63q0fwcFe9nWdIYM1no2xmkzkiFiNsDegyKKdkA_Zj-qnL3V2cHAeYOk0GrtEEF8vt-MN-o:1ml1bf:81TVjf8PYBYgpE3SRBtA7wHUQ_vyUVh-LqOvMWgiz7Y	2021-11-25 04:22:35.220068+00
3pi739s3ug3xk3g4quufl4j8va22bsul	.eJxVjMsOwiAQRf-FtSHSoTxcuvcbyMwAUjWQlHZl_HfbpAvdnnPufYuA61LC2tMcpiguQonTLyPkZ6q7iA-s9ya51WWeSO6JPGyXtxbT63q0fwcFe9nWdIYM1no2xmkzkiFiNsDegyKKdkA_Zj-qnL3V2cHAeYOk0GrtEEF8vt-MN-o:1mnXTr:CkwUaZxQ2g99qt-7eibGuJ9aYMAcgNZugE2-XtJDpRQ	2021-12-02 02:48:55.458814+00
\.


--
-- Data for Name: m_approval_class; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.m_approval_class (created, modified, approval_class_id, approval_class_nm) FROM stdin;
2021-11-19 04:18:50.854318+00	2021-11-19 04:18:50.855342+00	1	???????????????
2021-11-19 04:19:04.252526+00	2021-11-19 04:19:04.252526+00	2	?????????
2021-11-19 04:19:18.678271+00	2021-11-19 04:19:18.678271+00	3	?????????
\.


--
-- Data for Name: m_approval_post; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.m_approval_post (created, modified, approval_post_id, approval_post_nm) FROM stdin;
2021-09-22 02:38:00.458+00	2021-11-18 04:03:12.647466+00	100	??????????????????????????????
2021-09-22 02:38:00.458+00	2021-11-18 04:03:30.2822+00	300	??????????????????????????????
2021-09-22 02:38:00.458+00	2021-11-18 05:39:28.738573+00	200	??????????????????????????????
2021-11-19 02:15:50.878853+00	2021-11-19 02:15:50.878853+00	400	????????????????????????
2021-11-19 02:16:13.648286+00	2021-11-19 02:16:13.648286+00	500	????????????????????????
\.


--
-- Data for Name: m_approval_status; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.m_approval_status (created, modified, approval_status_id, approval_status_nm) FROM stdin;
2021-11-18 04:49:51.84+00	2021-11-18 05:49:33.169+00	1	??????
2021-11-18 05:37:26.173+00	2021-11-18 06:24:56.909+00	2	??????
\.


--
-- Data for Name: m_business_unit; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.m_business_unit (created, modified, business_unit_id, business_unit_nm) FROM stdin;
2021-10-26 08:52:48.869+00	2021-11-18 04:05:41.770258+00	01	????????????
2021-11-19 00:46:57.018976+00	2021-11-19 00:46:57.018976+00	02	??????????????????????????????
\.


--
-- Data for Name: m_choices; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.m_choices (created, modified, choice_id, choice_nm, request_column_id) FROM stdin;
2021-10-30 12:18:55.131+00	2021-10-30 12:18:55.132+00	00	???????????????	0012
2021-10-30 12:18:55.133+00	2021-10-30 12:18:55.133+00	01	???????????????	0012
2021-10-30 12:18:55.135+00	2021-10-30 12:18:55.135+00	02	??????	0012
2021-10-30 12:18:55.137+00	2021-10-30 12:18:55.137+00	03	???????????????	0012
2021-10-30 12:20:19.688+00	2021-10-30 12:20:19.688+00	05	??????	0013
2021-10-30 12:20:19.69+00	2021-10-30 12:20:19.69+00	06	????????????	0013
2021-10-30 12:21:08.078+00	2021-10-30 12:21:08.078+00	07	??????	0018
2021-10-30 12:21:08.083+00	2021-10-30 12:21:08.083+00	08	??????	0018
2021-10-30 12:21:29.654+00	2021-10-30 12:21:29.654+00	09	??????	0019
2021-10-30 12:21:29.656+00	2021-10-30 12:21:29.656+00	10	??????	0019
\.


--
-- Data for Name: m_column_type; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.m_column_type (created, modified, column_type_id, column_type_nm) FROM stdin;
2021-10-30 04:05:47.076+00	2021-10-30 09:38:25.23+00	01	header
2021-10-30 09:38:31.543+00	2021-10-30 09:39:13.909+00	02	input_text
2021-10-30 09:39:24.043+00	2021-10-30 09:39:24.043+00	03	number
2021-10-30 09:39:42.641+00	2021-10-30 09:39:42.641+00	04	radio
2021-10-30 09:39:55.823+00	2021-10-30 09:39:55.823+00	05	checkbox
2021-10-30 09:40:14.822+00	2021-10-30 09:40:14.823+00	06	selection
\.


--
-- Data for Name: m_department; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.m_department (created, modified, department_id, department_nm) FROM stdin;
2021-10-26 08:53:25.13+00	2021-11-18 04:05:59.107107+00	100	?????????
2021-11-18 04:06:12.450262+00	2021-11-18 04:06:12.450262+00	200	???????????????
2021-11-18 04:06:28.81077+00	2021-11-18 04:06:28.81077+00	300	?????????
2021-11-19 01:22:35.099923+00	2021-11-19 01:22:35.099923+00	400	?????????
2021-11-19 01:22:50.983749+00	2021-11-19 01:22:50.983749+00	500	???????????????
2021-11-19 01:23:13.28208+00	2021-11-19 01:23:13.28208+00	600	???????????????
2021-11-19 01:23:30.536669+00	2021-11-19 01:23:30.536669+00	700	???????????????
2021-11-19 01:23:43.828617+00	2021-11-19 01:23:43.829615+00	800	???????????????
2021-11-19 01:24:12.087494+00	2021-11-19 01:24:12.087494+00	900	????????????
2021-11-19 01:24:35.272669+00	2021-11-19 01:24:35.272669+00	101	????????????????????????
2021-11-19 01:24:57.606722+00	2021-11-19 01:24:57.606722+00	102	????????????
2021-11-19 01:25:13.43165+00	2021-11-19 01:25:13.43165+00	103	???????????????
2021-11-19 01:25:37.678882+00	2021-11-19 01:25:37.678882+00	104	???????????????
2021-11-19 01:26:06.722691+00	2021-11-19 01:26:06.722691+00	105	???????????????
2021-11-19 01:26:56.039816+00	2021-11-19 01:26:56.039816+00	106	?????????????????????
2021-11-19 01:27:16.395331+00	2021-11-19 01:27:16.395331+00	107	????????????????????????
\.


--
-- Data for Name: m_division; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.m_division (created, modified, division_id, division_nm) FROM stdin;
2021-10-26 08:54:12.051+00	2021-11-19 02:56:58.46789+00	01	????????????
2021-11-19 02:57:23.077589+00	2021-11-19 02:57:23.077589+00	02	???????????????
2021-11-19 02:57:46.510005+00	2021-11-19 02:57:46.510005+00	03	????????????
\.


--
-- Data for Name: m_emp; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.m_emp (id, password, last_login, is_superuser, created, modified, email, is_staff, is_active, deleted_flg, emp_cd, emp_nm) FROM stdin;
1	pbkdf2_sha256$260000$L2gggWSh35FU8DaCpjSizv$U/PEZ3ckieXr5KeJUCwv+GB5+XZOkwEoLmLMmjet1Xw=	2021-11-18 02:48:55.449381+00	t	2021-09-22 03:43:00.644272+00	2021-09-27 10:58:35.037229+00	admin@example.com	t	t	f	0000001	????????????
4	pbkdf2_sha256$260000$EeRopa5jpxR71v899ih4QL$mIiJahgf91lPDDNT6ilmXokM/8M3BVbpz6dAqumJx1I=	\N	f	2021-11-18 04:12:01.945359+00	2021-11-19 02:48:33.27072+00	s@example.com	f	t	f	0000003	???????????????
2	pbkdf2_sha256$260000$1DZJ22YKKNTGSelK2Ti3CI$SKJPYqfH3bv3UH3AkkJeVpeMbWcdN5eZVvaJqxbN5Ps=	\N	f	2021-09-22 03:44:48.939363+00	2021-11-19 02:49:04.968887+00	i@example.com	f	t	f	0000002	????????????
5	pbkdf2_sha256$260000$1E3XqvmiGY5ZSHNs1HGITh$W/pJG/t3svpbypvqnc1pkG1bmBRNPa/enJm6WPKyKg4=	\N	f	2021-11-18 04:13:07.236941+00	2021-11-19 02:50:37.463106+00	co@example.com	f	t	f	0000004	???????????????
6	pbkdf2_sha256$260000$xMvN3RKHUQl0S8svUjIuPr$aMr1Z50DVTpxrFPsQlZHSK5McngPNAKh7kBEfWKrd2o=	\N	f	2021-11-19 02:51:36.701796+00	2021-11-19 02:51:36.701796+00	ta@example.com	f	t	f	0000005	???????????????
7	pbkdf2_sha256$260000$GNNsQSJrBQsEyaZ49a3W5g$9LThH6xkRi6RdYywk3MfzlheWwglGesh9v67AKAY1xM=	\N	f	2021-11-19 02:52:51.572972+00	2021-11-19 02:52:51.572972+00	ya@example.com	f	t	f	0000006	???????????????
8	pbkdf2_sha256$260000$Rq05649e1GJfQQj0VtyGbn$kIzLwNJE02fFezLesXQ98Uow5ON1SXQQGB2JggpZfK0=	\N	f	2021-11-19 02:55:03.584585+00	2021-11-19 02:55:03.584585+00	kura@example.com	f	t	f	0000007	???????????????
9	pbkdf2_sha256$260000$db8WyDwcix38QG0jnfMKSV$CwHre5qZCQsIXPY7Kfafd0IejE+iuKySVLrRkPPYuck=	\N	f	2021-11-19 02:56:28.24761+00	2021-11-19 02:56:28.24761+00	taku@example.com	f	t	f	0000008	???????????????
\.


--
-- Data for Name: m_emp_affiliation; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.m_emp_affiliation (created, modified, emp_affiliation_id, main_flg, business_unit_id, department_id, division_id, emp_id, segment_id) FROM stdin;
2021-11-09 02:41:10.183+00	2021-11-09 02:41:14.029+00	1	t	01	100	01	1	100
2021-11-18 04:12:01.947361+00	2021-11-18 04:12:01.947361+00	2	f	01	200	\N	4	300
2021-11-19 02:49:04.978346+00	2021-11-19 02:49:04.978346+00	4	f	01	200	\N	2	300
2021-11-19 02:49:05.009346+00	2021-11-19 02:49:05.009346+00	5	f	01	200	\N	2	500
2021-11-18 04:13:07.239655+00	2021-11-19 02:50:37.472108+00	3	f	01	200	\N	5	300
2021-11-19 02:51:36.710796+00	2021-11-19 02:51:36.710796+00	6	f	01	200	\N	6	300
2021-11-19 02:52:51.574974+00	2021-11-19 02:52:51.574974+00	7	f	01	200	\N	7	300
2021-11-19 02:55:03.587584+00	2021-11-19 02:55:03.587584+00	8	f	01	100	\N	8	100
2021-11-19 02:55:03.591401+00	2021-11-19 02:55:03.591401+00	9	f	01	200	\N	8	300
2021-11-19 02:55:03.594459+00	2021-11-19 02:55:03.594459+00	10	f	01	500	\N	8	800
2021-11-19 02:56:28.2496+00	2021-11-19 02:56:28.2496+00	11	f	01	100	\N	9	100
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
-- Data for Name: m_news; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.m_news (created, modified, news_id, news, delete_flag) FROM stdin;
\.


--
-- Data for Name: m_notification_type; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.m_notification_type (created, modified, notification_type_id, notification_type_nm) FROM stdin;
2021-11-11 04:23:28.009+00	2021-11-11 04:23:28.009+00	01	??????
2021-11-11 04:23:32.4+00	2021-11-11 04:23:32.4+00	02	???????????????
2021-11-11 04:23:39.33+00	2021-11-11 04:23:39.33+00	03	??????
2021-11-11 04:23:46.393+00	2021-11-11 04:23:46.393+00	04	????????????
2021-11-11 04:23:53.381+00	2021-11-11 04:23:53.381+00	09	???????????????
\.


--
-- Data for Name: m_property; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.m_property (created, modified, property_id, property_nm, address, tel_number, department_id, division_id, emp_id, segment_id) FROM stdin;
2021-11-19 04:08:50.228203+00	2021-11-19 04:08:50.228203+00	1002201	??????????????????????????????????????????	??????????????????????????????	070	700	01	5	104
2021-11-19 04:09:02.005835+00	2021-11-19 04:09:02.005835+00	1004501	OTC??????????????????????????????	??????????????????????????????	090	700	01	5	104
2021-11-19 04:11:21.312786+00	2021-11-19 04:11:21.312786+00	1005601	???????????????????????????????????????????????????	??????????????????????????????	090	700	01	4	104
2021-11-19 04:12:19.263581+00	2021-11-19 04:12:19.263581+00	1000301	???????????????????????????????????????????????????	??????????????????????????????	090	800	01	4	105
2021-11-19 04:13:14.741371+00	2021-11-19 04:13:14.741371+00	1002001	??????????????????????????????????????????	??????????????????????????????	090	800	01	2	105
\.


--
-- Data for Name: m_request_detail; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.m_request_detail (created, modified, request_column_id, required, max_length, column_nm, notes, approval_type_id, column_type_id, parent_column_id) FROM stdin;
2021-10-30 11:58:40.748+00	2021-10-30 12:16:23.874+00	0001	f	20	?????????????????????	???????????????	0001	01	\N
2021-10-30 12:03:25.065+00	2021-10-30 12:16:23.875+00	0002	f	20	???????????????	????????????????????????	0001	02	0001
2021-10-30 12:03:25.067+00	2021-10-30 12:16:23.877+00	0003	f	20	????????????	??????	0001	02	0001
2021-10-30 12:03:25.07+00	2021-10-30 12:16:23.878+00	0004	f	20	????????????	??????	0001	02	0001
2021-10-30 12:03:25.073+00	2021-10-30 12:16:23.879+00	0005	f	20	????????????	????????????????????????	0001	02	0001
2021-10-30 12:03:25.076+00	2021-10-30 12:16:23.882+00	0006	f	20	????????????	??????	0001	06	0001
2021-10-30 12:03:25.084+00	2021-10-30 12:16:23.884+00	0007	f	20	?????????????????????	??????	0001	06	0001
2021-10-30 12:03:25.092+00	2021-10-30 12:16:23.886+00	0008	f	20	?????????????????????	??????	0001	02	0001
2021-10-30 12:12:29.235+00	2021-10-30 12:16:23.888+00	0009	f	20	???????????????	??????	0001	02	0001
2021-10-30 12:12:29.238+00	2021-10-30 12:16:23.89+00	0010	f	20	???????????????	??????	0001	02	0001
2021-10-30 12:12:29.24+00	2021-10-30 16:30:09.066+00	0011	f	20	????????????	??????	0001	01	0001
2021-10-30 12:12:29.243+00	2021-10-30 12:18:55.129+00	0012	f	20	??????	????????????????????????	0001	04	0001
2021-10-30 12:12:29.245+00	2021-10-30 12:20:19.685+00	0013	f	20	??????????????????	??????	0001	04	0001
2021-10-30 12:12:29.247+00	2021-10-30 12:16:23.896+00	0014	f	20	????????????	??????	0001	02	0001
2021-10-30 12:12:29.249+00	2021-10-30 12:16:23.897+00	0015	f	20	?????????????????????	??????	0001	02	0001
2021-10-30 12:12:29.252+00	2021-10-30 12:16:23.899+00	0016	f	20	?????????????????????	????????????????????????	0001	02	0001
2021-10-30 12:12:29.255+00	2021-10-30 12:16:23.9+00	0017	f	20	??????????????????????????????	??????	0001	02	0001
2021-10-30 12:12:29.257+00	2021-10-30 12:21:08.07+00	0018	f	20	????????????	??????	0001	04	0001
2021-10-30 12:12:29.259+00	2021-10-30 12:21:29.651+00	0019	f	20	?????????????????????	??????	0001	04	0001
2021-10-30 16:30:09.075+00	2021-10-30 16:30:09.075+00	0020	f	20	????????????		0001	06	0011
2021-10-30 16:30:09.078+00	2021-10-30 16:30:09.078+00	0021	f	20	????????????		0001	06	0011
2021-10-30 16:30:09.081+00	2021-10-30 16:30:09.081+00	0022	f	20	???????????? ?????????????????????		0001	06	0011
\.


--
-- Data for Name: m_request_status; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.m_request_status (created, modified, status_id, status_nm) FROM stdin;
2021-10-30 04:05:47.076+00	2021-10-30 09:38:25.23+00	1	?????????
2021-10-30 09:38:31.543+00	2021-10-30 09:39:13.909+00	2	?????????
2021-11-18 05:54:06.83+00	2021-11-18 05:54:06.83+00	3	???????????????
2021-11-18 05:54:20.77+00	2021-11-18 05:54:20.77+00	8	??????
2021-11-18 05:54:29.177+00	2021-11-18 05:54:29.178+00	9	????????????
\.


--
-- Data for Name: m_segment; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.m_segment (created, modified, segment_id, segment_nm) FROM stdin;
2021-10-26 08:54:37.912+00	2021-11-18 04:06:53.910377+00	100	?????????
2021-11-18 04:07:06.806579+00	2021-11-18 04:07:06.806579+00	200	?????????
2021-11-18 04:07:22.79238+00	2021-11-18 04:07:22.79238+00	300	??????????????????
2021-11-18 04:07:56.318902+00	2021-11-18 04:07:56.318902+00	400	?????????
2021-11-19 01:50:42.1948+00	2021-11-19 01:51:01.648122+00	500	???????????????
2021-11-19 01:52:54.896339+00	2021-11-19 01:52:54.896339+00	600	?????????
2021-11-19 01:53:50.45604+00	2021-11-19 01:53:50.45604+00	700	??????
2021-11-19 01:54:10.678994+00	2021-11-19 01:54:10.678994+00	800	???????????????
2021-11-19 01:54:34.90021+00	2021-11-19 01:54:34.90021+00	900	???????????????
2021-11-19 01:54:55.615406+00	2021-11-19 01:54:55.615406+00	101	????????????????????????
2021-11-19 01:55:16.459115+00	2021-11-19 01:55:16.459115+00	102	??????????????????????????????
2021-11-19 01:55:56.896467+00	2021-11-19 01:55:56.896467+00	103	???????????????24?????????
2021-11-19 01:56:18.168139+00	2021-11-19 01:56:18.168139+00	104	?????????
2021-11-19 01:56:28.576296+00	2021-11-19 01:56:28.576296+00	105	?????????
2021-11-19 01:56:43.633187+00	2021-11-19 01:56:43.633187+00	106	??????
2021-11-19 01:56:54.182661+00	2021-11-19 01:56:54.182661+00	107	???????????????
2021-11-19 02:01:08.256488+00	2021-11-19 02:01:08.256488+00	108	??????
2021-11-19 02:01:37.801138+00	2021-11-19 02:01:37.801138+00	109	???????????????
2021-11-19 02:02:05.515159+00	2021-11-19 02:02:05.515159+00	110	???????????????
2021-11-19 02:02:28.298678+00	2021-11-19 02:02:28.299681+00	111	??????
2021-11-19 02:03:47.156534+00	2021-11-19 02:03:47.156534+00	112	?????????
2021-11-19 02:04:09.039968+00	2021-11-19 02:04:09.039968+00	113	???????????????
2021-11-19 02:05:18.288469+00	2021-11-19 02:05:18.28947+00	114	????????????
2021-11-19 02:07:24.033934+00	2021-11-19 02:07:24.033934+00	115	????????????
2021-11-19 02:07:41.524725+00	2021-11-19 02:07:41.524725+00	116	??????FM????????????
2021-11-19 02:11:12.921525+00	2021-11-19 02:11:12.921525+00	117	?????????????????????
2021-11-19 02:11:35.017681+00	2021-11-19 02:11:35.017681+00	119	??????????????????
2021-11-19 02:12:07.455078+00	2021-11-19 02:12:07.455078+00	120	??????????????????????????????
\.


--
-- Data for Name: mm_approval_route; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.mm_approval_route (id, created, modified, judge_cd, "order", notification, required_num_approvals, approval_post_id, approval_type_id, department_id, division_id, emp_id, segment_id) FROM stdin;
1	2021-11-19 02:17:06.063373+00	2021-11-19 02:19:17.497384+00		1	\N	1	500	0001	200	\N	2	300
2	2021-11-19 02:19:59.01221+00	2021-11-19 02:19:59.01221+00		2	\N	2	100	0001	100	\N	4	100
3	2021-11-19 02:21:20.159268+00	2021-11-19 02:21:20.159268+00		3	\N	3	300	0001	200	\N	5	300
\.


--
-- Data for Name: mm_approval_type; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.mm_approval_type (created, modified, approval_type_id, approval_type_nm, can_read, approval_class_id, division_id, segment_id) FROM stdin;
2021-10-30 11:58:40.741+00	2021-10-30 16:33:39.076+00	0001	??????????????????????????????		\N	\N	\N
\.


--
-- Data for Name: t_approval_route; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.t_approval_route (created, modified, approval_route_id, judgement_cd, request_emp_id, business_unit_id, department_id, division_id, segment_id, approval_type_id, request_id, request_dt) FROM stdin;
2021-11-11 16:40:31.719428+00	2021-11-11 16:40:31.719428+00	2	\N	2	01	100	01	100	0001	2	\N
2021-11-11 16:40:05.197598+00	2021-11-18 04:14:12.529318+00	1	\N	1	01	100	01	100	0001	1	2021-11-18 04:14:04+00
2021-11-18 05:38:50.316552+00	2021-11-18 05:38:50.316552+00	3	\N	2	01	300	\N	400	0001	1	\N
2021-11-18 05:38:50.334553+00	2021-11-18 05:38:50.335564+00	4	\N	4	01	200	\N	300	0001	1	\N
2021-11-18 05:44:02.34909+00	2021-11-18 05:44:02.34909+00	5	\N	1	\N	100	\N	\N	0001	3	\N
2021-11-19 00:51:17.606598+00	2021-11-19 00:51:17.606598+00	6	\N	1	\N	100	\N	\N	0001	4	\N
2021-11-19 00:51:17.798749+00	2021-11-19 00:51:17.798749+00	7	\N	1	\N	100	\N	\N	0001	5	\N
2021-11-19 00:51:17.993973+00	2021-11-19 00:51:17.993973+00	8	\N	1	\N	100	\N	\N	0001	6	\N
\.


--
-- Data for Name: t_approval_route_comment; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.t_approval_route_comment (id, created, modified, comment_no, comment, approval_route_id, ins_emp_id, request_id) FROM stdin;
1	2021-11-19 04:14:38.69631+00	2021-11-19 04:14:38.69631+00	1	???????????????????????????	1	2	1
\.


--
-- Data for Name: t_approval_route_detail; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.t_approval_route_detail (created, modified, detail_no, required_num_approvals, "order", notification, approval_status_id, approval_date, approval_emp_id, approval_post_id, approval_route_id, current_order_flg, default_flg) FROM stdin;
\.


--
-- Data for Name: t_notification_record; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.t_notification_record (id, created, modified, emp_id, notification_type_id, request_id, confirm_dt) FROM stdin;
1	2021-11-11 16:40:50.802153+00	2021-11-11 16:40:50.802153+00	1	02	1	\N
2	2021-11-18 05:35:56.289463+00	2021-11-18 05:35:56.289463+00	2	03	1	\N
\.


--
-- Data for Name: t_notifier; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.t_notifier (id, created, modified, confirm_dt, notify_emp_id, request_id) FROM stdin;
1	2021-11-18 05:36:13.150771+00	2021-11-18 05:36:13.150771+00	\N	5	1
\.


--
-- Data for Name: t_request; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.t_request (created, modified, request_id, request_title, status_id, approval_type_id) FROM stdin;
2021-11-11 16:40:31.717351+00	2021-11-11 16:40:31.717351+00	2	??????????????????	1	0001
2021-11-11 16:40:05.194096+00	2021-11-18 05:38:50.310581+00	1	???????????????	1	0001
2021-11-18 05:44:02.291093+00	2021-11-18 05:44:17.8497+00	3		2	0001
2021-11-19 00:51:17.773892+00	2021-11-19 00:51:17.773892+00	5		2	0001
2021-11-19 00:51:17.976973+00	2021-11-19 00:51:17.976973+00	6		2	0001
2021-11-19 00:51:17.591116+00	2021-11-19 02:17:29.259371+00	4		2	0001
\.


--
-- Data for Name: t_request_detail; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.t_request_detail (id, created, modified, request_column_val, request_id, request_column_id) FROM stdin;
1	2021-11-18 05:44:02.31409+00	2021-11-18 05:44:17.837717+00	08	3	0018
2	2021-11-18 05:44:02.329097+00	2021-11-18 05:44:17.845701+00	10	3	0019
\.


--
-- Data for Name: t_request_detail_hist; Type: TABLE DATA; Schema: public; Owner: approval_user
--

COPY public.t_request_detail_hist (id, created, modified, request_column_val, request_id, request_column_id) FROM stdin;
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
6	2021-11-09 02:02:00.389888+00	8
7	2021-11-11 16:40:58.546469+00	10
8	2021-11-11 16:40:59.15447+00	11
9	2021-11-18 05:41:57.627448+00	12
10	2021-11-19 00:49:37.04025+00	13
12	2021-11-19 01:00:02.164012+00	15
13	2021-11-19 02:17:29.13574+00	16
14	2021-11-19 02:26:16.147581+00	17
15	2021-11-19 02:36:26.784675+00	18
16	2021-11-19 02:43:21.091201+00	19
18	2021-11-19 04:14:46.560223+00	21
20	2021-11-19 04:23:44.551475+00	23
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
6	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYzNjQyMjA3NiwianRpIjoiNTk3NzRjMTkwNTk2NDgzYTkyMjJlZmQxMjVkYjdiY2UiLCJ1c2VyX2lkIjoxfQ.ysi8WjXAwkmD-Qyf9r8dSaIDiyiflIOwnmn8rAF-nug	2021-11-08 01:41:16.75172+00	2021-11-09 01:41:16+00	1	59774c190596483a9222efd125db7bce
7	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYzNjUwOTcxNCwianRpIjoiZTRiNjE0NTYzZGY0NGMwNjhiOTVjOGM2MTBmMTIzNWEiLCJ1c2VyX2lkIjoxfQ.ZlADyJcXnEs6QYak126K0IUak4rJaiqiJ2ionmRwh8U	2021-11-09 02:01:54.525317+00	2021-11-10 02:01:54+00	1	e4b614563df44c068b95c8c610f1235a
8	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjM2NDIzNjE0LCJqdGkiOiJhNTgyM2ZjNTViYjA0YTBmOThhYjI4M2NmNWU5ZTM3NCIsInVzZXJfaWQiOjF9.5EoyLHQdYzsLC3c-neaP5xIk8cOcEL-OUAW034ORxLo	\N	2021-11-09 02:06:54+00	\N	a5823fc55bb04a0f98ab283cf5e9e374
9	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYzNjUwOTcyNiwianRpIjoiODhkOGQ5ZDFhODcwNDk2N2I2Njc3Y2M1Yjc5OTQwMmUiLCJ1c2VyX2lkIjoxfQ.ke9lnYI8mF66CzveFdgKSXIRZM8yfPMkbL6cRhvdpbI	2021-11-09 02:02:06.587675+00	2021-11-10 02:02:06+00	1	88d8d9d1a8704967b6677cc5b799402e
10	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYzNjczNDY5NSwianRpIjoiNWE1ZWUxMDE0MGY0NGFhYThlZjZlNTdjYjI1NTBhYWMiLCJ1c2VyX2lkIjoxfQ.LfvbuekvJktEQaFeyU4RW6UJyGZ1HYt11Nf5vYNuBfo	\N	2021-11-12 16:31:35+00	\N	5a5ee10140f44aaa8ef6e57cb2550aac
11	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYzNjczNTI1OCwianRpIjoiNmVmYjdjNDM4MTk3NDA1NmE0MTM5ZmIxMDc4MjAwZjgiLCJ1c2VyX2lkIjoxfQ.JeiJ0yMzT4-3EfyEbK944VpCP9DtMtpIB8rcWzN2B0w	\N	2021-11-12 16:40:58+00	\N	6efb7c4381974056a4139fb1078200f8
12	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYzNzI4NzA5OSwianRpIjoiNDdkZDUzZTYxNTk5NDVlZDhiOTcwODVlYzA4YjkyZmMiLCJ1c2VyX2lkIjoxfQ.8UvYmM9RF3PPTIDvStPMeR4wRkEdS6WlvYyY-L9TA3E	\N	2021-11-19 01:58:19+00	\N	47dd53e6159945ed8b97085ec08b92fc
13	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYzNzMwMDUxNywianRpIjoiMjUwMmViZjI3OTk1NDMyNDg4ZTIxYTMwYWEzNGJlN2EiLCJ1c2VyX2lkIjoxfQ._6_yTtWqomlkpYMREaDAOGUKyFsS5zsSfh1Wu9D5HWE	\N	2021-11-19 05:41:57+00	\N	2502ebf27995432488e21a30aa34be7a
15	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYzNzM2OTM4NywianRpIjoiMTk4YmMxNjRmM2FiNDg1MzgxYzQ1MjJjMDIwYWNjMTgiLCJ1c2VyX2lkIjoxfQ.rsbAjl8vD7nchJ01HB70KdmZAuTdGvxvx5tc0GrdbRg	2021-11-19 00:49:47.927901+00	2021-11-20 00:49:47+00	1	198bc164f3ab485381c4522c020acc18
16	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYzNzM3MDAwMiwianRpIjoiNjA5MjVhMmM2NGM5NDk3ZWE0NDQyODc1MjQ0MTIwOTEiLCJ1c2VyX2lkIjoxfQ.ot54BBre88di2vEWZfEkllZNgL0o8NORLz1A1lu1SYw	\N	2021-11-20 01:00:02+00	\N	60925a2c64c9497ea444287524412091
17	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYzNzM3NDY0OSwianRpIjoiYjk0YmFjZWZlOWJjNGUxM2I5MWY2ZGFiMzY5YjFhM2UiLCJ1c2VyX2lkIjoxfQ.SeADtylCuoyNtDMgX3-_2tuGNK_rddEFB2Q1DCcAh8M	\N	2021-11-20 02:17:29+00	\N	b94bacefe9bc4e13b91f6dab369b1a3e
18	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYzNzM3NTE5MiwianRpIjoiODk0OTg0MGM4MWFhNGY5OWFlZmMyMjdmOTAzNTEyZjAiLCJ1c2VyX2lkIjoxfQ.Q-ZXnrB2FETOf4tBM3evdk8xmBK0tubMPaJXyR3V-o8	2021-11-19 02:26:32.560026+00	2021-11-20 02:26:32+00	1	8949840c81aa4f99aefc227f903512f0
19	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYzNzM3NTc4NiwianRpIjoiOWNhMjllNTIxM2E0NDU4MmE3MWIyZjk3Y2NmYzA2MzkiLCJ1c2VyX2lkIjoxfQ.e1EqEnmnHXKe12Ivt8w33vjx6WVwCfSbq8l1ETsq5yY	\N	2021-11-20 02:36:26+00	\N	9ca29e5213a44582a71b2f97ccfc0639
21	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYzNzM3NjIwMSwianRpIjoiZjU0NDk5MjMzYWQxNDMwOTkzMWQ2NDRhMjM5OGMxZjQiLCJ1c2VyX2lkIjoxfQ.9SreF3PIzKp7lYEIiLZewdOCZXwivFX_agtlihsxQAs	\N	2021-11-20 02:43:21+00	\N	f54499233ad14309931d644a2398c1f4
23	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYzNzM4MTY5NiwianRpIjoiM2Q2MDY1MWNhNTlhNDAzNDkyYWU3NTI0MmEyYWNmMWMiLCJ1c2VyX2lkIjoxfQ.G9QfPGv2Kz9AhrwUC3bXvY67aGxrVhy1HmyOdDHXyQo	2021-11-19 04:14:56.02224+00	2021-11-20 04:14:56+00	1	3d60651ca59a403492ae75242a2acf1c
24	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYzNzM4MjIzNCwianRpIjoiZTUyYThiMmJmZjZmNDYxN2I2NzNmMTUzM2JhOTgzZDYiLCJ1c2VyX2lkIjoxfQ.ipeA3MHd6X-k0W44tP7oKiufTKUK0z_wrOmZfvN5-sE	2021-11-19 04:23:54.1405+00	2021-11-20 04:23:54+00	1	e52a8b2bff6f4617b673f1533ba983d6
25	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYzNzM4MjIzNCwianRpIjoiM2I5ZjZjMGM0NTk5NGQ1ZmE3OTUxZmM1M2Y5NmNlMzAiLCJ1c2VyX2lkIjoxfQ.PFs5Lia6MV2J5dvCllBewy7CW5HGl7m1OCaTIYdYgyg	2021-11-19 04:23:54.451723+00	2021-11-20 04:23:54+00	1	3b9f6c0c45994d5fa7951fc53f96ce30
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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 152, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 104, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 38, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 51, true);


--
-- Name: m_emp_affiliation_emp_affiliation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.m_emp_affiliation_emp_affiliation_id_seq', 11, true);


--
-- Name: mm_approval_route_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.mm_approval_route_id_seq', 3, true);


--
-- Name: t_approval_route_approval_route_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.t_approval_route_approval_route_id_seq', 12, true);


--
-- Name: t_approval_route_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.t_approval_route_comment_id_seq', 1, true);


--
-- Name: t_approval_route_detail_detail_no_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.t_approval_route_detail_detail_no_seq', 12, true);


--
-- Name: t_notification_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.t_notification_record_id_seq', 2, true);


--
-- Name: t_notifier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.t_notifier_id_seq', 1, true);


--
-- Name: t_request_detail_hist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.t_request_detail_hist_id_seq', 1, false);


--
-- Name: t_request_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.t_request_detail_id_seq', 2, true);


--
-- Name: t_request_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.t_request_request_id_seq', 10, true);


--
-- Name: token_blacklist_blacklistedtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.token_blacklist_blacklistedtoken_id_seq', 21, true);


--
-- Name: token_blacklist_outstandingtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.token_blacklist_outstandingtoken_id_seq', 25, true);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: approval_user
--

SELECT pg_catalog.setval('public.users_user_id_seq', 9, true);


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
-- Name: m_approval_class m_approval_class_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_approval_class
    ADD CONSTRAINT m_approval_class_pkey PRIMARY KEY (approval_class_id);


--
-- Name: m_approval_post m_approval_post_approval_post_nm_42311033_uniq; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_approval_post
    ADD CONSTRAINT m_approval_post_approval_post_nm_42311033_uniq UNIQUE (approval_post_nm);


--
-- Name: m_approval_post m_approval_post_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_approval_post
    ADD CONSTRAINT m_approval_post_pkey PRIMARY KEY (approval_post_id);


--
-- Name: m_approval_status m_approval_status_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_approval_status
    ADD CONSTRAINT m_approval_status_pkey PRIMARY KEY (approval_status_id);


--
-- Name: m_business_unit m_business_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_business_unit
    ADD CONSTRAINT m_business_unit_pkey PRIMARY KEY (business_unit_id);


--
-- Name: m_choices m_choices_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_choices
    ADD CONSTRAINT m_choices_pkey PRIMARY KEY (choice_id);


--
-- Name: m_column_type m_column_type_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_column_type
    ADD CONSTRAINT m_column_type_pkey PRIMARY KEY (column_type_id);


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
-- Name: m_emp_affiliation m_emp_affiliation_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_emp_affiliation
    ADD CONSTRAINT m_emp_affiliation_pkey PRIMARY KEY (emp_affiliation_id);


--
-- Name: m_news m_news_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_news
    ADD CONSTRAINT m_news_pkey PRIMARY KEY (news_id);


--
-- Name: m_notification_type m_notification_type_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_notification_type
    ADD CONSTRAINT m_notification_type_pkey PRIMARY KEY (notification_type_id);


--
-- Name: m_property m_property_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_property
    ADD CONSTRAINT m_property_pkey PRIMARY KEY (property_id);


--
-- Name: m_request_detail m_request_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_request_detail
    ADD CONSTRAINT m_request_detail_pkey PRIMARY KEY (request_column_id);


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
-- Name: mm_approval_route mm_approval_route_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.mm_approval_route
    ADD CONSTRAINT mm_approval_route_pkey PRIMARY KEY (id);


--
-- Name: mm_approval_type mm_approval_type_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.mm_approval_type
    ADD CONSTRAINT mm_approval_type_pkey PRIMARY KEY (approval_type_id);


--
-- Name: t_approval_route_comment t_approval_route_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route_comment
    ADD CONSTRAINT t_approval_route_comment_pkey PRIMARY KEY (id);


--
-- Name: t_approval_route_detail t_approval_route_detail_approval_route_id_approv_fc0d69fa_uniq; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route_detail
    ADD CONSTRAINT t_approval_route_detail_approval_route_id_approv_fc0d69fa_uniq UNIQUE (approval_route_id, approval_emp_id);


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
-- Name: t_notification_record t_notification_record_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_notification_record
    ADD CONSTRAINT t_notification_record_pkey PRIMARY KEY (id);


--
-- Name: t_notifier t_notifier_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_notifier
    ADD CONSTRAINT t_notifier_pkey PRIMARY KEY (id);


--
-- Name: t_notifier t_notifier_request_id_notify_emp_id_0d024b0e_uniq; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_notifier
    ADD CONSTRAINT t_notifier_request_id_notify_emp_id_0d024b0e_uniq UNIQUE (request_id, notify_emp_id);


--
-- Name: t_request_detail_hist t_request_detail_hist_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_request_detail_hist
    ADD CONSTRAINT t_request_detail_hist_pkey PRIMARY KEY (id);


--
-- Name: t_request_detail t_request_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_request_detail
    ADD CONSTRAINT t_request_detail_pkey PRIMARY KEY (id);


--
-- Name: t_request t_request_pkey; Type: CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_request
    ADD CONSTRAINT t_request_pkey PRIMARY KEY (request_id);


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
-- Name: m_approval_class_approval_class_id_2e95ca75_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_approval_class_approval_class_id_2e95ca75_like ON public.m_approval_class USING btree (approval_class_id varchar_pattern_ops);


--
-- Name: m_approval_post_approval_post_cd_2fcf98d8_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_approval_post_approval_post_cd_2fcf98d8_like ON public.m_approval_post USING btree (approval_post_id varchar_pattern_ops);


--
-- Name: m_approval_post_approval_post_nm_42311033_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_approval_post_approval_post_nm_42311033_like ON public.m_approval_post USING btree (approval_post_nm varchar_pattern_ops);


--
-- Name: m_approval_status_approval_status_id_014f0eb5_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_approval_status_approval_status_id_014f0eb5_like ON public.m_approval_status USING btree (approval_status_id varchar_pattern_ops);


--
-- Name: m_business_unit_business_unit_cd_29f642a3_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_business_unit_business_unit_cd_29f642a3_like ON public.m_business_unit USING btree (business_unit_id varchar_pattern_ops);


--
-- Name: m_choices_choice_id_10c3b1d7_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_choices_choice_id_10c3b1d7_like ON public.m_choices USING btree (choice_id varchar_pattern_ops);


--
-- Name: m_choices_request_column_id_75744d4c; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_choices_request_column_id_75744d4c ON public.m_choices USING btree (request_column_id);


--
-- Name: m_choices_request_column_id_75744d4c_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_choices_request_column_id_75744d4c_like ON public.m_choices USING btree (request_column_id varchar_pattern_ops);


--
-- Name: m_column_type_column_type_id_71400c85_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_column_type_column_type_id_71400c85_like ON public.m_column_type USING btree (column_type_id varchar_pattern_ops);


--
-- Name: m_department_department_cd_0bb8db7b_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_department_department_cd_0bb8db7b_like ON public.m_department USING btree (department_id varchar_pattern_ops);


--
-- Name: m_division_division_cd_4f4969ee_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_division_division_cd_4f4969ee_like ON public.m_division USING btree (division_id varchar_pattern_ops);


--
-- Name: m_emp_affiliation_business_unit_id_bf18a7b3; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_emp_affiliation_business_unit_id_bf18a7b3 ON public.m_emp_affiliation USING btree (business_unit_id);


--
-- Name: m_emp_affiliation_business_unit_id_bf18a7b3_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_emp_affiliation_business_unit_id_bf18a7b3_like ON public.m_emp_affiliation USING btree (business_unit_id varchar_pattern_ops);


--
-- Name: m_emp_affiliation_department_id_d607f3e3; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_emp_affiliation_department_id_d607f3e3 ON public.m_emp_affiliation USING btree (department_id);


--
-- Name: m_emp_affiliation_department_id_d607f3e3_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_emp_affiliation_department_id_d607f3e3_like ON public.m_emp_affiliation USING btree (department_id varchar_pattern_ops);


--
-- Name: m_emp_affiliation_division_id_859848f6; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_emp_affiliation_division_id_859848f6 ON public.m_emp_affiliation USING btree (division_id);


--
-- Name: m_emp_affiliation_division_id_859848f6_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_emp_affiliation_division_id_859848f6_like ON public.m_emp_affiliation USING btree (division_id varchar_pattern_ops);


--
-- Name: m_emp_affiliation_emp_id_7a1570bb; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_emp_affiliation_emp_id_7a1570bb ON public.m_emp_affiliation USING btree (emp_id);


--
-- Name: m_emp_affiliation_segment_id_6fd06372; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_emp_affiliation_segment_id_6fd06372 ON public.m_emp_affiliation USING btree (segment_id);


--
-- Name: m_emp_affiliation_segment_id_6fd06372_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_emp_affiliation_segment_id_6fd06372_like ON public.m_emp_affiliation USING btree (segment_id varchar_pattern_ops);


--
-- Name: m_emp_emp_cd_68c49e31_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_emp_emp_cd_68c49e31_like ON public.m_emp USING btree (emp_cd varchar_pattern_ops);


--
-- Name: m_notification_type_notification_type_id_3020fb9f_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_notification_type_notification_type_id_3020fb9f_like ON public.m_notification_type USING btree (notification_type_id varchar_pattern_ops);


--
-- Name: m_property_department_id_5b565865; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_property_department_id_5b565865 ON public.m_property USING btree (department_id);


--
-- Name: m_property_department_id_5b565865_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_property_department_id_5b565865_like ON public.m_property USING btree (department_id varchar_pattern_ops);


--
-- Name: m_property_division_id_5dc9e504; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_property_division_id_5dc9e504 ON public.m_property USING btree (division_id);


--
-- Name: m_property_division_id_5dc9e504_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_property_division_id_5dc9e504_like ON public.m_property USING btree (division_id varchar_pattern_ops);


--
-- Name: m_property_emp_id_375b22f6; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_property_emp_id_375b22f6 ON public.m_property USING btree (emp_id);


--
-- Name: m_property_segment_id_1ef3cda0; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_property_segment_id_1ef3cda0 ON public.m_property USING btree (segment_id);


--
-- Name: m_property_segment_id_1ef3cda0_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_property_segment_id_1ef3cda0_like ON public.m_property USING btree (segment_id varchar_pattern_ops);


--
-- Name: m_request_detail_approval_type_id_c469b8c0; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_request_detail_approval_type_id_c469b8c0 ON public.m_request_detail USING btree (approval_type_id);


--
-- Name: m_request_detail_approval_type_id_c469b8c0_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_request_detail_approval_type_id_c469b8c0_like ON public.m_request_detail USING btree (approval_type_id varchar_pattern_ops);


--
-- Name: m_request_detail_column_type_id_13481145; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_request_detail_column_type_id_13481145 ON public.m_request_detail USING btree (column_type_id);


--
-- Name: m_request_detail_column_type_id_13481145_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_request_detail_column_type_id_13481145_like ON public.m_request_detail USING btree (column_type_id varchar_pattern_ops);


--
-- Name: m_request_detail_parent_column_id_11b6cbe9; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_request_detail_parent_column_id_11b6cbe9 ON public.m_request_detail USING btree (parent_column_id);


--
-- Name: m_request_detail_parent_column_id_11b6cbe9_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_request_detail_parent_column_id_11b6cbe9_like ON public.m_request_detail USING btree (parent_column_id varchar_pattern_ops);


--
-- Name: m_request_detail_request_column_id_a9909e8d_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_request_detail_request_column_id_a9909e8d_like ON public.m_request_detail USING btree (request_column_id varchar_pattern_ops);


--
-- Name: m_request_status_status_id_b88e49fa_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_request_status_status_id_b88e49fa_like ON public.m_request_status USING btree (status_id varchar_pattern_ops);


--
-- Name: m_segment_segment_cd_75427e7d_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX m_segment_segment_cd_75427e7d_like ON public.m_segment USING btree (segment_id varchar_pattern_ops);


--
-- Name: mm_approval_route_approval_post_id_f53fdd68; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX mm_approval_route_approval_post_id_f53fdd68 ON public.mm_approval_route USING btree (approval_post_id);


--
-- Name: mm_approval_route_approval_post_id_f53fdd68_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX mm_approval_route_approval_post_id_f53fdd68_like ON public.mm_approval_route USING btree (approval_post_id varchar_pattern_ops);


--
-- Name: mm_approval_route_approval_type_id_a7bce788; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX mm_approval_route_approval_type_id_a7bce788 ON public.mm_approval_route USING btree (approval_type_id);


--
-- Name: mm_approval_route_approval_type_id_a7bce788_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX mm_approval_route_approval_type_id_a7bce788_like ON public.mm_approval_route USING btree (approval_type_id varchar_pattern_ops);


--
-- Name: mm_approval_route_department_id_eef96e0d; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX mm_approval_route_department_id_eef96e0d ON public.mm_approval_route USING btree (department_id);


--
-- Name: mm_approval_route_department_id_eef96e0d_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX mm_approval_route_department_id_eef96e0d_like ON public.mm_approval_route USING btree (department_id varchar_pattern_ops);


--
-- Name: mm_approval_route_division_id_488626e2; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX mm_approval_route_division_id_488626e2 ON public.mm_approval_route USING btree (division_id);


--
-- Name: mm_approval_route_division_id_488626e2_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX mm_approval_route_division_id_488626e2_like ON public.mm_approval_route USING btree (division_id varchar_pattern_ops);


--
-- Name: mm_approval_route_emp_id_f2e0b3fe; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX mm_approval_route_emp_id_f2e0b3fe ON public.mm_approval_route USING btree (emp_id);


--
-- Name: mm_approval_route_segment_id_c57491ad; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX mm_approval_route_segment_id_c57491ad ON public.mm_approval_route USING btree (segment_id);


--
-- Name: mm_approval_route_segment_id_c57491ad_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX mm_approval_route_segment_id_c57491ad_like ON public.mm_approval_route USING btree (segment_id varchar_pattern_ops);


--
-- Name: mm_approval_type_approval_class_id_2a9c16a1; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX mm_approval_type_approval_class_id_2a9c16a1 ON public.mm_approval_type USING btree (approval_class_id);


--
-- Name: mm_approval_type_approval_class_id_2a9c16a1_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX mm_approval_type_approval_class_id_2a9c16a1_like ON public.mm_approval_type USING btree (approval_class_id varchar_pattern_ops);


--
-- Name: mm_approval_type_approval_type_id_c4e9d805_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX mm_approval_type_approval_type_id_c4e9d805_like ON public.mm_approval_type USING btree (approval_type_id varchar_pattern_ops);


--
-- Name: mm_approval_type_division_id_f92f5eae; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX mm_approval_type_division_id_f92f5eae ON public.mm_approval_type USING btree (division_id);


--
-- Name: mm_approval_type_division_id_f92f5eae_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX mm_approval_type_division_id_f92f5eae_like ON public.mm_approval_type USING btree (division_id varchar_pattern_ops);


--
-- Name: mm_approval_type_segment_id_7f9c5308; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX mm_approval_type_segment_id_7f9c5308 ON public.mm_approval_type USING btree (segment_id);


--
-- Name: mm_approval_type_segment_id_7f9c5308_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX mm_approval_type_segment_id_7f9c5308_like ON public.mm_approval_type USING btree (segment_id varchar_pattern_ops);


--
-- Name: t_approval_route_approval_type_id_48479540; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_approval_type_id_48479540 ON public.t_approval_route USING btree (approval_type_id);


--
-- Name: t_approval_route_approval_type_id_48479540_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_approval_type_id_48479540_like ON public.t_approval_route USING btree (approval_type_id varchar_pattern_ops);


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

CREATE INDEX t_approval_route_detail_approval_emp_cd_id_c690a825 ON public.t_approval_route_detail USING btree (approval_emp_id);


--
-- Name: t_approval_route_detail_approval_post_cd_id_e91b1b51; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_detail_approval_post_cd_id_e91b1b51 ON public.t_approval_route_detail USING btree (approval_post_id);


--
-- Name: t_approval_route_detail_approval_post_cd_id_e91b1b51_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_detail_approval_post_cd_id_e91b1b51_like ON public.t_approval_route_detail USING btree (approval_post_id varchar_pattern_ops);


--
-- Name: t_approval_route_detail_approval_route_id_id_340dda9e; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_detail_approval_route_id_id_340dda9e ON public.t_approval_route_detail USING btree (approval_route_id);


--
-- Name: t_approval_route_detail_approval_status_id_ead12d7a; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_detail_approval_status_id_ead12d7a ON public.t_approval_route_detail USING btree (approval_status_id);


--
-- Name: t_approval_route_detail_approval_status_id_ead12d7a_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_detail_approval_status_id_ead12d7a_like ON public.t_approval_route_detail USING btree (approval_status_id varchar_pattern_ops);


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
-- Name: t_approval_route_request_id_524eafc6; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_request_id_524eafc6 ON public.t_approval_route USING btree (request_id);


--
-- Name: t_approval_route_segment_id_65a5c02f; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_segment_id_65a5c02f ON public.t_approval_route USING btree (segment_id);


--
-- Name: t_approval_route_segment_id_65a5c02f_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_approval_route_segment_id_65a5c02f_like ON public.t_approval_route USING btree (segment_id varchar_pattern_ops);


--
-- Name: t_notification_record_emp_id_a7f24d32; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_notification_record_emp_id_a7f24d32 ON public.t_notification_record USING btree (emp_id);


--
-- Name: t_notification_record_notification_type_id_1ea1f225; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_notification_record_notification_type_id_1ea1f225 ON public.t_notification_record USING btree (notification_type_id);


--
-- Name: t_notification_record_notification_type_id_1ea1f225_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_notification_record_notification_type_id_1ea1f225_like ON public.t_notification_record USING btree (notification_type_id varchar_pattern_ops);


--
-- Name: t_notification_record_request_id_9cbb0ffd; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_notification_record_request_id_9cbb0ffd ON public.t_notification_record USING btree (request_id);


--
-- Name: t_notifier_notify_emp_id_49e83404; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_notifier_notify_emp_id_49e83404 ON public.t_notifier USING btree (notify_emp_id);


--
-- Name: t_notifier_request_id_063f7cee; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_notifier_request_id_063f7cee ON public.t_notifier USING btree (request_id);


--
-- Name: t_request_approval_type_id_0c5c6523; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_request_approval_type_id_0c5c6523 ON public.t_request USING btree (approval_type_id);


--
-- Name: t_request_approval_type_id_0c5c6523_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_request_approval_type_id_0c5c6523_like ON public.t_request USING btree (approval_type_id varchar_pattern_ops);


--
-- Name: t_request_detail_hist_request_column_id_326255c9; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_request_detail_hist_request_column_id_326255c9 ON public.t_request_detail_hist USING btree (request_column_id);


--
-- Name: t_request_detail_hist_request_column_id_326255c9_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_request_detail_hist_request_column_id_326255c9_like ON public.t_request_detail_hist USING btree (request_column_id varchar_pattern_ops);


--
-- Name: t_request_detail_hist_request_id_5447b8b1; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_request_detail_hist_request_id_5447b8b1 ON public.t_request_detail_hist USING btree (request_id);


--
-- Name: t_request_detail_request_column_id_4d50586f; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_request_detail_request_column_id_4d50586f ON public.t_request_detail USING btree (request_column_id);


--
-- Name: t_request_detail_request_column_id_4d50586f_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_request_detail_request_column_id_4d50586f_like ON public.t_request_detail USING btree (request_column_id varchar_pattern_ops);


--
-- Name: t_request_detail_request_id_cb49d5d2; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_request_detail_request_id_cb49d5d2 ON public.t_request_detail USING btree (request_id);


--
-- Name: t_request_status_id_7484f8ec; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_request_status_id_7484f8ec ON public.t_request USING btree (status_id);


--
-- Name: t_request_status_id_7484f8ec_like; Type: INDEX; Schema: public; Owner: approval_user
--

CREATE INDEX t_request_status_id_7484f8ec_like ON public.t_request USING btree (status_id varchar_pattern_ops);


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
-- Name: m_choices m_choices_request_column_id_75744d4c_fk_m_request; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_choices
    ADD CONSTRAINT m_choices_request_column_id_75744d4c_fk_m_request FOREIGN KEY (request_column_id) REFERENCES public.m_request_detail(request_column_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: m_emp_affiliation m_emp_affiliation_business_unit_id_bf18a7b3_fk_m_busines; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_emp_affiliation
    ADD CONSTRAINT m_emp_affiliation_business_unit_id_bf18a7b3_fk_m_busines FOREIGN KEY (business_unit_id) REFERENCES public.m_business_unit(business_unit_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: m_emp_affiliation m_emp_affiliation_department_id_d607f3e3_fk_m_departm; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_emp_affiliation
    ADD CONSTRAINT m_emp_affiliation_department_id_d607f3e3_fk_m_departm FOREIGN KEY (department_id) REFERENCES public.m_department(department_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: m_emp_affiliation m_emp_affiliation_division_id_859848f6_fk_m_divisio; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_emp_affiliation
    ADD CONSTRAINT m_emp_affiliation_division_id_859848f6_fk_m_divisio FOREIGN KEY (division_id) REFERENCES public.m_division(division_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: m_emp_affiliation m_emp_affiliation_emp_id_7a1570bb_fk_m_emp_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_emp_affiliation
    ADD CONSTRAINT m_emp_affiliation_emp_id_7a1570bb_fk_m_emp_id FOREIGN KEY (emp_id) REFERENCES public.m_emp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: m_emp_affiliation m_emp_affiliation_segment_id_6fd06372_fk_m_segment_segment_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_emp_affiliation
    ADD CONSTRAINT m_emp_affiliation_segment_id_6fd06372_fk_m_segment_segment_id FOREIGN KEY (segment_id) REFERENCES public.m_segment(segment_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: m_property m_property_department_id_5b565865_fk_m_department_department_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_property
    ADD CONSTRAINT m_property_department_id_5b565865_fk_m_department_department_id FOREIGN KEY (department_id) REFERENCES public.m_department(department_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: m_property m_property_division_id_5dc9e504_fk_m_division_division_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_property
    ADD CONSTRAINT m_property_division_id_5dc9e504_fk_m_division_division_id FOREIGN KEY (division_id) REFERENCES public.m_division(division_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: m_property m_property_emp_id_375b22f6_fk_m_emp_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_property
    ADD CONSTRAINT m_property_emp_id_375b22f6_fk_m_emp_id FOREIGN KEY (emp_id) REFERENCES public.m_emp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: m_property m_property_segment_id_1ef3cda0_fk_m_segment_segment_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_property
    ADD CONSTRAINT m_property_segment_id_1ef3cda0_fk_m_segment_segment_id FOREIGN KEY (segment_id) REFERENCES public.m_segment(segment_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: m_request_detail m_request_detail_approval_type_id_c469b8c0_fk_mm_approv; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_request_detail
    ADD CONSTRAINT m_request_detail_approval_type_id_c469b8c0_fk_mm_approv FOREIGN KEY (approval_type_id) REFERENCES public.mm_approval_type(approval_type_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: m_request_detail m_request_detail_column_type_id_13481145_fk_m_column_; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_request_detail
    ADD CONSTRAINT m_request_detail_column_type_id_13481145_fk_m_column_ FOREIGN KEY (column_type_id) REFERENCES public.m_column_type(column_type_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: m_request_detail m_request_detail_parent_column_id_11b6cbe9_fk_m_request; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.m_request_detail
    ADD CONSTRAINT m_request_detail_parent_column_id_11b6cbe9_fk_m_request FOREIGN KEY (parent_column_id) REFERENCES public.m_request_detail(request_column_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mm_approval_route mm_approval_route_approval_post_id_f53fdd68_fk_m_approva; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.mm_approval_route
    ADD CONSTRAINT mm_approval_route_approval_post_id_f53fdd68_fk_m_approva FOREIGN KEY (approval_post_id) REFERENCES public.m_approval_post(approval_post_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mm_approval_route mm_approval_route_approval_type_id_a7bce788_fk_mm_approv; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.mm_approval_route
    ADD CONSTRAINT mm_approval_route_approval_type_id_a7bce788_fk_mm_approv FOREIGN KEY (approval_type_id) REFERENCES public.mm_approval_type(approval_type_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mm_approval_route mm_approval_route_department_id_eef96e0d_fk_m_departm; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.mm_approval_route
    ADD CONSTRAINT mm_approval_route_department_id_eef96e0d_fk_m_departm FOREIGN KEY (department_id) REFERENCES public.m_department(department_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mm_approval_route mm_approval_route_division_id_488626e2_fk_m_divisio; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.mm_approval_route
    ADD CONSTRAINT mm_approval_route_division_id_488626e2_fk_m_divisio FOREIGN KEY (division_id) REFERENCES public.m_division(division_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mm_approval_route mm_approval_route_emp_id_f2e0b3fe_fk_m_emp_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.mm_approval_route
    ADD CONSTRAINT mm_approval_route_emp_id_f2e0b3fe_fk_m_emp_id FOREIGN KEY (emp_id) REFERENCES public.m_emp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mm_approval_route mm_approval_route_segment_id_c57491ad_fk_m_segment_segment_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.mm_approval_route
    ADD CONSTRAINT mm_approval_route_segment_id_c57491ad_fk_m_segment_segment_id FOREIGN KEY (segment_id) REFERENCES public.m_segment(segment_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mm_approval_type mm_approval_type_approval_class_id_2a9c16a1_fk_m_approva; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.mm_approval_type
    ADD CONSTRAINT mm_approval_type_approval_class_id_2a9c16a1_fk_m_approva FOREIGN KEY (approval_class_id) REFERENCES public.m_approval_class(approval_class_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mm_approval_type mm_approval_type_division_id_f92f5eae_fk_m_division_division_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.mm_approval_type
    ADD CONSTRAINT mm_approval_type_division_id_f92f5eae_fk_m_division_division_id FOREIGN KEY (division_id) REFERENCES public.m_division(division_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mm_approval_type mm_approval_type_segment_id_7f9c5308_fk_m_segment_segment_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.mm_approval_type
    ADD CONSTRAINT mm_approval_type_segment_id_7f9c5308_fk_m_segment_segment_id FOREIGN KEY (segment_id) REFERENCES public.m_segment(segment_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_approval_route t_approval_route_approval_type_id_48479540_fk_mm_approv; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route
    ADD CONSTRAINT t_approval_route_approval_type_id_48479540_fk_mm_approv FOREIGN KEY (approval_type_id) REFERENCES public.mm_approval_type(approval_type_id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: t_approval_route_comment t_approval_route_com_request_id_8cbe311f_fk_t_request; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route_comment
    ADD CONSTRAINT t_approval_route_com_request_id_8cbe311f_fk_t_request FOREIGN KEY (request_id) REFERENCES public.t_request(request_id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: t_approval_route_detail t_approval_route_det_approval_post_id_fa3a8946_fk_m_approva; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route_detail
    ADD CONSTRAINT t_approval_route_det_approval_post_id_fa3a8946_fk_m_approva FOREIGN KEY (approval_post_id) REFERENCES public.m_approval_post(approval_post_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_approval_route_detail t_approval_route_det_approval_route_id_8d58ac80_fk_t_approva; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route_detail
    ADD CONSTRAINT t_approval_route_det_approval_route_id_8d58ac80_fk_t_approva FOREIGN KEY (approval_route_id) REFERENCES public.t_approval_route(approval_route_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_approval_route_detail t_approval_route_det_approval_status_id_ead12d7a_fk_m_approva; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route_detail
    ADD CONSTRAINT t_approval_route_det_approval_status_id_ead12d7a_fk_m_approva FOREIGN KEY (approval_status_id) REFERENCES public.m_approval_status(approval_status_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_approval_route_detail t_approval_route_detail_approval_emp_id_da02f9c3_fk_m_emp_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route_detail
    ADD CONSTRAINT t_approval_route_detail_approval_emp_id_da02f9c3_fk_m_emp_id FOREIGN KEY (approval_emp_id) REFERENCES public.m_emp(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: t_approval_route t_approval_route_request_id_524eafc6_fk_t_request_request_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route
    ADD CONSTRAINT t_approval_route_request_id_524eafc6_fk_t_request_request_id FOREIGN KEY (request_id) REFERENCES public.t_request(request_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_approval_route t_approval_route_segment_id_65a5c02f_fk_m_segment_segment_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_approval_route
    ADD CONSTRAINT t_approval_route_segment_id_65a5c02f_fk_m_segment_segment_id FOREIGN KEY (segment_id) REFERENCES public.m_segment(segment_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_notification_record t_notification_recor_notification_type_id_1ea1f225_fk_m_notific; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_notification_record
    ADD CONSTRAINT t_notification_recor_notification_type_id_1ea1f225_fk_m_notific FOREIGN KEY (notification_type_id) REFERENCES public.m_notification_type(notification_type_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_notification_record t_notification_recor_request_id_9cbb0ffd_fk_t_request; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_notification_record
    ADD CONSTRAINT t_notification_recor_request_id_9cbb0ffd_fk_t_request FOREIGN KEY (request_id) REFERENCES public.t_request(request_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_notification_record t_notification_record_emp_id_a7f24d32_fk_m_emp_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_notification_record
    ADD CONSTRAINT t_notification_record_emp_id_a7f24d32_fk_m_emp_id FOREIGN KEY (emp_id) REFERENCES public.m_emp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_notifier t_notifier_notify_emp_id_49e83404_fk_m_emp_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_notifier
    ADD CONSTRAINT t_notifier_notify_emp_id_49e83404_fk_m_emp_id FOREIGN KEY (notify_emp_id) REFERENCES public.m_emp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_notifier t_notifier_request_id_063f7cee_fk_t_request_request_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_notifier
    ADD CONSTRAINT t_notifier_request_id_063f7cee_fk_t_request_request_id FOREIGN KEY (request_id) REFERENCES public.t_request(request_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_request t_request_approval_type_id_0c5c6523_fk_mm_approv; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_request
    ADD CONSTRAINT t_request_approval_type_id_0c5c6523_fk_mm_approv FOREIGN KEY (approval_type_id) REFERENCES public.mm_approval_type(approval_type_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_request_detail_hist t_request_detail_his_request_column_id_326255c9_fk_m_request; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_request_detail_hist
    ADD CONSTRAINT t_request_detail_his_request_column_id_326255c9_fk_m_request FOREIGN KEY (request_column_id) REFERENCES public.m_request_detail(request_column_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_request_detail_hist t_request_detail_his_request_id_5447b8b1_fk_t_request; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_request_detail_hist
    ADD CONSTRAINT t_request_detail_his_request_id_5447b8b1_fk_t_request FOREIGN KEY (request_id) REFERENCES public.t_request(request_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_request_detail t_request_detail_request_column_id_4d50586f_fk_m_request; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_request_detail
    ADD CONSTRAINT t_request_detail_request_column_id_4d50586f_fk_m_request FOREIGN KEY (request_column_id) REFERENCES public.m_request_detail(request_column_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_request_detail t_request_detail_request_id_cb49d5d2_fk_t_request_request_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_request_detail
    ADD CONSTRAINT t_request_detail_request_id_cb49d5d2_fk_t_request_request_id FOREIGN KEY (request_id) REFERENCES public.t_request(request_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: t_request t_request_status_id_baae0a5b_fk_m_request_status_status_id; Type: FK CONSTRAINT; Schema: public; Owner: approval_user
--

ALTER TABLE ONLY public.t_request
    ADD CONSTRAINT t_request_status_id_baae0a5b_fk_m_request_status_status_id FOREIGN KEY (status_id) REFERENCES public.m_request_status(status_id) DEFERRABLE INITIALLY DEFERRED;


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

