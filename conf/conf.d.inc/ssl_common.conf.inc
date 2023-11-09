ssl_session_timeout 1d;
ssl_session_cache shared:TLS:10m;  # about 40000 sessions

ssl_session_tickets off;

ssl_dhparam /usr/local/nginx/conf.docker/ssl.dh/dhparams4096.pem;

ssl_protocols TLSv1.3 TLSv1.2;

# Enable Perfect Forward Secrecy (PFS)
ssl_prefer_server_ciphers on;

ssl_ecdh_curve auto;
ssl_ciphers "ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:AES256-GCM-SHA384:TLS_AES_128_GCM_SHA256:!CBC";



# OCSP stapling
ssl_stapling on;
ssl_stapling_verify on;




more_set_headers "X-Content-Type-Options: nosniff";
more_set_headers -t 'text/html' 'x-frame-options: SAMEORIGIN' always;
more_set_headers -t 'text/html' 'x-xss-protection: 1; mode=block';

## Content-Security-Policy (CSP): Yes
## No 'script-src' directive, you need to test it yourself
# add_header Content-Security-Policy "object-src 'none'; base-uri 'none'; require-trusted-types-for 'script'; frame-ancestors 'self';";
## The safest CSP, only block your website to be inside an inframe
# add_header Content-Security-Policy "frame-ancestors 'self';";
# more_set_headers "Content-Security-Policy: default-src 'self';";

more_set_headers "Strict-Transport-Security: max-age=63072000; includeSubDomains; preload";


ssl_early_data on;
