ssl_session_timeout 1d;
ssl_session_cache shared:TLS:10m;  # about 40000 sessions
ssl_session_tickets off;
#ssl_session_tickets on;

ssl_dhparam /usr/local/nginx/conf/ssl/dhparam.pem;

ssl_protocols TLSv1.3 TLSv1.2;

# Enable Perfect Forward Secrecy (PFS)
#ssl_prefer_server_ciphers on;
ssl_prefer_server_ciphers off;

#ssl_ciphers 'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA';
#ssl_ecdh_curve secp521r1:secp384r1:prime256v1;
ssl_ecdh_curve auto;
#ssl_ciphers EECDH+AESGCM:EECDH+AES256:!CBC;
#ssl_ciphers ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES256-GCM-SHA384:AES256-GCM-SHA384:!CBC;

#ssl_buffer_size 4k;

#openssl rand 80 > ticket.key
#ssl_session_ticket_key /usr/local/nginx/conf/ssl/ticket.key;
#ssl_session_ticket_key /run/nginx-ephemeral/nginx_session_ticket_curr;
#ssl_session_ticket_key /run/nginx-ephemeral/nginx_session_ticket_prev;
#ssl_session_ticket_key /run/nginx-ephemeral/nginx_session_ticket_next;

# OCSP stapling
ssl_stapling on;
ssl_stapling_verify on;

resolver 1.1.1.1 1.0.0.1 8.8.8.8 4.4.4.4 [2606:4700:4700::1111] [2606:4700:4700::1001]; # Cloudflare

# These headers can break applications, be careful!
#default enable
#add_header X-Frame-Options DENY;
#add_header X-Content-Type-Options nosniff;

# Enable HSTS
add_header Strict-Transport-Security "max-age=63072000; includeSubDomains";

#ssl_verify_client off;
