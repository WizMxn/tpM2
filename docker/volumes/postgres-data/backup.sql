--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0 (Debian 17.0-1.pgdg120+1)
-- Dumped by pg_dump version 17.0 (Debian 17.0-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO keycloak;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO keycloak;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO keycloak;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO keycloak;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO keycloak;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO keycloak;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO keycloak;

--
-- Name: client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO keycloak;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.client_attributes OWNER TO keycloak;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO keycloak;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO keycloak;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO keycloak;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO keycloak;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO keycloak;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO keycloak;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO keycloak;

--
-- Name: component; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO keycloak;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.component_config OWNER TO keycloak;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO keycloak;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO keycloak;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO keycloak;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO keycloak;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO keycloak;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255),
    details_json_long_value text
);


ALTER TABLE public.event_entity OWNER TO keycloak;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024),
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.fed_user_attribute OWNER TO keycloak;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO keycloak;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO keycloak;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO keycloak;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO keycloak;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO keycloak;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO keycloak;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO keycloak;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO keycloak;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO keycloak;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO keycloak;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL,
    organization_id character varying(255),
    hide_on_login boolean DEFAULT false
);


ALTER TABLE public.identity_provider OWNER TO keycloak;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO keycloak;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO keycloak;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO keycloak;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36),
    type integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.keycloak_group OWNER TO keycloak;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO keycloak;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO keycloak;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL,
    version integer DEFAULT 0
);


ALTER TABLE public.offline_client_session OWNER TO keycloak;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL,
    broker_session_id character varying(1024),
    version integer DEFAULT 0
);


ALTER TABLE public.offline_user_session OWNER TO keycloak;

--
-- Name: org; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.org (
    id character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    realm_id character varying(255) NOT NULL,
    group_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(4000),
    alias character varying(255) NOT NULL,
    redirect_url character varying(2048)
);


ALTER TABLE public.org OWNER TO keycloak;

--
-- Name: org_domain; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.org_domain (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    verified boolean NOT NULL,
    org_id character varying(255) NOT NULL
);


ALTER TABLE public.org_domain OWNER TO keycloak;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO keycloak;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO keycloak;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO keycloak;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO keycloak;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO keycloak;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO keycloak;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO keycloak;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO keycloak;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO keycloak;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO keycloak;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO keycloak;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO keycloak;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO keycloak;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO keycloak;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO keycloak;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO keycloak;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO keycloak;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO keycloak;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO keycloak;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO keycloak;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO keycloak;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO keycloak;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO keycloak;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO keycloak;

--
-- Name: revoked_token; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.revoked_token (
    id character varying(255) NOT NULL,
    expire bigint NOT NULL
);


ALTER TABLE public.revoked_token OWNER TO keycloak;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO keycloak;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO keycloak;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO keycloak;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.user_attribute OWNER TO keycloak;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO keycloak;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO keycloak;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO keycloak;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO keycloak;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO keycloak;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO keycloak;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO keycloak;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL,
    membership_type character varying(255) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO keycloak;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO keycloak;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO keycloak;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO keycloak;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO keycloak;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
e2edc536-2c6e-44ed-9213-e0b1dcaf22de	\N	auth-cookie	7df03360-60a3-49d8-8fc4-f7cf9b739084	920fa4ea-5b15-49f4-9cac-da322bc4891f	2	10	f	\N	\N
485060c2-4f25-4eec-b635-0535c3f78089	\N	auth-spnego	7df03360-60a3-49d8-8fc4-f7cf9b739084	920fa4ea-5b15-49f4-9cac-da322bc4891f	3	20	f	\N	\N
b26626f9-2145-4e92-9750-dfe585adb0b3	\N	identity-provider-redirector	7df03360-60a3-49d8-8fc4-f7cf9b739084	920fa4ea-5b15-49f4-9cac-da322bc4891f	2	25	f	\N	\N
06e0b102-90d1-4605-be46-4e96ead7bfa8	\N	\N	7df03360-60a3-49d8-8fc4-f7cf9b739084	920fa4ea-5b15-49f4-9cac-da322bc4891f	2	30	t	faa6b251-79df-4874-b90f-bfb38c865e2d	\N
df89d528-1c98-4828-982a-363c196a9bc9	\N	auth-username-password-form	7df03360-60a3-49d8-8fc4-f7cf9b739084	faa6b251-79df-4874-b90f-bfb38c865e2d	0	10	f	\N	\N
c998e3e0-b895-40a4-9234-37a6d9afba92	\N	\N	7df03360-60a3-49d8-8fc4-f7cf9b739084	faa6b251-79df-4874-b90f-bfb38c865e2d	1	20	t	73ec958a-1276-4bb1-aa40-bf5ecde99caa	\N
4b34d21e-6392-400f-b5fa-2b95afa28b22	\N	conditional-user-configured	7df03360-60a3-49d8-8fc4-f7cf9b739084	73ec958a-1276-4bb1-aa40-bf5ecde99caa	0	10	f	\N	\N
612680ad-9c51-41cf-8e99-272e19812c5c	\N	auth-otp-form	7df03360-60a3-49d8-8fc4-f7cf9b739084	73ec958a-1276-4bb1-aa40-bf5ecde99caa	0	20	f	\N	\N
6db6aaf7-f19f-40ed-b539-1925f9013c1c	\N	direct-grant-validate-username	7df03360-60a3-49d8-8fc4-f7cf9b739084	42d38bfa-bc8f-4587-8b5c-4bfb56f389d1	0	10	f	\N	\N
e7a6052b-d581-4916-9a39-29276b2f71cf	\N	direct-grant-validate-password	7df03360-60a3-49d8-8fc4-f7cf9b739084	42d38bfa-bc8f-4587-8b5c-4bfb56f389d1	0	20	f	\N	\N
20c3494b-f370-4e96-8dbd-4e0eec0d2d79	\N	\N	7df03360-60a3-49d8-8fc4-f7cf9b739084	42d38bfa-bc8f-4587-8b5c-4bfb56f389d1	1	30	t	d8db911e-2d8f-4979-a7d8-cbb8d4a00c06	\N
e2e3e9cf-eb22-4ae2-ac73-d45844d28750	\N	conditional-user-configured	7df03360-60a3-49d8-8fc4-f7cf9b739084	d8db911e-2d8f-4979-a7d8-cbb8d4a00c06	0	10	f	\N	\N
20ad277b-bed7-42aa-89de-37b38d825348	\N	direct-grant-validate-otp	7df03360-60a3-49d8-8fc4-f7cf9b739084	d8db911e-2d8f-4979-a7d8-cbb8d4a00c06	0	20	f	\N	\N
e734def0-8d39-45de-ae26-055bbacb6dfd	\N	registration-page-form	7df03360-60a3-49d8-8fc4-f7cf9b739084	8d812cde-5d38-49bb-8431-f3f501a6da72	0	10	t	156edc9f-c00b-4a80-8115-0b27074cf94d	\N
1e15a938-e7e9-4dae-a6d0-5569b97c2c3d	\N	registration-user-creation	7df03360-60a3-49d8-8fc4-f7cf9b739084	156edc9f-c00b-4a80-8115-0b27074cf94d	0	20	f	\N	\N
a346e12c-27e6-4ced-843e-5ed3207452ac	\N	registration-password-action	7df03360-60a3-49d8-8fc4-f7cf9b739084	156edc9f-c00b-4a80-8115-0b27074cf94d	0	50	f	\N	\N
69723ea8-8586-4a7f-91c1-41fd3403dfe0	\N	registration-recaptcha-action	7df03360-60a3-49d8-8fc4-f7cf9b739084	156edc9f-c00b-4a80-8115-0b27074cf94d	3	60	f	\N	\N
f8ab1549-abdb-4636-a2f3-bedfeaabb3b7	\N	registration-terms-and-conditions	7df03360-60a3-49d8-8fc4-f7cf9b739084	156edc9f-c00b-4a80-8115-0b27074cf94d	3	70	f	\N	\N
c266c2f5-f986-4fd4-960b-b603867a8e32	\N	reset-credentials-choose-user	7df03360-60a3-49d8-8fc4-f7cf9b739084	4624c5c3-e95b-453c-bba5-caf569b77bbc	0	10	f	\N	\N
503baa90-c663-4b68-8dd0-05dbf495e9d9	\N	reset-credential-email	7df03360-60a3-49d8-8fc4-f7cf9b739084	4624c5c3-e95b-453c-bba5-caf569b77bbc	0	20	f	\N	\N
a541b05a-b6ba-41ae-afd7-fe68f715a46e	\N	reset-password	7df03360-60a3-49d8-8fc4-f7cf9b739084	4624c5c3-e95b-453c-bba5-caf569b77bbc	0	30	f	\N	\N
646a21ab-b1e0-4078-9c6c-25c1582422d6	\N	\N	7df03360-60a3-49d8-8fc4-f7cf9b739084	4624c5c3-e95b-453c-bba5-caf569b77bbc	1	40	t	9aa42c56-d4b5-4c1a-953b-e5a7797a6ddd	\N
8ab2b7fd-f3b4-49b9-ad16-6cd453679ae3	\N	conditional-user-configured	7df03360-60a3-49d8-8fc4-f7cf9b739084	9aa42c56-d4b5-4c1a-953b-e5a7797a6ddd	0	10	f	\N	\N
ccf0f8b5-5878-4d91-a0ea-eb0571a43bc0	\N	reset-otp	7df03360-60a3-49d8-8fc4-f7cf9b739084	9aa42c56-d4b5-4c1a-953b-e5a7797a6ddd	0	20	f	\N	\N
7f7db81c-5573-4c3b-b3a6-198babb3cfb4	\N	client-secret	7df03360-60a3-49d8-8fc4-f7cf9b739084	94414d8c-0d1a-493b-ba38-2d6198070865	2	10	f	\N	\N
a45507b2-08bf-4514-8c37-db147d0178b6	\N	client-jwt	7df03360-60a3-49d8-8fc4-f7cf9b739084	94414d8c-0d1a-493b-ba38-2d6198070865	2	20	f	\N	\N
c0a06501-af96-4e6e-95ba-a2a4853557ca	\N	client-secret-jwt	7df03360-60a3-49d8-8fc4-f7cf9b739084	94414d8c-0d1a-493b-ba38-2d6198070865	2	30	f	\N	\N
f1e5b247-f2d2-49c4-9f00-fe94c4ba824b	\N	client-x509	7df03360-60a3-49d8-8fc4-f7cf9b739084	94414d8c-0d1a-493b-ba38-2d6198070865	2	40	f	\N	\N
afcca650-f7f0-4978-bb1b-b8e37f4cbf06	\N	idp-review-profile	7df03360-60a3-49d8-8fc4-f7cf9b739084	ff05994d-d11c-4699-8edb-8cf350580481	0	10	f	\N	1338c6cb-6ada-4eca-9129-236dac4bd115
3fbb9d6e-e46f-4527-a1af-c1c3fc1ecaad	\N	\N	7df03360-60a3-49d8-8fc4-f7cf9b739084	ff05994d-d11c-4699-8edb-8cf350580481	0	20	t	872604af-c830-4844-bedd-af4c9ad5121f	\N
c87ebaf5-37e8-4527-941f-b80d1e2b973a	\N	idp-create-user-if-unique	7df03360-60a3-49d8-8fc4-f7cf9b739084	872604af-c830-4844-bedd-af4c9ad5121f	2	10	f	\N	d7d6006f-2d99-4e47-98ac-8a4258c51a46
72672e77-7317-4dc9-ab42-c6c2f1ce74c5	\N	\N	7df03360-60a3-49d8-8fc4-f7cf9b739084	872604af-c830-4844-bedd-af4c9ad5121f	2	20	t	0442baa1-2b1f-42ee-9037-9f562da73cad	\N
a9916884-466a-43fc-b307-a98192de6d4d	\N	idp-confirm-link	7df03360-60a3-49d8-8fc4-f7cf9b739084	0442baa1-2b1f-42ee-9037-9f562da73cad	0	10	f	\N	\N
8c57ff3f-f352-46cd-bb0b-ea4511471a19	\N	\N	7df03360-60a3-49d8-8fc4-f7cf9b739084	0442baa1-2b1f-42ee-9037-9f562da73cad	0	20	t	5ea74633-1cb7-4d21-9f8b-3bef0f33f2d3	\N
05e9859f-ddcf-4e3f-b632-bcfd692789b9	\N	idp-email-verification	7df03360-60a3-49d8-8fc4-f7cf9b739084	5ea74633-1cb7-4d21-9f8b-3bef0f33f2d3	2	10	f	\N	\N
ea0ee957-2dfc-4db6-8592-85bb0371a890	\N	\N	7df03360-60a3-49d8-8fc4-f7cf9b739084	5ea74633-1cb7-4d21-9f8b-3bef0f33f2d3	2	20	t	407d8078-eae1-48a9-a94c-f17c86fd3fb4	\N
c3f88b45-fdde-4b68-98b1-b07ea4969de6	\N	idp-username-password-form	7df03360-60a3-49d8-8fc4-f7cf9b739084	407d8078-eae1-48a9-a94c-f17c86fd3fb4	0	10	f	\N	\N
584c33a6-18ab-4fa6-99e5-c0994f4c13ae	\N	\N	7df03360-60a3-49d8-8fc4-f7cf9b739084	407d8078-eae1-48a9-a94c-f17c86fd3fb4	1	20	t	2faa57c6-87d7-4afe-97c1-bbfc51f2e09f	\N
1585c9c3-b72f-477a-802a-f55f0d282d10	\N	conditional-user-configured	7df03360-60a3-49d8-8fc4-f7cf9b739084	2faa57c6-87d7-4afe-97c1-bbfc51f2e09f	0	10	f	\N	\N
317b59e1-c6ee-493c-b5bc-5efd4373afa4	\N	auth-otp-form	7df03360-60a3-49d8-8fc4-f7cf9b739084	2faa57c6-87d7-4afe-97c1-bbfc51f2e09f	0	20	f	\N	\N
cee5a87e-7e53-4123-a85f-608a98a95cbe	\N	http-basic-authenticator	7df03360-60a3-49d8-8fc4-f7cf9b739084	4204a992-e3ea-4b81-93c5-4787bc67bb51	0	10	f	\N	\N
b8f1f59a-d5c9-44fc-9d1d-4d4327c1aef4	\N	docker-http-basic-authenticator	7df03360-60a3-49d8-8fc4-f7cf9b739084	ccad98c4-7ce0-4567-968b-c0de02d1dde4	0	10	f	\N	\N
548daefe-95d4-4df3-953a-7396d0193eb7	\N	idp-email-verification	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	ef63d119-440a-4fcd-9fa6-3affe916d311	2	10	f	\N	\N
cdaa001e-e773-4958-a772-c624de8ec3e6	\N	\N	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	ef63d119-440a-4fcd-9fa6-3affe916d311	2	20	t	221e12c5-47c0-4f68-9c20-36005957d185	\N
b039214b-8238-4a17-8475-75ceb02b7a4c	\N	conditional-user-configured	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	80ba01a1-5ea3-4b75-8d44-3b5145131ce7	0	10	f	\N	\N
b9bba3f6-0355-43f4-9030-e3d1a18ae0d6	\N	auth-otp-form	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	80ba01a1-5ea3-4b75-8d44-3b5145131ce7	0	20	f	\N	\N
b719e850-c58b-4057-b4b2-55f05ed5cc09	\N	conditional-user-configured	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	c1a7dd92-aaba-4c51-ad12-9e67e5494d7a	0	10	f	\N	\N
31cd3aee-9007-474b-85d0-bbd184f98f2c	\N	organization	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	c1a7dd92-aaba-4c51-ad12-9e67e5494d7a	2	20	f	\N	\N
d25e4cc3-4240-43a9-b392-dbb2061eb61c	\N	conditional-user-configured	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	19b52da5-ada0-4de9-8c5a-7808c684e791	0	10	f	\N	\N
7e1f3e77-1f33-4652-99c7-aded707bcd56	\N	direct-grant-validate-otp	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	19b52da5-ada0-4de9-8c5a-7808c684e791	0	20	f	\N	\N
1715456e-f20a-4acf-a500-1f03747135c3	\N	conditional-user-configured	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	c4bf8289-b7a5-4183-8f9d-aae99d311f2e	0	10	f	\N	\N
d84f6f68-a64d-43e7-9adc-9b972e4e8059	\N	idp-add-organization-member	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	c4bf8289-b7a5-4183-8f9d-aae99d311f2e	0	20	f	\N	\N
8d9b520c-1c02-4fa0-9d16-8a4d4cbce3a8	\N	conditional-user-configured	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	893ba122-d9f9-4d23-a220-85d182077eec	0	10	f	\N	\N
12d5630e-93dd-45bc-bf9d-caa31cb10d97	\N	auth-otp-form	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	893ba122-d9f9-4d23-a220-85d182077eec	0	20	f	\N	\N
13cbde62-0c07-4c9e-ba19-43b7c0904ab0	\N	idp-confirm-link	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	fefd580f-3684-4dc9-9b2a-ccd1686a921d	0	10	f	\N	\N
24bfd568-05db-4639-8af1-99d313e8aca1	\N	\N	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	fefd580f-3684-4dc9-9b2a-ccd1686a921d	0	20	t	ef63d119-440a-4fcd-9fa6-3affe916d311	\N
45cca81f-f987-4c1f-bc0a-760bf3591c2b	\N	\N	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	1cff76c8-3cf7-4485-bd6e-764eab466c78	1	10	t	c1a7dd92-aaba-4c51-ad12-9e67e5494d7a	\N
ba70a6d2-49e4-42f4-988b-f270666d1616	\N	conditional-user-configured	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	848926d9-214d-4cc7-ba3a-2ba31faddb0f	0	10	f	\N	\N
6d5ebd67-2a9b-41b4-92a1-f8f82084d0f7	\N	reset-otp	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	848926d9-214d-4cc7-ba3a-2ba31faddb0f	0	20	f	\N	\N
37984262-4793-4530-9f87-11b742ae0193	\N	idp-create-user-if-unique	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	290b2335-0bf8-456d-98ad-7f14344ffd1e	2	10	f	\N	d4ce9fef-b8d5-4a49-8c35-e6d95874bbde
7b0b38b4-fe2a-48eb-981c-9e9aff60740d	\N	\N	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	290b2335-0bf8-456d-98ad-7f14344ffd1e	2	20	t	fefd580f-3684-4dc9-9b2a-ccd1686a921d	\N
d9af97f8-be59-4753-935a-1c51dd957854	\N	idp-username-password-form	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	221e12c5-47c0-4f68-9c20-36005957d185	0	10	f	\N	\N
fc42b2f3-8062-413a-bbee-de22314d3186	\N	\N	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	221e12c5-47c0-4f68-9c20-36005957d185	1	20	t	893ba122-d9f9-4d23-a220-85d182077eec	\N
3f498629-1d31-4efc-a505-c5269b80320a	\N	auth-cookie	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	9f084199-d6f7-4ee8-9111-37d9be0b6446	2	10	f	\N	\N
1051a52b-c133-4f10-89f8-aa84f6deb2f2	\N	auth-spnego	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	9f084199-d6f7-4ee8-9111-37d9be0b6446	3	20	f	\N	\N
58d0d919-c2ac-4bac-b0a7-ee47b4110cf3	\N	identity-provider-redirector	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	9f084199-d6f7-4ee8-9111-37d9be0b6446	2	25	f	\N	\N
738e903a-a3cd-47e3-bbd2-8b3d0e3682db	\N	\N	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	9f084199-d6f7-4ee8-9111-37d9be0b6446	2	26	t	1cff76c8-3cf7-4485-bd6e-764eab466c78	\N
4d9969dd-8c40-4151-bc01-546d7c1075d8	\N	\N	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	9f084199-d6f7-4ee8-9111-37d9be0b6446	2	30	t	d40a062d-8123-499d-a2b0-8cc10b5c8132	\N
26517667-40fa-47dd-a9d2-0bc63dc3c5c7	\N	client-secret	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	df88470c-4746-4043-bc4b-a572cb1b0eca	2	10	f	\N	\N
6f454454-7cd7-4ec2-8ddd-a47e7c3aa82d	\N	client-jwt	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	df88470c-4746-4043-bc4b-a572cb1b0eca	2	20	f	\N	\N
8aaeef47-866a-49c9-aa7b-c6ac38c62cff	\N	client-secret-jwt	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	df88470c-4746-4043-bc4b-a572cb1b0eca	2	30	f	\N	\N
e2c47912-f3a1-4c79-873f-d978e3867e3e	\N	client-x509	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	df88470c-4746-4043-bc4b-a572cb1b0eca	2	40	f	\N	\N
0d3603e1-b5cb-4733-aac8-6f16b05372b5	\N	direct-grant-validate-username	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	0d6bbefa-a98c-428e-ba13-a03d692a29fb	0	10	f	\N	\N
e00f9e08-aede-4227-a072-9db667934357	\N	direct-grant-validate-password	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	0d6bbefa-a98c-428e-ba13-a03d692a29fb	0	20	f	\N	\N
ae3a25cf-9b4e-4f79-ae2c-ea724073b8f3	\N	\N	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	0d6bbefa-a98c-428e-ba13-a03d692a29fb	1	30	t	19b52da5-ada0-4de9-8c5a-7808c684e791	\N
b7e2ec06-ea58-4b40-83f7-9d0ad0cca558	\N	docker-http-basic-authenticator	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	0cfef825-093c-4a5a-bff9-28da27b8daf7	0	10	f	\N	\N
eebfb244-348f-4232-8132-b87dc2b75cee	\N	idp-review-profile	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	6db2fca1-f135-49ba-a688-7ff6a7ce1db6	0	10	f	\N	bab17018-afb9-4260-bbf9-25727c51f38d
9151ca24-ef23-40c2-823f-5efe1a67b37a	\N	\N	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	6db2fca1-f135-49ba-a688-7ff6a7ce1db6	0	20	t	290b2335-0bf8-456d-98ad-7f14344ffd1e	\N
877f8237-a9d0-477d-bb38-c4bc3b59e448	\N	\N	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	6db2fca1-f135-49ba-a688-7ff6a7ce1db6	1	50	t	c4bf8289-b7a5-4183-8f9d-aae99d311f2e	\N
0940a4df-dba8-4f3e-8970-38ac1de14d89	\N	auth-username-password-form	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	d40a062d-8123-499d-a2b0-8cc10b5c8132	0	10	f	\N	\N
7baa1f74-acb1-4ad7-827c-da7ebb29d78b	\N	\N	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	d40a062d-8123-499d-a2b0-8cc10b5c8132	1	20	t	80ba01a1-5ea3-4b75-8d44-3b5145131ce7	\N
5c27ac10-cdb6-44fc-97da-43d8e79cf7f8	\N	registration-page-form	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	3c29de44-590d-4d2f-b7ed-572cc96c6569	0	10	t	c8881c9c-b38d-4290-9c5e-81267f16f889	\N
2444c3b1-3f1b-44ca-9408-1b68b40c8b24	\N	registration-user-creation	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	c8881c9c-b38d-4290-9c5e-81267f16f889	0	20	f	\N	\N
95500508-6d94-4558-b5d0-94703972476a	\N	registration-password-action	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	c8881c9c-b38d-4290-9c5e-81267f16f889	0	50	f	\N	\N
98c42e7c-ff33-4275-bff1-1ad395087c72	\N	registration-recaptcha-action	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	c8881c9c-b38d-4290-9c5e-81267f16f889	3	60	f	\N	\N
c1ff8c03-afc7-4d11-846b-8701a994c5e2	\N	registration-terms-and-conditions	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	c8881c9c-b38d-4290-9c5e-81267f16f889	3	70	f	\N	\N
a2608d80-cf10-4981-8a0b-6f7a84e25ff9	\N	reset-credentials-choose-user	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	bbc3d78a-97ec-4856-a678-025cc8918a3a	0	10	f	\N	\N
b1cfbdd2-f4d6-457f-a47f-49ca2bcd9a34	\N	reset-credential-email	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	bbc3d78a-97ec-4856-a678-025cc8918a3a	0	20	f	\N	\N
535c123d-9ec2-4590-8aeb-a2ec9980109b	\N	reset-password	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	bbc3d78a-97ec-4856-a678-025cc8918a3a	0	30	f	\N	\N
6c5f1609-42de-4ebe-9594-4d5ffc30be7d	\N	\N	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	bbc3d78a-97ec-4856-a678-025cc8918a3a	1	40	t	848926d9-214d-4cc7-ba3a-2ba31faddb0f	\N
046b7f72-d589-433c-afa4-e71084c4d60d	\N	http-basic-authenticator	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	5002ca85-687f-4cac-af26-3c9f9568fc5a	0	10	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
920fa4ea-5b15-49f4-9cac-da322bc4891f	browser	Browser based authentication	7df03360-60a3-49d8-8fc4-f7cf9b739084	basic-flow	t	t
faa6b251-79df-4874-b90f-bfb38c865e2d	forms	Username, password, otp and other auth forms.	7df03360-60a3-49d8-8fc4-f7cf9b739084	basic-flow	f	t
73ec958a-1276-4bb1-aa40-bf5ecde99caa	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	7df03360-60a3-49d8-8fc4-f7cf9b739084	basic-flow	f	t
42d38bfa-bc8f-4587-8b5c-4bfb56f389d1	direct grant	OpenID Connect Resource Owner Grant	7df03360-60a3-49d8-8fc4-f7cf9b739084	basic-flow	t	t
d8db911e-2d8f-4979-a7d8-cbb8d4a00c06	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	7df03360-60a3-49d8-8fc4-f7cf9b739084	basic-flow	f	t
8d812cde-5d38-49bb-8431-f3f501a6da72	registration	Registration flow	7df03360-60a3-49d8-8fc4-f7cf9b739084	basic-flow	t	t
156edc9f-c00b-4a80-8115-0b27074cf94d	registration form	Registration form	7df03360-60a3-49d8-8fc4-f7cf9b739084	form-flow	f	t
4624c5c3-e95b-453c-bba5-caf569b77bbc	reset credentials	Reset credentials for a user if they forgot their password or something	7df03360-60a3-49d8-8fc4-f7cf9b739084	basic-flow	t	t
9aa42c56-d4b5-4c1a-953b-e5a7797a6ddd	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	7df03360-60a3-49d8-8fc4-f7cf9b739084	basic-flow	f	t
94414d8c-0d1a-493b-ba38-2d6198070865	clients	Base authentication for clients	7df03360-60a3-49d8-8fc4-f7cf9b739084	client-flow	t	t
ff05994d-d11c-4699-8edb-8cf350580481	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	7df03360-60a3-49d8-8fc4-f7cf9b739084	basic-flow	t	t
872604af-c830-4844-bedd-af4c9ad5121f	User creation or linking	Flow for the existing/non-existing user alternatives	7df03360-60a3-49d8-8fc4-f7cf9b739084	basic-flow	f	t
0442baa1-2b1f-42ee-9037-9f562da73cad	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	7df03360-60a3-49d8-8fc4-f7cf9b739084	basic-flow	f	t
5ea74633-1cb7-4d21-9f8b-3bef0f33f2d3	Account verification options	Method with which to verity the existing account	7df03360-60a3-49d8-8fc4-f7cf9b739084	basic-flow	f	t
407d8078-eae1-48a9-a94c-f17c86fd3fb4	Verify Existing Account by Re-authentication	Reauthentication of existing account	7df03360-60a3-49d8-8fc4-f7cf9b739084	basic-flow	f	t
2faa57c6-87d7-4afe-97c1-bbfc51f2e09f	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	7df03360-60a3-49d8-8fc4-f7cf9b739084	basic-flow	f	t
4204a992-e3ea-4b81-93c5-4787bc67bb51	saml ecp	SAML ECP Profile Authentication Flow	7df03360-60a3-49d8-8fc4-f7cf9b739084	basic-flow	t	t
ccad98c4-7ce0-4567-968b-c0de02d1dde4	docker auth	Used by Docker clients to authenticate against the IDP	7df03360-60a3-49d8-8fc4-f7cf9b739084	basic-flow	t	t
ef63d119-440a-4fcd-9fa6-3affe916d311	Account verification options	Method with which to verity the existing account	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	basic-flow	f	t
80ba01a1-5ea3-4b75-8d44-3b5145131ce7	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	basic-flow	f	t
c1a7dd92-aaba-4c51-ad12-9e67e5494d7a	Browser - Conditional Organization	Flow to determine if the organization identity-first login is to be used	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	basic-flow	f	t
19b52da5-ada0-4de9-8c5a-7808c684e791	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	basic-flow	f	t
c4bf8289-b7a5-4183-8f9d-aae99d311f2e	First Broker Login - Conditional Organization	Flow to determine if the authenticator that adds organization members is to be used	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	basic-flow	f	t
893ba122-d9f9-4d23-a220-85d182077eec	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	basic-flow	f	t
fefd580f-3684-4dc9-9b2a-ccd1686a921d	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	basic-flow	f	t
1cff76c8-3cf7-4485-bd6e-764eab466c78	Organization	\N	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	basic-flow	f	t
848926d9-214d-4cc7-ba3a-2ba31faddb0f	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	basic-flow	f	t
290b2335-0bf8-456d-98ad-7f14344ffd1e	User creation or linking	Flow for the existing/non-existing user alternatives	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	basic-flow	f	t
221e12c5-47c0-4f68-9c20-36005957d185	Verify Existing Account by Re-authentication	Reauthentication of existing account	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	basic-flow	f	t
9f084199-d6f7-4ee8-9111-37d9be0b6446	browser	Browser based authentication	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	basic-flow	t	t
df88470c-4746-4043-bc4b-a572cb1b0eca	clients	Base authentication for clients	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	client-flow	t	t
0d6bbefa-a98c-428e-ba13-a03d692a29fb	direct grant	OpenID Connect Resource Owner Grant	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	basic-flow	t	t
0cfef825-093c-4a5a-bff9-28da27b8daf7	docker auth	Used by Docker clients to authenticate against the IDP	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	basic-flow	t	t
6db2fca1-f135-49ba-a688-7ff6a7ce1db6	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	basic-flow	t	t
d40a062d-8123-499d-a2b0-8cc10b5c8132	forms	Username, password, otp and other auth forms.	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	basic-flow	f	t
3c29de44-590d-4d2f-b7ed-572cc96c6569	registration	Registration flow	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	basic-flow	t	t
c8881c9c-b38d-4290-9c5e-81267f16f889	registration form	Registration form	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	form-flow	f	t
bbc3d78a-97ec-4856-a678-025cc8918a3a	reset credentials	Reset credentials for a user if they forgot their password or something	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	basic-flow	t	t
5002ca85-687f-4cac-af26-3c9f9568fc5a	saml ecp	SAML ECP Profile Authentication Flow	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	basic-flow	t	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
1338c6cb-6ada-4eca-9129-236dac4bd115	review profile config	7df03360-60a3-49d8-8fc4-f7cf9b739084
d7d6006f-2d99-4e47-98ac-8a4258c51a46	create unique user config	7df03360-60a3-49d8-8fc4-f7cf9b739084
d4ce9fef-b8d5-4a49-8c35-e6d95874bbde	create unique user config	be6ce2a1-9fac-4c0a-9916-53b2dbad6409
bab17018-afb9-4260-bbf9-25727c51f38d	review profile config	be6ce2a1-9fac-4c0a-9916-53b2dbad6409
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
1338c6cb-6ada-4eca-9129-236dac4bd115	missing	update.profile.on.first.login
d7d6006f-2d99-4e47-98ac-8a4258c51a46	false	require.password.update.after.registration
bab17018-afb9-4260-bbf9-25727c51f38d	missing	update.profile.on.first.login
d4ce9fef-b8d5-4a49-8c35-e6d95874bbde	false	require.password.update.after.registration
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
82b1cb52-ee49-426d-9d20-5365bd7dbae4	t	f	master-realm	0	f	\N	\N	t	\N	f	7df03360-60a3-49d8-8fc4-f7cf9b739084	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
9bf17482-c934-4a6c-a477-e98986383b96	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	7df03360-60a3-49d8-8fc4-f7cf9b739084	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
ff46868d-6213-47b3-ad8b-8df736eed272	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	7df03360-60a3-49d8-8fc4-f7cf9b739084	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
d8b7d0b7-bf3c-495b-a780-804c1470e617	t	f	broker	0	f	\N	\N	t	\N	f	7df03360-60a3-49d8-8fc4-f7cf9b739084	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
4891877d-9e6b-4062-9e53-b57a61f89e3c	t	t	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	7df03360-60a3-49d8-8fc4-f7cf9b739084	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
9531b973-2e68-4106-8953-1ed08f1d3682	t	t	admin-cli	0	t	\N	\N	f	\N	f	7df03360-60a3-49d8-8fc4-f7cf9b739084	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
188cb1f3-d31f-4737-a6e4-70df5283923b	t	f	KahootRealm-realm	0	f	\N	\N	t	\N	f	7df03360-60a3-49d8-8fc4-f7cf9b739084	\N	0	f	f	KahootRealm Realm	f	client-secret	\N	\N	\N	t	f	f	f
ca0950df-cbba-4cca-9094-7dddb2d826bf	t	f	account	0	t	\N	/realms/KahootRealm/account/	f	\N	f	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
69b5e48e-5dee-4ac0-b363-d9a311ae9b80	t	f	account-console	0	t	\N	/realms/KahootRealm/account/	f	\N	f	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
96876501-a2b4-4c95-af7e-4792aebd8f4a	t	t	admin-cli	0	t	\N	\N	f	\N	f	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
6655e5d1-2ae3-436b-8587-37b5dfd2df7f	t	f	broker	0	f	\N	\N	t	\N	f	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
f820e539-4dae-4c02-be0f-fc0ca7f13aa7	t	t	kahootApp	0	t	\N		f		f	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	openid-connect	-1	t	f		f	client-secret			\N	t	f	t	f
af8b2ee8-df19-46cf-8ea2-a4da390b5d17	t	f	realm-management	0	f	\N	\N	t	\N	f	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
59f6eb8a-7e11-4e0c-b0ab-33d4aa7e13f8	t	t	security-admin-console	0	t	\N	/admin/KahootRealm/console/	f	\N	f	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
9bf17482-c934-4a6c-a477-e98986383b96	post.logout.redirect.uris	+
ff46868d-6213-47b3-ad8b-8df736eed272	post.logout.redirect.uris	+
ff46868d-6213-47b3-ad8b-8df736eed272	pkce.code.challenge.method	S256
4891877d-9e6b-4062-9e53-b57a61f89e3c	post.logout.redirect.uris	+
4891877d-9e6b-4062-9e53-b57a61f89e3c	pkce.code.challenge.method	S256
4891877d-9e6b-4062-9e53-b57a61f89e3c	client.use.lightweight.access.token.enabled	true
9531b973-2e68-4106-8953-1ed08f1d3682	client.use.lightweight.access.token.enabled	true
ca0950df-cbba-4cca-9094-7dddb2d826bf	realm_client	false
ca0950df-cbba-4cca-9094-7dddb2d826bf	post.logout.redirect.uris	+
69b5e48e-5dee-4ac0-b363-d9a311ae9b80	realm_client	false
69b5e48e-5dee-4ac0-b363-d9a311ae9b80	post.logout.redirect.uris	+
69b5e48e-5dee-4ac0-b363-d9a311ae9b80	pkce.code.challenge.method	S256
96876501-a2b4-4c95-af7e-4792aebd8f4a	realm_client	false
96876501-a2b4-4c95-af7e-4792aebd8f4a	client.use.lightweight.access.token.enabled	true
96876501-a2b4-4c95-af7e-4792aebd8f4a	post.logout.redirect.uris	+
6655e5d1-2ae3-436b-8587-37b5dfd2df7f	realm_client	true
6655e5d1-2ae3-436b-8587-37b5dfd2df7f	post.logout.redirect.uris	+
f820e539-4dae-4c02-be0f-fc0ca7f13aa7	realm_client	false
f820e539-4dae-4c02-be0f-fc0ca7f13aa7	oidc.ciba.grant.enabled	false
f820e539-4dae-4c02-be0f-fc0ca7f13aa7	backchannel.logout.session.required	true
f820e539-4dae-4c02-be0f-fc0ca7f13aa7	oauth2.device.authorization.grant.enabled	false
f820e539-4dae-4c02-be0f-fc0ca7f13aa7	display.on.consent.screen	false
f820e539-4dae-4c02-be0f-fc0ca7f13aa7	backchannel.logout.revoke.offline.tokens	false
f820e539-4dae-4c02-be0f-fc0ca7f13aa7	post.logout.redirect.uris	+
af8b2ee8-df19-46cf-8ea2-a4da390b5d17	realm_client	true
af8b2ee8-df19-46cf-8ea2-a4da390b5d17	post.logout.redirect.uris	+
59f6eb8a-7e11-4e0c-b0ab-33d4aa7e13f8	realm_client	false
59f6eb8a-7e11-4e0c-b0ab-33d4aa7e13f8	client.use.lightweight.access.token.enabled	true
59f6eb8a-7e11-4e0c-b0ab-33d4aa7e13f8	post.logout.redirect.uris	+
59f6eb8a-7e11-4e0c-b0ab-33d4aa7e13f8	pkce.code.challenge.method	S256
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
87109c75-df07-432d-9c24-901c17391903	offline_access	7df03360-60a3-49d8-8fc4-f7cf9b739084	OpenID Connect built-in scope: offline_access	openid-connect
c0a30a51-edac-4272-bb34-d7de293153f5	role_list	7df03360-60a3-49d8-8fc4-f7cf9b739084	SAML role list	saml
b7d12e20-e8ec-474f-9000-dc6af53f401f	saml_organization	7df03360-60a3-49d8-8fc4-f7cf9b739084	Organization Membership	saml
87b50f20-019e-4d82-8c07-3c5223affc34	profile	7df03360-60a3-49d8-8fc4-f7cf9b739084	OpenID Connect built-in scope: profile	openid-connect
5f6aeea2-1484-4474-9cfe-b66c0ec59d30	email	7df03360-60a3-49d8-8fc4-f7cf9b739084	OpenID Connect built-in scope: email	openid-connect
9f4e737a-3383-4078-99a5-0390c8ad9bc9	address	7df03360-60a3-49d8-8fc4-f7cf9b739084	OpenID Connect built-in scope: address	openid-connect
fd5edd43-eb09-4d28-b0c5-df17aeccc316	phone	7df03360-60a3-49d8-8fc4-f7cf9b739084	OpenID Connect built-in scope: phone	openid-connect
909d9318-c4fa-48c7-82f1-8e9c94160ac9	roles	7df03360-60a3-49d8-8fc4-f7cf9b739084	OpenID Connect scope for add user roles to the access token	openid-connect
6d1fe510-797f-4102-8f05-6c284992e02c	web-origins	7df03360-60a3-49d8-8fc4-f7cf9b739084	OpenID Connect scope for add allowed web origins to the access token	openid-connect
7f327484-8284-4c27-8f94-2f42e74c9b53	microprofile-jwt	7df03360-60a3-49d8-8fc4-f7cf9b739084	Microprofile - JWT built-in scope	openid-connect
637e3c73-f18e-4603-9c26-708a1bcac855	acr	7df03360-60a3-49d8-8fc4-f7cf9b739084	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
8cca7a80-36d4-44e6-9ac0-bd339a111441	basic	7df03360-60a3-49d8-8fc4-f7cf9b739084	OpenID Connect scope for add all basic claims to the token	openid-connect
ffb25617-e1f8-4038-b04c-7caaba64400c	organization	7df03360-60a3-49d8-8fc4-f7cf9b739084	Additional claims about the organization a subject belongs to	openid-connect
e3665b21-655b-4222-a98c-567b10968fa0	microprofile-jwt	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	Microprofile - JWT built-in scope	openid-connect
eb8000fc-5791-475a-a5ca-6e9eacf3ca96	email	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	OpenID Connect built-in scope: email	openid-connect
33778144-3ab0-45b8-b12b-d6e51133c87a	phone	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	OpenID Connect built-in scope: phone	openid-connect
74f4d58d-f097-40d8-9298-eec0ae1bda9e	offline_access	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	OpenID Connect built-in scope: offline_access	openid-connect
577d8b9c-5795-4214-8703-e301c8eadeb1	saml_organization	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	Organization Membership	saml
d72b75f5-b5c7-4a6c-8e00-a197ba18e29f	address	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	OpenID Connect built-in scope: address	openid-connect
d4276354-645c-4888-83a7-ce52303ac1c9	acr	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
b75f7fc5-08ec-4a2b-bf90-9fed81881326	web-origins	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	OpenID Connect scope for add allowed web origins to the access token	openid-connect
4f174b30-c68b-4c37-bb10-bae6d509b26f	profile	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	OpenID Connect built-in scope: profile	openid-connect
2e6e1812-abee-47e1-adb9-c82883cd9a20	roles	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	OpenID Connect scope for add user roles to the access token	openid-connect
6708bae9-8e4e-4dd5-8f2c-6b21729ff1ad	organization	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	Additional claims about the organization a subject belongs to	openid-connect
7b5242cf-59cb-4c3e-8705-318003a9b44e	role_list	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	SAML role list	saml
d7b05a5a-21c6-414f-bef7-b28cace5d342	basic	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	OpenID Connect scope for add all basic claims to the token	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
87109c75-df07-432d-9c24-901c17391903	true	display.on.consent.screen
87109c75-df07-432d-9c24-901c17391903	${offlineAccessScopeConsentText}	consent.screen.text
c0a30a51-edac-4272-bb34-d7de293153f5	true	display.on.consent.screen
c0a30a51-edac-4272-bb34-d7de293153f5	${samlRoleListScopeConsentText}	consent.screen.text
b7d12e20-e8ec-474f-9000-dc6af53f401f	false	display.on.consent.screen
87b50f20-019e-4d82-8c07-3c5223affc34	true	display.on.consent.screen
87b50f20-019e-4d82-8c07-3c5223affc34	${profileScopeConsentText}	consent.screen.text
87b50f20-019e-4d82-8c07-3c5223affc34	true	include.in.token.scope
5f6aeea2-1484-4474-9cfe-b66c0ec59d30	true	display.on.consent.screen
5f6aeea2-1484-4474-9cfe-b66c0ec59d30	${emailScopeConsentText}	consent.screen.text
5f6aeea2-1484-4474-9cfe-b66c0ec59d30	true	include.in.token.scope
9f4e737a-3383-4078-99a5-0390c8ad9bc9	true	display.on.consent.screen
9f4e737a-3383-4078-99a5-0390c8ad9bc9	${addressScopeConsentText}	consent.screen.text
9f4e737a-3383-4078-99a5-0390c8ad9bc9	true	include.in.token.scope
fd5edd43-eb09-4d28-b0c5-df17aeccc316	true	display.on.consent.screen
fd5edd43-eb09-4d28-b0c5-df17aeccc316	${phoneScopeConsentText}	consent.screen.text
fd5edd43-eb09-4d28-b0c5-df17aeccc316	true	include.in.token.scope
909d9318-c4fa-48c7-82f1-8e9c94160ac9	true	display.on.consent.screen
909d9318-c4fa-48c7-82f1-8e9c94160ac9	${rolesScopeConsentText}	consent.screen.text
909d9318-c4fa-48c7-82f1-8e9c94160ac9	false	include.in.token.scope
6d1fe510-797f-4102-8f05-6c284992e02c	false	display.on.consent.screen
6d1fe510-797f-4102-8f05-6c284992e02c		consent.screen.text
6d1fe510-797f-4102-8f05-6c284992e02c	false	include.in.token.scope
7f327484-8284-4c27-8f94-2f42e74c9b53	false	display.on.consent.screen
7f327484-8284-4c27-8f94-2f42e74c9b53	true	include.in.token.scope
637e3c73-f18e-4603-9c26-708a1bcac855	false	display.on.consent.screen
637e3c73-f18e-4603-9c26-708a1bcac855	false	include.in.token.scope
8cca7a80-36d4-44e6-9ac0-bd339a111441	false	display.on.consent.screen
8cca7a80-36d4-44e6-9ac0-bd339a111441	false	include.in.token.scope
ffb25617-e1f8-4038-b04c-7caaba64400c	true	display.on.consent.screen
ffb25617-e1f8-4038-b04c-7caaba64400c	${organizationScopeConsentText}	consent.screen.text
ffb25617-e1f8-4038-b04c-7caaba64400c	true	include.in.token.scope
e3665b21-655b-4222-a98c-567b10968fa0	true	include.in.token.scope
e3665b21-655b-4222-a98c-567b10968fa0	false	display.on.consent.screen
eb8000fc-5791-475a-a5ca-6e9eacf3ca96	true	include.in.token.scope
eb8000fc-5791-475a-a5ca-6e9eacf3ca96	${emailScopeConsentText}	consent.screen.text
eb8000fc-5791-475a-a5ca-6e9eacf3ca96	true	display.on.consent.screen
33778144-3ab0-45b8-b12b-d6e51133c87a	true	include.in.token.scope
33778144-3ab0-45b8-b12b-d6e51133c87a	${phoneScopeConsentText}	consent.screen.text
33778144-3ab0-45b8-b12b-d6e51133c87a	true	display.on.consent.screen
74f4d58d-f097-40d8-9298-eec0ae1bda9e	${offlineAccessScopeConsentText}	consent.screen.text
74f4d58d-f097-40d8-9298-eec0ae1bda9e	true	display.on.consent.screen
577d8b9c-5795-4214-8703-e301c8eadeb1	false	display.on.consent.screen
d72b75f5-b5c7-4a6c-8e00-a197ba18e29f	true	include.in.token.scope
d72b75f5-b5c7-4a6c-8e00-a197ba18e29f	${addressScopeConsentText}	consent.screen.text
d72b75f5-b5c7-4a6c-8e00-a197ba18e29f	true	display.on.consent.screen
d4276354-645c-4888-83a7-ce52303ac1c9	false	include.in.token.scope
d4276354-645c-4888-83a7-ce52303ac1c9	false	display.on.consent.screen
b75f7fc5-08ec-4a2b-bf90-9fed81881326	false	include.in.token.scope
b75f7fc5-08ec-4a2b-bf90-9fed81881326		consent.screen.text
b75f7fc5-08ec-4a2b-bf90-9fed81881326	false	display.on.consent.screen
4f174b30-c68b-4c37-bb10-bae6d509b26f	true	include.in.token.scope
4f174b30-c68b-4c37-bb10-bae6d509b26f	${profileScopeConsentText}	consent.screen.text
4f174b30-c68b-4c37-bb10-bae6d509b26f	true	display.on.consent.screen
2e6e1812-abee-47e1-adb9-c82883cd9a20	false	include.in.token.scope
2e6e1812-abee-47e1-adb9-c82883cd9a20	${rolesScopeConsentText}	consent.screen.text
2e6e1812-abee-47e1-adb9-c82883cd9a20	true	display.on.consent.screen
6708bae9-8e4e-4dd5-8f2c-6b21729ff1ad	true	include.in.token.scope
6708bae9-8e4e-4dd5-8f2c-6b21729ff1ad	${organizationScopeConsentText}	consent.screen.text
6708bae9-8e4e-4dd5-8f2c-6b21729ff1ad	true	display.on.consent.screen
7b5242cf-59cb-4c3e-8705-318003a9b44e	${samlRoleListScopeConsentText}	consent.screen.text
7b5242cf-59cb-4c3e-8705-318003a9b44e	true	display.on.consent.screen
d7b05a5a-21c6-414f-bef7-b28cace5d342	false	include.in.token.scope
d7b05a5a-21c6-414f-bef7-b28cace5d342	false	display.on.consent.screen
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
9bf17482-c934-4a6c-a477-e98986383b96	8cca7a80-36d4-44e6-9ac0-bd339a111441	t
9bf17482-c934-4a6c-a477-e98986383b96	5f6aeea2-1484-4474-9cfe-b66c0ec59d30	t
9bf17482-c934-4a6c-a477-e98986383b96	909d9318-c4fa-48c7-82f1-8e9c94160ac9	t
9bf17482-c934-4a6c-a477-e98986383b96	6d1fe510-797f-4102-8f05-6c284992e02c	t
9bf17482-c934-4a6c-a477-e98986383b96	87b50f20-019e-4d82-8c07-3c5223affc34	t
9bf17482-c934-4a6c-a477-e98986383b96	637e3c73-f18e-4603-9c26-708a1bcac855	t
9bf17482-c934-4a6c-a477-e98986383b96	87109c75-df07-432d-9c24-901c17391903	f
9bf17482-c934-4a6c-a477-e98986383b96	9f4e737a-3383-4078-99a5-0390c8ad9bc9	f
9bf17482-c934-4a6c-a477-e98986383b96	fd5edd43-eb09-4d28-b0c5-df17aeccc316	f
9bf17482-c934-4a6c-a477-e98986383b96	ffb25617-e1f8-4038-b04c-7caaba64400c	f
9bf17482-c934-4a6c-a477-e98986383b96	7f327484-8284-4c27-8f94-2f42e74c9b53	f
ff46868d-6213-47b3-ad8b-8df736eed272	8cca7a80-36d4-44e6-9ac0-bd339a111441	t
ff46868d-6213-47b3-ad8b-8df736eed272	5f6aeea2-1484-4474-9cfe-b66c0ec59d30	t
ff46868d-6213-47b3-ad8b-8df736eed272	909d9318-c4fa-48c7-82f1-8e9c94160ac9	t
ff46868d-6213-47b3-ad8b-8df736eed272	6d1fe510-797f-4102-8f05-6c284992e02c	t
ff46868d-6213-47b3-ad8b-8df736eed272	87b50f20-019e-4d82-8c07-3c5223affc34	t
ff46868d-6213-47b3-ad8b-8df736eed272	637e3c73-f18e-4603-9c26-708a1bcac855	t
ff46868d-6213-47b3-ad8b-8df736eed272	87109c75-df07-432d-9c24-901c17391903	f
ff46868d-6213-47b3-ad8b-8df736eed272	9f4e737a-3383-4078-99a5-0390c8ad9bc9	f
ff46868d-6213-47b3-ad8b-8df736eed272	fd5edd43-eb09-4d28-b0c5-df17aeccc316	f
ff46868d-6213-47b3-ad8b-8df736eed272	ffb25617-e1f8-4038-b04c-7caaba64400c	f
ff46868d-6213-47b3-ad8b-8df736eed272	7f327484-8284-4c27-8f94-2f42e74c9b53	f
9531b973-2e68-4106-8953-1ed08f1d3682	8cca7a80-36d4-44e6-9ac0-bd339a111441	t
9531b973-2e68-4106-8953-1ed08f1d3682	5f6aeea2-1484-4474-9cfe-b66c0ec59d30	t
9531b973-2e68-4106-8953-1ed08f1d3682	909d9318-c4fa-48c7-82f1-8e9c94160ac9	t
9531b973-2e68-4106-8953-1ed08f1d3682	6d1fe510-797f-4102-8f05-6c284992e02c	t
9531b973-2e68-4106-8953-1ed08f1d3682	87b50f20-019e-4d82-8c07-3c5223affc34	t
9531b973-2e68-4106-8953-1ed08f1d3682	637e3c73-f18e-4603-9c26-708a1bcac855	t
9531b973-2e68-4106-8953-1ed08f1d3682	87109c75-df07-432d-9c24-901c17391903	f
9531b973-2e68-4106-8953-1ed08f1d3682	9f4e737a-3383-4078-99a5-0390c8ad9bc9	f
9531b973-2e68-4106-8953-1ed08f1d3682	fd5edd43-eb09-4d28-b0c5-df17aeccc316	f
9531b973-2e68-4106-8953-1ed08f1d3682	ffb25617-e1f8-4038-b04c-7caaba64400c	f
9531b973-2e68-4106-8953-1ed08f1d3682	7f327484-8284-4c27-8f94-2f42e74c9b53	f
d8b7d0b7-bf3c-495b-a780-804c1470e617	8cca7a80-36d4-44e6-9ac0-bd339a111441	t
d8b7d0b7-bf3c-495b-a780-804c1470e617	5f6aeea2-1484-4474-9cfe-b66c0ec59d30	t
d8b7d0b7-bf3c-495b-a780-804c1470e617	909d9318-c4fa-48c7-82f1-8e9c94160ac9	t
d8b7d0b7-bf3c-495b-a780-804c1470e617	6d1fe510-797f-4102-8f05-6c284992e02c	t
d8b7d0b7-bf3c-495b-a780-804c1470e617	87b50f20-019e-4d82-8c07-3c5223affc34	t
d8b7d0b7-bf3c-495b-a780-804c1470e617	637e3c73-f18e-4603-9c26-708a1bcac855	t
d8b7d0b7-bf3c-495b-a780-804c1470e617	87109c75-df07-432d-9c24-901c17391903	f
d8b7d0b7-bf3c-495b-a780-804c1470e617	9f4e737a-3383-4078-99a5-0390c8ad9bc9	f
d8b7d0b7-bf3c-495b-a780-804c1470e617	fd5edd43-eb09-4d28-b0c5-df17aeccc316	f
d8b7d0b7-bf3c-495b-a780-804c1470e617	ffb25617-e1f8-4038-b04c-7caaba64400c	f
d8b7d0b7-bf3c-495b-a780-804c1470e617	7f327484-8284-4c27-8f94-2f42e74c9b53	f
82b1cb52-ee49-426d-9d20-5365bd7dbae4	8cca7a80-36d4-44e6-9ac0-bd339a111441	t
82b1cb52-ee49-426d-9d20-5365bd7dbae4	5f6aeea2-1484-4474-9cfe-b66c0ec59d30	t
82b1cb52-ee49-426d-9d20-5365bd7dbae4	909d9318-c4fa-48c7-82f1-8e9c94160ac9	t
82b1cb52-ee49-426d-9d20-5365bd7dbae4	6d1fe510-797f-4102-8f05-6c284992e02c	t
82b1cb52-ee49-426d-9d20-5365bd7dbae4	87b50f20-019e-4d82-8c07-3c5223affc34	t
82b1cb52-ee49-426d-9d20-5365bd7dbae4	637e3c73-f18e-4603-9c26-708a1bcac855	t
82b1cb52-ee49-426d-9d20-5365bd7dbae4	87109c75-df07-432d-9c24-901c17391903	f
82b1cb52-ee49-426d-9d20-5365bd7dbae4	9f4e737a-3383-4078-99a5-0390c8ad9bc9	f
82b1cb52-ee49-426d-9d20-5365bd7dbae4	fd5edd43-eb09-4d28-b0c5-df17aeccc316	f
82b1cb52-ee49-426d-9d20-5365bd7dbae4	ffb25617-e1f8-4038-b04c-7caaba64400c	f
82b1cb52-ee49-426d-9d20-5365bd7dbae4	7f327484-8284-4c27-8f94-2f42e74c9b53	f
4891877d-9e6b-4062-9e53-b57a61f89e3c	8cca7a80-36d4-44e6-9ac0-bd339a111441	t
4891877d-9e6b-4062-9e53-b57a61f89e3c	5f6aeea2-1484-4474-9cfe-b66c0ec59d30	t
4891877d-9e6b-4062-9e53-b57a61f89e3c	909d9318-c4fa-48c7-82f1-8e9c94160ac9	t
4891877d-9e6b-4062-9e53-b57a61f89e3c	6d1fe510-797f-4102-8f05-6c284992e02c	t
4891877d-9e6b-4062-9e53-b57a61f89e3c	87b50f20-019e-4d82-8c07-3c5223affc34	t
4891877d-9e6b-4062-9e53-b57a61f89e3c	637e3c73-f18e-4603-9c26-708a1bcac855	t
4891877d-9e6b-4062-9e53-b57a61f89e3c	87109c75-df07-432d-9c24-901c17391903	f
4891877d-9e6b-4062-9e53-b57a61f89e3c	9f4e737a-3383-4078-99a5-0390c8ad9bc9	f
4891877d-9e6b-4062-9e53-b57a61f89e3c	fd5edd43-eb09-4d28-b0c5-df17aeccc316	f
4891877d-9e6b-4062-9e53-b57a61f89e3c	ffb25617-e1f8-4038-b04c-7caaba64400c	f
4891877d-9e6b-4062-9e53-b57a61f89e3c	7f327484-8284-4c27-8f94-2f42e74c9b53	f
ca0950df-cbba-4cca-9094-7dddb2d826bf	b75f7fc5-08ec-4a2b-bf90-9fed81881326	t
ca0950df-cbba-4cca-9094-7dddb2d826bf	d4276354-645c-4888-83a7-ce52303ac1c9	t
ca0950df-cbba-4cca-9094-7dddb2d826bf	4f174b30-c68b-4c37-bb10-bae6d509b26f	t
ca0950df-cbba-4cca-9094-7dddb2d826bf	2e6e1812-abee-47e1-adb9-c82883cd9a20	t
ca0950df-cbba-4cca-9094-7dddb2d826bf	d7b05a5a-21c6-414f-bef7-b28cace5d342	t
ca0950df-cbba-4cca-9094-7dddb2d826bf	eb8000fc-5791-475a-a5ca-6e9eacf3ca96	t
ca0950df-cbba-4cca-9094-7dddb2d826bf	d72b75f5-b5c7-4a6c-8e00-a197ba18e29f	f
ca0950df-cbba-4cca-9094-7dddb2d826bf	33778144-3ab0-45b8-b12b-d6e51133c87a	f
ca0950df-cbba-4cca-9094-7dddb2d826bf	74f4d58d-f097-40d8-9298-eec0ae1bda9e	f
ca0950df-cbba-4cca-9094-7dddb2d826bf	6708bae9-8e4e-4dd5-8f2c-6b21729ff1ad	f
ca0950df-cbba-4cca-9094-7dddb2d826bf	e3665b21-655b-4222-a98c-567b10968fa0	f
69b5e48e-5dee-4ac0-b363-d9a311ae9b80	b75f7fc5-08ec-4a2b-bf90-9fed81881326	t
69b5e48e-5dee-4ac0-b363-d9a311ae9b80	d4276354-645c-4888-83a7-ce52303ac1c9	t
69b5e48e-5dee-4ac0-b363-d9a311ae9b80	4f174b30-c68b-4c37-bb10-bae6d509b26f	t
69b5e48e-5dee-4ac0-b363-d9a311ae9b80	2e6e1812-abee-47e1-adb9-c82883cd9a20	t
69b5e48e-5dee-4ac0-b363-d9a311ae9b80	d7b05a5a-21c6-414f-bef7-b28cace5d342	t
69b5e48e-5dee-4ac0-b363-d9a311ae9b80	eb8000fc-5791-475a-a5ca-6e9eacf3ca96	t
69b5e48e-5dee-4ac0-b363-d9a311ae9b80	d72b75f5-b5c7-4a6c-8e00-a197ba18e29f	f
69b5e48e-5dee-4ac0-b363-d9a311ae9b80	33778144-3ab0-45b8-b12b-d6e51133c87a	f
69b5e48e-5dee-4ac0-b363-d9a311ae9b80	74f4d58d-f097-40d8-9298-eec0ae1bda9e	f
69b5e48e-5dee-4ac0-b363-d9a311ae9b80	6708bae9-8e4e-4dd5-8f2c-6b21729ff1ad	f
69b5e48e-5dee-4ac0-b363-d9a311ae9b80	e3665b21-655b-4222-a98c-567b10968fa0	f
96876501-a2b4-4c95-af7e-4792aebd8f4a	b75f7fc5-08ec-4a2b-bf90-9fed81881326	t
96876501-a2b4-4c95-af7e-4792aebd8f4a	d4276354-645c-4888-83a7-ce52303ac1c9	t
96876501-a2b4-4c95-af7e-4792aebd8f4a	4f174b30-c68b-4c37-bb10-bae6d509b26f	t
96876501-a2b4-4c95-af7e-4792aebd8f4a	2e6e1812-abee-47e1-adb9-c82883cd9a20	t
96876501-a2b4-4c95-af7e-4792aebd8f4a	d7b05a5a-21c6-414f-bef7-b28cace5d342	t
96876501-a2b4-4c95-af7e-4792aebd8f4a	eb8000fc-5791-475a-a5ca-6e9eacf3ca96	t
96876501-a2b4-4c95-af7e-4792aebd8f4a	d72b75f5-b5c7-4a6c-8e00-a197ba18e29f	f
96876501-a2b4-4c95-af7e-4792aebd8f4a	33778144-3ab0-45b8-b12b-d6e51133c87a	f
96876501-a2b4-4c95-af7e-4792aebd8f4a	74f4d58d-f097-40d8-9298-eec0ae1bda9e	f
96876501-a2b4-4c95-af7e-4792aebd8f4a	6708bae9-8e4e-4dd5-8f2c-6b21729ff1ad	f
96876501-a2b4-4c95-af7e-4792aebd8f4a	e3665b21-655b-4222-a98c-567b10968fa0	f
6655e5d1-2ae3-436b-8587-37b5dfd2df7f	b75f7fc5-08ec-4a2b-bf90-9fed81881326	t
6655e5d1-2ae3-436b-8587-37b5dfd2df7f	d4276354-645c-4888-83a7-ce52303ac1c9	t
6655e5d1-2ae3-436b-8587-37b5dfd2df7f	4f174b30-c68b-4c37-bb10-bae6d509b26f	t
6655e5d1-2ae3-436b-8587-37b5dfd2df7f	2e6e1812-abee-47e1-adb9-c82883cd9a20	t
6655e5d1-2ae3-436b-8587-37b5dfd2df7f	d7b05a5a-21c6-414f-bef7-b28cace5d342	t
6655e5d1-2ae3-436b-8587-37b5dfd2df7f	eb8000fc-5791-475a-a5ca-6e9eacf3ca96	t
6655e5d1-2ae3-436b-8587-37b5dfd2df7f	d72b75f5-b5c7-4a6c-8e00-a197ba18e29f	f
6655e5d1-2ae3-436b-8587-37b5dfd2df7f	33778144-3ab0-45b8-b12b-d6e51133c87a	f
6655e5d1-2ae3-436b-8587-37b5dfd2df7f	74f4d58d-f097-40d8-9298-eec0ae1bda9e	f
6655e5d1-2ae3-436b-8587-37b5dfd2df7f	6708bae9-8e4e-4dd5-8f2c-6b21729ff1ad	f
6655e5d1-2ae3-436b-8587-37b5dfd2df7f	e3665b21-655b-4222-a98c-567b10968fa0	f
f820e539-4dae-4c02-be0f-fc0ca7f13aa7	b75f7fc5-08ec-4a2b-bf90-9fed81881326	t
f820e539-4dae-4c02-be0f-fc0ca7f13aa7	d4276354-645c-4888-83a7-ce52303ac1c9	t
f820e539-4dae-4c02-be0f-fc0ca7f13aa7	4f174b30-c68b-4c37-bb10-bae6d509b26f	t
f820e539-4dae-4c02-be0f-fc0ca7f13aa7	2e6e1812-abee-47e1-adb9-c82883cd9a20	t
f820e539-4dae-4c02-be0f-fc0ca7f13aa7	d7b05a5a-21c6-414f-bef7-b28cace5d342	t
f820e539-4dae-4c02-be0f-fc0ca7f13aa7	eb8000fc-5791-475a-a5ca-6e9eacf3ca96	t
f820e539-4dae-4c02-be0f-fc0ca7f13aa7	d72b75f5-b5c7-4a6c-8e00-a197ba18e29f	f
f820e539-4dae-4c02-be0f-fc0ca7f13aa7	33778144-3ab0-45b8-b12b-d6e51133c87a	f
f820e539-4dae-4c02-be0f-fc0ca7f13aa7	74f4d58d-f097-40d8-9298-eec0ae1bda9e	f
f820e539-4dae-4c02-be0f-fc0ca7f13aa7	6708bae9-8e4e-4dd5-8f2c-6b21729ff1ad	f
f820e539-4dae-4c02-be0f-fc0ca7f13aa7	e3665b21-655b-4222-a98c-567b10968fa0	f
af8b2ee8-df19-46cf-8ea2-a4da390b5d17	b75f7fc5-08ec-4a2b-bf90-9fed81881326	t
af8b2ee8-df19-46cf-8ea2-a4da390b5d17	d4276354-645c-4888-83a7-ce52303ac1c9	t
af8b2ee8-df19-46cf-8ea2-a4da390b5d17	4f174b30-c68b-4c37-bb10-bae6d509b26f	t
af8b2ee8-df19-46cf-8ea2-a4da390b5d17	2e6e1812-abee-47e1-adb9-c82883cd9a20	t
af8b2ee8-df19-46cf-8ea2-a4da390b5d17	d7b05a5a-21c6-414f-bef7-b28cace5d342	t
af8b2ee8-df19-46cf-8ea2-a4da390b5d17	eb8000fc-5791-475a-a5ca-6e9eacf3ca96	t
af8b2ee8-df19-46cf-8ea2-a4da390b5d17	d72b75f5-b5c7-4a6c-8e00-a197ba18e29f	f
af8b2ee8-df19-46cf-8ea2-a4da390b5d17	33778144-3ab0-45b8-b12b-d6e51133c87a	f
af8b2ee8-df19-46cf-8ea2-a4da390b5d17	74f4d58d-f097-40d8-9298-eec0ae1bda9e	f
af8b2ee8-df19-46cf-8ea2-a4da390b5d17	6708bae9-8e4e-4dd5-8f2c-6b21729ff1ad	f
af8b2ee8-df19-46cf-8ea2-a4da390b5d17	e3665b21-655b-4222-a98c-567b10968fa0	f
59f6eb8a-7e11-4e0c-b0ab-33d4aa7e13f8	b75f7fc5-08ec-4a2b-bf90-9fed81881326	t
59f6eb8a-7e11-4e0c-b0ab-33d4aa7e13f8	d4276354-645c-4888-83a7-ce52303ac1c9	t
59f6eb8a-7e11-4e0c-b0ab-33d4aa7e13f8	4f174b30-c68b-4c37-bb10-bae6d509b26f	t
59f6eb8a-7e11-4e0c-b0ab-33d4aa7e13f8	2e6e1812-abee-47e1-adb9-c82883cd9a20	t
59f6eb8a-7e11-4e0c-b0ab-33d4aa7e13f8	d7b05a5a-21c6-414f-bef7-b28cace5d342	t
59f6eb8a-7e11-4e0c-b0ab-33d4aa7e13f8	eb8000fc-5791-475a-a5ca-6e9eacf3ca96	t
59f6eb8a-7e11-4e0c-b0ab-33d4aa7e13f8	d72b75f5-b5c7-4a6c-8e00-a197ba18e29f	f
59f6eb8a-7e11-4e0c-b0ab-33d4aa7e13f8	33778144-3ab0-45b8-b12b-d6e51133c87a	f
59f6eb8a-7e11-4e0c-b0ab-33d4aa7e13f8	74f4d58d-f097-40d8-9298-eec0ae1bda9e	f
59f6eb8a-7e11-4e0c-b0ab-33d4aa7e13f8	6708bae9-8e4e-4dd5-8f2c-6b21729ff1ad	f
59f6eb8a-7e11-4e0c-b0ab-33d4aa7e13f8	e3665b21-655b-4222-a98c-567b10968fa0	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
87109c75-df07-432d-9c24-901c17391903	f1ea46a6-8469-4ed6-b22b-437698470fe4
74f4d58d-f097-40d8-9298-eec0ae1bda9e	8296084c-72f5-4c89-b75b-b71a6695e425
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
d875502a-1fb1-4b86-85d8-9ac48737ee82	Trusted Hosts	7df03360-60a3-49d8-8fc4-f7cf9b739084	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	7df03360-60a3-49d8-8fc4-f7cf9b739084	anonymous
385f3092-ee68-4831-a442-aeac4a4bb3fd	Consent Required	7df03360-60a3-49d8-8fc4-f7cf9b739084	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	7df03360-60a3-49d8-8fc4-f7cf9b739084	anonymous
aa2f53ce-130e-4270-a3cd-9112da6f829e	Full Scope Disabled	7df03360-60a3-49d8-8fc4-f7cf9b739084	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	7df03360-60a3-49d8-8fc4-f7cf9b739084	anonymous
2a71779a-2dca-4cd5-b729-baf1adc83d62	Max Clients Limit	7df03360-60a3-49d8-8fc4-f7cf9b739084	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	7df03360-60a3-49d8-8fc4-f7cf9b739084	anonymous
ccdb7914-8ea3-4e00-bb62-882dc9484aa2	Allowed Protocol Mapper Types	7df03360-60a3-49d8-8fc4-f7cf9b739084	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	7df03360-60a3-49d8-8fc4-f7cf9b739084	anonymous
71bc59b6-6caf-4adb-a440-780b9a2c011f	Allowed Client Scopes	7df03360-60a3-49d8-8fc4-f7cf9b739084	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	7df03360-60a3-49d8-8fc4-f7cf9b739084	anonymous
66137a4e-aa34-4927-818f-2513ba714e3c	Allowed Protocol Mapper Types	7df03360-60a3-49d8-8fc4-f7cf9b739084	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	7df03360-60a3-49d8-8fc4-f7cf9b739084	authenticated
b65fa229-61f9-44b2-a98b-135e26b6d5ff	Allowed Client Scopes	7df03360-60a3-49d8-8fc4-f7cf9b739084	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	7df03360-60a3-49d8-8fc4-f7cf9b739084	authenticated
5190e98a-cde6-476b-8e19-7688382fe425	rsa-generated	7df03360-60a3-49d8-8fc4-f7cf9b739084	rsa-generated	org.keycloak.keys.KeyProvider	7df03360-60a3-49d8-8fc4-f7cf9b739084	\N
ca4561ac-4778-4cbc-943a-aaa0e01b1831	rsa-enc-generated	7df03360-60a3-49d8-8fc4-f7cf9b739084	rsa-enc-generated	org.keycloak.keys.KeyProvider	7df03360-60a3-49d8-8fc4-f7cf9b739084	\N
96f56a7d-c271-4a4a-8c16-4c032a19d4ef	hmac-generated-hs512	7df03360-60a3-49d8-8fc4-f7cf9b739084	hmac-generated	org.keycloak.keys.KeyProvider	7df03360-60a3-49d8-8fc4-f7cf9b739084	\N
19d635b4-2e1c-4392-ab80-6d478fac6fb2	aes-generated	7df03360-60a3-49d8-8fc4-f7cf9b739084	aes-generated	org.keycloak.keys.KeyProvider	7df03360-60a3-49d8-8fc4-f7cf9b739084	\N
c3ef90b7-c100-4ec9-a4d6-c3c3e9b7a849	\N	7df03360-60a3-49d8-8fc4-f7cf9b739084	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	7df03360-60a3-49d8-8fc4-f7cf9b739084	\N
bdb040cd-38ff-4f60-b94c-633878bef8c9	Allowed Protocol Mapper Types	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	authenticated
dcbad3e4-2be8-4758-a841-9e6d13caa663	Full Scope Disabled	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	anonymous
7871ad35-69af-4ad4-b413-e66ecaf1ef98	Trusted Hosts	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	anonymous
7a60fd1b-0498-4d52-90c9-bc71c26998ac	Allowed Protocol Mapper Types	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	anonymous
17ba4ca7-ecfb-4890-8ccc-9a1282398e5b	Max Clients Limit	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	anonymous
9653da47-83a9-446c-9042-d40ef7de8444	Allowed Client Scopes	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	anonymous
bf935b3c-676d-491e-be9b-0c0453cc6d0f	Allowed Client Scopes	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	authenticated
6b04a24b-9f38-4512-a93b-db650a61e4f9	Consent Required	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	anonymous
58cc4c92-2497-46dc-8eec-e39e4bd808df	rsa-generated	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	rsa-generated	org.keycloak.keys.KeyProvider	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	\N
f20faec2-b233-4cd1-86c4-9f16d01be0c0	aes-generated	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	aes-generated	org.keycloak.keys.KeyProvider	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	\N
48adbdb7-12d0-464b-a2a9-dd67484bb0e3	rsa-enc-generated	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	rsa-enc-generated	org.keycloak.keys.KeyProvider	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	\N
eb1d57af-3ef8-4a79-b372-771803ae758d	hmac-generated-hs512	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	hmac-generated	org.keycloak.keys.KeyProvider	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	\N
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
073d8458-7d68-41a8-9ab3-0e352354a185	ccdb7914-8ea3-4e00-bb62-882dc9484aa2	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
b5ce8de5-e278-435f-89e0-d25dd24d90a7	ccdb7914-8ea3-4e00-bb62-882dc9484aa2	allowed-protocol-mapper-types	saml-user-property-mapper
8381db98-fa22-43d7-933a-dc83a945f966	ccdb7914-8ea3-4e00-bb62-882dc9484aa2	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
b940028b-f707-4ec8-87a0-fc71ddaa9a72	ccdb7914-8ea3-4e00-bb62-882dc9484aa2	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
3dc049ed-9774-4c94-9915-11e721e5d3af	ccdb7914-8ea3-4e00-bb62-882dc9484aa2	allowed-protocol-mapper-types	oidc-full-name-mapper
a48ede0c-5f68-4c75-9be4-bf38720855a0	ccdb7914-8ea3-4e00-bb62-882dc9484aa2	allowed-protocol-mapper-types	saml-user-attribute-mapper
af7a694c-c9f6-4592-99ea-243b48260f8d	ccdb7914-8ea3-4e00-bb62-882dc9484aa2	allowed-protocol-mapper-types	oidc-address-mapper
56b8b48a-59c3-4017-b5b1-44bb22d5e0bd	ccdb7914-8ea3-4e00-bb62-882dc9484aa2	allowed-protocol-mapper-types	saml-role-list-mapper
15d6ecb5-4b8b-44ef-97de-0bb7767322a9	71bc59b6-6caf-4adb-a440-780b9a2c011f	allow-default-scopes	true
48deedaa-5087-47f4-863a-2fc6b754237a	66137a4e-aa34-4927-818f-2513ba714e3c	allowed-protocol-mapper-types	saml-user-attribute-mapper
bfb69f40-0e25-4d62-9cb4-ef8903761780	66137a4e-aa34-4927-818f-2513ba714e3c	allowed-protocol-mapper-types	oidc-address-mapper
059913ca-ebd5-4fd6-b50f-52ad297f21a5	66137a4e-aa34-4927-818f-2513ba714e3c	allowed-protocol-mapper-types	saml-role-list-mapper
aefd320b-d00a-4243-a834-f636b5e9ccda	66137a4e-aa34-4927-818f-2513ba714e3c	allowed-protocol-mapper-types	saml-user-property-mapper
3265d4a9-5322-48ac-9a7d-22878a931d44	66137a4e-aa34-4927-818f-2513ba714e3c	allowed-protocol-mapper-types	oidc-full-name-mapper
626a2958-e620-4a12-8548-98f264eb1735	66137a4e-aa34-4927-818f-2513ba714e3c	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
114f8066-088d-463d-869f-bb9ba3df852a	66137a4e-aa34-4927-818f-2513ba714e3c	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
51fe09e7-40dd-4e7a-aea1-f348df5fa7d7	66137a4e-aa34-4927-818f-2513ba714e3c	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
9685bb0f-fb54-48c7-9843-1792189301cb	b65fa229-61f9-44b2-a98b-135e26b6d5ff	allow-default-scopes	true
53ce6643-05dd-4b6e-bb65-a44a76df380b	d875502a-1fb1-4b86-85d8-9ac48737ee82	client-uris-must-match	true
97a7b1af-5e63-4b67-b98b-c71a3feceb9a	d875502a-1fb1-4b86-85d8-9ac48737ee82	host-sending-registration-request-must-match	true
bffca65c-4cbf-4200-bd6f-1a6b38b80f0c	2a71779a-2dca-4cd5-b729-baf1adc83d62	max-clients	200
8d030031-af14-46c3-97f9-fa1d90dcf8ef	5190e98a-cde6-476b-8e19-7688382fe425	privateKey	MIIEogIBAAKCAQEAxGR+aV49rfWxzuWP7lgzCqzH8Dr+tRlHcXvluho/EAbJ8iLK62ZVFnQVq+b4SJc2lsUXQ0MQkpNSjYYeovjGIwSD/WrLVJxyS7PtlXR5JB9P4WcYpJZdd4OzVMf6Yv82khKqXlMo291IAtTSBwjnENWwIDOi/3NUClDLujUCaT6O7YlBVsfwNJzG1RtmDJCQ7E14tE7N9eUJsDUIclTF8NaNf4XdobOpGLNc1vFroNFjjQowkBkkruOIN1So/A+xny29titA7ZiRonuAa4A+vi1r9yKCmbjVX/lHXMZb4KeX5Yq0+PicQMmTDTz97jeV3izbI6Smuif/9Mm7gtM0fQIDAQABAoIBAAmh/jtP1ommT/LceqtPoy1GXUYwtpaOZ10vHQz8RZSVKKmaQEa8jbbcucVlPk9dL13EzAfODc2KsVVkuzL2Lc3A5nJzHwcG52pEKIaYoGp/qKzfICvOfkYi7RRe/K6HYxdWGAopXQsvtt0AsE6NBrxiJtHlhnyuHPSmkt+OwxADXgJPP1aAQv6LoJhcl5ZZIKGvfC0spcv7+kFL/oU4O95IXIBrv+RZsOFq1Q4wJaMxkoAAlljk8tnS8gLm2RFu5oVbR2AxLZTOkIFpZO9lmKY9+PABGU5hjLbHGGdhdxs8bB2QflTiE76oCUDWdKtaOuOekvOcQVT4TgY5IizWHycCgYEA5IPZ+BHbc4ypXqr0zFxENoxMTF4TfLXxPikgGXXT+s4egf01ZNhIhnRaslCaBH6JfMOYbiRgfvc4Jg5F8r42KtueIS2MKKPYEYzF2PP2IEUtmfLklgeWPU0GHINUClv5UNKsdPQqgNZff5eMjN8rgDdEp8vhz117jBW7iplFew8CgYEA3AORIYyhgc7ieO3375WP7a639LxsN9WcuvsOau14izlRcnXATNFqZnIyUnE4jn0DURllJg0BvI1bhLxmrPsniV8ctqhadsf353+EpgKgdEHChhUfW5bimK9gVpK8yDRSlcIa+7K+hweFHuXiVcIBHW3E1cq+WKNh3vvVGRATR7MCgYB9i8snNXhiBXfQIRCZbl+zsGUC1/TQ4Y0G38VY95ldA/1S4XCCVSmTZT2nFg1oRrT2rOeEK8wwNVbN4a2gbcyIw1wfUkzczxeYnMTeKzqgBCHHoODhZI2wZC7lX2m+v0U8mGJTZwoq+pxBF1wK0Vmu+a5omeUX7n5AOnhs70RzFQKBgBT2MgmkQG8BqwoighDNixz2HIiwuw7Gx1v5N3JwlZ+OInhpR50KBr0j/C9moiDRQFOlu8FYU+YHAcUvvgiVFTs9WJr+hz/x5Wik+ZpnfaoV6dakhIxRX910OBWHfX0FnyitiayZZxWuXbyH4nyRM1H+d1Z3LpN7XYPFMpRkt7GJAoGAHo4QVY5Y2owBq8J4jmkYQzymAGFWHGUkmH9QwWTvN2QRa0l/GahNXLT7wnk3VzI1X95W+8dnUgz0/s7Zr8TAAEMxts0tlzK81GMpQHnX/Vbq7vEJZpWuMExKqHlHRdqNNY66NGocep7dmDMCfCHbYZ/7eT9OOmMTZ1RU+ZZNi0w=
3cd38b2d-324a-4ace-871f-503c1708e0a7	5190e98a-cde6-476b-8e19-7688382fe425	keyUse	SIG
5608a8c7-1d91-430d-9cab-6e1730aa4b33	5190e98a-cde6-476b-8e19-7688382fe425	certificate	MIICmzCCAYMCBgGSdqNqgDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQxMDEwMTMzMjU0WhcNMzQxMDEwMTMzNDM0WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDEZH5pXj2t9bHO5Y/uWDMKrMfwOv61GUdxe+W6Gj8QBsnyIsrrZlUWdBWr5vhIlzaWxRdDQxCSk1KNhh6i+MYjBIP9astUnHJLs+2VdHkkH0/hZxikll13g7NUx/pi/zaSEqpeUyjb3UgC1NIHCOcQ1bAgM6L/c1QKUMu6NQJpPo7tiUFWx/A0nMbVG2YMkJDsTXi0Ts315QmwNQhyVMXw1o1/hd2hs6kYs1zW8Wug0WONCjCQGSSu44g3VKj8D7GfLb22K0DtmJGie4BrgD6+LWv3IoKZuNVf+Udcxlvgp5flirT4+JxAyZMNPP3uN5XeLNsjpKa6J//0ybuC0zR9AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAH94x2q1bdnsUak/hDKtN4vmrqb/REP4OiE0UghesSsBEIxBk68hjrmW0GRn4bHIIKpOcTE00BTC//Nh+l4d7qLuVb1Ex8EdobQiVNMEiDU5DDbg5WKHdic+KYUq17eNZzH1FdOhlfSyLeFcrVl2bygAnHEJR+EafP/CkjjB98sKUfBJb/NU3a6+w4+KNNdhSLGYHUN0Iiu9cUMxij7XNt5Gt2KWdsfnPw6heKrAbV1f77261RV8kACiWz6SOcBMFNk1S/dx/BBokJLtuq5Xn2FFI1wEW7woK6kb+uMa7mkx7qEMzlqOuIjsPQF0V+hneGsh3EUJ1FYsC7fCVnQamHE=
de2140b3-a760-4fca-910e-fad51d0e3610	5190e98a-cde6-476b-8e19-7688382fe425	priority	100
a740d59c-a6ec-4468-850c-abee72d1e149	ca4561ac-4778-4cbc-943a-aaa0e01b1831	priority	100
da66a3ed-3cdf-4b21-abff-6cf64392e836	ca4561ac-4778-4cbc-943a-aaa0e01b1831	algorithm	RSA-OAEP
749fc2e5-6df5-4c01-8467-f4834164fb7b	ca4561ac-4778-4cbc-943a-aaa0e01b1831	certificate	MIICmzCCAYMCBgGSdqNr6zANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQxMDEwMTMzMjU0WhcNMzQxMDEwMTMzNDM0WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC4Rv0Wx3GJwboGUDThUD6U7dP5Ryi4SRYf/145CiAWvBWKVAUeE6bOkiyiPEl4r3CJT9gxv7vRkdv9J58ygHIchaVr4O0ZbxzwQgFT0YJj7Y/e94vabjUR9k4CqYmc8OtQ5n5785xs75f7RT0XTZ4nOP/lBYuzMMk0BuzMICvTakvcPKkdLa0h8s2k2ymhetK0tdwqblLofClMS84nNb6gc3s5gKeahwAkBHbCLN485xxkDwbXpAIQGxwScjN2LyTytD3RVUIyLanF7u8gDWNyy595bOfcP+9xram34o/oq1w17nCqQqHBObg9vE+29oyAdGwTRKosRa0gJnp2bc8bAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAFPvOwmOjHdVeQc7D2j669TC7AeRHxsvx2jjTyzNFXSPoekn4KAgcX5hRPQaE8c5iY3NFIKl+/fUSVvBJdnbOr9s7B0c4wcykEzX+lhUhpBhYiACNcIq1dppb+i+AWGBPuxOncoI1SYaLIMxsM6qan2OURJsh4llAwEzVqOTNVxKoABYD3TsTWUMj4pHQUXLEy2UM5uqseCCI5/MP4e6MRw+izXYn2/BdbIOXqV/LUwdmpTu3sMGDY1u3Rcs3N0tK6MSSAAW/2iMREuHhvZz/kIREJC0ZKzQqTDjBfWCOOYAprzL0kDrP6DRZ7kFvcdxRR+dmqIH7h4U12YxI+19d4c=
46a6314f-ac43-4637-892f-f83e0606712a	ca4561ac-4778-4cbc-943a-aaa0e01b1831	privateKey	MIIEpAIBAAKCAQEAuEb9FsdxicG6BlA04VA+lO3T+UcouEkWH/9eOQogFrwVilQFHhOmzpIsojxJeK9wiU/YMb+70ZHb/SefMoByHIWla+DtGW8c8EIBU9GCY+2P3veL2m41EfZOAqmJnPDrUOZ+e/OcbO+X+0U9F02eJzj/5QWLszDJNAbszCAr02pL3DypHS2tIfLNpNspoXrStLXcKm5S6HwpTEvOJzW+oHN7OYCnmocAJAR2wizePOccZA8G16QCEBscEnIzdi8k8rQ90VVCMi2pxe7vIA1jcsufeWzn3D/vca2pt+KP6KtcNe5wqkKhwTm4PbxPtvaMgHRsE0SqLEWtICZ6dm3PGwIDAQABAoIBAERKUnqBmOrjNywlxyMEmNyaMmb73vREaYWcHm/m97NVKmpj7q2RvMxq0U2iJ9wor/zC8SymkFT+x9bOOyn8/cziHkaXSWaWjdPfshw81SRxIlMPy+070EEC1TAZYh0eDyag9Ji80+hu9hSxOQ2MvyJr9jEKWBYk6ztzoYeYGIW1CrZx8KAohQAuQvMAjd3d6x/MlCnh7ITglSmiMX57cECVgTGFuQprqvV9lTo/fp0zHe9nRonNr58O0uYAkE5ieQkGuooKOlybCFowsP6dTtrkjoEDzfkzj6wDSHOvcDrvVHKG9Zjy3I9VokjDi9FgMKMwYscXPdE1HjM42Ya7yMECgYEA3ncdl0/VfdQkAyg70J50Lkg9VJdjdZDLVbKwo8ZAfewCDSLwRor1/aS0QL3Wl3VcohTHyn5a7gNI3f1VKY774WKgEipqrUVLsSTfVH98/RJ7tKFg+3T/S648GyAsSbcwANW9tuV1o+oqDBmmqRKsrSwGFCN+WW/oOz93K62Cg7sCgYEA1A41A605xf7rRTVc0RNYV7uvy2CYGBkZdn4R/RQeHGnMB2wXaLjqQ4KbWPX7zsx/c2vR7gf5B0Ra5u85v4ILVOWY6cEnhfsAwsOk7lZrDK8ZVXeAde09PIXIDGUuctxJY++s7KjqfUjdwY4oF0TipeEjMyUUEF67v1j+sRoBPCECgYA230CgQuPQ7pOXZ8QhOARGKjFefRzeMcHFuJaTPuJHbQAwh06mx73XO1nuoiSdJSidHe0NyE7baFn/z23DG26LcE01TdsUNARwhDzF1dBZh8aVjjyiqYATBb3znuLtp86iVhY+V6jFrouCgo02JNIMwNAbBYozu0OX4ZaeYmTP4wKBgQDMMV4FS1HdgWoFe6wDu5AO8zEFMt9iHREy05T40N1p2MpZv1EPSzhxh5uVX1B5QtvbRdChV9YJlF3AEE3YRh4pQukq9g7b6eZCpWf1BQwR664GaYsugyK7W8tVfDzs54hYDhvCy6j4uSioT/304iUpPBDMGAEo/j/lsomV+geEYQKBgQCziX3gwIV2FfuTjDY3J2Qws7TTNGMGtOJ+i4mblbnswjR1UzrbwigDrO8QtNmE9c/gXvKyUUBHRo0UgE7/gpNGhThaFxNmtQ6U1rAxFTA5zKXrrx5dsSL/sDeMcQNEH7TJUesCRiz9KifZr0uuB8tvR0LV+tapphZrXtq3eNttgA==
a8e6e0fc-061b-41d6-a794-01eea0110564	ca4561ac-4778-4cbc-943a-aaa0e01b1831	keyUse	ENC
47e586d8-d7f9-4f5a-babe-82fcc6f39035	96f56a7d-c271-4a4a-8c16-4c032a19d4ef	kid	cfcd1931-74a8-433f-b27a-0b0550e3e819
5afe101e-064f-4da6-bb66-b1d727c8faa8	96f56a7d-c271-4a4a-8c16-4c032a19d4ef	secret	M5PZqs1UUGcqK4ceY-RCKCaEIR0nUGklXPeYRG8DI8b7eLhr5X8bCTV4-S1XoKezb8twAVJickaoTMsmclCaTa68ERyMGS2muk-Xny7Buxq3fFxFPrBSRcnGwDyZOa3g3oFN3MKChoV5qKFzTlB1nyOEpJm7njzWRLAFzD1Mg6E
d33bfe89-442e-46ec-bd8a-fdbd6272ed05	96f56a7d-c271-4a4a-8c16-4c032a19d4ef	priority	100
b170ddf3-f866-4180-aa1d-9388ac7836dc	96f56a7d-c271-4a4a-8c16-4c032a19d4ef	algorithm	HS512
599195a9-e03f-43e8-bfe3-1b7472b9a64f	19d635b4-2e1c-4392-ab80-6d478fac6fb2	kid	67bf3575-b70f-45b3-adc4-f1bd9ba5eb65
5aae026a-9fb9-4c5c-90ce-639c7e83a463	19d635b4-2e1c-4392-ab80-6d478fac6fb2	secret	8SgB9knnsaZD0DkWws_NLA
689584e8-aebe-4b23-a55f-256236efa528	19d635b4-2e1c-4392-ab80-6d478fac6fb2	priority	100
decf74d7-6969-4336-a4cc-a4ced11ea5b0	c3ef90b7-c100-4ec9-a4d6-c3c3e9b7a849	kc.user.profile.config	{"attributes":[{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"firstName","displayName":"${firstName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"lastName","displayName":"${lastName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}]}
47a80590-b59b-4610-9b2a-aa2a34bd8122	bdb040cd-38ff-4f60-b94c-633878bef8c9	allowed-protocol-mapper-types	oidc-address-mapper
797d8d63-2666-4644-bbfe-3dfdb7afa1b1	bdb040cd-38ff-4f60-b94c-633878bef8c9	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
584195f9-f2c7-4e19-9679-76a44d377358	bdb040cd-38ff-4f60-b94c-633878bef8c9	allowed-protocol-mapper-types	saml-user-attribute-mapper
aa7a928c-ed94-43e5-bf22-a337c9730234	bdb040cd-38ff-4f60-b94c-633878bef8c9	allowed-protocol-mapper-types	saml-role-list-mapper
3617e260-5d8a-43b9-b789-4a07d550ed99	bdb040cd-38ff-4f60-b94c-633878bef8c9	allowed-protocol-mapper-types	saml-user-property-mapper
cce1f358-f830-45bd-af48-5ea42d1b6270	bdb040cd-38ff-4f60-b94c-633878bef8c9	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
94271947-a1e3-4db2-b976-7155d081ae95	bdb040cd-38ff-4f60-b94c-633878bef8c9	allowed-protocol-mapper-types	oidc-full-name-mapper
0565d6a8-eb6d-47da-a3ef-fa254af2943e	bdb040cd-38ff-4f60-b94c-633878bef8c9	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
1390b6fe-57ba-4c8d-9e94-f5dd2d345028	48adbdb7-12d0-464b-a2a9-dd67484bb0e3	priority	100
eaf7a4ec-d039-4828-a264-b70445905461	48adbdb7-12d0-464b-a2a9-dd67484bb0e3	algorithm	RSA-OAEP
3783d99b-e719-4471-957b-4d8751c2ad27	48adbdb7-12d0-464b-a2a9-dd67484bb0e3	privateKey	MIIEowIBAAKCAQEAnb7/ZRn28EVAVCpcOCJAjiDNeq5rOedbHF4DxZs77GhHj4+Pa9yO2zIan52XB+vleEEb7iv8FnfcwJYvvK0OdFIXTDOUg/vf303urQEFtvk+MvfuvLXYtnb6iMfybG4IGHf58y6y8N39tGT3eXWsYz1u0FxWY25uHuwGTRLxNPDxKOzAgW7hOGEHXngqx02W7+XRH8SeP04XhGaXjeqkbiCynEHYbDa+SI3jiDYSsieDO+WwEFsp144SINcjyo4zfp/2Z6YF4WXGL+ybvo/hwLpj52Imon93opIVjOBQipjmLklbcd1/WIiuOvkr9I/4C5E4Q+IPxNoQHCWRAPqltwIDAQABAoIBAADvfbWXHn8fn1lgbu+Tnxe4sL9GLYidtffzGXP15GMV3ebHY9hbPyr5nxgh58q6PBV8fV0/kYfTP3ySPMeSVyrwGbHv/womrOs2xnBBjfZ0f/PuwycHWmOqok28ByoGylwqyfwGjjUeJpUH9u0XejrpxbB3+7iB59FIdmPFSvzqC9awveZdhWsav+FAhhS4XJr99cxLlfaUcyhEFblBCTaRtkv4HZ+hfVRUyWC7AQeyYxQM1leaegHreLxd0cYQ9P1v8ugFLYitGRHW9yJm0IcWGoiZCUfqEKL+r3lNxA4WVo/sCazKS4OBYJV5ck/Q3ndGhOxOzL14AUgb26g6/zECgYEA0ZfhUN8XcKxC5KLI2BXGGejQxMKiNGcA5EtUJs0cMN/jVVQ+tUVMQBOKb5ezHlDbj4JZUjUVuUXWdibZIJFFy8vNZHu209KA+jjLb0NvxrUBOV738l7gXbAFJiz+C00FAPyL9xjltzAD0x1OfW8fU4UPIU1Cj7/u3j4t10fVGv0CgYEAwKxTgAe3vyy4fhELiTOnG/iogeBk/NZF6IrOYrKxmgSg6SCo8wRfGjVgS9wPoHznw5L2X1KbwtxFAmU1P3T1mJ5xvWnnJWuRiJp0ZtwzsUk4wgCTHv/9lfTA4VSHW7tXv7Lhqg83sQRdRwO9Q91csntSGJ06QQzFYFZpK2TYo8MCgYAdJBjXvazspYbHczqpkJ1yjMQ6FzWmQ4wEMdUJcAszYG2jN4tgeLoZTp441ca5uFROp7jzjR3wHJ2s38nglVI2+6cbCXhqCyKTp8HhPmcUIaaB64pd0IMxg3+zxx2rRJIliPeM65FE3xApEjIPjpu0aROpdayDgBQeIlcNT5d5oQKBgChqPV2mwMlOJSj0hFn0RsJcR2Ru4GAUxjdAHoifeReYjvQ30JihOx2xQpDHCVQdvzPL+PgHyPp339XfyuqTqwynd65Gr6Cuzqk71NzapdEzTb+MBVBEXDn/TBI3++inBIIGkMVuSb1M8A/8XdAFd/NMYO0e1eBdQG2z0n2yuqqnAoGBAMljwhvlK94JufDQkmmjX4rZowzHJ5oSjvQ9gvb9dCfcY9A7OFKA74O3vYqldjD5uvdBQLXfXZqjVYUzDIPJxpLuaODEDj4Pj5v9JkPljNZwF9KBkLtneaspoB/qVK0gKVqhe5gBvFt6McHximw792GG4ptNDsfd9eRvcD9UcNKH
f2a61466-a4e9-4c7b-b75b-066e62aaf1c8	48adbdb7-12d0-464b-a2a9-dd67484bb0e3	certificate	MIICpTCCAY0CBgGSdqN1jTANBgkqhkiG9w0BAQsFADAWMRQwEgYDVQQDDAtLYWhvb3RSZWFsbTAeFw0yNDEwMTAxMzMyNTZaFw0zNDEwMTAxMzM0MzZaMBYxFDASBgNVBAMMC0thaG9vdFJlYWxtMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnb7/ZRn28EVAVCpcOCJAjiDNeq5rOedbHF4DxZs77GhHj4+Pa9yO2zIan52XB+vleEEb7iv8FnfcwJYvvK0OdFIXTDOUg/vf303urQEFtvk+MvfuvLXYtnb6iMfybG4IGHf58y6y8N39tGT3eXWsYz1u0FxWY25uHuwGTRLxNPDxKOzAgW7hOGEHXngqx02W7+XRH8SeP04XhGaXjeqkbiCynEHYbDa+SI3jiDYSsieDO+WwEFsp144SINcjyo4zfp/2Z6YF4WXGL+ybvo/hwLpj52Imon93opIVjOBQipjmLklbcd1/WIiuOvkr9I/4C5E4Q+IPxNoQHCWRAPqltwIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQAZ7Il/MamD5ZzE0qrHqWLKlzeeASCgqNfOztqdMInt+GOQYPhTeSgd4s08Y0oOhz0Rt0mtoP6nNq/sDZ/ESeyyLcipqjb+jpV6x1efB+4+QinWtcPXa9QhR21keH/ieTyG/HqQqfXqRBjPs5frx5xMi7X42y/dskNvemt9tgdkk4UCjOR98nlbUwZi3VYv23LRsJgw5/BiyQ/M/Q5dU0opYYtSrOxLJ3dut2vJLhN4aua3NNCBGWh5CmFMy9fSWaItRaDmU4Ifajvijmz5TmMFFyFTI+FxBVwfY2bZXT5PZMCuJs4LdgoWS8LiN2WJ/2VMNt0ta5TFIyn9vt/AJom8
59d19980-a3d3-464c-bc43-3bfc26ef114b	eb1d57af-3ef8-4a79-b372-771803ae758d	algorithm	HS512
75966518-0a77-43b9-9b1d-fe8b98a4a18f	eb1d57af-3ef8-4a79-b372-771803ae758d	secret	KlQkTo-KNPachJLd9ematjPZh-R3HtMnv8Dssn4r_KTgAPEsJVdnCKFH5EuKx4rptLj2d7_lodIeAr9sKnml1_CTV1_YiBRJZzKZJgQYKFj4sLV2EELgQ-cfqyz6MwYNad2ZkjP6JM4rEJGOjWdrCasMb8teoAAB83mzglWEROI
83d7bc19-0607-463d-90dc-2b69cf5fe462	eb1d57af-3ef8-4a79-b372-771803ae758d	priority	100
45fd5101-669f-483e-96bd-80adbd4a33f9	eb1d57af-3ef8-4a79-b372-771803ae758d	kid	b9d99ae3-dd07-47bd-a96e-72fcb1884875
4f3d0526-20f6-45f0-8f4f-d749912ad3e0	9653da47-83a9-446c-9042-d40ef7de8444	allow-default-scopes	true
af7ddf34-a037-431e-ab21-2aa840b55f78	bf935b3c-676d-491e-be9b-0c0453cc6d0f	allow-default-scopes	true
8e47557c-54d1-4eb1-bbdc-5bfbd85253e7	7871ad35-69af-4ad4-b413-e66ecaf1ef98	client-uris-must-match	true
a16ca6fb-fa10-4b7a-b2aa-9c6b374573d9	7871ad35-69af-4ad4-b413-e66ecaf1ef98	host-sending-registration-request-must-match	true
c0b416e0-b52e-456e-ab21-9e8b12b6b62e	7a60fd1b-0498-4d52-90c9-bc71c26998ac	allowed-protocol-mapper-types	oidc-address-mapper
65f1be77-f6f4-483b-8808-634d0474d3a1	7a60fd1b-0498-4d52-90c9-bc71c26998ac	allowed-protocol-mapper-types	saml-user-property-mapper
a0f0d40c-29d0-41f7-8b72-e76c741cb0dc	7a60fd1b-0498-4d52-90c9-bc71c26998ac	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
fb33a52c-37ac-4814-82e4-fe6c344c5157	7a60fd1b-0498-4d52-90c9-bc71c26998ac	allowed-protocol-mapper-types	saml-role-list-mapper
c62ff176-0893-4869-84bf-93b544a59833	7a60fd1b-0498-4d52-90c9-bc71c26998ac	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
24879770-5c00-4811-8a7a-e6e33a0b9c48	7a60fd1b-0498-4d52-90c9-bc71c26998ac	allowed-protocol-mapper-types	oidc-full-name-mapper
dd950ec1-0c10-4b7f-8fd6-0bd8839085fe	7a60fd1b-0498-4d52-90c9-bc71c26998ac	allowed-protocol-mapper-types	saml-user-attribute-mapper
b5eb22c3-538a-4399-ac3e-1ef227fa3fe5	7a60fd1b-0498-4d52-90c9-bc71c26998ac	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
8d6e1bfe-19d6-4079-8df2-a92a5e2729c7	58cc4c92-2497-46dc-8eec-e39e4bd808df	priority	100
1984ef58-8d3a-417a-924a-f53ccf789728	58cc4c92-2497-46dc-8eec-e39e4bd808df	certificate	MIICpTCCAY0CBgGSdqN0tzANBgkqhkiG9w0BAQsFADAWMRQwEgYDVQQDDAtLYWhvb3RSZWFsbTAeFw0yNDEwMTAxMzMyNTZaFw0zNDEwMTAxMzM0MzZaMBYxFDASBgNVBAMMC0thaG9vdFJlYWxtMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtdtHwTY/08AJ2U+EXS7OcyMJmWX7mgXnJQao+MLXhyFAW6DO/9gIXTptrfJHgSeQ9k7kgkC39rGXx1MZs9UjmPtCfJY1YkWQIww1i56ZHnpzNGUW6+Iq2vdFVtLrDG09XqnrTusCg+TlwpSG6RHKLtOF594XPr+ocu0LVExdY+/TuRpuH2iZso4JdqpcY+hKWDpSJT1BaaT1PHPe2cOZXFwa4PpoHmAlmu5IExRCjT1UfGtGALHkvLfhXWj5nDMfhkgsfVjzLRdqUwYx/yV5Mh0WTWQ4mUKBDHy45/B+C8LGEck/9FROYrrZzTMuJ5ASbGK9jsAlVXQp3reZIXGD6wIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQAu+uguobQOuRwkHRgjQA7dQiYe1Oj7NWBj1rADkTKy6Oicz5LyA1h2hJN3zjHbJ6kVDCHiQA+AVPLZEEK3zDyhGwx9UlTfkjoEwu8/w5lFEHkcuzjohJWn5V6feUmyhyiJv4CAAlwXXt13L40T/wVF5KKmCaBVaGx5uANcPtr6PjyRMB9C5RS8cM3KQWgjXclZGJyv8bZgx2zYgMn/V7jTBgf3w5OEyVgyL5r5uFuy/FhcoHUrBJOItN6DtWnRvw2o1lru5V+PMEgHURKs3JwoYpxQVhdyadbgDQ5k6ycfuYvD7f1gdcwTvByWL77E4mTKL7sTK0qpq4swI7fLBO/w
919f70f4-26ec-465a-bbbd-150d17b3e341	58cc4c92-2497-46dc-8eec-e39e4bd808df	privateKey	MIIEogIBAAKCAQEAtdtHwTY/08AJ2U+EXS7OcyMJmWX7mgXnJQao+MLXhyFAW6DO/9gIXTptrfJHgSeQ9k7kgkC39rGXx1MZs9UjmPtCfJY1YkWQIww1i56ZHnpzNGUW6+Iq2vdFVtLrDG09XqnrTusCg+TlwpSG6RHKLtOF594XPr+ocu0LVExdY+/TuRpuH2iZso4JdqpcY+hKWDpSJT1BaaT1PHPe2cOZXFwa4PpoHmAlmu5IExRCjT1UfGtGALHkvLfhXWj5nDMfhkgsfVjzLRdqUwYx/yV5Mh0WTWQ4mUKBDHy45/B+C8LGEck/9FROYrrZzTMuJ5ASbGK9jsAlVXQp3reZIXGD6wIDAQABAoIBAFSNkswzs/N5G1stjIZix9xikwj+kL/pNLJTaWbX+Ku8exbfKr9rq1/lVa+FsVdMlSrgPYCOJLqPkdk8OvwRAk8Tq7MPh9ycKUsSVycGY3z3Q+89fS3JZ1GNnHCk+mI5vEnySRTVUcMPPwB8XEmrWszwzhajfT1QkTp2GklkhBt9US8VLAkcCAE6GR9G0zqgwFkgWAWcI2jfQkfS3uOSR6Wohm7e/Pj+U6oWVl6fuCZunwpc/cF8ZJw6eao0h2NC+1++4/6JlVp7AG3i1Iv/hDbjXBwgPKT1lI4mksDHoNdbsf4RB1QGbFL/mzpMXkKyFusVcu6rUmkHJIUbZY3f1rkCgYEA9V8YU2MbHCL/DC7KR7tdy4LYbfPMuyJTlvWkYmPY61p7ikUQ1UT7T41AYkx+qlFqmEC14wXEP5Rme74+p3ljTNVfhmvdDbaW+z8ZECknbs7b5uIWWiJo8t6wycG8IdxcMV+vLnQ5+903DHDaOOPJzZVk7aR78vq9ftTwLIaXLJcCgYEAvbvfnZXh5HNwJzex0XOWQfUxWuW3Ur5+s3u0YrTeAi6JqwlfAHIuBzCe7kc+PQ07E7v5EUwm7warZNwiA+dTmj5+8a+cYI9kZAObyS95t1yDCSE3qnujAkwdxfiKIAXK1QkutzwndZGa53tI8tpeAIJvtdG7aY6lhCVYRItqic0CgYBduzzkpcg2YFwDgGA/NKDo3AvnPKmplrxNv3pTJ4c2qLLmp+l9PsOtqOy+YDBGyaEplhalKY/FJeBcRtlSSnmXYS8Df3LLCUP1qC3f0YjBuH2iXh1hwyFKHa109O/0E2SYa8/UtAtuXhvoQbfq4YE2ampKqXm74PLAX4F70NIw8wKBgHKcHkPu2flJ0iGefwdqrwVAu4OQ5+BPufFpdFl7r+/ZdMegbYazciJduGNvHaV7bIhLL/TG723LtZTDdLiu781omv4benbJp3bSxzQMPZYJiA3nxtxwutMUb5e6vpUBaritR07gQ2W9grj5u+MXDVl5cUl/W5oz1L+yX1Noc/6xAoGAPSyitDc5V1FaaZiA94/KG38hvKHsd+BySdc4mRcK2dbAyKYfz7d2y/9CRrnTfb6e7WkfLeo4UWbColNddf2nOMxFEZPH21C6Oj+1aWMbGwlJ1pK7ZT8Io4e/yagiPWub9f8935t3rxzs960gZ9zcShn/JyHAcG/hq7VnGnoCElI=
0b812723-9a64-43f2-b045-8e5a96bc43aa	17ba4ca7-ecfb-4890-8ccc-9a1282398e5b	max-clients	200
e52ed945-5845-4c03-8585-dd5d8f599c0d	f20faec2-b233-4cd1-86c4-9f16d01be0c0	priority	100
102f4d73-f3c4-485f-80c2-9837998f6a21	f20faec2-b233-4cd1-86c4-9f16d01be0c0	secret	auNQZYEZxLUwPpJLde5q0g
554f6c9f-8c4e-44e9-9dd1-e0bc10b68244	f20faec2-b233-4cd1-86c4-9f16d01be0c0	kid	199f2c79-1dc3-4390-bae3-1ef79de4e5ff
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.composite_role (composite, child_role) FROM stdin;
d2d4eb12-128b-461b-8e25-7262a9e698d0	a43f31aa-d354-456e-a2a3-595d2866c8d0
d2d4eb12-128b-461b-8e25-7262a9e698d0	5043f973-0183-4faf-a06b-39b580108037
d2d4eb12-128b-461b-8e25-7262a9e698d0	8f35fc04-6bf5-47ae-bcf4-11763bbe15f6
d2d4eb12-128b-461b-8e25-7262a9e698d0	439895d9-5f6c-4f17-baeb-b5ddde5f2edf
d2d4eb12-128b-461b-8e25-7262a9e698d0	322692b7-727f-4612-9935-77024aeb338a
d2d4eb12-128b-461b-8e25-7262a9e698d0	e2c853f9-6325-44b9-9aa2-113483167939
d2d4eb12-128b-461b-8e25-7262a9e698d0	b28fb1db-586c-47c3-b06e-13c20fb9e182
d2d4eb12-128b-461b-8e25-7262a9e698d0	a874f8e2-c19c-4ed8-9690-cafd464c312c
d2d4eb12-128b-461b-8e25-7262a9e698d0	6b3d7998-8e20-436a-a393-3a22f5db09ca
d2d4eb12-128b-461b-8e25-7262a9e698d0	f4fc69ab-b7fb-4ce6-b1b0-0ad3a70d15d2
d2d4eb12-128b-461b-8e25-7262a9e698d0	7510a4c6-c5cb-45f9-a0e0-ae3755f47be5
d2d4eb12-128b-461b-8e25-7262a9e698d0	5434cc5a-b29f-4a8c-b29a-dc65c1c2b53e
d2d4eb12-128b-461b-8e25-7262a9e698d0	abe81c1d-2bd3-48d6-94c9-29b5d2e8d897
d2d4eb12-128b-461b-8e25-7262a9e698d0	e154d09a-facf-4496-b24b-2fd559513d8c
d2d4eb12-128b-461b-8e25-7262a9e698d0	cd23e02e-ff77-4447-855a-e22551653cf3
d2d4eb12-128b-461b-8e25-7262a9e698d0	43662433-9285-4997-a207-dd5678a12695
d2d4eb12-128b-461b-8e25-7262a9e698d0	b9097f2b-a6df-46bb-b4c4-b0bf5d2eec20
d2d4eb12-128b-461b-8e25-7262a9e698d0	eeb82e16-5c68-4661-a783-c356c77cf067
322692b7-727f-4612-9935-77024aeb338a	43662433-9285-4997-a207-dd5678a12695
439895d9-5f6c-4f17-baeb-b5ddde5f2edf	eeb82e16-5c68-4661-a783-c356c77cf067
439895d9-5f6c-4f17-baeb-b5ddde5f2edf	cd23e02e-ff77-4447-855a-e22551653cf3
f2464307-faaf-4598-98a2-33952a03351b	832896b9-0856-461d-a630-e09143c1a553
f2464307-faaf-4598-98a2-33952a03351b	98924bda-5e7e-4b8d-aebe-be7dd2b2bcd1
98924bda-5e7e-4b8d-aebe-be7dd2b2bcd1	b5bd9d72-ab09-422d-a823-4a5eaca75c1e
fec69db6-6386-4b30-89c2-41fb005f7f50	3f8fd2da-38c5-4748-ab0d-9a992ea8071e
d2d4eb12-128b-461b-8e25-7262a9e698d0	74d369ce-87ca-434f-81df-6847d22d5954
f2464307-faaf-4598-98a2-33952a03351b	f1ea46a6-8469-4ed6-b22b-437698470fe4
f2464307-faaf-4598-98a2-33952a03351b	0062e8b5-4b41-40e4-bd7d-3019e856ec0f
d2d4eb12-128b-461b-8e25-7262a9e698d0	1be6abbf-9df3-4c6d-957c-1fbaf325c5fa
d2d4eb12-128b-461b-8e25-7262a9e698d0	f01888b6-75d6-482d-be86-43660422c1cb
d2d4eb12-128b-461b-8e25-7262a9e698d0	a1b82aa0-1dd0-44f0-855c-1ea2df9319cf
d2d4eb12-128b-461b-8e25-7262a9e698d0	45057dc9-9c54-44a1-848b-5c84158728e5
d2d4eb12-128b-461b-8e25-7262a9e698d0	bb46b286-0977-4da3-bcab-cd589e337e63
d2d4eb12-128b-461b-8e25-7262a9e698d0	53e56d06-d2d7-4ffd-afe6-397bd9ca897c
d2d4eb12-128b-461b-8e25-7262a9e698d0	0f6eb75e-46ea-4155-96a0-3ffd9e0d258b
d2d4eb12-128b-461b-8e25-7262a9e698d0	fb680dc6-531d-469f-b36e-93408e2b0d60
d2d4eb12-128b-461b-8e25-7262a9e698d0	5f3050a7-7a30-42cc-825a-bce856b6a301
d2d4eb12-128b-461b-8e25-7262a9e698d0	17573d35-22c1-4115-96a2-936770d9824d
d2d4eb12-128b-461b-8e25-7262a9e698d0	1f4f68e0-d36f-4446-b912-20700ddf352b
d2d4eb12-128b-461b-8e25-7262a9e698d0	e126bc20-9511-4c1b-8b88-32a2396318a7
d2d4eb12-128b-461b-8e25-7262a9e698d0	7f7145bf-e1d9-4bc1-bdf9-85958d2bc435
d2d4eb12-128b-461b-8e25-7262a9e698d0	f3bd6567-c7b7-4705-8c2d-801f906df609
d2d4eb12-128b-461b-8e25-7262a9e698d0	be28186b-1e1a-4a92-8b85-2c3a0304aaf7
d2d4eb12-128b-461b-8e25-7262a9e698d0	15391ed0-c9c1-4776-84de-f5b14e800be1
d2d4eb12-128b-461b-8e25-7262a9e698d0	59ad28a1-d74f-42bd-b81e-a9fa2fd422dd
45057dc9-9c54-44a1-848b-5c84158728e5	be28186b-1e1a-4a92-8b85-2c3a0304aaf7
a1b82aa0-1dd0-44f0-855c-1ea2df9319cf	f3bd6567-c7b7-4705-8c2d-801f906df609
a1b82aa0-1dd0-44f0-855c-1ea2df9319cf	59ad28a1-d74f-42bd-b81e-a9fa2fd422dd
2e7bac1d-957d-482c-9c24-faddde4cfc3a	a9aaf9fb-d473-4074-a23b-ca0dd6f0f0a7
97930d2c-082e-41db-a473-12ccf480ff01	40d6ddd3-5df1-4479-921f-efd49322e0d7
c87b0034-dfa4-4006-9ae5-d4881b8063fd	62de843a-07e6-4024-a29e-b2f08923257d
c87b0034-dfa4-4006-9ae5-d4881b8063fd	99beeb18-10d4-4f7d-a691-b39d1965953a
cc4f33b7-f97b-411d-a100-31ecbcf0af0f	e8390104-1626-4e48-b9a4-ad4df06104e2
e3a66f8f-ca9d-48c9-b29b-1e465436380a	8296084c-72f5-4c89-b75b-b71a6695e425
e3a66f8f-ca9d-48c9-b29b-1e465436380a	85e42273-3171-42d8-99c1-07e2dea14342
e3a66f8f-ca9d-48c9-b29b-1e465436380a	2e7bac1d-957d-482c-9c24-faddde4cfc3a
e3a66f8f-ca9d-48c9-b29b-1e465436380a	5517c357-15bf-4c96-853b-f2b781488f38
f9b65eeb-2e74-46d2-82b5-27f755502d09	7fd54588-4d20-4be8-971a-ced6f9a5a94c
f9b65eeb-2e74-46d2-82b5-27f755502d09	4ad07ae9-f1a4-41be-9c38-0ca643f0b91d
f9b65eeb-2e74-46d2-82b5-27f755502d09	cc4f33b7-f97b-411d-a100-31ecbcf0af0f
f9b65eeb-2e74-46d2-82b5-27f755502d09	ba586b29-b24e-4fcb-a6cf-b146824c08cd
f9b65eeb-2e74-46d2-82b5-27f755502d09	d9f3e0d0-2588-48c8-b971-5ff5faf66225
f9b65eeb-2e74-46d2-82b5-27f755502d09	85918706-3485-41e5-a91c-dc4dc8eca3b9
f9b65eeb-2e74-46d2-82b5-27f755502d09	18ec3d04-8385-4bb2-9729-f745aadd6c27
f9b65eeb-2e74-46d2-82b5-27f755502d09	07c7f3f4-425e-44fd-a5f3-e7b9b0212dc1
f9b65eeb-2e74-46d2-82b5-27f755502d09	e8390104-1626-4e48-b9a4-ad4df06104e2
f9b65eeb-2e74-46d2-82b5-27f755502d09	c87b0034-dfa4-4006-9ae5-d4881b8063fd
f9b65eeb-2e74-46d2-82b5-27f755502d09	62de843a-07e6-4024-a29e-b2f08923257d
f9b65eeb-2e74-46d2-82b5-27f755502d09	1071fcf7-4bf7-4ee4-b3a2-31c2d1d70123
f9b65eeb-2e74-46d2-82b5-27f755502d09	4358793c-8198-4ee0-b66f-25203aaee841
f9b65eeb-2e74-46d2-82b5-27f755502d09	712d2bdd-3757-47f9-ab43-8f8a547617ea
f9b65eeb-2e74-46d2-82b5-27f755502d09	61a068d9-6d25-4724-a87c-023401ca478f
f9b65eeb-2e74-46d2-82b5-27f755502d09	90a6b532-df65-4c37-8046-51ce1e524f50
f9b65eeb-2e74-46d2-82b5-27f755502d09	99beeb18-10d4-4f7d-a691-b39d1965953a
f9b65eeb-2e74-46d2-82b5-27f755502d09	bd5f39a3-8d2e-4b7c-9c78-522acf3d9333
d2d4eb12-128b-461b-8e25-7262a9e698d0	12e5a6e0-f995-4660-a58d-204210250f0a
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
b0b0694b-8e7d-46fc-8033-c972771b6e3d	\N	password	bbea8fc6-e191-4d29-80c6-ed86e8affd08	1728567277286	\N	{"value":"pcBEKrrKTgtL3mfC9dITknO+P34tEwR1qzHTvRnep6k=","salt":"Yrlzoy+3A0eOG9gRKHCcoQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10
fa2f0222-e337-4014-b609-e8635027676b	\N	password	86c4bda2-24ac-4cdb-a3dc-32cef3a24daf	1728570061698	My password	{"value":"kSUR/EMEHd/YO8xuRGSFeEB1OKvTRaxW/WZsyvA5Sck=","salt":"Z4LlyEcMR1n1CrNga2ndYQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2024-10-10 13:34:27.399675	1	EXECUTED	9:6f1016664e21e16d26517a4418f5e3df	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.29.1	\N	\N	8567267019
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2024-10-10 13:34:27.414382	2	MARK_RAN	9:828775b1596a07d1200ba1d49e5e3941	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.29.1	\N	\N	8567267019
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2024-10-10 13:34:27.447853	3	EXECUTED	9:5f090e44a7d595883c1fb61f4b41fd38	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.29.1	\N	\N	8567267019
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2024-10-10 13:34:27.453337	4	EXECUTED	9:c07e577387a3d2c04d1adc9aaad8730e	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	8567267019
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2024-10-10 13:34:27.520729	5	EXECUTED	9:b68ce996c655922dbcd2fe6b6ae72686	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.29.1	\N	\N	8567267019
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2024-10-10 13:34:27.527898	6	MARK_RAN	9:543b5c9989f024fe35c6f6c5a97de88e	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.29.1	\N	\N	8567267019
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2024-10-10 13:34:27.593657	7	EXECUTED	9:765afebbe21cf5bbca048e632df38336	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.29.1	\N	\N	8567267019
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2024-10-10 13:34:27.599476	8	MARK_RAN	9:db4a145ba11a6fdaefb397f6dbf829a1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.29.1	\N	\N	8567267019
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2024-10-10 13:34:27.606607	9	EXECUTED	9:9d05c7be10cdb873f8bcb41bc3a8ab23	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.29.1	\N	\N	8567267019
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2024-10-10 13:34:27.675039	10	EXECUTED	9:18593702353128d53111f9b1ff0b82b8	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.29.1	\N	\N	8567267019
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2024-10-10 13:34:27.712078	11	EXECUTED	9:6122efe5f090e41a85c0f1c9e52cbb62	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	8567267019
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2024-10-10 13:34:27.718123	12	MARK_RAN	9:e1ff28bf7568451453f844c5d54bb0b5	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	8567267019
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2024-10-10 13:34:27.736266	13	EXECUTED	9:7af32cd8957fbc069f796b61217483fd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	8567267019
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-10-10 13:34:27.747357	14	EXECUTED	9:6005e15e84714cd83226bf7879f54190	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.29.1	\N	\N	8567267019
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-10-10 13:34:27.749208	15	MARK_RAN	9:bf656f5a2b055d07f314431cae76f06c	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8567267019
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-10-10 13:34:27.75154	16	MARK_RAN	9:f8dadc9284440469dcf71e25ca6ab99b	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.29.1	\N	\N	8567267019
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-10-10 13:34:27.755197	17	EXECUTED	9:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.29.1	\N	\N	8567267019
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2024-10-10 13:34:27.780752	18	EXECUTED	9:3368ff0be4c2855ee2dd9ca813b38d8e	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.29.1	\N	\N	8567267019
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2024-10-10 13:34:27.80729	19	EXECUTED	9:8ac2fb5dd030b24c0570a763ed75ed20	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.29.1	\N	\N	8567267019
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2024-10-10 13:34:27.812723	20	EXECUTED	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.29.1	\N	\N	8567267019
26.0.0-33201-org-redirect-url	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-10-10 13:34:31.721743	144	EXECUTED	9:4d0e22b0ac68ebe9794fa9cb752ea660	addColumn tableName=ORG		\N	4.29.1	\N	\N	8567267019
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2024-10-10 13:34:27.816142	21	MARK_RAN	9:831e82914316dc8a57dc09d755f23c51	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.29.1	\N	\N	8567267019
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2024-10-10 13:34:27.819569	22	MARK_RAN	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.29.1	\N	\N	8567267019
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2024-10-10 13:34:27.896632	23	EXECUTED	9:bc3d0f9e823a69dc21e23e94c7a94bb1	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.29.1	\N	\N	8567267019
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2024-10-10 13:34:27.901356	24	EXECUTED	9:c9999da42f543575ab790e76439a2679	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.29.1	\N	\N	8567267019
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2024-10-10 13:34:27.90297	25	MARK_RAN	9:0d6c65c6f58732d81569e77b10ba301d	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.29.1	\N	\N	8567267019
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2024-10-10 13:34:28.250012	26	EXECUTED	9:fc576660fc016ae53d2d4778d84d86d0	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.29.1	\N	\N	8567267019
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2024-10-10 13:34:28.286208	27	EXECUTED	9:43ed6b0da89ff77206289e87eaa9c024	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.29.1	\N	\N	8567267019
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2024-10-10 13:34:28.289177	28	EXECUTED	9:44bae577f551b3738740281eceb4ea70	update tableName=RESOURCE_SERVER_POLICY		\N	4.29.1	\N	\N	8567267019
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2024-10-10 13:34:28.316181	29	EXECUTED	9:bd88e1f833df0420b01e114533aee5e8	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.29.1	\N	\N	8567267019
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2024-10-10 13:34:28.326255	30	EXECUTED	9:a7022af5267f019d020edfe316ef4371	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.29.1	\N	\N	8567267019
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2024-10-10 13:34:28.340522	31	EXECUTED	9:fc155c394040654d6a79227e56f5e25a	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.29.1	\N	\N	8567267019
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2024-10-10 13:34:28.345911	32	EXECUTED	9:eac4ffb2a14795e5dc7b426063e54d88	customChange		\N	4.29.1	\N	\N	8567267019
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-10-10 13:34:28.352267	33	EXECUTED	9:54937c05672568c4c64fc9524c1e9462	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8567267019
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-10-10 13:34:28.354765	34	MARK_RAN	9:3a32bace77c84d7678d035a7f5a8084e	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.29.1	\N	\N	8567267019
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-10-10 13:34:28.373613	35	EXECUTED	9:33d72168746f81f98ae3a1e8e0ca3554	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.29.1	\N	\N	8567267019
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2024-10-10 13:34:28.37878	36	EXECUTED	9:61b6d3d7a4c0e0024b0c839da283da0c	addColumn tableName=REALM		\N	4.29.1	\N	\N	8567267019
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-10-10 13:34:28.383601	37	EXECUTED	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	8567267019
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2024-10-10 13:34:28.388082	38	EXECUTED	9:a2b870802540cb3faa72098db5388af3	addColumn tableName=FED_USER_CONSENT		\N	4.29.1	\N	\N	8567267019
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2024-10-10 13:34:28.392339	39	EXECUTED	9:132a67499ba24bcc54fb5cbdcfe7e4c0	addColumn tableName=IDENTITY_PROVIDER		\N	4.29.1	\N	\N	8567267019
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-10-10 13:34:28.394015	40	MARK_RAN	9:938f894c032f5430f2b0fafb1a243462	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.29.1	\N	\N	8567267019
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-10-10 13:34:28.396751	41	MARK_RAN	9:845c332ff1874dc5d35974b0babf3006	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.29.1	\N	\N	8567267019
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2024-10-10 13:34:28.401393	42	EXECUTED	9:fc86359c079781adc577c5a217e4d04c	customChange		\N	4.29.1	\N	\N	8567267019
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-10-10 13:34:29.58012	43	EXECUTED	9:59a64800e3c0d09b825f8a3b444fa8f4	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.29.1	\N	\N	8567267019
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2024-10-10 13:34:29.584393	44	EXECUTED	9:d48d6da5c6ccf667807f633fe489ce88	addColumn tableName=USER_ENTITY		\N	4.29.1	\N	\N	8567267019
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-10-10 13:34:29.588222	45	EXECUTED	9:dde36f7973e80d71fceee683bc5d2951	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.29.1	\N	\N	8567267019
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-10-10 13:34:29.592696	46	EXECUTED	9:b855e9b0a406b34fa323235a0cf4f640	customChange		\N	4.29.1	\N	\N	8567267019
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-10-10 13:34:29.594184	47	MARK_RAN	9:51abbacd7b416c50c4421a8cabf7927e	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.29.1	\N	\N	8567267019
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-10-10 13:34:29.685412	48	EXECUTED	9:bdc99e567b3398bac83263d375aad143	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.29.1	\N	\N	8567267019
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-10-10 13:34:29.689143	49	EXECUTED	9:d198654156881c46bfba39abd7769e69	addColumn tableName=REALM		\N	4.29.1	\N	\N	8567267019
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2024-10-10 13:34:29.704062	50	EXECUTED	9:cfdd8736332ccdd72c5256ccb42335db	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.29.1	\N	\N	8567267019
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2024-10-10 13:34:29.966255	51	EXECUTED	9:7c84de3d9bd84d7f077607c1a4dcb714	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.29.1	\N	\N	8567267019
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2024-10-10 13:34:29.969214	52	EXECUTED	9:5a6bb36cbefb6a9d6928452c0852af2d	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8567267019
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2024-10-10 13:34:29.971864	53	EXECUTED	9:8f23e334dbc59f82e0a328373ca6ced0	update tableName=REALM		\N	4.29.1	\N	\N	8567267019
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2024-10-10 13:34:29.97415	54	EXECUTED	9:9156214268f09d970cdf0e1564d866af	update tableName=CLIENT		\N	4.29.1	\N	\N	8567267019
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-10-10 13:34:29.978355	55	EXECUTED	9:db806613b1ed154826c02610b7dbdf74	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.29.1	\N	\N	8567267019
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-10-10 13:34:29.982073	56	EXECUTED	9:229a041fb72d5beac76bb94a5fa709de	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.29.1	\N	\N	8567267019
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-10-10 13:34:30.016733	57	EXECUTED	9:079899dade9c1e683f26b2aa9ca6ff04	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.29.1	\N	\N	8567267019
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-10-10 13:34:30.304831	58	EXECUTED	9:139b79bcbbfe903bb1c2d2a4dbf001d9	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.29.1	\N	\N	8567267019
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2024-10-10 13:34:30.319568	59	EXECUTED	9:b55738ad889860c625ba2bf483495a04	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.29.1	\N	\N	8567267019
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2024-10-10 13:34:30.324992	60	EXECUTED	9:e0057eac39aa8fc8e09ac6cfa4ae15fe	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.29.1	\N	\N	8567267019
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2024-10-10 13:34:30.332532	61	EXECUTED	9:42a33806f3a0443fe0e7feeec821326c	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.29.1	\N	\N	8567267019
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2024-10-10 13:34:30.337038	62	EXECUTED	9:9968206fca46eecc1f51db9c024bfe56	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.29.1	\N	\N	8567267019
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2024-10-10 13:34:30.340905	63	EXECUTED	9:92143a6daea0a3f3b8f598c97ce55c3d	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.29.1	\N	\N	8567267019
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2024-10-10 13:34:30.344133	64	EXECUTED	9:82bab26a27195d889fb0429003b18f40	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.29.1	\N	\N	8567267019
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2024-10-10 13:34:30.346885	65	EXECUTED	9:e590c88ddc0b38b0ae4249bbfcb5abc3	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.29.1	\N	\N	8567267019
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2024-10-10 13:34:30.379934	66	EXECUTED	9:5c1f475536118dbdc38d5d7977950cc0	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.29.1	\N	\N	8567267019
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2024-10-10 13:34:30.408453	67	EXECUTED	9:e7c9f5f9c4d67ccbbcc215440c718a17	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.29.1	\N	\N	8567267019
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2024-10-10 13:34:30.412291	68	EXECUTED	9:88e0bfdda924690d6f4e430c53447dd5	addColumn tableName=REALM		\N	4.29.1	\N	\N	8567267019
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2024-10-10 13:34:30.445655	69	EXECUTED	9:f53177f137e1c46b6a88c59ec1cb5218	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.29.1	\N	\N	8567267019
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2024-10-10 13:34:30.450598	70	EXECUTED	9:a74d33da4dc42a37ec27121580d1459f	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.29.1	\N	\N	8567267019
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2024-10-10 13:34:30.453908	71	EXECUTED	9:fd4ade7b90c3b67fae0bfcfcb42dfb5f	addColumn tableName=RESOURCE_SERVER		\N	4.29.1	\N	\N	8567267019
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-10-10 13:34:30.459713	72	EXECUTED	9:aa072ad090bbba210d8f18781b8cebf4	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	8567267019
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-10-10 13:34:30.466145	73	EXECUTED	9:1ae6be29bab7c2aa376f6983b932be37	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	8567267019
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-10-10 13:34:30.468104	74	MARK_RAN	9:14706f286953fc9a25286dbd8fb30d97	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	8567267019
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-10-10 13:34:30.482386	75	EXECUTED	9:2b9cc12779be32c5b40e2e67711a218b	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.29.1	\N	\N	8567267019
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-10-10 13:34:30.512295	76	EXECUTED	9:91fa186ce7a5af127a2d7a91ee083cc5	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.29.1	\N	\N	8567267019
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-10-10 13:34:30.516183	77	EXECUTED	9:6335e5c94e83a2639ccd68dd24e2e5ad	addColumn tableName=CLIENT		\N	4.29.1	\N	\N	8567267019
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-10-10 13:34:30.517774	78	MARK_RAN	9:6bdb5658951e028bfe16fa0a8228b530	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.29.1	\N	\N	8567267019
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-10-10 13:34:30.541117	79	EXECUTED	9:d5bc15a64117ccad481ce8792d4c608f	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.29.1	\N	\N	8567267019
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-10-10 13:34:30.543053	80	MARK_RAN	9:077cba51999515f4d3e7ad5619ab592c	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.29.1	\N	\N	8567267019
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-10-10 13:34:30.582465	81	EXECUTED	9:be969f08a163bf47c6b9e9ead8ac2afb	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.29.1	\N	\N	8567267019
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-10-10 13:34:30.584159	82	MARK_RAN	9:6d3bb4408ba5a72f39bd8a0b301ec6e3	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	8567267019
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-10-10 13:34:30.588301	83	EXECUTED	9:966bda61e46bebf3cc39518fbed52fa7	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	8567267019
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-10-10 13:34:30.589563	84	MARK_RAN	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	8567267019
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-10-10 13:34:30.617101	85	EXECUTED	9:7d93d602352a30c0c317e6a609b56599	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	8567267019
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2024-10-10 13:34:30.621201	86	EXECUTED	9:71c5969e6cdd8d7b6f47cebc86d37627	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.29.1	\N	\N	8567267019
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2024-10-10 13:34:30.627287	87	EXECUTED	9:a9ba7d47f065f041b7da856a81762021	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.29.1	\N	\N	8567267019
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2024-10-10 13:34:30.632203	88	EXECUTED	9:fffabce2bc01e1a8f5110d5278500065	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.29.1	\N	\N	8567267019
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-10-10 13:34:30.637041	89	EXECUTED	9:fa8a5b5445e3857f4b010bafb5009957	addColumn tableName=REALM; customChange		\N	4.29.1	\N	\N	8567267019
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-10-10 13:34:30.641345	90	EXECUTED	9:67ac3241df9a8582d591c5ed87125f39	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.29.1	\N	\N	8567267019
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-10-10 13:34:30.670406	91	EXECUTED	9:ad1194d66c937e3ffc82386c050ba089	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8567267019
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-10-10 13:34:30.676456	92	EXECUTED	9:d9be619d94af5a2f5d07b9f003543b91	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.29.1	\N	\N	8567267019
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-10-10 13:34:30.678129	93	MARK_RAN	9:544d201116a0fcc5a5da0925fbbc3bde	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.29.1	\N	\N	8567267019
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-10-10 13:34:30.684105	94	EXECUTED	9:43c0c1055b6761b4b3e89de76d612ccf	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.29.1	\N	\N	8567267019
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-10-10 13:34:30.686018	95	MARK_RAN	9:8bd711fd0330f4fe980494ca43ab1139	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.29.1	\N	\N	8567267019
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-10-10 13:34:30.692428	96	EXECUTED	9:e07d2bc0970c348bb06fb63b1f82ddbf	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.29.1	\N	\N	8567267019
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-10-10 13:34:30.78489	97	EXECUTED	9:24fb8611e97f29989bea412aa38d12b7	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8567267019
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-10-10 13:34:30.786977	98	MARK_RAN	9:259f89014ce2506ee84740cbf7163aa7	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8567267019
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-10-10 13:34:30.798938	99	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8567267019
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-10-10 13:34:30.842421	100	EXECUTED	9:60ca84a0f8c94ec8c3504a5a3bc88ee8	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8567267019
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-10-10 13:34:30.8447	101	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8567267019
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-10-10 13:34:30.891263	102	EXECUTED	9:0b305d8d1277f3a89a0a53a659ad274c	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.29.1	\N	\N	8567267019
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-10-10 13:34:30.896877	103	EXECUTED	9:2c374ad2cdfe20e2905a84c8fac48460	customChange		\N	4.29.1	\N	\N	8567267019
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2024-10-10 13:34:30.903579	104	EXECUTED	9:47a760639ac597360a8219f5b768b4de	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.29.1	\N	\N	8567267019
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2024-10-10 13:34:30.949006	105	EXECUTED	9:a6272f0576727dd8cad2522335f5d99e	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.29.1	\N	\N	8567267019
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2024-10-10 13:34:30.985244	106	EXECUTED	9:015479dbd691d9cc8669282f4828c41d	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.29.1	\N	\N	8567267019
18.0.15-30992-index-consent	keycloak	META-INF/jpa-changelog-18.0.15.xml	2024-10-10 13:34:31.030256	107	EXECUTED	9:80071ede7a05604b1f4906f3bf3b00f0	createIndex indexName=IDX_USCONSENT_SCOPE_ID, tableName=USER_CONSENT_CLIENT_SCOPE		\N	4.29.1	\N	\N	8567267019
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2024-10-10 13:34:31.035199	108	EXECUTED	9:9518e495fdd22f78ad6425cc30630221	customChange		\N	4.29.1	\N	\N	8567267019
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-10-10 13:34:31.077057	109	EXECUTED	9:e5f243877199fd96bcc842f27a1656ac	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.29.1	\N	\N	8567267019
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-10-10 13:34:31.079768	110	MARK_RAN	9:1a6fcaa85e20bdeae0a9ce49b41946a5	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.29.1	\N	\N	8567267019
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-10-10 13:34:31.088198	111	EXECUTED	9:3f332e13e90739ed0c35b0b25b7822ca	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8567267019
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2024-10-10 13:34:31.094718	112	EXECUTED	9:7ee1f7a3fb8f5588f171fb9a6ab623c0	customChange		\N	4.29.1	\N	\N	8567267019
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2024-10-10 13:34:31.108443	113	EXECUTED	9:3d7e830b52f33676b9d64f7f2b2ea634	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.29.1	\N	\N	8567267019
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2024-10-10 13:34:31.1132	114	MARK_RAN	9:627d032e3ef2c06c0e1f73d2ae25c26c	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.29.1	\N	\N	8567267019
22.0.0-17484-updated	keycloak	META-INF/jpa-changelog-22.0.0.xml	2024-10-10 13:34:31.119765	115	EXECUTED	9:90af0bfd30cafc17b9f4d6eccd92b8b3	customChange		\N	4.29.1	\N	\N	8567267019
22.0.5-24031	keycloak	META-INF/jpa-changelog-22.0.0.xml	2024-10-10 13:34:31.123055	116	MARK_RAN	9:a60d2d7b315ec2d3eba9e2f145f9df28	customChange		\N	4.29.1	\N	\N	8567267019
23.0.0-12062	keycloak	META-INF/jpa-changelog-23.0.0.xml	2024-10-10 13:34:31.130608	117	EXECUTED	9:2168fbe728fec46ae9baf15bf80927b8	addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG		\N	4.29.1	\N	\N	8567267019
23.0.0-17258	keycloak	META-INF/jpa-changelog-23.0.0.xml	2024-10-10 13:34:31.136227	118	EXECUTED	9:36506d679a83bbfda85a27ea1864dca8	addColumn tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	8567267019
24.0.0-9758	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-10-10 13:34:31.286222	119	EXECUTED	9:502c557a5189f600f0f445a9b49ebbce	addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...		\N	4.29.1	\N	\N	8567267019
24.0.0-9758-2	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-10-10 13:34:31.291041	120	EXECUTED	9:bf0fdee10afdf597a987adbf291db7b2	customChange		\N	4.29.1	\N	\N	8567267019
24.0.0-26618-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-10-10 13:34:31.296751	121	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8567267019
24.0.0-26618-reindex	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-10-10 13:34:31.328383	122	EXECUTED	9:08707c0f0db1cef6b352db03a60edc7f	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8567267019
24.0.2-27228	keycloak	META-INF/jpa-changelog-24.0.2.xml	2024-10-10 13:34:31.333185	123	EXECUTED	9:eaee11f6b8aa25d2cc6a84fb86fc6238	customChange		\N	4.29.1	\N	\N	8567267019
24.0.2-27967-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.2.xml	2024-10-10 13:34:31.335387	124	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8567267019
24.0.2-27967-reindex	keycloak	META-INF/jpa-changelog-24.0.2.xml	2024-10-10 13:34:31.337628	125	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8567267019
25.0.0-28265-tables	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-10-10 13:34:31.343734	126	EXECUTED	9:deda2df035df23388af95bbd36c17cef	addColumn tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	8567267019
25.0.0-28265-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-10-10 13:34:31.373618	127	EXECUTED	9:3e96709818458ae49f3c679ae58d263a	createIndex indexName=IDX_OFFLINE_USS_BY_LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8567267019
25.0.0-28265-index-cleanup	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-10-10 13:34:31.380376	128	EXECUTED	9:8c0cfa341a0474385b324f5c4b2dfcc1	dropIndex indexName=IDX_OFFLINE_USS_CREATEDON, tableName=OFFLINE_USER_SESSION; dropIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION; dropIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION; dropIndex ...		\N	4.29.1	\N	\N	8567267019
25.0.0-28265-index-2-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-10-10 13:34:31.382523	129	MARK_RAN	9:b7ef76036d3126bb83c2423bf4d449d6	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8567267019
25.0.0-28265-index-2-not-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-10-10 13:34:31.414739	130	EXECUTED	9:23396cf51ab8bc1ae6f0cac7f9f6fcf7	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8567267019
25.0.0-org	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-10-10 13:34:31.425102	131	EXECUTED	9:5c859965c2c9b9c72136c360649af157	createTable tableName=ORG; addUniqueConstraint constraintName=UK_ORG_NAME, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_GROUP, tableName=ORG; createTable tableName=ORG_DOMAIN		\N	4.29.1	\N	\N	8567267019
unique-consentuser	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-10-10 13:34:31.434041	132	EXECUTED	9:5857626a2ea8767e9a6c66bf3a2cb32f	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.29.1	\N	\N	8567267019
unique-consentuser-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-10-10 13:34:31.435871	133	MARK_RAN	9:b79478aad5adaa1bc428e31563f55e8e	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.29.1	\N	\N	8567267019
25.0.0-28861-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-10-10 13:34:31.496418	134	EXECUTED	9:b9acb58ac958d9ada0fe12a5d4794ab1	createIndex indexName=IDX_PERM_TICKET_REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; createIndex indexName=IDX_PERM_TICKET_OWNER, tableName=RESOURCE_SERVER_PERM_TICKET		\N	4.29.1	\N	\N	8567267019
26.0.0-org-alias	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-10-10 13:34:31.502653	135	EXECUTED	9:6ef7d63e4412b3c2d66ed179159886a4	addColumn tableName=ORG; update tableName=ORG; addNotNullConstraint columnName=ALIAS, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_ALIAS, tableName=ORG		\N	4.29.1	\N	\N	8567267019
26.0.0-org-group	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-10-10 13:34:31.512177	136	EXECUTED	9:da8e8087d80ef2ace4f89d8c5b9ca223	addColumn tableName=KEYCLOAK_GROUP; update tableName=KEYCLOAK_GROUP; addNotNullConstraint columnName=TYPE, tableName=KEYCLOAK_GROUP; customChange		\N	4.29.1	\N	\N	8567267019
26.0.0-org-indexes	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-10-10 13:34:31.55649	137	EXECUTED	9:79b05dcd610a8c7f25ec05135eec0857	createIndex indexName=IDX_ORG_DOMAIN_ORG_ID, tableName=ORG_DOMAIN		\N	4.29.1	\N	\N	8567267019
26.0.0-org-group-membership	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-10-10 13:34:31.564135	138	EXECUTED	9:a6ace2ce583a421d89b01ba2a28dc2d4	addColumn tableName=USER_GROUP_MEMBERSHIP; update tableName=USER_GROUP_MEMBERSHIP; addNotNullConstraint columnName=MEMBERSHIP_TYPE, tableName=USER_GROUP_MEMBERSHIP		\N	4.29.1	\N	\N	8567267019
31296-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-10-10 13:34:31.571571	139	EXECUTED	9:64ef94489d42a358e8304b0e245f0ed4	createTable tableName=REVOKED_TOKEN; addPrimaryKey constraintName=CONSTRAINT_RT, tableName=REVOKED_TOKEN		\N	4.29.1	\N	\N	8567267019
31725-index-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-10-10 13:34:31.623708	140	EXECUTED	9:b994246ec2bf7c94da881e1d28782c7b	createIndex indexName=IDX_REV_TOKEN_ON_EXPIRE, tableName=REVOKED_TOKEN		\N	4.29.1	\N	\N	8567267019
26.0.0-idps-for-login	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-10-10 13:34:31.698208	141	EXECUTED	9:51f5fffadf986983d4bd59582c6c1604	addColumn tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_REALM_ORG, tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_FOR_LOGIN, tableName=IDENTITY_PROVIDER; customChange		\N	4.29.1	\N	\N	8567267019
26.0.0-32583-drop-redundant-index-on-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-10-10 13:34:31.702942	142	EXECUTED	9:24972d83bf27317a055d234187bb4af9	dropIndex indexName=IDX_US_SESS_ID_ON_CL_SESS, tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	8567267019
26.0.0.32582-remove-tables-user-session-user-session-note-and-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-10-10 13:34:31.716895	143	EXECUTED	9:febdc0f47f2ed241c59e60f58c3ceea5	dropTable tableName=CLIENT_SESSION_ROLE; dropTable tableName=CLIENT_SESSION_NOTE; dropTable tableName=CLIENT_SESSION_PROT_MAPPER; dropTable tableName=CLIENT_SESSION_AUTH_STATUS; dropTable tableName=CLIENT_USER_SESSION_NOTE; dropTable tableName=CLI...		\N	4.29.1	\N	\N	8567267019
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
7df03360-60a3-49d8-8fc4-f7cf9b739084	87109c75-df07-432d-9c24-901c17391903	f
7df03360-60a3-49d8-8fc4-f7cf9b739084	c0a30a51-edac-4272-bb34-d7de293153f5	t
7df03360-60a3-49d8-8fc4-f7cf9b739084	b7d12e20-e8ec-474f-9000-dc6af53f401f	t
7df03360-60a3-49d8-8fc4-f7cf9b739084	87b50f20-019e-4d82-8c07-3c5223affc34	t
7df03360-60a3-49d8-8fc4-f7cf9b739084	5f6aeea2-1484-4474-9cfe-b66c0ec59d30	t
7df03360-60a3-49d8-8fc4-f7cf9b739084	9f4e737a-3383-4078-99a5-0390c8ad9bc9	f
7df03360-60a3-49d8-8fc4-f7cf9b739084	fd5edd43-eb09-4d28-b0c5-df17aeccc316	f
7df03360-60a3-49d8-8fc4-f7cf9b739084	909d9318-c4fa-48c7-82f1-8e9c94160ac9	t
7df03360-60a3-49d8-8fc4-f7cf9b739084	6d1fe510-797f-4102-8f05-6c284992e02c	t
7df03360-60a3-49d8-8fc4-f7cf9b739084	7f327484-8284-4c27-8f94-2f42e74c9b53	f
7df03360-60a3-49d8-8fc4-f7cf9b739084	637e3c73-f18e-4603-9c26-708a1bcac855	t
7df03360-60a3-49d8-8fc4-f7cf9b739084	8cca7a80-36d4-44e6-9ac0-bd339a111441	t
7df03360-60a3-49d8-8fc4-f7cf9b739084	ffb25617-e1f8-4038-b04c-7caaba64400c	f
be6ce2a1-9fac-4c0a-9916-53b2dbad6409	7b5242cf-59cb-4c3e-8705-318003a9b44e	t
be6ce2a1-9fac-4c0a-9916-53b2dbad6409	577d8b9c-5795-4214-8703-e301c8eadeb1	t
be6ce2a1-9fac-4c0a-9916-53b2dbad6409	4f174b30-c68b-4c37-bb10-bae6d509b26f	t
be6ce2a1-9fac-4c0a-9916-53b2dbad6409	eb8000fc-5791-475a-a5ca-6e9eacf3ca96	t
be6ce2a1-9fac-4c0a-9916-53b2dbad6409	2e6e1812-abee-47e1-adb9-c82883cd9a20	t
be6ce2a1-9fac-4c0a-9916-53b2dbad6409	b75f7fc5-08ec-4a2b-bf90-9fed81881326	t
be6ce2a1-9fac-4c0a-9916-53b2dbad6409	d4276354-645c-4888-83a7-ce52303ac1c9	t
be6ce2a1-9fac-4c0a-9916-53b2dbad6409	d7b05a5a-21c6-414f-bef7-b28cace5d342	t
be6ce2a1-9fac-4c0a-9916-53b2dbad6409	74f4d58d-f097-40d8-9298-eec0ae1bda9e	f
be6ce2a1-9fac-4c0a-9916-53b2dbad6409	d72b75f5-b5c7-4a6c-8e00-a197ba18e29f	f
be6ce2a1-9fac-4c0a-9916-53b2dbad6409	33778144-3ab0-45b8-b12b-d6e51133c87a	f
be6ce2a1-9fac-4c0a-9916-53b2dbad6409	e3665b21-655b-4222-a98c-567b10968fa0	f
be6ce2a1-9fac-4c0a-9916-53b2dbad6409	6708bae9-8e4e-4dd5-8f2c-6b21729ff1ad	f
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id, details_json_long_value) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
49917384-43c3-4be6-b5a7-a18b1242164e	7935808f-93e9-44d2-ac9c-7eb77f77a4f9
68de3a92-e359-46a0-9901-7238170a3c90	cbc98f71-4dd6-419d-92c3-fbb7479cb9e6
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only, organization_id, hide_on_login) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_group (id, name, parent_group, realm_id, type) FROM stdin;
7935808f-93e9-44d2-ac9c-7eb77f77a4f9	ADMINS	 	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	0
cbc98f71-4dd6-419d-92c3-fbb7479cb9e6	USERS	 	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	0
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
f2464307-faaf-4598-98a2-33952a03351b	7df03360-60a3-49d8-8fc4-f7cf9b739084	f	${role_default-roles}	default-roles-master	7df03360-60a3-49d8-8fc4-f7cf9b739084	\N	\N
a43f31aa-d354-456e-a2a3-595d2866c8d0	7df03360-60a3-49d8-8fc4-f7cf9b739084	f	${role_create-realm}	create-realm	7df03360-60a3-49d8-8fc4-f7cf9b739084	\N	\N
d2d4eb12-128b-461b-8e25-7262a9e698d0	7df03360-60a3-49d8-8fc4-f7cf9b739084	f	${role_admin}	admin	7df03360-60a3-49d8-8fc4-f7cf9b739084	\N	\N
5043f973-0183-4faf-a06b-39b580108037	82b1cb52-ee49-426d-9d20-5365bd7dbae4	t	${role_create-client}	create-client	7df03360-60a3-49d8-8fc4-f7cf9b739084	82b1cb52-ee49-426d-9d20-5365bd7dbae4	\N
8f35fc04-6bf5-47ae-bcf4-11763bbe15f6	82b1cb52-ee49-426d-9d20-5365bd7dbae4	t	${role_view-realm}	view-realm	7df03360-60a3-49d8-8fc4-f7cf9b739084	82b1cb52-ee49-426d-9d20-5365bd7dbae4	\N
439895d9-5f6c-4f17-baeb-b5ddde5f2edf	82b1cb52-ee49-426d-9d20-5365bd7dbae4	t	${role_view-users}	view-users	7df03360-60a3-49d8-8fc4-f7cf9b739084	82b1cb52-ee49-426d-9d20-5365bd7dbae4	\N
322692b7-727f-4612-9935-77024aeb338a	82b1cb52-ee49-426d-9d20-5365bd7dbae4	t	${role_view-clients}	view-clients	7df03360-60a3-49d8-8fc4-f7cf9b739084	82b1cb52-ee49-426d-9d20-5365bd7dbae4	\N
e2c853f9-6325-44b9-9aa2-113483167939	82b1cb52-ee49-426d-9d20-5365bd7dbae4	t	${role_view-events}	view-events	7df03360-60a3-49d8-8fc4-f7cf9b739084	82b1cb52-ee49-426d-9d20-5365bd7dbae4	\N
b28fb1db-586c-47c3-b06e-13c20fb9e182	82b1cb52-ee49-426d-9d20-5365bd7dbae4	t	${role_view-identity-providers}	view-identity-providers	7df03360-60a3-49d8-8fc4-f7cf9b739084	82b1cb52-ee49-426d-9d20-5365bd7dbae4	\N
a874f8e2-c19c-4ed8-9690-cafd464c312c	82b1cb52-ee49-426d-9d20-5365bd7dbae4	t	${role_view-authorization}	view-authorization	7df03360-60a3-49d8-8fc4-f7cf9b739084	82b1cb52-ee49-426d-9d20-5365bd7dbae4	\N
6b3d7998-8e20-436a-a393-3a22f5db09ca	82b1cb52-ee49-426d-9d20-5365bd7dbae4	t	${role_manage-realm}	manage-realm	7df03360-60a3-49d8-8fc4-f7cf9b739084	82b1cb52-ee49-426d-9d20-5365bd7dbae4	\N
f4fc69ab-b7fb-4ce6-b1b0-0ad3a70d15d2	82b1cb52-ee49-426d-9d20-5365bd7dbae4	t	${role_manage-users}	manage-users	7df03360-60a3-49d8-8fc4-f7cf9b739084	82b1cb52-ee49-426d-9d20-5365bd7dbae4	\N
7510a4c6-c5cb-45f9-a0e0-ae3755f47be5	82b1cb52-ee49-426d-9d20-5365bd7dbae4	t	${role_manage-clients}	manage-clients	7df03360-60a3-49d8-8fc4-f7cf9b739084	82b1cb52-ee49-426d-9d20-5365bd7dbae4	\N
5434cc5a-b29f-4a8c-b29a-dc65c1c2b53e	82b1cb52-ee49-426d-9d20-5365bd7dbae4	t	${role_manage-events}	manage-events	7df03360-60a3-49d8-8fc4-f7cf9b739084	82b1cb52-ee49-426d-9d20-5365bd7dbae4	\N
abe81c1d-2bd3-48d6-94c9-29b5d2e8d897	82b1cb52-ee49-426d-9d20-5365bd7dbae4	t	${role_manage-identity-providers}	manage-identity-providers	7df03360-60a3-49d8-8fc4-f7cf9b739084	82b1cb52-ee49-426d-9d20-5365bd7dbae4	\N
e154d09a-facf-4496-b24b-2fd559513d8c	82b1cb52-ee49-426d-9d20-5365bd7dbae4	t	${role_manage-authorization}	manage-authorization	7df03360-60a3-49d8-8fc4-f7cf9b739084	82b1cb52-ee49-426d-9d20-5365bd7dbae4	\N
cd23e02e-ff77-4447-855a-e22551653cf3	82b1cb52-ee49-426d-9d20-5365bd7dbae4	t	${role_query-users}	query-users	7df03360-60a3-49d8-8fc4-f7cf9b739084	82b1cb52-ee49-426d-9d20-5365bd7dbae4	\N
43662433-9285-4997-a207-dd5678a12695	82b1cb52-ee49-426d-9d20-5365bd7dbae4	t	${role_query-clients}	query-clients	7df03360-60a3-49d8-8fc4-f7cf9b739084	82b1cb52-ee49-426d-9d20-5365bd7dbae4	\N
b9097f2b-a6df-46bb-b4c4-b0bf5d2eec20	82b1cb52-ee49-426d-9d20-5365bd7dbae4	t	${role_query-realms}	query-realms	7df03360-60a3-49d8-8fc4-f7cf9b739084	82b1cb52-ee49-426d-9d20-5365bd7dbae4	\N
eeb82e16-5c68-4661-a783-c356c77cf067	82b1cb52-ee49-426d-9d20-5365bd7dbae4	t	${role_query-groups}	query-groups	7df03360-60a3-49d8-8fc4-f7cf9b739084	82b1cb52-ee49-426d-9d20-5365bd7dbae4	\N
832896b9-0856-461d-a630-e09143c1a553	9bf17482-c934-4a6c-a477-e98986383b96	t	${role_view-profile}	view-profile	7df03360-60a3-49d8-8fc4-f7cf9b739084	9bf17482-c934-4a6c-a477-e98986383b96	\N
98924bda-5e7e-4b8d-aebe-be7dd2b2bcd1	9bf17482-c934-4a6c-a477-e98986383b96	t	${role_manage-account}	manage-account	7df03360-60a3-49d8-8fc4-f7cf9b739084	9bf17482-c934-4a6c-a477-e98986383b96	\N
b5bd9d72-ab09-422d-a823-4a5eaca75c1e	9bf17482-c934-4a6c-a477-e98986383b96	t	${role_manage-account-links}	manage-account-links	7df03360-60a3-49d8-8fc4-f7cf9b739084	9bf17482-c934-4a6c-a477-e98986383b96	\N
18077be4-5c8d-4419-add2-d76daf33ba2f	9bf17482-c934-4a6c-a477-e98986383b96	t	${role_view-applications}	view-applications	7df03360-60a3-49d8-8fc4-f7cf9b739084	9bf17482-c934-4a6c-a477-e98986383b96	\N
3f8fd2da-38c5-4748-ab0d-9a992ea8071e	9bf17482-c934-4a6c-a477-e98986383b96	t	${role_view-consent}	view-consent	7df03360-60a3-49d8-8fc4-f7cf9b739084	9bf17482-c934-4a6c-a477-e98986383b96	\N
fec69db6-6386-4b30-89c2-41fb005f7f50	9bf17482-c934-4a6c-a477-e98986383b96	t	${role_manage-consent}	manage-consent	7df03360-60a3-49d8-8fc4-f7cf9b739084	9bf17482-c934-4a6c-a477-e98986383b96	\N
8e474eaa-cba4-475c-abd4-bbba77b08a6c	9bf17482-c934-4a6c-a477-e98986383b96	t	${role_view-groups}	view-groups	7df03360-60a3-49d8-8fc4-f7cf9b739084	9bf17482-c934-4a6c-a477-e98986383b96	\N
e5683301-8a12-4c15-beb1-ac89dc9ffd06	9bf17482-c934-4a6c-a477-e98986383b96	t	${role_delete-account}	delete-account	7df03360-60a3-49d8-8fc4-f7cf9b739084	9bf17482-c934-4a6c-a477-e98986383b96	\N
644b0c61-cd2b-4a8f-afba-b6ddc52fceba	d8b7d0b7-bf3c-495b-a780-804c1470e617	t	${role_read-token}	read-token	7df03360-60a3-49d8-8fc4-f7cf9b739084	d8b7d0b7-bf3c-495b-a780-804c1470e617	\N
74d369ce-87ca-434f-81df-6847d22d5954	82b1cb52-ee49-426d-9d20-5365bd7dbae4	t	${role_impersonation}	impersonation	7df03360-60a3-49d8-8fc4-f7cf9b739084	82b1cb52-ee49-426d-9d20-5365bd7dbae4	\N
f1ea46a6-8469-4ed6-b22b-437698470fe4	7df03360-60a3-49d8-8fc4-f7cf9b739084	f	${role_offline-access}	offline_access	7df03360-60a3-49d8-8fc4-f7cf9b739084	\N	\N
0062e8b5-4b41-40e4-bd7d-3019e856ec0f	7df03360-60a3-49d8-8fc4-f7cf9b739084	f	${role_uma_authorization}	uma_authorization	7df03360-60a3-49d8-8fc4-f7cf9b739084	\N	\N
e3a66f8f-ca9d-48c9-b29b-1e465436380a	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	f	${role_default-roles}	default-roles-kahootrealm	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	\N	\N
1be6abbf-9df3-4c6d-957c-1fbaf325c5fa	188cb1f3-d31f-4737-a6e4-70df5283923b	t	${role_create-client}	create-client	7df03360-60a3-49d8-8fc4-f7cf9b739084	188cb1f3-d31f-4737-a6e4-70df5283923b	\N
f01888b6-75d6-482d-be86-43660422c1cb	188cb1f3-d31f-4737-a6e4-70df5283923b	t	${role_view-realm}	view-realm	7df03360-60a3-49d8-8fc4-f7cf9b739084	188cb1f3-d31f-4737-a6e4-70df5283923b	\N
a1b82aa0-1dd0-44f0-855c-1ea2df9319cf	188cb1f3-d31f-4737-a6e4-70df5283923b	t	${role_view-users}	view-users	7df03360-60a3-49d8-8fc4-f7cf9b739084	188cb1f3-d31f-4737-a6e4-70df5283923b	\N
45057dc9-9c54-44a1-848b-5c84158728e5	188cb1f3-d31f-4737-a6e4-70df5283923b	t	${role_view-clients}	view-clients	7df03360-60a3-49d8-8fc4-f7cf9b739084	188cb1f3-d31f-4737-a6e4-70df5283923b	\N
bb46b286-0977-4da3-bcab-cd589e337e63	188cb1f3-d31f-4737-a6e4-70df5283923b	t	${role_view-events}	view-events	7df03360-60a3-49d8-8fc4-f7cf9b739084	188cb1f3-d31f-4737-a6e4-70df5283923b	\N
53e56d06-d2d7-4ffd-afe6-397bd9ca897c	188cb1f3-d31f-4737-a6e4-70df5283923b	t	${role_view-identity-providers}	view-identity-providers	7df03360-60a3-49d8-8fc4-f7cf9b739084	188cb1f3-d31f-4737-a6e4-70df5283923b	\N
0f6eb75e-46ea-4155-96a0-3ffd9e0d258b	188cb1f3-d31f-4737-a6e4-70df5283923b	t	${role_view-authorization}	view-authorization	7df03360-60a3-49d8-8fc4-f7cf9b739084	188cb1f3-d31f-4737-a6e4-70df5283923b	\N
fb680dc6-531d-469f-b36e-93408e2b0d60	188cb1f3-d31f-4737-a6e4-70df5283923b	t	${role_manage-realm}	manage-realm	7df03360-60a3-49d8-8fc4-f7cf9b739084	188cb1f3-d31f-4737-a6e4-70df5283923b	\N
5f3050a7-7a30-42cc-825a-bce856b6a301	188cb1f3-d31f-4737-a6e4-70df5283923b	t	${role_manage-users}	manage-users	7df03360-60a3-49d8-8fc4-f7cf9b739084	188cb1f3-d31f-4737-a6e4-70df5283923b	\N
17573d35-22c1-4115-96a2-936770d9824d	188cb1f3-d31f-4737-a6e4-70df5283923b	t	${role_manage-clients}	manage-clients	7df03360-60a3-49d8-8fc4-f7cf9b739084	188cb1f3-d31f-4737-a6e4-70df5283923b	\N
1f4f68e0-d36f-4446-b912-20700ddf352b	188cb1f3-d31f-4737-a6e4-70df5283923b	t	${role_manage-events}	manage-events	7df03360-60a3-49d8-8fc4-f7cf9b739084	188cb1f3-d31f-4737-a6e4-70df5283923b	\N
e126bc20-9511-4c1b-8b88-32a2396318a7	188cb1f3-d31f-4737-a6e4-70df5283923b	t	${role_manage-identity-providers}	manage-identity-providers	7df03360-60a3-49d8-8fc4-f7cf9b739084	188cb1f3-d31f-4737-a6e4-70df5283923b	\N
7f7145bf-e1d9-4bc1-bdf9-85958d2bc435	188cb1f3-d31f-4737-a6e4-70df5283923b	t	${role_manage-authorization}	manage-authorization	7df03360-60a3-49d8-8fc4-f7cf9b739084	188cb1f3-d31f-4737-a6e4-70df5283923b	\N
f3bd6567-c7b7-4705-8c2d-801f906df609	188cb1f3-d31f-4737-a6e4-70df5283923b	t	${role_query-users}	query-users	7df03360-60a3-49d8-8fc4-f7cf9b739084	188cb1f3-d31f-4737-a6e4-70df5283923b	\N
be28186b-1e1a-4a92-8b85-2c3a0304aaf7	188cb1f3-d31f-4737-a6e4-70df5283923b	t	${role_query-clients}	query-clients	7df03360-60a3-49d8-8fc4-f7cf9b739084	188cb1f3-d31f-4737-a6e4-70df5283923b	\N
15391ed0-c9c1-4776-84de-f5b14e800be1	188cb1f3-d31f-4737-a6e4-70df5283923b	t	${role_query-realms}	query-realms	7df03360-60a3-49d8-8fc4-f7cf9b739084	188cb1f3-d31f-4737-a6e4-70df5283923b	\N
59ad28a1-d74f-42bd-b81e-a9fa2fd422dd	188cb1f3-d31f-4737-a6e4-70df5283923b	t	${role_query-groups}	query-groups	7df03360-60a3-49d8-8fc4-f7cf9b739084	188cb1f3-d31f-4737-a6e4-70df5283923b	\N
68de3a92-e359-46a0-9901-7238170a3c90	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	f		USER	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	\N	\N
8296084c-72f5-4c89-b75b-b71a6695e425	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	f	${role_offline-access}	offline_access	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	\N	\N
49917384-43c3-4be6-b5a7-a18b1242164e	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	f		ADMIN	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	\N	\N
5517c357-15bf-4c96-853b-f2b781488f38	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	f	${role_uma_authorization}	uma_authorization	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	\N	\N
7fd54588-4d20-4be8-971a-ced6f9a5a94c	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	t	${role_view-events}	view-events	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	\N
4ad07ae9-f1a4-41be-9c38-0ca643f0b91d	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	t	${role_manage-realm}	manage-realm	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	\N
cc4f33b7-f97b-411d-a100-31ecbcf0af0f	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	t	${role_view-clients}	view-clients	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	\N
ba586b29-b24e-4fcb-a6cf-b146824c08cd	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	t	${role_view-identity-providers}	view-identity-providers	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	\N
d9f3e0d0-2588-48c8-b971-5ff5faf66225	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	t	${role_view-realm}	view-realm	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	\N
85918706-3485-41e5-a91c-dc4dc8eca3b9	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	t	${role_view-authorization}	view-authorization	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	\N
18ec3d04-8385-4bb2-9729-f745aadd6c27	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	t	${role_create-client}	create-client	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	\N
07c7f3f4-425e-44fd-a5f3-e7b9b0212dc1	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	t	${role_impersonation}	impersonation	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	\N
e8390104-1626-4e48-b9a4-ad4df06104e2	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	t	${role_query-clients}	query-clients	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	\N
c87b0034-dfa4-4006-9ae5-d4881b8063fd	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	t	${role_view-users}	view-users	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	\N
62de843a-07e6-4024-a29e-b2f08923257d	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	t	${role_query-groups}	query-groups	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	\N
4358793c-8198-4ee0-b66f-25203aaee841	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	t	${role_manage-authorization}	manage-authorization	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	\N
712d2bdd-3757-47f9-ab43-8f8a547617ea	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	t	${role_manage-clients}	manage-clients	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	\N
1071fcf7-4bf7-4ee4-b3a2-31c2d1d70123	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	t	${role_manage-events}	manage-events	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	\N
61a068d9-6d25-4724-a87c-023401ca478f	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	t	${role_manage-identity-providers}	manage-identity-providers	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	\N
90a6b532-df65-4c37-8046-51ce1e524f50	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	t	${role_query-realms}	query-realms	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	\N
bd5f39a3-8d2e-4b7c-9c78-522acf3d9333	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	t	${role_manage-users}	manage-users	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	\N
99beeb18-10d4-4f7d-a691-b39d1965953a	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	t	${role_query-users}	query-users	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	\N
f9b65eeb-2e74-46d2-82b5-27f755502d09	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	t	${role_realm-admin}	realm-admin	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	af8b2ee8-df19-46cf-8ea2-a4da390b5d17	\N
ba8deedc-2909-4d73-8bf1-9426a5b1d653	6655e5d1-2ae3-436b-8587-37b5dfd2df7f	t	${role_read-token}	read-token	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	6655e5d1-2ae3-436b-8587-37b5dfd2df7f	\N
b913e464-0d58-485a-a209-6bbbc4a2bc3a	ca0950df-cbba-4cca-9094-7dddb2d826bf	t	${role_view-applications}	view-applications	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	ca0950df-cbba-4cca-9094-7dddb2d826bf	\N
6f828282-2578-4a05-8954-1b6bc5355bad	ca0950df-cbba-4cca-9094-7dddb2d826bf	t	${role_view-groups}	view-groups	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	ca0950df-cbba-4cca-9094-7dddb2d826bf	\N
655e0b26-abd2-4aef-9c1a-1db127b64872	ca0950df-cbba-4cca-9094-7dddb2d826bf	t	${role_delete-account}	delete-account	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	ca0950df-cbba-4cca-9094-7dddb2d826bf	\N
40d6ddd3-5df1-4479-921f-efd49322e0d7	ca0950df-cbba-4cca-9094-7dddb2d826bf	t	${role_view-consent}	view-consent	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	ca0950df-cbba-4cca-9094-7dddb2d826bf	\N
97930d2c-082e-41db-a473-12ccf480ff01	ca0950df-cbba-4cca-9094-7dddb2d826bf	t	${role_manage-consent}	manage-consent	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	ca0950df-cbba-4cca-9094-7dddb2d826bf	\N
a9aaf9fb-d473-4074-a23b-ca0dd6f0f0a7	ca0950df-cbba-4cca-9094-7dddb2d826bf	t	${role_manage-account-links}	manage-account-links	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	ca0950df-cbba-4cca-9094-7dddb2d826bf	\N
85e42273-3171-42d8-99c1-07e2dea14342	ca0950df-cbba-4cca-9094-7dddb2d826bf	t	${role_view-profile}	view-profile	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	ca0950df-cbba-4cca-9094-7dddb2d826bf	\N
2e7bac1d-957d-482c-9c24-faddde4cfc3a	ca0950df-cbba-4cca-9094-7dddb2d826bf	t	${role_manage-account}	manage-account	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	ca0950df-cbba-4cca-9094-7dddb2d826bf	\N
12e5a6e0-f995-4660-a58d-204210250f0a	188cb1f3-d31f-4737-a6e4-70df5283923b	t	${role_impersonation}	impersonation	7df03360-60a3-49d8-8fc4-f7cf9b739084	188cb1f3-d31f-4737-a6e4-70df5283923b	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.migration_model (id, version, update_time) FROM stdin;
500j5	26.0.0	1728567272
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id, version) FROM stdin;
8aecaaee-28a3-4063-a7d3-ae5fcbdeaa96	4891877d-9e6b-4062-9e53-b57a61f89e3c	0	1728570207	{"authMethod":"openid-connect","redirectUri":"http://localhost:8180/admin/master/console/#/KahootRealm/users/86c4bda2-24ac-4cdb-a3dc-32cef3a24daf/settings","notes":{"clientId":"4891877d-9e6b-4062-9e53-b57a61f89e3c","iss":"http://localhost:8180/realms/master","startedAt":"1728570111","response_type":"code","level-of-authentication":"-1","code_challenge_method":"S256","nonce":"95ecbb59-60a5-4bcd-a3c0-424162b42551","response_mode":"query","scope":"openid","userSessionStartedAt":"1728570111","redirect_uri":"http://localhost:8180/admin/master/console/#/KahootRealm/users/86c4bda2-24ac-4cdb-a3dc-32cef3a24daf/settings","state":"4e1c0cf4-2b53-48d1-bb5c-4ce79439a3b9","code_challenge":"53Y1MgjUtzM54Y2SYLt8dWpKmEOGmroUx0_zBXSxqB4"}}	local	local	1
1f937726-d390-459d-b572-0f0909f455db	f820e539-4dae-4c02-be0f-fc0ca7f13aa7	0	1728570272	{"authMethod":"openid-connect","notes":{"clientId":"f820e539-4dae-4c02-be0f-fc0ca7f13aa7","userSessionStartedAt":"1728570272","iss":"http://localhost:8180/realms/KahootRealm","startedAt":"1728570272","level-of-authentication":"-1"}}	local	local	0
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh, broker_session_id, version) FROM stdin;
8aecaaee-28a3-4063-a7d3-ae5fcbdeaa96	bbea8fc6-e191-4d29-80c6-ed86e8affd08	7df03360-60a3-49d8-8fc4-f7cf9b739084	1728570111	0	{"ipAddress":"172.25.0.1","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxNzIuMjUuMC4xIiwib3MiOiJXaW5kb3dzIiwib3NWZXJzaW9uIjoiMTAiLCJicm93c2VyIjoiT3BlcmEvMTEzLjAuMCIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=","AUTH_TIME":"1728570111","authenticators-completed":"{\\"df89d528-1c98-4828-982a-363c196a9bc9\\":1728570111}"},"state":"LOGGED_IN"}	1728570207	\N	1
1f937726-d390-459d-b572-0f0909f455db	86c4bda2-24ac-4cdb-a3dc-32cef3a24daf	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	1728570272	0	{"ipAddress":"172.25.0.1","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxNzIuMjUuMC4xIiwib3MiOiJPdGhlciIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiY3VybC83LjgxLjAiLCJkZXZpY2UiOiJPdGhlciIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","authenticators-completed":"{\\"0d3603e1-b5cb-4733-aac8-6f16b05372b5\\":1728570272,\\"e00f9e08-aede-4227-a072-9db667934357\\":1728570272}"},"state":"LOGGED_IN"}	1728570272	\N	0
\.


--
-- Data for Name: org; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.org (id, enabled, realm_id, group_id, name, description, alias, redirect_url) FROM stdin;
\.


--
-- Data for Name: org_domain; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.org_domain (id, name, verified, org_id) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
4cbb2828-c949-4b10-98c1-c90756a576f6	audience resolve	openid-connect	oidc-audience-resolve-mapper	ff46868d-6213-47b3-ad8b-8df736eed272	\N
2c38f414-7a21-4c44-97f0-610721d11595	locale	openid-connect	oidc-usermodel-attribute-mapper	4891877d-9e6b-4062-9e53-b57a61f89e3c	\N
15dc323b-2508-4acb-a736-add03a4f4623	role list	saml	saml-role-list-mapper	\N	c0a30a51-edac-4272-bb34-d7de293153f5
19dfb2d5-fc44-40ad-9597-9354b439b365	organization	saml	saml-organization-membership-mapper	\N	b7d12e20-e8ec-474f-9000-dc6af53f401f
f306c129-0f26-4601-8ab5-851a03053a6d	full name	openid-connect	oidc-full-name-mapper	\N	87b50f20-019e-4d82-8c07-3c5223affc34
bcbb07be-6dca-4b07-8fde-e68b55aa07fb	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	87b50f20-019e-4d82-8c07-3c5223affc34
e5d6b2b2-a105-4a0e-a1dd-fc60b8b2bc9a	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	87b50f20-019e-4d82-8c07-3c5223affc34
9d1b3f9d-9bf8-4603-8910-8711ef4c9b9b	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	87b50f20-019e-4d82-8c07-3c5223affc34
103a87b5-0e12-49a4-bc53-ca810c2f4227	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	87b50f20-019e-4d82-8c07-3c5223affc34
acec36e1-8a6e-4032-bc18-1f1d1861aec8	username	openid-connect	oidc-usermodel-attribute-mapper	\N	87b50f20-019e-4d82-8c07-3c5223affc34
0fa7ed89-add1-4640-817d-4c45d2357f05	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	87b50f20-019e-4d82-8c07-3c5223affc34
cff98ac0-56cf-4fb6-8a48-34820fe05d3a	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	87b50f20-019e-4d82-8c07-3c5223affc34
692c9568-abb3-41ce-8a95-d64a8535b786	website	openid-connect	oidc-usermodel-attribute-mapper	\N	87b50f20-019e-4d82-8c07-3c5223affc34
236e454a-e91b-4e2e-8f25-577b0daeedb7	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	87b50f20-019e-4d82-8c07-3c5223affc34
d8eeaf7a-74a7-4f42-88d3-20ab7e2acd50	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	87b50f20-019e-4d82-8c07-3c5223affc34
5a12b839-ead3-4332-bdd3-226fb5fe39ac	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	87b50f20-019e-4d82-8c07-3c5223affc34
2b800336-3863-4c77-bbb0-4056e1ea097d	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	87b50f20-019e-4d82-8c07-3c5223affc34
798c3fdc-81f3-4917-b9c9-5f3fd812d20f	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	87b50f20-019e-4d82-8c07-3c5223affc34
0c512e64-7c15-4585-ad38-57058fa11705	email	openid-connect	oidc-usermodel-attribute-mapper	\N	5f6aeea2-1484-4474-9cfe-b66c0ec59d30
5de2e115-09da-46bf-967b-87edc0d907ee	email verified	openid-connect	oidc-usermodel-property-mapper	\N	5f6aeea2-1484-4474-9cfe-b66c0ec59d30
ecd49da0-e8ff-47f0-946e-c4c8fc6f9d5f	address	openid-connect	oidc-address-mapper	\N	9f4e737a-3383-4078-99a5-0390c8ad9bc9
b802a65e-2363-4d59-8a0d-03ef9b87e6f7	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	fd5edd43-eb09-4d28-b0c5-df17aeccc316
07215ee7-ee6f-46db-aa37-d763fa357991	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	fd5edd43-eb09-4d28-b0c5-df17aeccc316
75a3ddb1-7303-4b10-8985-eb83980b9499	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	909d9318-c4fa-48c7-82f1-8e9c94160ac9
5cf53a49-6caf-4bb4-a634-f4b3eaf5f4f5	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	909d9318-c4fa-48c7-82f1-8e9c94160ac9
9637a2d1-24f1-4b40-bf8d-25b768b2025e	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	909d9318-c4fa-48c7-82f1-8e9c94160ac9
f0965935-63e9-4d77-aaa9-cc877334dbb6	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	6d1fe510-797f-4102-8f05-6c284992e02c
20221fe4-7b93-4487-8920-ba691faf3085	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	7f327484-8284-4c27-8f94-2f42e74c9b53
50f2f838-8c90-4580-a8dc-e4064fa76e70	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	7f327484-8284-4c27-8f94-2f42e74c9b53
e2b17e8d-ccd1-47fd-adb6-5017acc5c0a8	acr loa level	openid-connect	oidc-acr-mapper	\N	637e3c73-f18e-4603-9c26-708a1bcac855
e5433238-3178-4369-a302-feb8ddcf889c	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	8cca7a80-36d4-44e6-9ac0-bd339a111441
5d13beca-d98d-415c-8dba-6d4e2251e36f	sub	openid-connect	oidc-sub-mapper	\N	8cca7a80-36d4-44e6-9ac0-bd339a111441
bc7318dc-f8c1-406d-ba1f-c2c58e810eb7	organization	openid-connect	oidc-organization-membership-mapper	\N	ffb25617-e1f8-4038-b04c-7caaba64400c
91c8e786-d7f9-4dfb-9887-33e02650c39e	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	e3665b21-655b-4222-a98c-567b10968fa0
1b66bff8-bfaf-4db6-be2f-2172f3d54aa2	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	e3665b21-655b-4222-a98c-567b10968fa0
033733bd-e38e-44f6-a2c6-2803f44dbcb3	email	openid-connect	oidc-usermodel-attribute-mapper	\N	eb8000fc-5791-475a-a5ca-6e9eacf3ca96
7c76a6dd-2f23-455e-9596-40a4f8a3cee5	email verified	openid-connect	oidc-usermodel-property-mapper	\N	eb8000fc-5791-475a-a5ca-6e9eacf3ca96
5a5d4f3c-368f-41f0-8af4-ac201ad85c23	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	33778144-3ab0-45b8-b12b-d6e51133c87a
349634f9-834d-4243-8128-9efcd9d83dbf	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	33778144-3ab0-45b8-b12b-d6e51133c87a
02f6bda6-2903-4ee8-b893-cfe1fabba538	organization	saml	saml-organization-membership-mapper	\N	577d8b9c-5795-4214-8703-e301c8eadeb1
560eaa5a-bad5-43ad-b9ce-3d1ffce753e8	address	openid-connect	oidc-address-mapper	\N	d72b75f5-b5c7-4a6c-8e00-a197ba18e29f
f49cdfa3-024b-420f-9e02-4de6ab75e232	acr loa level	openid-connect	oidc-acr-mapper	\N	d4276354-645c-4888-83a7-ce52303ac1c9
23d7ff50-f2c1-4746-ab79-ceeeb3be76be	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	b75f7fc5-08ec-4a2b-bf90-9fed81881326
6eac62e0-8c26-4bd7-8f57-d89655b83fb9	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	4f174b30-c68b-4c37-bb10-bae6d509b26f
5d6089ea-ef8a-4f5b-b9b8-744bd06adf35	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	4f174b30-c68b-4c37-bb10-bae6d509b26f
f1604575-42b0-4602-a694-8c429f3e997f	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	4f174b30-c68b-4c37-bb10-bae6d509b26f
9e02febb-1d8a-485e-b0b8-13d918f7cb15	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	4f174b30-c68b-4c37-bb10-bae6d509b26f
85a54d35-7785-4a51-b84c-9fdad6bda475	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	4f174b30-c68b-4c37-bb10-bae6d509b26f
aab07f1b-06a8-4904-bba9-37d04a3993c4	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	4f174b30-c68b-4c37-bb10-bae6d509b26f
a1b71f73-935c-46c1-a704-d2eed8fdf7e9	full name	openid-connect	oidc-full-name-mapper	\N	4f174b30-c68b-4c37-bb10-bae6d509b26f
d3848097-e73e-4fdb-b4d7-df060545138e	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	4f174b30-c68b-4c37-bb10-bae6d509b26f
18c96d8f-28ba-4c65-8f03-ba19d898da8f	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	4f174b30-c68b-4c37-bb10-bae6d509b26f
db4a56f2-24be-4c5c-826a-8549316265e9	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	4f174b30-c68b-4c37-bb10-bae6d509b26f
a374cd82-1ce8-4ffb-8ca9-bf3c6cc17d76	website	openid-connect	oidc-usermodel-attribute-mapper	\N	4f174b30-c68b-4c37-bb10-bae6d509b26f
1bc82259-4ee3-4a99-9d65-762b3b2c0b96	username	openid-connect	oidc-usermodel-attribute-mapper	\N	4f174b30-c68b-4c37-bb10-bae6d509b26f
ab3bf0f3-043a-4919-b3d6-27a97d594d28	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	4f174b30-c68b-4c37-bb10-bae6d509b26f
60a3b4cb-1c4e-4ed6-a8b0-e18ee56084d9	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	4f174b30-c68b-4c37-bb10-bae6d509b26f
0cf35c1a-905c-4b10-9fc6-03e065ea61ea	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	2e6e1812-abee-47e1-adb9-c82883cd9a20
1c7cd2b8-e7ee-4cba-bf57-11a897ab3776	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	2e6e1812-abee-47e1-adb9-c82883cd9a20
6d72dd44-419f-4db2-9a6a-9f69d25ab7a2	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	2e6e1812-abee-47e1-adb9-c82883cd9a20
f5777d8a-ae6f-4e9c-a063-461321866212	organization	openid-connect	oidc-organization-membership-mapper	\N	6708bae9-8e4e-4dd5-8f2c-6b21729ff1ad
59994685-b6b1-45c1-88e0-54d292b18b81	role list	saml	saml-role-list-mapper	\N	7b5242cf-59cb-4c3e-8705-318003a9b44e
0fededfb-c2ce-4c64-9217-077c02c7cfcb	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	d7b05a5a-21c6-414f-bef7-b28cace5d342
544edb28-5e4c-45f0-bae6-cd5f799b714d	sub	openid-connect	oidc-sub-mapper	\N	d7b05a5a-21c6-414f-bef7-b28cace5d342
c68f109a-348a-40ae-8cb8-e311b3109eb8	audience resolve	openid-connect	oidc-audience-resolve-mapper	69b5e48e-5dee-4ac0-b363-d9a311ae9b80	\N
e9993d27-3168-4387-888e-3538035e1e3d	locale	openid-connect	oidc-usermodel-attribute-mapper	59f6eb8a-7e11-4e0c-b0ab-33d4aa7e13f8	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
2c38f414-7a21-4c44-97f0-610721d11595	true	introspection.token.claim
2c38f414-7a21-4c44-97f0-610721d11595	true	userinfo.token.claim
2c38f414-7a21-4c44-97f0-610721d11595	locale	user.attribute
2c38f414-7a21-4c44-97f0-610721d11595	true	id.token.claim
2c38f414-7a21-4c44-97f0-610721d11595	true	access.token.claim
2c38f414-7a21-4c44-97f0-610721d11595	locale	claim.name
2c38f414-7a21-4c44-97f0-610721d11595	String	jsonType.label
15dc323b-2508-4acb-a736-add03a4f4623	false	single
15dc323b-2508-4acb-a736-add03a4f4623	Basic	attribute.nameformat
15dc323b-2508-4acb-a736-add03a4f4623	Role	attribute.name
0fa7ed89-add1-4640-817d-4c45d2357f05	true	introspection.token.claim
0fa7ed89-add1-4640-817d-4c45d2357f05	true	userinfo.token.claim
0fa7ed89-add1-4640-817d-4c45d2357f05	profile	user.attribute
0fa7ed89-add1-4640-817d-4c45d2357f05	true	id.token.claim
0fa7ed89-add1-4640-817d-4c45d2357f05	true	access.token.claim
0fa7ed89-add1-4640-817d-4c45d2357f05	profile	claim.name
0fa7ed89-add1-4640-817d-4c45d2357f05	String	jsonType.label
103a87b5-0e12-49a4-bc53-ca810c2f4227	true	introspection.token.claim
103a87b5-0e12-49a4-bc53-ca810c2f4227	true	userinfo.token.claim
103a87b5-0e12-49a4-bc53-ca810c2f4227	nickname	user.attribute
103a87b5-0e12-49a4-bc53-ca810c2f4227	true	id.token.claim
103a87b5-0e12-49a4-bc53-ca810c2f4227	true	access.token.claim
103a87b5-0e12-49a4-bc53-ca810c2f4227	nickname	claim.name
103a87b5-0e12-49a4-bc53-ca810c2f4227	String	jsonType.label
236e454a-e91b-4e2e-8f25-577b0daeedb7	true	introspection.token.claim
236e454a-e91b-4e2e-8f25-577b0daeedb7	true	userinfo.token.claim
236e454a-e91b-4e2e-8f25-577b0daeedb7	gender	user.attribute
236e454a-e91b-4e2e-8f25-577b0daeedb7	true	id.token.claim
236e454a-e91b-4e2e-8f25-577b0daeedb7	true	access.token.claim
236e454a-e91b-4e2e-8f25-577b0daeedb7	gender	claim.name
236e454a-e91b-4e2e-8f25-577b0daeedb7	String	jsonType.label
2b800336-3863-4c77-bbb0-4056e1ea097d	true	introspection.token.claim
2b800336-3863-4c77-bbb0-4056e1ea097d	true	userinfo.token.claim
2b800336-3863-4c77-bbb0-4056e1ea097d	locale	user.attribute
2b800336-3863-4c77-bbb0-4056e1ea097d	true	id.token.claim
2b800336-3863-4c77-bbb0-4056e1ea097d	true	access.token.claim
2b800336-3863-4c77-bbb0-4056e1ea097d	locale	claim.name
2b800336-3863-4c77-bbb0-4056e1ea097d	String	jsonType.label
5a12b839-ead3-4332-bdd3-226fb5fe39ac	true	introspection.token.claim
5a12b839-ead3-4332-bdd3-226fb5fe39ac	true	userinfo.token.claim
5a12b839-ead3-4332-bdd3-226fb5fe39ac	zoneinfo	user.attribute
5a12b839-ead3-4332-bdd3-226fb5fe39ac	true	id.token.claim
5a12b839-ead3-4332-bdd3-226fb5fe39ac	true	access.token.claim
5a12b839-ead3-4332-bdd3-226fb5fe39ac	zoneinfo	claim.name
5a12b839-ead3-4332-bdd3-226fb5fe39ac	String	jsonType.label
692c9568-abb3-41ce-8a95-d64a8535b786	true	introspection.token.claim
692c9568-abb3-41ce-8a95-d64a8535b786	true	userinfo.token.claim
692c9568-abb3-41ce-8a95-d64a8535b786	website	user.attribute
692c9568-abb3-41ce-8a95-d64a8535b786	true	id.token.claim
692c9568-abb3-41ce-8a95-d64a8535b786	true	access.token.claim
692c9568-abb3-41ce-8a95-d64a8535b786	website	claim.name
692c9568-abb3-41ce-8a95-d64a8535b786	String	jsonType.label
798c3fdc-81f3-4917-b9c9-5f3fd812d20f	true	introspection.token.claim
798c3fdc-81f3-4917-b9c9-5f3fd812d20f	true	userinfo.token.claim
798c3fdc-81f3-4917-b9c9-5f3fd812d20f	updatedAt	user.attribute
798c3fdc-81f3-4917-b9c9-5f3fd812d20f	true	id.token.claim
798c3fdc-81f3-4917-b9c9-5f3fd812d20f	true	access.token.claim
798c3fdc-81f3-4917-b9c9-5f3fd812d20f	updated_at	claim.name
798c3fdc-81f3-4917-b9c9-5f3fd812d20f	long	jsonType.label
9d1b3f9d-9bf8-4603-8910-8711ef4c9b9b	true	introspection.token.claim
9d1b3f9d-9bf8-4603-8910-8711ef4c9b9b	true	userinfo.token.claim
9d1b3f9d-9bf8-4603-8910-8711ef4c9b9b	middleName	user.attribute
9d1b3f9d-9bf8-4603-8910-8711ef4c9b9b	true	id.token.claim
9d1b3f9d-9bf8-4603-8910-8711ef4c9b9b	true	access.token.claim
9d1b3f9d-9bf8-4603-8910-8711ef4c9b9b	middle_name	claim.name
9d1b3f9d-9bf8-4603-8910-8711ef4c9b9b	String	jsonType.label
acec36e1-8a6e-4032-bc18-1f1d1861aec8	true	introspection.token.claim
acec36e1-8a6e-4032-bc18-1f1d1861aec8	true	userinfo.token.claim
acec36e1-8a6e-4032-bc18-1f1d1861aec8	username	user.attribute
acec36e1-8a6e-4032-bc18-1f1d1861aec8	true	id.token.claim
acec36e1-8a6e-4032-bc18-1f1d1861aec8	true	access.token.claim
acec36e1-8a6e-4032-bc18-1f1d1861aec8	preferred_username	claim.name
acec36e1-8a6e-4032-bc18-1f1d1861aec8	String	jsonType.label
bcbb07be-6dca-4b07-8fde-e68b55aa07fb	true	introspection.token.claim
bcbb07be-6dca-4b07-8fde-e68b55aa07fb	true	userinfo.token.claim
bcbb07be-6dca-4b07-8fde-e68b55aa07fb	lastName	user.attribute
bcbb07be-6dca-4b07-8fde-e68b55aa07fb	true	id.token.claim
bcbb07be-6dca-4b07-8fde-e68b55aa07fb	true	access.token.claim
bcbb07be-6dca-4b07-8fde-e68b55aa07fb	family_name	claim.name
bcbb07be-6dca-4b07-8fde-e68b55aa07fb	String	jsonType.label
cff98ac0-56cf-4fb6-8a48-34820fe05d3a	true	introspection.token.claim
cff98ac0-56cf-4fb6-8a48-34820fe05d3a	true	userinfo.token.claim
cff98ac0-56cf-4fb6-8a48-34820fe05d3a	picture	user.attribute
cff98ac0-56cf-4fb6-8a48-34820fe05d3a	true	id.token.claim
cff98ac0-56cf-4fb6-8a48-34820fe05d3a	true	access.token.claim
cff98ac0-56cf-4fb6-8a48-34820fe05d3a	picture	claim.name
cff98ac0-56cf-4fb6-8a48-34820fe05d3a	String	jsonType.label
d8eeaf7a-74a7-4f42-88d3-20ab7e2acd50	true	introspection.token.claim
d8eeaf7a-74a7-4f42-88d3-20ab7e2acd50	true	userinfo.token.claim
d8eeaf7a-74a7-4f42-88d3-20ab7e2acd50	birthdate	user.attribute
d8eeaf7a-74a7-4f42-88d3-20ab7e2acd50	true	id.token.claim
d8eeaf7a-74a7-4f42-88d3-20ab7e2acd50	true	access.token.claim
d8eeaf7a-74a7-4f42-88d3-20ab7e2acd50	birthdate	claim.name
d8eeaf7a-74a7-4f42-88d3-20ab7e2acd50	String	jsonType.label
e5d6b2b2-a105-4a0e-a1dd-fc60b8b2bc9a	true	introspection.token.claim
e5d6b2b2-a105-4a0e-a1dd-fc60b8b2bc9a	true	userinfo.token.claim
e5d6b2b2-a105-4a0e-a1dd-fc60b8b2bc9a	firstName	user.attribute
e5d6b2b2-a105-4a0e-a1dd-fc60b8b2bc9a	true	id.token.claim
e5d6b2b2-a105-4a0e-a1dd-fc60b8b2bc9a	true	access.token.claim
e5d6b2b2-a105-4a0e-a1dd-fc60b8b2bc9a	given_name	claim.name
e5d6b2b2-a105-4a0e-a1dd-fc60b8b2bc9a	String	jsonType.label
f306c129-0f26-4601-8ab5-851a03053a6d	true	introspection.token.claim
f306c129-0f26-4601-8ab5-851a03053a6d	true	userinfo.token.claim
f306c129-0f26-4601-8ab5-851a03053a6d	true	id.token.claim
f306c129-0f26-4601-8ab5-851a03053a6d	true	access.token.claim
0c512e64-7c15-4585-ad38-57058fa11705	true	introspection.token.claim
0c512e64-7c15-4585-ad38-57058fa11705	true	userinfo.token.claim
0c512e64-7c15-4585-ad38-57058fa11705	email	user.attribute
0c512e64-7c15-4585-ad38-57058fa11705	true	id.token.claim
0c512e64-7c15-4585-ad38-57058fa11705	true	access.token.claim
0c512e64-7c15-4585-ad38-57058fa11705	email	claim.name
0c512e64-7c15-4585-ad38-57058fa11705	String	jsonType.label
5de2e115-09da-46bf-967b-87edc0d907ee	true	introspection.token.claim
5de2e115-09da-46bf-967b-87edc0d907ee	true	userinfo.token.claim
5de2e115-09da-46bf-967b-87edc0d907ee	emailVerified	user.attribute
5de2e115-09da-46bf-967b-87edc0d907ee	true	id.token.claim
5de2e115-09da-46bf-967b-87edc0d907ee	true	access.token.claim
5de2e115-09da-46bf-967b-87edc0d907ee	email_verified	claim.name
5de2e115-09da-46bf-967b-87edc0d907ee	boolean	jsonType.label
ecd49da0-e8ff-47f0-946e-c4c8fc6f9d5f	formatted	user.attribute.formatted
ecd49da0-e8ff-47f0-946e-c4c8fc6f9d5f	country	user.attribute.country
ecd49da0-e8ff-47f0-946e-c4c8fc6f9d5f	true	introspection.token.claim
ecd49da0-e8ff-47f0-946e-c4c8fc6f9d5f	postal_code	user.attribute.postal_code
ecd49da0-e8ff-47f0-946e-c4c8fc6f9d5f	true	userinfo.token.claim
ecd49da0-e8ff-47f0-946e-c4c8fc6f9d5f	street	user.attribute.street
ecd49da0-e8ff-47f0-946e-c4c8fc6f9d5f	true	id.token.claim
ecd49da0-e8ff-47f0-946e-c4c8fc6f9d5f	region	user.attribute.region
ecd49da0-e8ff-47f0-946e-c4c8fc6f9d5f	true	access.token.claim
ecd49da0-e8ff-47f0-946e-c4c8fc6f9d5f	locality	user.attribute.locality
07215ee7-ee6f-46db-aa37-d763fa357991	true	introspection.token.claim
07215ee7-ee6f-46db-aa37-d763fa357991	true	userinfo.token.claim
07215ee7-ee6f-46db-aa37-d763fa357991	phoneNumberVerified	user.attribute
07215ee7-ee6f-46db-aa37-d763fa357991	true	id.token.claim
07215ee7-ee6f-46db-aa37-d763fa357991	true	access.token.claim
07215ee7-ee6f-46db-aa37-d763fa357991	phone_number_verified	claim.name
07215ee7-ee6f-46db-aa37-d763fa357991	boolean	jsonType.label
b802a65e-2363-4d59-8a0d-03ef9b87e6f7	true	introspection.token.claim
b802a65e-2363-4d59-8a0d-03ef9b87e6f7	true	userinfo.token.claim
b802a65e-2363-4d59-8a0d-03ef9b87e6f7	phoneNumber	user.attribute
b802a65e-2363-4d59-8a0d-03ef9b87e6f7	true	id.token.claim
b802a65e-2363-4d59-8a0d-03ef9b87e6f7	true	access.token.claim
b802a65e-2363-4d59-8a0d-03ef9b87e6f7	phone_number	claim.name
b802a65e-2363-4d59-8a0d-03ef9b87e6f7	String	jsonType.label
5cf53a49-6caf-4bb4-a634-f4b3eaf5f4f5	true	introspection.token.claim
5cf53a49-6caf-4bb4-a634-f4b3eaf5f4f5	true	multivalued
5cf53a49-6caf-4bb4-a634-f4b3eaf5f4f5	foo	user.attribute
5cf53a49-6caf-4bb4-a634-f4b3eaf5f4f5	true	access.token.claim
5cf53a49-6caf-4bb4-a634-f4b3eaf5f4f5	resource_access.${client_id}.roles	claim.name
5cf53a49-6caf-4bb4-a634-f4b3eaf5f4f5	String	jsonType.label
75a3ddb1-7303-4b10-8985-eb83980b9499	true	introspection.token.claim
75a3ddb1-7303-4b10-8985-eb83980b9499	true	multivalued
75a3ddb1-7303-4b10-8985-eb83980b9499	foo	user.attribute
75a3ddb1-7303-4b10-8985-eb83980b9499	true	access.token.claim
75a3ddb1-7303-4b10-8985-eb83980b9499	realm_access.roles	claim.name
75a3ddb1-7303-4b10-8985-eb83980b9499	String	jsonType.label
9637a2d1-24f1-4b40-bf8d-25b768b2025e	true	introspection.token.claim
9637a2d1-24f1-4b40-bf8d-25b768b2025e	true	access.token.claim
f0965935-63e9-4d77-aaa9-cc877334dbb6	true	introspection.token.claim
f0965935-63e9-4d77-aaa9-cc877334dbb6	true	access.token.claim
20221fe4-7b93-4487-8920-ba691faf3085	true	introspection.token.claim
20221fe4-7b93-4487-8920-ba691faf3085	true	userinfo.token.claim
20221fe4-7b93-4487-8920-ba691faf3085	username	user.attribute
20221fe4-7b93-4487-8920-ba691faf3085	true	id.token.claim
20221fe4-7b93-4487-8920-ba691faf3085	true	access.token.claim
20221fe4-7b93-4487-8920-ba691faf3085	upn	claim.name
20221fe4-7b93-4487-8920-ba691faf3085	String	jsonType.label
50f2f838-8c90-4580-a8dc-e4064fa76e70	true	introspection.token.claim
50f2f838-8c90-4580-a8dc-e4064fa76e70	true	multivalued
50f2f838-8c90-4580-a8dc-e4064fa76e70	foo	user.attribute
50f2f838-8c90-4580-a8dc-e4064fa76e70	true	id.token.claim
50f2f838-8c90-4580-a8dc-e4064fa76e70	true	access.token.claim
50f2f838-8c90-4580-a8dc-e4064fa76e70	groups	claim.name
50f2f838-8c90-4580-a8dc-e4064fa76e70	String	jsonType.label
e2b17e8d-ccd1-47fd-adb6-5017acc5c0a8	true	introspection.token.claim
e2b17e8d-ccd1-47fd-adb6-5017acc5c0a8	true	id.token.claim
e2b17e8d-ccd1-47fd-adb6-5017acc5c0a8	true	access.token.claim
5d13beca-d98d-415c-8dba-6d4e2251e36f	true	introspection.token.claim
5d13beca-d98d-415c-8dba-6d4e2251e36f	true	access.token.claim
e5433238-3178-4369-a302-feb8ddcf889c	AUTH_TIME	user.session.note
e5433238-3178-4369-a302-feb8ddcf889c	true	introspection.token.claim
e5433238-3178-4369-a302-feb8ddcf889c	true	id.token.claim
e5433238-3178-4369-a302-feb8ddcf889c	true	access.token.claim
e5433238-3178-4369-a302-feb8ddcf889c	auth_time	claim.name
e5433238-3178-4369-a302-feb8ddcf889c	long	jsonType.label
bc7318dc-f8c1-406d-ba1f-c2c58e810eb7	true	introspection.token.claim
bc7318dc-f8c1-406d-ba1f-c2c58e810eb7	true	multivalued
bc7318dc-f8c1-406d-ba1f-c2c58e810eb7	true	id.token.claim
bc7318dc-f8c1-406d-ba1f-c2c58e810eb7	true	access.token.claim
bc7318dc-f8c1-406d-ba1f-c2c58e810eb7	organization	claim.name
bc7318dc-f8c1-406d-ba1f-c2c58e810eb7	String	jsonType.label
1b66bff8-bfaf-4db6-be2f-2172f3d54aa2	true	introspection.token.claim
1b66bff8-bfaf-4db6-be2f-2172f3d54aa2	true	multivalued
1b66bff8-bfaf-4db6-be2f-2172f3d54aa2	true	userinfo.token.claim
1b66bff8-bfaf-4db6-be2f-2172f3d54aa2	foo	user.attribute
1b66bff8-bfaf-4db6-be2f-2172f3d54aa2	true	id.token.claim
1b66bff8-bfaf-4db6-be2f-2172f3d54aa2	true	access.token.claim
1b66bff8-bfaf-4db6-be2f-2172f3d54aa2	groups	claim.name
1b66bff8-bfaf-4db6-be2f-2172f3d54aa2	String	jsonType.label
91c8e786-d7f9-4dfb-9887-33e02650c39e	true	introspection.token.claim
91c8e786-d7f9-4dfb-9887-33e02650c39e	true	userinfo.token.claim
91c8e786-d7f9-4dfb-9887-33e02650c39e	username	user.attribute
91c8e786-d7f9-4dfb-9887-33e02650c39e	true	id.token.claim
91c8e786-d7f9-4dfb-9887-33e02650c39e	true	access.token.claim
91c8e786-d7f9-4dfb-9887-33e02650c39e	upn	claim.name
91c8e786-d7f9-4dfb-9887-33e02650c39e	String	jsonType.label
033733bd-e38e-44f6-a2c6-2803f44dbcb3	true	introspection.token.claim
033733bd-e38e-44f6-a2c6-2803f44dbcb3	true	userinfo.token.claim
033733bd-e38e-44f6-a2c6-2803f44dbcb3	email	user.attribute
033733bd-e38e-44f6-a2c6-2803f44dbcb3	true	id.token.claim
033733bd-e38e-44f6-a2c6-2803f44dbcb3	true	access.token.claim
033733bd-e38e-44f6-a2c6-2803f44dbcb3	email	claim.name
033733bd-e38e-44f6-a2c6-2803f44dbcb3	String	jsonType.label
7c76a6dd-2f23-455e-9596-40a4f8a3cee5	true	introspection.token.claim
7c76a6dd-2f23-455e-9596-40a4f8a3cee5	true	userinfo.token.claim
7c76a6dd-2f23-455e-9596-40a4f8a3cee5	emailVerified	user.attribute
7c76a6dd-2f23-455e-9596-40a4f8a3cee5	true	id.token.claim
7c76a6dd-2f23-455e-9596-40a4f8a3cee5	true	access.token.claim
7c76a6dd-2f23-455e-9596-40a4f8a3cee5	email_verified	claim.name
7c76a6dd-2f23-455e-9596-40a4f8a3cee5	boolean	jsonType.label
349634f9-834d-4243-8128-9efcd9d83dbf	true	introspection.token.claim
349634f9-834d-4243-8128-9efcd9d83dbf	true	userinfo.token.claim
349634f9-834d-4243-8128-9efcd9d83dbf	phoneNumber	user.attribute
349634f9-834d-4243-8128-9efcd9d83dbf	true	id.token.claim
349634f9-834d-4243-8128-9efcd9d83dbf	true	access.token.claim
349634f9-834d-4243-8128-9efcd9d83dbf	phone_number	claim.name
349634f9-834d-4243-8128-9efcd9d83dbf	String	jsonType.label
5a5d4f3c-368f-41f0-8af4-ac201ad85c23	true	introspection.token.claim
5a5d4f3c-368f-41f0-8af4-ac201ad85c23	true	userinfo.token.claim
5a5d4f3c-368f-41f0-8af4-ac201ad85c23	phoneNumberVerified	user.attribute
5a5d4f3c-368f-41f0-8af4-ac201ad85c23	true	id.token.claim
5a5d4f3c-368f-41f0-8af4-ac201ad85c23	true	access.token.claim
5a5d4f3c-368f-41f0-8af4-ac201ad85c23	phone_number_verified	claim.name
5a5d4f3c-368f-41f0-8af4-ac201ad85c23	boolean	jsonType.label
560eaa5a-bad5-43ad-b9ce-3d1ffce753e8	formatted	user.attribute.formatted
560eaa5a-bad5-43ad-b9ce-3d1ffce753e8	country	user.attribute.country
560eaa5a-bad5-43ad-b9ce-3d1ffce753e8	true	introspection.token.claim
560eaa5a-bad5-43ad-b9ce-3d1ffce753e8	postal_code	user.attribute.postal_code
560eaa5a-bad5-43ad-b9ce-3d1ffce753e8	true	userinfo.token.claim
560eaa5a-bad5-43ad-b9ce-3d1ffce753e8	street	user.attribute.street
560eaa5a-bad5-43ad-b9ce-3d1ffce753e8	true	id.token.claim
560eaa5a-bad5-43ad-b9ce-3d1ffce753e8	region	user.attribute.region
560eaa5a-bad5-43ad-b9ce-3d1ffce753e8	true	access.token.claim
560eaa5a-bad5-43ad-b9ce-3d1ffce753e8	locality	user.attribute.locality
f49cdfa3-024b-420f-9e02-4de6ab75e232	true	id.token.claim
f49cdfa3-024b-420f-9e02-4de6ab75e232	true	introspection.token.claim
f49cdfa3-024b-420f-9e02-4de6ab75e232	true	access.token.claim
f49cdfa3-024b-420f-9e02-4de6ab75e232	true	userinfo.token.claim
23d7ff50-f2c1-4746-ab79-ceeeb3be76be	true	introspection.token.claim
23d7ff50-f2c1-4746-ab79-ceeeb3be76be	true	access.token.claim
18c96d8f-28ba-4c65-8f03-ba19d898da8f	true	introspection.token.claim
18c96d8f-28ba-4c65-8f03-ba19d898da8f	true	userinfo.token.claim
18c96d8f-28ba-4c65-8f03-ba19d898da8f	gender	user.attribute
18c96d8f-28ba-4c65-8f03-ba19d898da8f	true	id.token.claim
18c96d8f-28ba-4c65-8f03-ba19d898da8f	true	access.token.claim
18c96d8f-28ba-4c65-8f03-ba19d898da8f	gender	claim.name
18c96d8f-28ba-4c65-8f03-ba19d898da8f	String	jsonType.label
1bc82259-4ee3-4a99-9d65-762b3b2c0b96	true	introspection.token.claim
1bc82259-4ee3-4a99-9d65-762b3b2c0b96	true	userinfo.token.claim
1bc82259-4ee3-4a99-9d65-762b3b2c0b96	username	user.attribute
1bc82259-4ee3-4a99-9d65-762b3b2c0b96	true	id.token.claim
1bc82259-4ee3-4a99-9d65-762b3b2c0b96	true	access.token.claim
1bc82259-4ee3-4a99-9d65-762b3b2c0b96	preferred_username	claim.name
1bc82259-4ee3-4a99-9d65-762b3b2c0b96	String	jsonType.label
5d6089ea-ef8a-4f5b-b9b8-744bd06adf35	true	introspection.token.claim
5d6089ea-ef8a-4f5b-b9b8-744bd06adf35	true	userinfo.token.claim
5d6089ea-ef8a-4f5b-b9b8-744bd06adf35	profile	user.attribute
5d6089ea-ef8a-4f5b-b9b8-744bd06adf35	true	id.token.claim
5d6089ea-ef8a-4f5b-b9b8-744bd06adf35	true	access.token.claim
5d6089ea-ef8a-4f5b-b9b8-744bd06adf35	profile	claim.name
5d6089ea-ef8a-4f5b-b9b8-744bd06adf35	String	jsonType.label
60a3b4cb-1c4e-4ed6-a8b0-e18ee56084d9	true	introspection.token.claim
60a3b4cb-1c4e-4ed6-a8b0-e18ee56084d9	true	userinfo.token.claim
60a3b4cb-1c4e-4ed6-a8b0-e18ee56084d9	middleName	user.attribute
60a3b4cb-1c4e-4ed6-a8b0-e18ee56084d9	true	id.token.claim
60a3b4cb-1c4e-4ed6-a8b0-e18ee56084d9	true	access.token.claim
60a3b4cb-1c4e-4ed6-a8b0-e18ee56084d9	middle_name	claim.name
60a3b4cb-1c4e-4ed6-a8b0-e18ee56084d9	String	jsonType.label
6eac62e0-8c26-4bd7-8f57-d89655b83fb9	true	introspection.token.claim
6eac62e0-8c26-4bd7-8f57-d89655b83fb9	true	userinfo.token.claim
6eac62e0-8c26-4bd7-8f57-d89655b83fb9	lastName	user.attribute
6eac62e0-8c26-4bd7-8f57-d89655b83fb9	true	id.token.claim
6eac62e0-8c26-4bd7-8f57-d89655b83fb9	true	access.token.claim
6eac62e0-8c26-4bd7-8f57-d89655b83fb9	family_name	claim.name
6eac62e0-8c26-4bd7-8f57-d89655b83fb9	String	jsonType.label
85a54d35-7785-4a51-b84c-9fdad6bda475	true	introspection.token.claim
85a54d35-7785-4a51-b84c-9fdad6bda475	true	userinfo.token.claim
85a54d35-7785-4a51-b84c-9fdad6bda475	nickname	user.attribute
85a54d35-7785-4a51-b84c-9fdad6bda475	true	id.token.claim
85a54d35-7785-4a51-b84c-9fdad6bda475	true	access.token.claim
85a54d35-7785-4a51-b84c-9fdad6bda475	nickname	claim.name
85a54d35-7785-4a51-b84c-9fdad6bda475	String	jsonType.label
9e02febb-1d8a-485e-b0b8-13d918f7cb15	true	introspection.token.claim
9e02febb-1d8a-485e-b0b8-13d918f7cb15	true	userinfo.token.claim
9e02febb-1d8a-485e-b0b8-13d918f7cb15	updatedAt	user.attribute
9e02febb-1d8a-485e-b0b8-13d918f7cb15	true	id.token.claim
9e02febb-1d8a-485e-b0b8-13d918f7cb15	true	access.token.claim
9e02febb-1d8a-485e-b0b8-13d918f7cb15	updated_at	claim.name
9e02febb-1d8a-485e-b0b8-13d918f7cb15	long	jsonType.label
a1b71f73-935c-46c1-a704-d2eed8fdf7e9	true	id.token.claim
a1b71f73-935c-46c1-a704-d2eed8fdf7e9	true	introspection.token.claim
a1b71f73-935c-46c1-a704-d2eed8fdf7e9	true	access.token.claim
a1b71f73-935c-46c1-a704-d2eed8fdf7e9	true	userinfo.token.claim
a374cd82-1ce8-4ffb-8ca9-bf3c6cc17d76	true	introspection.token.claim
a374cd82-1ce8-4ffb-8ca9-bf3c6cc17d76	true	userinfo.token.claim
a374cd82-1ce8-4ffb-8ca9-bf3c6cc17d76	website	user.attribute
a374cd82-1ce8-4ffb-8ca9-bf3c6cc17d76	true	id.token.claim
a374cd82-1ce8-4ffb-8ca9-bf3c6cc17d76	true	access.token.claim
a374cd82-1ce8-4ffb-8ca9-bf3c6cc17d76	website	claim.name
a374cd82-1ce8-4ffb-8ca9-bf3c6cc17d76	String	jsonType.label
aab07f1b-06a8-4904-bba9-37d04a3993c4	true	introspection.token.claim
aab07f1b-06a8-4904-bba9-37d04a3993c4	true	userinfo.token.claim
aab07f1b-06a8-4904-bba9-37d04a3993c4	birthdate	user.attribute
aab07f1b-06a8-4904-bba9-37d04a3993c4	true	id.token.claim
aab07f1b-06a8-4904-bba9-37d04a3993c4	true	access.token.claim
aab07f1b-06a8-4904-bba9-37d04a3993c4	birthdate	claim.name
aab07f1b-06a8-4904-bba9-37d04a3993c4	String	jsonType.label
ab3bf0f3-043a-4919-b3d6-27a97d594d28	true	introspection.token.claim
ab3bf0f3-043a-4919-b3d6-27a97d594d28	true	userinfo.token.claim
ab3bf0f3-043a-4919-b3d6-27a97d594d28	locale	user.attribute
ab3bf0f3-043a-4919-b3d6-27a97d594d28	true	id.token.claim
ab3bf0f3-043a-4919-b3d6-27a97d594d28	true	access.token.claim
ab3bf0f3-043a-4919-b3d6-27a97d594d28	locale	claim.name
ab3bf0f3-043a-4919-b3d6-27a97d594d28	String	jsonType.label
d3848097-e73e-4fdb-b4d7-df060545138e	true	introspection.token.claim
d3848097-e73e-4fdb-b4d7-df060545138e	true	userinfo.token.claim
d3848097-e73e-4fdb-b4d7-df060545138e	firstName	user.attribute
d3848097-e73e-4fdb-b4d7-df060545138e	true	id.token.claim
d3848097-e73e-4fdb-b4d7-df060545138e	true	access.token.claim
d3848097-e73e-4fdb-b4d7-df060545138e	given_name	claim.name
d3848097-e73e-4fdb-b4d7-df060545138e	String	jsonType.label
db4a56f2-24be-4c5c-826a-8549316265e9	true	introspection.token.claim
db4a56f2-24be-4c5c-826a-8549316265e9	true	userinfo.token.claim
db4a56f2-24be-4c5c-826a-8549316265e9	picture	user.attribute
db4a56f2-24be-4c5c-826a-8549316265e9	true	id.token.claim
db4a56f2-24be-4c5c-826a-8549316265e9	true	access.token.claim
db4a56f2-24be-4c5c-826a-8549316265e9	picture	claim.name
db4a56f2-24be-4c5c-826a-8549316265e9	String	jsonType.label
f1604575-42b0-4602-a694-8c429f3e997f	true	introspection.token.claim
f1604575-42b0-4602-a694-8c429f3e997f	true	userinfo.token.claim
f1604575-42b0-4602-a694-8c429f3e997f	zoneinfo	user.attribute
f1604575-42b0-4602-a694-8c429f3e997f	true	id.token.claim
f1604575-42b0-4602-a694-8c429f3e997f	true	access.token.claim
f1604575-42b0-4602-a694-8c429f3e997f	zoneinfo	claim.name
f1604575-42b0-4602-a694-8c429f3e997f	String	jsonType.label
0cf35c1a-905c-4b10-9fc6-03e065ea61ea	true	introspection.token.claim
0cf35c1a-905c-4b10-9fc6-03e065ea61ea	true	access.token.claim
1c7cd2b8-e7ee-4cba-bf57-11a897ab3776	foo	user.attribute
1c7cd2b8-e7ee-4cba-bf57-11a897ab3776	true	introspection.token.claim
1c7cd2b8-e7ee-4cba-bf57-11a897ab3776	true	access.token.claim
1c7cd2b8-e7ee-4cba-bf57-11a897ab3776	resource_access.${client_id}.roles	claim.name
1c7cd2b8-e7ee-4cba-bf57-11a897ab3776	String	jsonType.label
1c7cd2b8-e7ee-4cba-bf57-11a897ab3776	true	multivalued
6d72dd44-419f-4db2-9a6a-9f69d25ab7a2	foo	user.attribute
6d72dd44-419f-4db2-9a6a-9f69d25ab7a2	true	introspection.token.claim
6d72dd44-419f-4db2-9a6a-9f69d25ab7a2	true	access.token.claim
6d72dd44-419f-4db2-9a6a-9f69d25ab7a2	realm_access.roles	claim.name
6d72dd44-419f-4db2-9a6a-9f69d25ab7a2	String	jsonType.label
6d72dd44-419f-4db2-9a6a-9f69d25ab7a2	true	multivalued
f5777d8a-ae6f-4e9c-a063-461321866212	true	introspection.token.claim
f5777d8a-ae6f-4e9c-a063-461321866212	true	multivalued
f5777d8a-ae6f-4e9c-a063-461321866212	true	userinfo.token.claim
f5777d8a-ae6f-4e9c-a063-461321866212	true	id.token.claim
f5777d8a-ae6f-4e9c-a063-461321866212	true	access.token.claim
f5777d8a-ae6f-4e9c-a063-461321866212	organization	claim.name
f5777d8a-ae6f-4e9c-a063-461321866212	String	jsonType.label
59994685-b6b1-45c1-88e0-54d292b18b81	false	single
59994685-b6b1-45c1-88e0-54d292b18b81	Basic	attribute.nameformat
59994685-b6b1-45c1-88e0-54d292b18b81	Role	attribute.name
0fededfb-c2ce-4c64-9217-077c02c7cfcb	AUTH_TIME	user.session.note
0fededfb-c2ce-4c64-9217-077c02c7cfcb	true	introspection.token.claim
0fededfb-c2ce-4c64-9217-077c02c7cfcb	true	userinfo.token.claim
0fededfb-c2ce-4c64-9217-077c02c7cfcb	true	id.token.claim
0fededfb-c2ce-4c64-9217-077c02c7cfcb	true	access.token.claim
0fededfb-c2ce-4c64-9217-077c02c7cfcb	auth_time	claim.name
0fededfb-c2ce-4c64-9217-077c02c7cfcb	long	jsonType.label
544edb28-5e4c-45f0-bae6-cd5f799b714d	true	introspection.token.claim
544edb28-5e4c-45f0-bae6-cd5f799b714d	true	access.token.claim
e9993d27-3168-4387-888e-3538035e1e3d	true	introspection.token.claim
e9993d27-3168-4387-888e-3538035e1e3d	true	userinfo.token.claim
e9993d27-3168-4387-888e-3538035e1e3d	locale	user.attribute
e9993d27-3168-4387-888e-3538035e1e3d	true	id.token.claim
e9993d27-3168-4387-888e-3538035e1e3d	true	access.token.claim
e9993d27-3168-4387-888e-3538035e1e3d	locale	claim.name
e9993d27-3168-4387-888e-3538035e1e3d	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
7df03360-60a3-49d8-8fc4-f7cf9b739084	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	82b1cb52-ee49-426d-9d20-5365bd7dbae4	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	920fa4ea-5b15-49f4-9cac-da322bc4891f	8d812cde-5d38-49bb-8431-f3f501a6da72	42d38bfa-bc8f-4587-8b5c-4bfb56f389d1	4624c5c3-e95b-453c-bba5-caf569b77bbc	94414d8c-0d1a-493b-ba38-2d6198070865	2592000	f	900	t	f	ccad98c4-7ce0-4567-968b-c0de02d1dde4	0	f	0	0	f2464307-faaf-4598-98a2-33952a03351b
be6ce2a1-9fac-4c0a-9916-53b2dbad6409	60	300	300	\N	\N	\N	t	f	0	\N	KahootRealm	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	188cb1f3-d31f-4737-a6e4-70df5283923b	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	9f084199-d6f7-4ee8-9111-37d9be0b6446	3c29de44-590d-4d2f-b7ed-572cc96c6569	0d6bbefa-a98c-428e-ba13-a03d692a29fb	bbc3d78a-97ec-4856-a678-025cc8918a3a	df88470c-4746-4043-bc4b-a572cb1b0eca	2592000	f	900	t	f	0cfef825-093c-4a5a-bff9-28da27b8daf7	0	f	0	0	e3a66f8f-ca9d-48c9-b29b-1e465436380a
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	7df03360-60a3-49d8-8fc4-f7cf9b739084	
_browser_header.xContentTypeOptions	7df03360-60a3-49d8-8fc4-f7cf9b739084	nosniff
_browser_header.referrerPolicy	7df03360-60a3-49d8-8fc4-f7cf9b739084	no-referrer
_browser_header.xRobotsTag	7df03360-60a3-49d8-8fc4-f7cf9b739084	none
_browser_header.xFrameOptions	7df03360-60a3-49d8-8fc4-f7cf9b739084	SAMEORIGIN
_browser_header.contentSecurityPolicy	7df03360-60a3-49d8-8fc4-f7cf9b739084	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	7df03360-60a3-49d8-8fc4-f7cf9b739084	1; mode=block
_browser_header.strictTransportSecurity	7df03360-60a3-49d8-8fc4-f7cf9b739084	max-age=31536000; includeSubDomains
bruteForceProtected	7df03360-60a3-49d8-8fc4-f7cf9b739084	false
permanentLockout	7df03360-60a3-49d8-8fc4-f7cf9b739084	false
maxTemporaryLockouts	7df03360-60a3-49d8-8fc4-f7cf9b739084	0
maxFailureWaitSeconds	7df03360-60a3-49d8-8fc4-f7cf9b739084	900
minimumQuickLoginWaitSeconds	7df03360-60a3-49d8-8fc4-f7cf9b739084	60
waitIncrementSeconds	7df03360-60a3-49d8-8fc4-f7cf9b739084	60
quickLoginCheckMilliSeconds	7df03360-60a3-49d8-8fc4-f7cf9b739084	1000
maxDeltaTimeSeconds	7df03360-60a3-49d8-8fc4-f7cf9b739084	43200
failureFactor	7df03360-60a3-49d8-8fc4-f7cf9b739084	30
realmReusableOtpCode	7df03360-60a3-49d8-8fc4-f7cf9b739084	false
firstBrokerLoginFlowId	7df03360-60a3-49d8-8fc4-f7cf9b739084	ff05994d-d11c-4699-8edb-8cf350580481
displayName	7df03360-60a3-49d8-8fc4-f7cf9b739084	Keycloak
displayNameHtml	7df03360-60a3-49d8-8fc4-f7cf9b739084	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	7df03360-60a3-49d8-8fc4-f7cf9b739084	RS256
offlineSessionMaxLifespanEnabled	7df03360-60a3-49d8-8fc4-f7cf9b739084	false
offlineSessionMaxLifespan	7df03360-60a3-49d8-8fc4-f7cf9b739084	5184000
_browser_header.contentSecurityPolicyReportOnly	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	
_browser_header.xContentTypeOptions	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	nosniff
_browser_header.referrerPolicy	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	no-referrer
_browser_header.xRobotsTag	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	none
_browser_header.xFrameOptions	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	SAMEORIGIN
_browser_header.contentSecurityPolicy	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	1; mode=block
_browser_header.strictTransportSecurity	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	max-age=31536000; includeSubDomains
bruteForceProtected	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	false
permanentLockout	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	false
maxTemporaryLockouts	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	0
maxFailureWaitSeconds	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	900
minimumQuickLoginWaitSeconds	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	60
waitIncrementSeconds	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	60
quickLoginCheckMilliSeconds	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	1000
maxDeltaTimeSeconds	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	43200
failureFactor	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	30
realmReusableOtpCode	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	false
defaultSignatureAlgorithm	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	RS256
offlineSessionMaxLifespanEnabled	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	false
offlineSessionMaxLifespan	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	5184000
clientSessionIdleTimeout	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	0
clientSessionMaxLifespan	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	0
clientOfflineSessionIdleTimeout	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	0
clientOfflineSessionMaxLifespan	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	0
actionTokenGeneratedByAdminLifespan	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	43200
actionTokenGeneratedByUserLifespan	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	300
oauth2DeviceCodeLifespan	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	600
oauth2DevicePollingInterval	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	5
organizationsEnabled	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	false
webAuthnPolicyRpEntityName	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	keycloak
webAuthnPolicySignatureAlgorithms	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	ES256,RS256
webAuthnPolicyRpId	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	
webAuthnPolicyAttestationConveyancePreference	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	not specified
webAuthnPolicyAuthenticatorAttachment	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	not specified
webAuthnPolicyRequireResidentKey	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	not specified
webAuthnPolicyUserVerificationRequirement	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	not specified
webAuthnPolicyCreateTimeout	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	0
webAuthnPolicyAvoidSameAuthenticatorRegister	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	false
webAuthnPolicyRpEntityNamePasswordless	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	ES256,RS256
webAuthnPolicyRpIdPasswordless	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	
webAuthnPolicyAttestationConveyancePreferencePasswordless	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	not specified
webAuthnPolicyRequireResidentKeyPasswordless	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	not specified
webAuthnPolicyCreateTimeoutPasswordless	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	false
cibaBackchannelTokenDeliveryMode	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	poll
cibaExpiresIn	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	120
cibaInterval	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	5
cibaAuthRequestedUserHint	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	login_hint
parRequestUriLifespan	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	60
firstBrokerLoginFlowId	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	6db2fca1-f135-49ba-a688-7ff6a7ce1db6
client-policies.profiles	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	{"profiles":[]}
client-policies.policies	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	{"policies":[]}
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
7df03360-60a3-49d8-8fc4-f7cf9b739084	jboss-logging
be6ce2a1-9fac-4c0a-9916-53b2dbad6409	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	7df03360-60a3-49d8-8fc4-f7cf9b739084
password	password	t	t	be6ce2a1-9fac-4c0a-9916-53b2dbad6409
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.redirect_uris (client_id, value) FROM stdin;
9bf17482-c934-4a6c-a477-e98986383b96	/realms/master/account/*
ff46868d-6213-47b3-ad8b-8df736eed272	/realms/master/account/*
4891877d-9e6b-4062-9e53-b57a61f89e3c	/admin/master/console/*
ca0950df-cbba-4cca-9094-7dddb2d826bf	/realms/KahootRealm/account/*
69b5e48e-5dee-4ac0-b363-d9a311ae9b80	/realms/KahootRealm/account/*
59f6eb8a-7e11-4e0c-b0ab-33d4aa7e13f8	/admin/KahootRealm/console/*
f820e539-4dae-4c02-be0f-fc0ca7f13aa7	http://localhost:8080/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
8064f87e-3000-465d-8177-30bef8d05645	VERIFY_EMAIL	Verify Email	7df03360-60a3-49d8-8fc4-f7cf9b739084	t	f	VERIFY_EMAIL	50
8a333396-367b-4c28-af7a-7d46700ba1a4	UPDATE_PROFILE	Update Profile	7df03360-60a3-49d8-8fc4-f7cf9b739084	t	f	UPDATE_PROFILE	40
6bc9b270-1482-40db-807c-9a58536f1861	CONFIGURE_TOTP	Configure OTP	7df03360-60a3-49d8-8fc4-f7cf9b739084	t	f	CONFIGURE_TOTP	10
9c510ce7-5202-4207-9bff-36b373a67dec	UPDATE_PASSWORD	Update Password	7df03360-60a3-49d8-8fc4-f7cf9b739084	t	f	UPDATE_PASSWORD	30
15886689-c8d7-4a59-adb9-4adb9b29452e	TERMS_AND_CONDITIONS	Terms and Conditions	7df03360-60a3-49d8-8fc4-f7cf9b739084	f	f	TERMS_AND_CONDITIONS	20
fb898ef4-6352-40a0-ba0e-15df4fd630f2	delete_account	Delete Account	7df03360-60a3-49d8-8fc4-f7cf9b739084	f	f	delete_account	60
ce3c2378-295e-481a-8ec9-c5e3628970b6	delete_credential	Delete Credential	7df03360-60a3-49d8-8fc4-f7cf9b739084	t	f	delete_credential	100
2dd2f93c-14f6-49b1-aa47-8c2e30359620	update_user_locale	Update User Locale	7df03360-60a3-49d8-8fc4-f7cf9b739084	t	f	update_user_locale	1000
5d732c4e-c761-4bcf-a416-6cd38ea11d27	webauthn-register	Webauthn Register	7df03360-60a3-49d8-8fc4-f7cf9b739084	t	f	webauthn-register	70
8325dfc8-58de-4db6-8498-63018475e54a	webauthn-register-passwordless	Webauthn Register Passwordless	7df03360-60a3-49d8-8fc4-f7cf9b739084	t	f	webauthn-register-passwordless	80
00cf0881-dfc4-4197-837d-f380e4bbd42f	VERIFY_PROFILE	Verify Profile	7df03360-60a3-49d8-8fc4-f7cf9b739084	t	f	VERIFY_PROFILE	90
3ef3e2b1-1427-458a-adc6-744e1abeb5aa	CONFIGURE_TOTP	Configure OTP	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	t	f	CONFIGURE_TOTP	10
8a87a961-40dd-473e-aa31-31d92ebbafd4	TERMS_AND_CONDITIONS	Terms and Conditions	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	f	f	TERMS_AND_CONDITIONS	20
e1c132a1-9e77-47c9-9e04-0df63033b224	UPDATE_PASSWORD	Update Password	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	t	f	UPDATE_PASSWORD	30
e8867e21-bfee-40d0-974f-76ef3416fe2b	UPDATE_PROFILE	Update Profile	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	t	f	UPDATE_PROFILE	40
9890ac82-f0f8-4f84-826a-3f83d74a27c4	VERIFY_EMAIL	Verify Email	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	t	f	VERIFY_EMAIL	50
ff87ef39-4900-4f35-83ec-b0226a65b013	delete_account	Delete Account	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	f	f	delete_account	60
1c61b3c9-8412-4c1a-8206-78e657aaeaf7	webauthn-register	Webauthn Register	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	t	f	webauthn-register	70
e61d7198-72f3-4dac-b24b-c68c124e6270	webauthn-register-passwordless	Webauthn Register Passwordless	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	t	f	webauthn-register-passwordless	80
136779f5-b968-4cd7-9233-d8193938987d	VERIFY_PROFILE	Verify Profile	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	t	f	VERIFY_PROFILE	90
e4fc4292-56c6-444a-8935-0470d4627b84	delete_credential	Delete Credential	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	t	f	delete_credential	100
93200e07-0590-4a82-b0f1-fc40d6cfa99e	update_user_locale	Update User Locale	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	t	f	update_user_locale	1000
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: revoked_token; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.revoked_token (id, expire) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
ff46868d-6213-47b3-ad8b-8df736eed272	98924bda-5e7e-4b8d-aebe-be7dd2b2bcd1
ff46868d-6213-47b3-ad8b-8df736eed272	8e474eaa-cba4-475c-abd4-bbba77b08a6c
69b5e48e-5dee-4ac0-b363-d9a311ae9b80	6f828282-2578-4a05-8954-1b6bc5355bad
69b5e48e-5dee-4ac0-b363-d9a311ae9b80	2e7bac1d-957d-482c-9c24-faddde4cfc3a
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_attribute (name, value, user_id, id, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
is_temporary_admin	true	bbea8fc6-e191-4d29-80c6-ed86e8affd08	774d96fa-d0a4-4327-8f21-b2f59d1290bd	\N	\N	\N
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
bbea8fc6-e191-4d29-80c6-ed86e8affd08	admin@admin.fr	admin@admin.fr	f	t	\N	First	Admin	7df03360-60a3-49d8-8fc4-f7cf9b739084	admin	1728567277180	\N	0
86c4bda2-24ac-4cdb-a3dc-32cef3a24daf	admin@gmail.com	admin@gmail.com	t	t	\N	John	Doe	be6ce2a1-9fac-4c0a-9916-53b2dbad6409	admin	1728567352487	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_group_membership (group_id, user_id, membership_type) FROM stdin;
7935808f-93e9-44d2-ac9c-7eb77f77a4f9	86c4bda2-24ac-4cdb-a3dc-32cef3a24daf	UNMANAGED
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
f2464307-faaf-4598-98a2-33952a03351b	bbea8fc6-e191-4d29-80c6-ed86e8affd08
d2d4eb12-128b-461b-8e25-7262a9e698d0	bbea8fc6-e191-4d29-80c6-ed86e8affd08
e3a66f8f-ca9d-48c9-b29b-1e465436380a	86c4bda2-24ac-4cdb-a3dc-32cef3a24daf
18ec3d04-8385-4bb2-9729-f745aadd6c27	86c4bda2-24ac-4cdb-a3dc-32cef3a24daf
85e42273-3171-42d8-99c1-07e2dea14342	86c4bda2-24ac-4cdb-a3dc-32cef3a24daf
b913e464-0d58-485a-a209-6bbbc4a2bc3a	86c4bda2-24ac-4cdb-a3dc-32cef3a24daf
ba8deedc-2909-4d73-8bf1-9426a5b1d653	86c4bda2-24ac-4cdb-a3dc-32cef3a24daf
6f828282-2578-4a05-8954-1b6bc5355bad	86c4bda2-24ac-4cdb-a3dc-32cef3a24daf
2e7bac1d-957d-482c-9c24-faddde4cfc3a	86c4bda2-24ac-4cdb-a3dc-32cef3a24daf
40d6ddd3-5df1-4479-921f-efd49322e0d7	86c4bda2-24ac-4cdb-a3dc-32cef3a24daf
655e0b26-abd2-4aef-9c1a-1db127b64872	86c4bda2-24ac-4cdb-a3dc-32cef3a24daf
97930d2c-082e-41db-a473-12ccf480ff01	86c4bda2-24ac-4cdb-a3dc-32cef3a24daf
a9aaf9fb-d473-4074-a23b-ca0dd6f0f0a7	86c4bda2-24ac-4cdb-a3dc-32cef3a24daf
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.web_origins (client_id, value) FROM stdin;
4891877d-9e6b-4062-9e53-b57a61f89e3c	+
59f6eb8a-7e11-4e0c-b0ab-33d4aa7e13f8	+
f820e539-4dae-4c02-be0f-fc0ca7f13aa7	http://localhost:8080
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: org_domain ORG_DOMAIN_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org_domain
    ADD CONSTRAINT "ORG_DOMAIN_pkey" PRIMARY KEY (id, name);


--
-- Name: org ORG_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT "ORG_pkey" PRIMARY KEY (id);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: revoked_token constraint_rt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.revoked_token
    ADD CONSTRAINT constraint_rt PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: user_consent uk_external_consent; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_external_consent UNIQUE (client_storage_provider, external_client_id, user_id);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_local_consent; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_local_consent UNIQUE (client_id, user_id);


--
-- Name: org uk_org_alias; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_alias UNIQUE (realm_id, alias);


--
-- Name: org uk_org_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_group UNIQUE (group_id);


--
-- Name: org uk_org_name; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_name UNIQUE (realm_id, name);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: fed_user_attr_long_values; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX fed_user_attr_long_values ON public.fed_user_attribute USING btree (long_value_hash, name);


--
-- Name: fed_user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX fed_user_attr_long_values_lower_case ON public.fed_user_attribute USING btree (long_value_hash_lower_case, name);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, substr(value, 1, 255));


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_idp_for_login; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_idp_for_login ON public.identity_provider USING btree (realm_id, enabled, link_only, hide_on_login, organization_id);


--
-- Name: idx_idp_realm_org; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_idp_realm_org ON public.identity_provider USING btree (realm_id, organization_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_uss_by_broker_session_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_broker_session_id ON public.offline_user_session USING btree (broker_session_id, realm_id);


--
-- Name: idx_offline_uss_by_last_session_refresh; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_last_session_refresh ON public.offline_user_session USING btree (realm_id, offline_flag, last_session_refresh);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_org_domain_org_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_org_domain_org_id ON public.org_domain USING btree (org_id);


--
-- Name: idx_perm_ticket_owner; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_perm_ticket_owner ON public.resource_server_perm_ticket USING btree (owner);


--
-- Name: idx_perm_ticket_requester; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_perm_ticket_requester ON public.resource_server_perm_ticket USING btree (requester);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_rev_token_on_expire; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_rev_token_on_expire ON public.revoked_token USING btree (expire);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_usconsent_scope_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_scope_id ON public.user_consent_client_scope USING btree (scope_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: user_attr_long_values; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX user_attr_long_values ON public.user_attribute USING btree (long_value_hash, name);


--
-- Name: user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX user_attr_long_values_lower_case ON public.user_attribute USING btree (long_value_hash_lower_case, name);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

