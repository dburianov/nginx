ssl_session_timeout 1d;
ssl_session_cache shared:TLS:10m;  # about 40000 sessions

#ssl_session_tickets off;
ssl_session_tickets on;

ssl_dhparam /usr/local/nginx/conf.docker/ssl.dh/dhparams4096.pem;

ssl_protocols TLSv1.3 TLSv1.2;

# Enable Perfect Forward Secrecy (PFS)
ssl_prefer_server_ciphers on;
#ssl_prefer_server_ciphers off;

#ssl_ecdh_curve X25519:secp521r1:secp384r1:prime256v1;
ssl_ecdh_curve auto;
#ssl_ciphers EECDH+AESGCM:EECDH+AES256:!CBC;
ssl_ciphers "ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:AES256-GCM-SHA384:!CBC";

#ssl_buffer_size 4k;

#openssl rand 80 > ticket.key
ssl_session_ticket_key /usr/local/nginx/conf.docker/ssl.dh/ticket.key;

# OCSP stapling
ssl_stapling on;
ssl_stapling_verify on;

# # verify chain of trust of OCSP response using Root CA and Intermediate certs
# ssl_trusted_certificate /certs/dir/chain.pem;
# ssl_trusted_certificate /etc/nginx/ssl/fullchain.pem;

#Due to usage of BoringSSL instead of OpenSSL, some directives may not work, e.g. ssl_conf_command.
#Besides, direct OCSP stapling via ssl_stapling on; ssl_stapling_verify on; does not work too.
#You should use ssl_stapling on; ssl_stapling_file /path/to/ocsp;.
#The OCSP file can be generated via
#openssl ocsp -no_nonce -issuer /path/to/intermediate -cert /path/to/cert -url "$(openssl x509 -in /path/to/cert -noout -ocsp_uri)" -respout /path/to/ocsp.

#resolver 1.1.1.1 1.0.0.1 8.8.8.8 4.4.4.4 [2606:4700:4700::1111] [2606:4700:4700::1001]; # Cloudflare

# These headers can break applications, be careful!
#default enable
#add_header X-Frame-Options DENY;
add_header X-Content-Type-Options nosniff;
#add_header X-XSS-Protection "1; mode=block";
more_set_headers -t 'text/html' 'x-frame-options: SAMEORIGIN' always;
more_set_headers -t 'text/html' 'x-xss-protection: 1; mode=block';

## Content-Security-Policy (CSP): Yes
## No 'script-src' directive, you need to test it yourself
#add_header Content-Security-Policy "object-src 'none'; base-uri 'none'; require-trusted-types-for 'script'; frame-ancestors 'self';";
## The safest CSP, only block your website to be inside an inframe
#add_header Content-Security-Policy "frame-ancestors 'self';";

# Enable HSTS
#add_header Strict-Transport-Security "max-age=63072000; includeSubDomains; preload";
more_set_headers "Strict-Transport-Security: max-age=63072000; includeSubDomains; preload";

#ssl_verify_client off;

# 0-RTT QUIC connection resumption
ssl_early_data  on;
