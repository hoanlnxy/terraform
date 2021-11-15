# https://dockerfile.readthedocs.io/en/latest/content/DockerImages/dockerfiles/php-nginx-dev.html
FROM webdevops/php-nginx-dev:7.1 as build-env

WORKDIR /app

# Install libsodium
RUN pecl install -f xdebug-2.9.8
RUN curl https://download.libsodium.org/libsodium/releases/libsodium-1.0.18.tar.gz -o /tmp/libsodium-1.0.18.tar.gz
RUN tar -xzf /tmp/libsodium-1.0.18.tar.gz -C /tmp && cd /tmp/libsodium-1.0.18 && ./configure && make && make check && make install
RUN pecl install libsodium
RUN echo extension=sodium.so > /usr/local/etc/php/conf.d/sodium.ini

# Install td-agent
RUN curl https://packages.treasuredata.com/GPG-KEY-td-agent | apt-key add -
# add treasure data repository to apt
RUN echo "deb http://packages.treasuredata.com/3/debian/buster/ buster contrib" > /etc/apt/sources.list.d/treasure-data.list
# update your sources
RUN apt-get update -y
# install the toolbelt
RUN apt-get install -y td-agent

COPY supervisord.sh /entrypoint.cmd/supervisord.sh
COPY td-agent.conf /etc/td-agent/td-agent.conf
#COPY env.php /entrypoint.cmd/env.php
#COPY auth.json /entrypoint.cmd/auth.json

ARG DOMAIN_NAME=local-mdc.tops.co.th
ARG DEBUGGER=none
ARG XDEBUG_HOST=localhost
ARG XDEBUG_PORT=9001

ENV COMPOSER_VERSION=1
ENV WEB_DOCUMENT_ROOT=/app/pub
ENV WEB_ALIAS_DOMAIN=${DOMAIN_NAME}
ENV COMPOSER_MEMORY_LIMIT=-1
ENV PHP_MEMORY_LIMIT=-1
ENV PHP_DISPLAY_ERRORS=1
ENV PHP_DEBUGGER=${DEBUGGER}
ENV XDEBUG_REMOTE_PORT=${XDEBUG_PORT}
ENV XDEBUG_REMOTE_HOST=${XDEBUG_HOST}

RUN echo "xdebug.remote_log=/tmp/xdebug.log" >> /opt/docker/etc/php/php.ini
RUN if [ "${DEBUGGER}" = "xdebug" ]; then \
        echo "" > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
    fi

COPY main.conf /opt/docker/etc/nginx/main.conf
COPY nginx.conf /opt/docker/etc/nginx/nginx.conf

COPY  MagentoCI.zip /app/MagentoCI.zip
RUN unzip /app/MagentoCI.zip

COPY env.php /app/app/etc/env.php
COPY auth.json /app/auth.json
