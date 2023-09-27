map http_user_agent $http_user_agent_map {
    "" "EMPTY_UA";
    default $http_user_agent;
}
map $upstream_connect_time $upstream_connect_time_map {
    "" 0.0;
    default $upstream_connect_time;
}
map $upstream_header_time $upstream_header_time_map {
    "" 0.0;
    default $upstream_header_time;
}
map $upstream_cache_status $upstream_cache_status_map {
    "" "NOCACHE";
    default $upstream_cache_status;
}
map $upstream_addr $upstream_addr_map {
    "" "127.0.0.1";
    default $upstream_addr;
}
map $upstream_status $upstream_status_map {
    "" 0;
    default $upstream_status;
}
map $upstream_response_time $upstream_response_time_map {
    "" 0.0;
    default $upstream_response_time;
}
map $gzip_ratio $gzip_ratio_map {
    "" 0.0;
    default $gzip_ratio;
}
map $http_x_forwarded_for $http_x_forwarded_for_map {
    "" "0.0.0.0";
    default $http_x_forwarded_for;
}
map $remote_user $remote_user_map {
    "" "NO_REMOTEUSER";
    default $remote_user;
}
map $http_referer $http_referer_map {
    "" "NO_REFERER";
    default $http_referer;
}
map $http_range $http_range_map {
    "" "NO_RANGE";
    default $http_range;
}
map $sent_http_etag $sent_http_etag_map {
    "" "NO_ETAG";
    default $sent_http_etag;
}
# Required for Jenkins websocket agents
map $http_upgrade $connection_upgrade {
  default upgrade;
  '' close;
}

map $gzip_ratio:$brotli_ratio $ratio_map {
    "~^[0-9]+\.[0-9]+:[0-9]+\.[0-9]+$" 0.00;
    "~^[0-9]+\.[0-9]+:$" $gzip_ratio;
    "~^:[0-9]+\.[0-9]+$" $brotli_ratio;
#    default $gzip_ratio:$brotli_ratio;
    ":" 0.0;
}

map $http2:$http3 $version_http {
    ":" "old";
    ".+:$" $http2;
    "^:.+" $http3;
    default "old";
}

map $ssl_alpn_protocol $ssl_alpn_protocol_map {
    "" "NO_SSL";
    default $ssl_alpn_protocol;
}
map $ssl_cipher $ssl_cipher_map {
    "" "NO_SSL";
    default $ssl_cipher;
}

map $ssl_curve $ssl_curve_map {
    "" "NO_SSL";
    default $ssl_curve;
}

map $ssl_early_data $ssl_early_data_map {
    "" "NO_SSL";
    default $ssl_early_data;
}

map $ssl_protocol $ssl_protocol_map {
    "" "NO_SSL";
    default $ssl_protocol;
}

map $ssl_server_name $ssl_server_name_map {
    "" "NO_SSL";
    default $ssl_server_name;
}

map $ssl_session_id $ssl_session_id_map {
    "" "NO_SSL";
    default $ssl_session_id;
}

map $ssl_session_reused $ssl_session_reused_map {
    "" "NO_SSL";
    default $ssl_session_reused;
}

map $time_iso8601 $time_iso8601_p1 {
    ~([^+]+) $1;
}
map $time_iso8601 $time_iso8601_p2 {
    ~\+([0-9:]+)$ $1;
}
map $msec $millisec {
    ~\.([0-9]+)$ $1;
}

