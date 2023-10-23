CREATE DATABASE IF NOT EXISTS ngx_logs;

CREATE TABLE ngx_logs.logs_v2_2
(
    `time_local` String,
    `time_iso8601` String,
    `time_msec` String,
    `timestamp` String,
    `logtime` DateTime,
    `Date` Date DEFAULT toDate(logtime),
    `logtimeUnixTimestamp` UInt32 MATERIALIZED toUnixTimestamp(logtime),
    `server_addr` String,
    `container_name` String,
    `url` String,
    `source` String,
    `container_id` String,
    `date` Float64,
    `nginx_logs` Nested
    (
        `type` String,
        `escape`  String,
        `version`  String,
        `log_format`  String
    ),
    `remote` Nested
    (
        `remote_addr` String,
        `remote_user` String,
        `geocode` String
    ),
    `http` Nested
    (
        `http_x_forwarded_for` String,
        `http_referer` String,
        `http_user_agent`String,
        `http_host` String,
        `http_range` String,
        `request` Nested
        (
            `body` String
        )
    ),
    `request` Nested
    (
        `server_name` String,
        `request` String,
        `request_time` Float64,
        `request_id` String,
        `request_length` UInt32,
        `scheme` Enum8('unknown' = 0, 'http' = 1, 'https' = 2),
        `server_protocol` String,
        `version_http` String,
        `req_method` String,
        `req_stream_name` String,
        `req_stream_type` String,
        `req_server_http` String,
        `req_stream_part` UInt32,
        `req_path` String,
        `req_false` String,
        `method` String,
        `geo` Nested
        (
            `ip` String,
            `as` Nested
            (
                `organization` Nested
                (
                    `name` String
                ),
                `number` UInt32
            ),
        )
        `ua` Nested
        (
            `name` String,
            `version` String,
            `os` Nested
            (
                `name` String,
                `full` String
            )
            `device` Nested
            (
                `name` String
            )
        )
    ),
    `response` Nested
    (
        `status` UInt16,
        `body_bytes_sent` UInt32,
        `bytes_sent` UInt32,
        `header_bytes` UInt32 MATERIALIZED bytes_sent - body_bytes_sent,
        `ratio` Float64
    ),
    `upstream` Nested
    (
        `upstream_connect_time` Float64,
        `upstream_header_time` Float64,
        `upstream_response_time` Float64,
        `upstream_cache_status` String,
        `upstream_addr` String,
        `upstream_status` UInt16
    ),
    `ssl` Nested
    (
        `ssl_alpn_protocol` String,
        `ssl_cipher` String,
        `ssl_curve` String,
        `ssl_early_data` String,
        `ssl_protocol` String,
        `ssl_server_name` String,
        `ssl_session_id` String,
        `ssl_session_reused` String
    ),
    `user_agent` Nested
    (
        `os_major` String,
        `patch` String,
        `os_minor` String,
        `minor` String,
        `build` String,
        `os` String,
        `device` String,
        `major` String,
        `os_name` String,
        `name` String
    ),
    `logsource` String
)
ENGINE = MergeTree()
PARTITION BY Date
ORDER BY (Date, logtime, remote_addr_int)
TTL Date + toIntervalWeek(6)
SETTINGS index_granularity = 8192;

CREATE TABLE ngx_logs.logs_v2_2_buffer AS ngx_logs.logs_v2_2 ENGINE = Buffer(ngx_logs, logs_v2_2, 16, 10, 100, 10000, 1000000, 10000000, 100000000);

CREATE TABLE ngx_logs.logs_v2_2_queue
(
    `time_local` String,
    `time_iso8601` String,
    `time_msec` String,

    `time_iso8601_ms` String,

    `timestamp` String,
    `logtime` DateTime,
    `server_addr` String,
    `container_name` String,
    `url` String,
    `source` String,
    `container_id` String,
    `date` Float64,
    `nginx_logs` Nested
    (
        `type` String,
        `escape`  String,
        `version`  String,
        `log_format`  String
    ),
    `remote` Nested
    (
        `remote_addr` String,
        `remote_user` String,
        `geocode` String
    ),
    `http` Nested
    (
        `http_x_forwarded_for` String,
        `http_referer` String,
        `http_user_agent` String,
        `http_host` String,
        `http_range` String
        `request` Nested
        (
            `body` String
        )
    ),
    `request` Nested
    (
        `server_name` String,
        `request` String,
        `request_time` Float64,
        `request_id` String,
        `request_length` UInt32,
        `scheme` String,
        `server_protocol` String,
        `version_http` String,
        `req_method` String,
        `req_stream_name` String,
        `req_stream_type` String,
        `req_server_http` String,
        `req_stream_part` UInt32,
        `req_path` String,
        `req_false` String,
        `method` String,
        `geo` Nested
        (
            `ip` String,
            `as` Nested
            (
                `organization` Nested
                (
                    `name` String
                ),
                `number` UInt32
            ),
        )
        `ua` Nested
        (
            `name` String,
            `version` String,
            `os` Nested
            (
                `name` String,
                `full` String
            )
            `device` Nested
            (
                `name` String
            )
        )
    ),
    `response` Nested
    (
        `status` UInt16,
        `body_bytes_sent` UInt32,
        `bytes_sent` UInt32,
        `ratio` Float64
    ),
    `upstream` Nested
    (
        `upstream_connect_time` Float64,
        `upstream_header_time` Float64,
        `upstream_response_time` Float64,
        `upstream_cache_status` String,
        `upstream_addr` String,
        `upstream_status` UInt16
    ),
    `ssl` Nested
    (
        `ssl_alpn_protocol` String,
        `ssl_cipher` String,
        `ssl_curve` String,
        `ssl_early_data` String,
        `ssl_protocol` String,
        `ssl_server_name` String,
        `ssl_session_id` String,
        `ssl_session_reused` String
    ),
    `user_agent` Nested
    (
        `os_major` String,
        `patch` String,
        `os_minor` String,
        `minor` String,
        `build` String,
        `os` String,
        `device` String,
        `major` String,
        `os_name` String,
        `name` String
    ),
    `logsource` String
)
ENGINE = Kafka()
SETTINGS
kafka_thread_per_consumer = 0,
kafka_num_consumers = 1,
kafka_broker_list = 'kafka:9092',
kafka_topic_list = 'ngxlogsv22',
kafka_group_name = 'clickhouse',
kafka_format = 'JSONEachRow'v2_2
;
CREATE MATERIALIZED VIEW ngx_logs.logs_v2_2_mv TO ngx_logs.logs_v2_2 AS
SELECT *
FROM ngx_logs.logs_v2_2_queue;

