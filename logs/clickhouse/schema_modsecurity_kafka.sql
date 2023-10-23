CREATE DATABASE IF NOT EXISTS ngx_logs;

CREATE TABLE ngx_logs.modsecurity_v0_1_queue
(
    `transaction` Nested
    (
        `client_ip` String,
        `time_stamp` String,
        `server_id` String,
        `client_port` UInt16,
        `host_ip` String,
        `host_port` UInt16,
        `unique_id` String,
        `request` Nested
        (
            `method` String,
            `http_version` Float64,
            `uri` String,
            `headers` String
        ),
        `response` Nested
        (
            `body` String,
            `http_code` UInt16,
            `headers` String
        ),
        `producer` Nested
        (
            `modsecurity` String,
            `connector` String,
            `secrules_engine` String,
            `components` String
        ),
        `messages` Nested
        (
            `message` String,
            `details` Nested
            (
                `match` String,
                `reference` String,
                `ruleId` String,
                `file` String,
                `lineNumber` String,
                `data` String,
                `severity` String,
                `ver` String,
                `rev` String,
                `tags` String,
                `maturity` String,
                `accuracy` String
            )
        )
    )
)
ENGINE = Kafka()
SETTINGS
kafka_thread_per_consumer = 0,
kafka_num_consumers = 1,
kafka_broker_list = 'kafka:9092',
kafka_topic_list = 'ngxtransactionv21',
kafka_group_name = 'clickhouse',
kafka_format = 'JSONEachRow'
;
