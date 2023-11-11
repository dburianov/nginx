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




# 0-RTT QUIC connection resumption
ssl_early_data on;
