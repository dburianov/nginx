CREATE KEYSPACE IF NOT EXISTS ngxLogsJson WITH REPLICATION = {'class' : 'SimpleStrategy','replication_factor' : 1 };

CREATE TYPE IF NOT EXISTS ngxLogsJson.remote(
    remote_addr inet,
    remote_user text,
    geocode text
);
CREATE TYPE IF NOT EXISTS ngxLogsJson.http(
    http_x_forwarded_for text,
    http_referer text,
    http_user_agent text,
    http_host text,
    http_range text,
    request text
);
CREATE TYPE IF NOT EXISTS ngxLogsJson.request(
    server_name text,
    request text,
    request_time float,
    request_id text,
    request_length int,
    scheme text,
    server_protocol text,
    version_http text,
    req_method text,
    req_stream_name text,
    req_stream_type text,
    req_server_http text,
    req_stream_part int,
    req_path text,
    req_false text,
    method text,
    geo frozen <request_geo>
);
CREATE TYPE IF NOT EXISTS ngxLogsJson.request_geo(
   ip inet,
   as frozen <request_geo_as>
);
CREATE TYPE IF NOT EXISTS ngxLogsJson.request_geo_as(
    organization frozen <request_geo_as_organization>
    number int
);
CREATE TYPE IF NOT EXISTS ngxLogsJson.request_geo_as_organization(
   name text
);
CREATE TYPE IF NOT EXISTS ngxLogsJson.request_ua(
    name text,
    version text,
    os frozen <request_ua_os>,
    device frozen <request_ua_device>
);
CREATE TYPE IF NOT EXISTS ngxLogsJson.request_ua_os(
        name text
        full text
);
CREATE TYPE IF NOT EXISTS ngxLogsJson.request_ua_device(
    name text
);
CREATE TYPE IF NOT EXISTS ngxLogsJson.response(
    status int,
    body_bytes_sent int,
    bytes_sent int,
    ratio float
);
CREATE TYPE IF NOT EXISTS ngxLogsJson.upstream(
    upstream_connect_time float,
    upstream_header_time float,
    upstream_response_time float,
    upstream_cache_status text,
    upstream_addr text,
    upstream_status int
);
CREATE TYPE IF NOT EXISTS ngxLogsJson.ssl(
    ssl_alpn_protocol text,
    ssl_cipher text,
    ssl_curve text,
    ssl_early_data text,
    ssl_protocol text,
    ssl_server_name text,
    ssl_session_id text,
    ssl_session_reused text
);
CREATE TYPE IF NOT EXISTS ngxLogsJson.user_agent(
    os_major text,
    patch text,
    os_minor text,
    minor text,
    build text,
    os text,
    device text,
    major text,
    os_name text,
    name text
);
CREATE TYPE IF NOT EXISTS ngxLogsJson.nginx_logs(
    type text
    escape text
    version text
    log_format text
);

CREATE TABLE IF NOT EXISTS ngxLogsJson.v22a
(
    time_local text,
    time_iso8601 text,
    time_iso8601_ms text,
    time_msec float,
    timestamp text,
    @timestamp text,
    logtime text,
    server_addr inet,
    remote frozen <remote>,
    http frozen <http>,
    request frozen <request>,
    response frozen <response>,
    upstream frozen <upstream>,
    ssl frozen <ssl>,
    user_agent frozen <user_agent>,
    logsource text,
    logdatetime text,
    container_name text,
    url text,
    source text,
    container_id text,
    date double,
    nginx_logs frozen <nginx_logs>
    PRIMARY KEY
    (
        "request.request_id"
    )
);

