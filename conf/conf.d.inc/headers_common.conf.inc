#  These headers can break applications, be careful!
# default enable
# add_header X-Frame-Options DENY;
#add_header X-Content-Type-Options nosniff;
# add_header X-XSS-Protection "1; mode=block";
more_set_headers "X-Content-Type-Options: nosniff";
more_set_headers -t 'text/html' 'x-frame-options: SAMEORIGIN' always;
more_set_headers -t 'text/html' 'x-xss-protection: 1; mode=block';

## Content-Security-Policy (CSP): Yes
## No 'script-src' directive, you need to test it yourself
# add_header Content-Security-Policy "object-src 'none'; base-uri 'none'; require-trusted-types-for 'script'; frame-ancestors 'self';";
## The safest CSP, only block your website to be inside an inframe
# add_header Content-Security-Policy "frame-ancestors 'self';";
# more_set_headers "Content-Security-Policy: default-src 'self';";

#  Enable HSTS
# add_header Strict-Transport-Security "max-age=63072000; includeSubDomains; preload";
more_set_headers "Strict-Transport-Security: max-age=63072000; includeSubDomains; preload";

# https://security.stackexchange.com/questions/251713/how-to-use-dh-certificate-to-configure-nginx-server
# https://security.stackexchange.com/questions/44251/openssl-generate-different-types-of-self-signed-certificate
# https://www.ssllabs.com/ssltest/analyze.html?d=registry.burianov.net
# https://www.nginx.com/blog/http-strict-transport-security-hsts-and-nginx/
# https://hstspreload.org/?domain=burianov.net
# https://clienttest.ssllabs.com:8443/ssltest/viewMyClient.html
# https://medium.com/hackernoon/rsa-and-ecdsa-hybrid-nginx-setup-with-letsencrypt-certificates-ee422695d7d3

more_set_headers "Set-Cookie: Path=/; HttpOnly; Secure";
