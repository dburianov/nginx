
[![pipeline status](https://gitlab.com/burianov/nginx-aio/badges/main/pipeline.svg)](https://gitlab.com/burianov/nginx-aio/-/commits/main)[![coverage report](https://gitlab.com/burianov/nginx-aio/badges/main/coverage.svg)](https://gitlab.com/burianov/nginx-aio/-/commits/main)[![Latest Release](https://gitlab.com/burianov/nginx-aio/-/badges/release.svg)](https://gitlab.com/burianov/nginx-aio/-/releases)
## Custom Nginx build with static modules
## ModSecurity rules
```bash
GHA build v4.0/dev
6 November 2023
(rules loaded inline/local/remote: 0/825/0)
```
## ModSecurity
```bash
ModSecurity-nginx v1.0.3
```
## OpenSSL
### linux/amd64
```bash
OpenSSL 3.3.0-dev  (Library: OpenSSL 3.3.0-dev )
root@e4835125b0b1:/# openssl version -a
OpenSSL 3.3.0-dev  (Library: OpenSSL 3.3.0-dev )
built on: Tue Oct 31 08:37:21 2023 UTC
platform: linux-x86_64
options:  bn(64,64)
compiler: gcc -fPIC -pthread -m64 -Wa,--noexecstack -Wall -O3 -DOPENSSL_USE_NODELETE -DL_ENDIAN -DOPENSSL_PIC -DOPENSSL_BUILDING_OPENSSL -DZLIB -DNDEBUG
OPENSSLDIR: "/usr/local/ssl"
ENGINESDIR: "/usr/local/ssl/lib64/engines-3"
MODULESDIR: "/usr/local/ssl/lib64/ossl-modules"
Seeding source: os-specific
CPUINFO: OPENSSL_ia32cap=0x7ffef3ffffebffff:0x21cbfbb
```
### linux/arm64/v8
```bash
OpenSSL 3.3.0-dev  (Library: OpenSSL 3.3.0-dev )
built on: Tue Oct 31 08:49:01 2023 UTC
platform: linux-aarch64
options:  bn(64,64)
compiler: gcc -fPIC -pthread -Wa,--noexecstack -Wall -O3 -DOPENSSL_USE_NODELETE -DOPENSSL_PIC -DOPENSSL_BUILDING_OPENSSL -DZLIB -DNDEBUG
OPENSSLDIR: "/usr/local/ssl"
ENGINESDIR: "/usr/local/ssl/lib/engines-3"
MODULESDIR: "/usr/local/ssl/lib/ossl-modules"
Seeding source: os-specific
CPUINFO: OPENSSL_armcap=0x81
```
## cURL
### linux/amd64
```bash
curl 8.5.0-DEV (x86_64-pc-linux-gnu) libcurl/8.5.0-DEV OpenSSL/3.0.10 zlib/1.2.11 brotli/1.0.9 zstd/1.4.8 c-ares/1.18.1 libidn2/2.3.2 libpsl/0.21.0 (+libidn2/2.3.2) libssh2/1.10.0 nghttp2/1.57.0 ngtcp2/1.0.0 nghttp3/1.0.0 librtmp/2.3 OpenLDAP/2.5.16
Protocols: dict file ftp ftps gopher gophers http https imap imaps ldap ldaps mqtt pop3 pop3s rtmp rtsp scp sftp smb smbs smtp smtps telnet tftp
Features: alt-svc AsynchDNS brotli HSTS HTTP2 HTTP3 HTTPS-proxy IDN IPv6 Largefile libz NTLM PSL SSL threadsafe TLS-SRP UnixSockets zstd
``` 
### linux/arm64/v8
```bash
curl 8.5.0-DEV (aarch64-unknown-linux-gnu) libcurl/8.5.0-DEV OpenSSL/3.0.10 zlib/1.2.11 brotli/1.0.9 zstd/1.4.8 c-ares/1.18.1 libidn2/2.3.2 libpsl/0.21.0 (+libidn2/2.3.2) libssh2/1.10.0 nghttp2/1.57.0 ngtcp2/1.0.0 nghttp3/1.0.0 librtmp/2.3 OpenLDAP/2.5.16
Protocols: dict file ftp ftps gopher gophers http https imap imaps ldap ldaps mqtt pop3 pop3s rtmp rtsp scp sftp smb smbs smtp smtps telnet tftp
Features: alt-svc AsynchDNS brotli HSTS HTTP2 HTTP3 HTTPS-proxy IDN IPv6 Largefile libz NTLM PSL SSL threadsafe TLS-SRP UnixSockets zstd
```
## njs
```bash
0.8.2
```
## Nginx
### Nginx with BoringSSL on linux/amd64 and linux/arm64/v8
```bash
nginx version: nginx/1.25.3 (quic-boringssl)
built with OpenSSL 1.1.1 (compatible; BoringSSL) (running with BoringSSL)
TLS SNI support enabled
configure arguments:
  --prefix=/usr/local/nginx
  --modules-path=/usr/local/nginx/modules
  --lock-path=/tmp/nginx/nginx.lock
  --pid-path=/tmp/nginx/nginx.pid
  --conf-path=/usr/local/nginx/conf/nginx.conf
  --http-log-path=/dev/stdout
  --error-log-path=/dev/stderr
  --http-client-body-temp-path=/tmp/nginx/client-body-temp
  --http-proxy-temp-path=/tmp/nginx/proxy-temp
  --http-fastcgi-temp-path=/tmp/nginx/fastcgi-temp
  --http-uwsgi-temp-path=/tmp/nginx/uwsgi-temp
  --http-scgi-temp-path=/tmp/nginx/scgi-temp
  --with-http_xslt_module
  --with-http_ssl_module
  --with-http_mp4_module
  --with-http_flv_module
  --with-http_secure_link_module
  --with-http_dav_module
  --with-http_auth_request_module
  --with-compat
  --with-http_geoip_module
  --with-http_image_filter_module
  --with-google_perftools_module
  --with-debug
  --with-pcre-jit
  --without-pcre2
  --with-ipv6
  --with-http_stub_status_module
  --with-http_realip_module
  --with-http_addition_module
  --with-http_gzip_static_module
  --with-http_sub_module
  --with-stream
  --with-stream_geoip_module
  --with-stream_realip_module
  --with-stream_ssl_module
  --with-stream_ssl_preread_module
  --with-http_random_index_module
  --with-http_gunzip_module
  --with-http_v2_module
  --with-http_v3_module
  --with-http_slice_module
  --with-threads
  --with-file-aio
  --without-mail_pop3_module
  --without-mail_smtp_module
  --without-mail_imap_module
  --without-http_uwsgi_module
  --without-http_scgi_module
  --add-module=/usr/src/nginx_upstream_check_module
  --add-module=/usr/src/nginx-rtmp-module
  --add-module=/usr/src/ngx_devel_kit
  --add-module=/usr/src/lua-nginx-module
  --add-module=/usr/src/echo-nginx-module
  --add-module=/usr/src/nginx-ts-module
  --add-module=/usr/src/nginx-module-vts
  --add-module=/usr/src/nginx-module-stream-sts
  --add-module=/usr/src/nginx-module-sts
  --add-module=/usr/src/nginx-vod-module
  --add-module=/usr/src/njs/nginx
  --add-module=/usr/src/ModSecurity-nginx
  --add-module=/usr/src/headers-more-nginx-module
  --add-module=/usr/src/lua-upstream-nginx-module
  --add-module=/usr/src/status-nginx-module
  --add-module=/usr/src/ngx_brotli
  --add-module=/usr/src/set-misc-nginx-module
  --add-module=/usr/src/ngx_http_proxy_connect_module
  --add-module=/usr/src/ngx_cache_purge
  --add-module=/usr/src/ngx_http_substitutions_filter_module
  --add-module=/usr/src/nginx-http-auth-digest
  --add-module=/usr/src/ngx_http_geoip2_module
  --add-module=/usr/src/redis2-nginx-module
  --with-cc-opt=-I/usr/src/boringssl/include
  --with-ld-opt='-L/usr/src/boringssl/build/ssl -L/usr/src/boringssl/build/crypto'
  --build=quic-boringssl
```
### Nginx with QuickTLS on linux/amd64 and linux/arm64/v8
```bash
nginx version: nginx/1.25.3 (quictls)
built with OpenSSL 3.0.10+quic 1 Aug 2023
TLS SNI support enabled
configure arguments:
  --prefix=/usr/local/nginx
  --modules-path=/usr/local/nginx/modules
  --lock-path=/tmp/nginx/nginx.lock
  --pid-path=/tmp/nginx/nginx.pid
  --conf-path=/usr/local/nginx/conf/nginx.conf
  --http-log-path=/dev/stdout
  --error-log-path=/dev/stderr
  --http-client-body-temp-path=/tmp/nginx/client-body-temp
  --http-proxy-temp-path=/tmp/nginx/proxy-temp
  --http-fastcgi-temp-path=/tmp/nginx/fastcgi-temp
  --http-uwsgi-temp-path=/tmp/nginx/uwsgi-temp
  --http-scgi-temp-path=/tmp/nginx/scgi-temp
  --with-http_xslt_module
  --with-http_ssl_module
  --with-http_mp4_module
  --with-http_flv_module
  --with-http_secure_link_module
  --with-http_dav_module
  --with-http_auth_request_module
  --with-compat
  --with-http_geoip_module
  --with-http_image_filter_module
  --with-google_perftools_module
  --with-debug
  --with-pcre-jit
  --without-pcre2
  --with-ipv6
  --with-http_stub_status_module
  --with-http_realip_module
  --with-http_addition_module
  --with-http_gzip_static_module
  --with-http_sub_module
  --with-stream
  --with-stream_geoip_module
  --with-stream_realip_module
  --with-stream_ssl_module
  --with-stream_ssl_preread_module
  --with-http_random_index_module
  --with-http_gunzip_module
  --with-http_v2_module
  --with-http_v3_module
  --with-http_slice_module
  --with-threads
  --with-file-aio
  --without-mail_pop3_module
  --without-mail_smtp_module
  --without-mail_imap_module
  --without-http_uwsgi_module
  --without-http_scgi_module
  --add-module=/usr/src/nginx_upstream_check_module
  --add-module=/usr/src/nginx-rtmp-module
  --add-module=/usr/src/ngx_devel_kit
  --add-module=/usr/src/lua-nginx-module
  --add-module=/usr/src/echo-nginx-module
  --add-module=/usr/src/nginx-ts-module
  --add-module=/usr/src/nginx-module-vts
  --add-module=/usr/src/nginx-module-stream-sts
  --add-module=/usr/src/nginx-module-sts
  --add-module=/usr/src/nginx-vod-module
  --add-module=/usr/src/njs/nginx
  --add-module=/usr/src/ModSecurity-nginx
  --add-module=/usr/src/headers-more-nginx-module
  --add-module=/usr/src/lua-upstream-nginx-module
  --add-module=/usr/src/status-nginx-module
  --add-module=/usr/src/ngx_brotli
  --add-module=/usr/src/set-misc-nginx-module
  --add-module=/usr/src/ngx_http_proxy_connect_module
  --add-module=/usr/src/ngx_cache_purge
  --add-module=/usr/src/ngx_http_substitutions_filter_module
  --add-module=/usr/src/nginx-http-auth-digest
  --add-module=/usr/src/ngx_http_geoip2_module
  --add-module=/usr/src/redis2-nginx-module
  --with-cc-opt=-I/usr/src/ssl/include
  --with-ld-opt=-L/usr/src/ssl/lib
  --with-openssl=/usr/src/openssl
  --build=quictls
```
## OS
```bash
Ubuntu 22.04.3 LTS (Jammy Jellyfish)
```
## GeoIP
```bash
from 16 October 2023 https://mailfud.org/geoip-legacy/
```
## Usage
```bash
sudo docker run \
  -d \
  --rm \
  --name nginx-aio \
  -p 80:80/tcp \
  -p 443:443/tcp \
  -p 443:443/udp \
  -v /opt/nginx/nginx.conf:/usr/local/nginx/conf/nginx.conf \
  -v /etc/letsencrypt/live/server_name/fullchain.pem:/usr/local/nginx/conf/ssl/server_name/fullchain.pem:ro \
  -v /etc/letsencrypt/live/server_name/privkey.pem:/usr/local/nginx/conf/ssl/server_name/privkey.pem:ro \
  dburianov/nginx-aio:buildx-latest
```
## Build
### nginx+boringssl
```bash
tag=$(date +%Y%m%d%H%M)
sudo docker buildx build
  --push \
  --platform linux/amd64 \
  --tag nginx-aio:latest \
  --tag nginx-aio:$tag \
  .
```
### nginx+quictls
```bash
tag=$(date +%Y%m%d%H%M)
sudo docker buildx build
  --push \
  --platform linux/amd64 \
  --tag nginx-aio:latest \
  --tag nginx-aio:$tag \
  -f Dockerfile.quictls \
  .
```
