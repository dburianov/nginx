
[![pipeline status](https://gitlab.com/burianov/nginx-aio/badges/main/pipeline.svg)](https://gitlab.com/burianov/nginx-aio/-/commits/main)[![coverage report](https://gitlab.com/burianov/nginx-aio/badges/main/coverage.svg)](https://gitlab.com/burianov/nginx-aio/-/commits/main)[![Latest Release](https://gitlab.com/burianov/nginx-aio/-/badges/release.svg)](https://gitlab.com/burianov/nginx-aio/-/releases)
## Custom Nginx build with static modules
## ModSecurity rules
```
GHA build v4.0/dev
16 October 2023
```
## ModSecurity
```
ModSecurity-nginx v1.0.3 (rules loaded inline/local/remote: 0/825/0)
```
## OpenSSL
### linux/amd64
```
OpenSSL 3.2.0-alpha3-dev  (Library: OpenSSL 3.2.0-alpha3-dev )
built on: Mon Oct 16 10:54:09 2023 UTC
platform: linux-x86_64
options:  bn(64,64)
compiler: gcc -fPIC -pthread -m64 -Wa,--noexecstack -Wall -O3 -DOPENSSL_USE_NODELETE -DL_ENDIAN -DOPENSSL_PIC -DOPENSSL_BUILDING_OPENSSL -DZLIB -DNDEBUG
OPENSSLDIR: "/usr/local/ssl"
ENGINESDIR: "/usr/local/ssl/lib64/engines-3"
MODULESDIR: "/usr/local/ssl/lib64/ossl-modules"
Seeding source: os-specific
CPUINFO: OPENSSL_ia32cap=0xfffa3203078bffff:0x40061c219c07ab
Providers:
  default
    name: OpenSSL Default Provider
    version: 3.2.0
    status: active
```
### linux/arm64/v8
```
OpenSSL 3.2.0-alpha3-dev  (Library: OpenSSL 3.2.0-alpha3-dev )
built on: Mon Oct 16 10:54:09 2023 UTC
platform: linux-x86_64
options:  bn(64,64)
compiler: gcc -fPIC -pthread -m64 -Wa,--noexecstack -Wall -O3 -DOPENSSL_USE_NODELETE -DL_ENDIAN -DOPENSSL_PIC -DOPENSSL_BUILDING_OPENSSL -DZLIB -DNDEBUG
OPENSSLDIR: "/usr/local/ssl"
ENGINESDIR: "/usr/local/ssl/lib64/engines-3"
MODULESDIR: "/usr/local/ssl/lib64/ossl-modules"
Seeding source: os-specific
CPUINFO: OPENSSL_ia32cap=0xced8220b0fcbfffd:0x8001000c01d84389
Providers:
  default
    name: OpenSSL Default Provider
    version: 3.2.0
    status: active
```
## cURL
### linux/amd64
```
curl 8.4.1-DEV (x86_64-pc-linux-gnu) libcurl/8.4.1-DEV OpenSSL/3.0.10 zlib/1.2.11 brotli/1.0.9 zstd/1.4.8 c-ares/1.18.1 libidn2/2.3.2 libpsl/0.21.0 (+libidn2/2.3.2) libssh2/1.10.0 nghttp2/1.56.0 ngtcp2/0.19.1 nghttp3/0.15.0 librtmp/2.3 OpenLDAP/2.5.16
Protocols: dict file ftp ftps gopher gophers http https imap imaps ldap ldaps mqtt pop3 pop3s rtmp rtsp scp sftp smb smbs smtp smtps telnet tftp
Features: alt-svc AsynchDNS brotli HSTS HTTP2 HTTP3 HTTPS-proxy IDN IPv6 Largefile libz NTLM PSL SSL threadsafe TLS-SRP UnixSockets zstd
``` 
### linux/arm64/v8
```
curl 8.4.1-DEV (x86_64-pc-linux-gnu) libcurl/8.4.1-DEV OpenSSL/3.0.10 zlib/1.2.11 brotli/1.0.9 zstd/1.4.8 c-ares/1.18.1 libidn2/2.3.2 libpsl/0.21.0 (+libidn2/2.3.2) libssh2/1.10.0 nghttp2/1.56.0 ngtcp2/0.19.1 nghttp3/0.15.0 librtmp/2.3 OpenLDAP/2.5.16
Release-Date: [unreleased]
Protocols: dict file ftp ftps gopher gophers http https imap imaps ldap ldaps mqtt pop3 pop3s rtmp rtsp scp sftp smb smbs smtp smtps telnet tftp
Features: alt-svc AsynchDNS brotli HSTS HTTP2 HTTP3 HTTPS-proxy IDN IPv6 Largefile libz NTLM PSL SSL threadsafe TLS-SRP UnixSockets zstd
```
## njs
```
0.8.2
```
## Nginx
### Nginx with BoringSSL, only linux/amd64
```
nginx version: nginx/1.25.3 (quic-boringssl)
built with OpenSSL 1.1.1 (compatible; BoringSSL) (running with BoringSSL)
TLS SNI support enabled
configure arguments:
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
  --with-mail
  --with-mail_ssl_module
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
  --with-http_slice_module
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
  --with-cc-opt=-I/usr/src/boringssl/include
  --with-ld-opt='-L/usr/src/boringssl/build/ssl -L/usr/src/boringssl/build/crypto'
  --build=quic-boringssl
  --with-http_v3_module
```
### Nginx with QuickTLS, linux/amd64
```
nginx version: nginx/1.25.3 (quictls)
built with OpenSSL 3.0.10+quic 1 Aug 2023
TLS SNI support enabled
configure arguments:
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
  --with-mail
  --with-mail_ssl_module
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
  --with-http_slice_module
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
  --with-cc-opt=-I/usr/src/ssl/include
  --with-ld-opt=-L/usr/src/ssl/lib
  --with-openssl=/usr/src/openssl
  --build=quictls
  --with-http_v3_module
```
### Nginx with QuickTLS, linux/arm64/v8
```
nginx version: nginx/1.25.3 (quictls)
built with OpenSSL 3.0.10+quic 1 Aug 2023
TLS SNI support enabled
configure arguments:
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
  --with-mail
  --with-mail_ssl_module
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
  --with-http_slice_module
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
  --with-cc-opt=-I/usr/src/ssl/include
  --with-ld-opt=-L/usr/src/ssl/lib
  --with-openssl=/usr/src/openssl
  --build=quictls
  --with-http_v3_module
```
## OS
```
Ubuntu 22.04.3 LTS (Jammy Jellyfish)
```
## GeoIP
```
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
sudo docker buildx build --push \
  --platform linux/amd64 \
  --tag nginx-aio:latest \
  --tag nginx-aio:$tag \
  .
```
### nginx+quictls
```bash
tag=$(date +%Y%m%d%H%M)
sudo docker buildx build --push \
  --platform linux/amd64 \
  --tag nginx-aio:latest \
  --tag nginx-aio:$tag \
  -f Dockerfile.quictls \
  .
```
