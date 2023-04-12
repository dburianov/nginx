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
    "" 0;
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
