proxy_redirect     default;
#proxy_redirect off;
proxy_http_version 1.1;

#Requests sent within early data are subject to replay attacks.
#To protect against such attacks at the application layer, the $ssl_early_data variable should be used.
proxy_set_header Early-Data $ssl_early_data;

proxy_set_header   Host              $host;
proxy_set_header   X-Real-IP         $remote_addr;
proxy_set_header   X-Forwarded-For   $proxy_add_x_forwarded_for;
proxy_set_header   X-Forwarded-Proto $scheme;
proxy_set_header   X-Forwarded-Port  $server_port;
# mitigate HTTPoxy Vulnerability
# https://www.nginx.com/blog/mitigating-the-httpoxy-vulnerability-with-nginx/
proxy_set_header   Proxy             "";
proxy_max_temp_file_size 0;

proxy_set_header   X-Nginx-Request-Id  $request_id;

#this is the maximum upload size
client_max_body_size       4096m;
client_body_buffer_size    128k;

proxy_connect_timeout      90;
proxy_send_timeout         90;
proxy_read_timeout         90;
proxy_buffering            off;
proxy_request_buffering    off; # Required for HTTP CLI commands

proxy_pass_header Authorization;
