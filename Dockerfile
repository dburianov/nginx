ARG RESTY_IMAGE_BASE="ubuntu"
ARG RESTY_IMAGE_TAG="jammy"

FROM ${RESTY_IMAGE_BASE}:${RESTY_IMAGE_TAG} AS ubuntu_core

LABEL maintainer="Dmytro Burianov <dmytro@burianov.net>"

ENV DEBIAN_FRONTEND noninteractive
#ENV TZ=Europe/Kiev
ENV TZ=Europe/London
RUN <<EOT
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
    echo $TZ > /etc/timezone
EOT

RUN <<EOT
    apt-get -yqq update
    apt-get upgrade -y
    apt-get install -y --no-install-recommends --no-install-suggests \
        software-properties-common lua-socket lua-zlib
    rm -rf /var/lib/apt/lists/*
    rm -rf /usr/share/doc/*
    rm -rf /usr/share/man/*
    apt-get autoremove -y
    apt-get autoremove -y
    apt-get clean -y
EOT

FROM ubuntu_core AS ubuntu-build
LABEL maintainer="Dmytro Burianov <dmytro@burianov.net>"
ENV DEBIAN_FRONTEND noninteractive
RUN <<EOT
    apt-get -yqq update
    apt-get install -y --no-install-recommends --no-install-suggests \
        git unzip libxml2-dev \
        libbz2-dev libcurl4-openssl-dev libmcrypt-dev libmhash2 \
        libmhash-dev libpcre3 libpcre3-dev make build-essential \
        libxslt1-dev libgeoip-dev \
        libpam-dev libgoogle-perftools-dev lua5.1 liblua5.1-0 \
        liblua5.1-0-dev checkinstall wget libssl-dev \
        mercurial meld openssh-server \
        autoconf automake cmake libass-dev libfreetype6-dev \
        libsdl2-dev libtheora-dev libtool libva-dev libvdpau-dev \
        libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev \
        texinfo zlib1g-dev pkgconf libyajl-dev libpcre++-dev liblmdb-dev \
        gettext gnupg2 curl python3 jq ca-certificates gcc g++ \
        libssl-dev libpcre3-dev \
        zlib1g-dev libxslt-dev libgd-dev libgeoip-dev \
        libperl-dev gperf uthash-dev \
        flex bison
    wget -qO /usr/local/bin/ninja.gz https://github.com/ninja-build/ninja/releases/latest/download/ninja-linux.zip
    gunzip /usr/local/bin/ninja.gz
    chmod a+x /usr/local/bin/ninja
    wget https://go.dev/dl/go1.20.1.linux-amd64.tar.gz
    rm -rf /usr/local/go
    tar -C /usr/local -xzf go1.20.1.linux-amd64.tar.gz
    rm -rf go1.20.1.linux-amd64.tar.gz
    rm -rf /var/lib/apt/lists/*
    rm -rf /usr/share/doc/*
    rm -rf /usr/share/man/*
    apt-get autoremove -y
    apt-get autoremove -y
    apt-get clean -y
EOT

RUN <<EOT
    git clone https://github.com/openresty/luajit2.git /usr/src/luajit-2.0
    git clone https://github.com/simpl/ngx_devel_kit.git /usr/src/ngx_devel_kit
    git clone https://github.com/openresty/lua-nginx-module.git /usr/src/lua-nginx-module
    git clone https://github.com/openresty/echo-nginx-module.git /usr/src/echo-nginx-module
    git clone https://github.com/vozlt/nginx-module-vts.git /usr/src/nginx-module-vts
    git clone https://github.com/vozlt/nginx-module-stream-sts.git /usr/src/nginx-module-stream-sts
    git clone https://github.com/vozlt/nginx-module-sts.git /usr/src/nginx-module-sts
    git clone https://github.com/kaltura/nginx-vod-module.git /usr/src/nginx-vod-module
    git clone https://github.com/arut/nginx-rtmp-module.git /usr/src/nginx-rtmp-module
    git clone https://github.com/arut/nginx-ts-module.git /usr/src/nginx-ts-module
    git clone https://github.com/openresty/headers-more-nginx-module.git /usr/src/headers-more-nginx-module
    git clone https://github.com/openresty/lua-upstream-nginx-module.git /usr/src/lua-upstream-nginx-module
    git clone https://github.com/yaoweibin/nginx_upstream_check_module /usr/src/nginx_upstream_check_module
    git clone https://github.com/openresty/lua-resty-core.git /usr/src/lua-resty-core
    git clone https://github.com/openresty/lua-resty-lrucache.git /usr/src/lua-resty-lrucache
    git clone https://github.com/hnlq715/status-nginx-module.git /usr/src/status-nginx-module
    git clone --depth 1 -b v3/master --single-branch https://github.com/SpiderLabs/ModSecurity /usr/src/ModSecurity
    git clone --depth 1 https://github.com/SpiderLabs/ModSecurity-nginx.git /usr/src/ModSecurity-nginx
    git clone https://github.com/opentracing/opentracing-cpp.git /usr/src/opentracing-cpp
    git clone https://github.com/opentracing-contrib/nginx-opentracing.git /usr/src/nginx-opentracing
    git clone --depth=1 --single-branch -b v0.9.0 https://github.com/jaegertracing/jaeger-client-cpp.git /usr/src/jaeger-client-cpp
    git clone https://github.com/google/ngx_brotli /usr/src/ngx_brotli
    git clone https://boringssl.googlesource.com/boringssl /usr/src/boringssl
    git clone https://github.com/openresty/set-misc-nginx-module.git /usr/src/set-misc-nginx-module
    git clone https://github.com/chobits/ngx_http_proxy_connect_module.git /usr/src/ngx_http_proxy_connect_module
    #https://www.alibabacloud.com/blog/how-to-use-nginx-as-an-https-forward-proxy-server_595799
EOT

RUN <<EOT
    cd /usr/src/luajit-2.0
    make -j$(nproc)
    make install
    export LUAJIT_LIB=/usr/local/lib
    export LUAJIT_INC=/usr/local/include/luajit-2.1
    ldconfig
EOT

RUN <<EOT
    echo "Compiling ModSecurity"
    cd /usr/src/ModSecurity
    git submodule init
    git submodule update
    ./build.sh
    ./configure
    make -j$(nproc)
    make install
EOT

RUN <<EOT
    echo "Building boringssl ..."
    export PATH=$PATH:/usr/local/go/bin
    mkdir -p /usr/src/boringssl/build
    cd /usr/src/boringssl/build
    cmake -GNinja ..
    ninja
EOT

#    && echo "Apply nngx_http_proxy_connect_module patch" \
#    && patch -p1 < /usr/src/ngx_http_proxy_connect_module/patch/proxy_connect_rewrite_102101.patch \
#    --add-module=/usr/src/ngx_http_proxy_connect_module \
    # Jaeger
RUN <<EOT
    mkdir -p /usr/src/opentracing-cpp/.build
    cd /usr/src/opentracing-cpp/.build
    cmake \
            -DBUILD_MOCKTRACER=OFF \
            -DBUILD_STATIC_LIBS=OFF \
            -DBUILD_TESTING=OFF \
            -DCMAKE_BUILD_TYPE=Release \
            ..
    make
    make install
EOT

RUN <<EOT
    mkdir -p /usr/src/jaeger-client-cpp/.build
    cd /usr/src/jaeger-client-cpp/.build
    cmake \
            -DBUILD_TESTING=OFF \
            -DCMAKE_BUILD_TYPE=Release \
            -DHUNTER_CONFIGURATION_TYPES=Release \
            -DJAEGERTRACING_BUILD_EXAMPLES=OFF \
            -DJAEGERTRACING_COVERAGE=OFF \
            -DJAEGERTRACING_WARNINGS_AS_ERRORS=OFF \
            -DJAEGERTRACING_WITH_YAML_CPP=ON \
            ..
    make
    make install
EOT

RUN <<EOT
    echo "Compiling Nginx"
    cd /usr/src/
    hg clone -b quic http://hg.nginx.org/nginx-quic /usr/src/nginx
    hg clone http://hg.nginx.org/njs
    echo "Init Nginx Brotli"
    cd /usr/src/ngx_brotli
    git submodule update --init
    cd /usr/src/nginx
    echo "Apply nginx_upstream_check_module patch check"
    patch -p1 < /usr/src/nginx_upstream_check_module/check_1.20.1+.patch
    echo "Apply nngx_http_proxy_connect_module patch"
    patch -p1 < /usr/src/ngx_http_proxy_connect_module/patch/proxy_connect_rewrite_102101.patch
    export ASAN_OPTIONS=detect_leaks=0
    export CFLAGS="-Wno-error"
    export LUAJIT_LIB=/usr/local/lib
    export LUAJIT_INC=/usr/local/include/luajit-2.1
    export HUNTER_INSTALL_DIR=$(cat /usr/src/jaeger-client-cpp/.build/_3rdParty/Hunter/install-root-dir)
    ldconfig
    cp ./auto/configure .
    ./configure \
        --with-http_xslt_module \
        --with-http_ssl_module \
        --with-http_mp4_module \
        --with-http_flv_module \
        --with-http_secure_link_module \
        --with-http_dav_module \
        --with-http_auth_request_module \
        --with-compat \
        --with-http_geoip_module \
        --with-http_image_filter_module \
        --with-mail \
        --with-mail_ssl_module \
        --with-google_perftools_module \
        --with-debug \
        --with-pcre-jit \
        --without-pcre2 \
        --with-ipv6 \
        --with-http_stub_status_module \
        --with-http_realip_module \
        --with-http_addition_module \
        --with-http_gzip_static_module \
        --with-http_sub_module \
        --with-stream \
        --with-stream_geoip_module \
        --with-stream_realip_module \
        --with-stream_ssl_module \
        --with-stream_ssl_preread_module \
        --with-http_random_index_module \
        --with-http_gunzip_module \
        --with-http_v2_module \
        --with-http_slice_module \
        --add-module=/usr/src/nginx_upstream_check_module \
        --add-module=/usr/src/nginx-rtmp-module \
        --add-module=/usr/src/ngx_devel_kit \
        --add-module=/usr/src/lua-nginx-module \
        --add-module=/usr/src/echo-nginx-module \
        --add-module=/usr/src/nginx-ts-module \
        --add-module=/usr/src/nginx-module-vts \
        --add-module=/usr/src/nginx-module-stream-sts \
        --add-module=/usr/src/nginx-module-sts \
        --add-module=/usr/src/nginx-vod-module \
        --add-module=/usr/src/njs/nginx \
        --add-module=/usr/src/ModSecurity-nginx \
        --add-module=/usr/src/headers-more-nginx-module \
        --add-module=/usr/src/lua-upstream-nginx-module \
        --add-module=/usr/src/status-nginx-module \
        --add-module=/usr/src/ngx_brotli \
        --add-module=/usr/src/set-misc-nginx-module \
        --add-module=/usr/src/ngx_http_proxy_connect_module \
        --with-http_v3_module \
        --with-stream_quic_module \
        --with-cc-opt="-I/usr/src/boringssl/include -I${HUNTER_INSTALL_DIR}/include" \
        --with-ld-opt="-L/usr/src/boringssl/build/ssl -L/usr/src/boringssl/build/crypto -L${HUNTER_INSTALL_DIR}/lib" \
        --build=quic-boringssl
    make -j$(nproc)
    make install
    cp -rf /usr/src/lua-resty-core/lib/* /usr/local/share/lua/5.1/
    cp -rf /usr/src/lua-resty-lrucache/lib/* /usr/local/share/lua/5.1/
    wget https://github.com/marrotte/nginx-sts-exporter/releases/download/v0.0-port/nginx-vts-exporter.tar.gz -O /usr/src/nginx-vts-exporter.tar.gz
    tar -C /usr/src -xzf /usr/src/nginx-vts-exporter.tar.gz
    mv /usr/src/nginx-vts-exporter /usr/local/nginx/sbin/nginx-vts-exporter
EOT

    # njs scripting language
RUN <<EOT
    cd /usr/src/njs
    ./configure --cc-opt="-O2 -m64 -march=x86-64 -mfpmath=sse -msse4.2 -pipe -fPIC -fomit-frame-pointer"
    make
    make unit_test
    install -m755 build/njs /usr/local/bin/
EOT

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/nginx/sbin/
RUN <<EOT
    mkdir -p /usr/local/nginx/lib/
    ldd /usr/local/nginx/sbin/nginx |  cut -d ' ' -f 3 | grep '/' | xargs -i cp {} /usr/local/nginx/lib/
    export HUNTER_INSTALL_DIR=$(cat /usr/src/jaeger-client-cpp/.build/_3rdParty/Hunter/install-root-dir)
    cp -p ${HUNTER_INSTALL_DIR}/lib/libyaml-cpp.so* /usr/local/lib
    strip \
        /usr/local/lib/libopentracing.so* \
        /usr/local/lib/libyaml-cpp.so* \
        /usr/local/lib/libjaegertracing.so* \
        /usr/local/nginx/lib/*.so*
    rm -rf /usr/local/go /usr/local/modsecurity/lib /usr/local/modsecurity/include /usr/local/nginx/conf/*.default
EOT

FROM ubuntu_core AS nginx-release
LABEL maintainer="Dmytro Burianov <dmytro@burianov.net>"
ARG CACHEBUST=0

RUN <<EOT
    mkdir -p /usr/local/nginx/logs \
            /usr/local/nginx/conf/ssl/ \
            /tmp/modsecurity/tmp \
            /tmp/modsecurity/data \
            /tmp/modsecurity/upload
    touch /usr/local/nginx/logs/access.log /usr/local/nginx/logs/error.log
    ln -sf /dev/stdout /usr/local/nginx/logs/access.log
    ln -sf /dev/stderr /usr/local/nginx/logs/error.log
EOT

COPY --from=ubuntu-build /usr/local /usr/local/
COPY --from=ubuntu-build /usr/src/ModSecurity/unicode.mapping /usr/local/modsecurity/unicode.mapping
#COPY --from=ubuntu-build /usr/src/ModSecurity/modsecurity.conf-recommended /usr/local/modsecurity/conf/modsecurity.conf
COPY --from=ubuntu-build /usr/bin/envsubst /usr/bin/envsubst
#RUN date
ADD docker-entrypoint.sh /docker-entrypoint.sh
ADD conf /usr/local/nginx/conf
ADD modsecurity /usr/local/modsecurity
ADD dhparams* /usr/local/nginx/conf/ssl/
#COPY dhparams4096.pem /usr/local/nginx/conf/ssl/
RUN ldconfig /usr/local/nginx/lib/

EXPOSE 80/tcp 443/tcp 443/udp 1935/tcp

#VOLUME ["/usr/local/nginx/conf", "/usr/local/nginx/html", "/usr/local/nginx/lua", "/usr/local/nginx/logs", "/usr/local/nginx/cache"]

STOPSIGNAL SIGQUIT

# test the configuration
#RUN env | sort \
#    && echo -n "njs version is: " \
#    && njs -v \
#    && /usr/local/nginx/sbin/nginx -V \
#    && /usr/local/nginx/sbin/nginx -t
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]
