FROM php:8.0.5-fpm as base
ENV APP_HOME=/var/www/html \
    FCGI_CONNECT=127.0.0.1:7070 \
    PHP_FPM_CONF=/usr/local/etc/php-fpm.d/zz-docker.conf \
    PHP_INI=/usr/local/etc/php/conf.d/zz-php.ini \
    COMPOSER_ALLOW_SUPERUSER=1 \
    TZ=America\/Sao_Paulo

COPY ./.docker/php/fpm.conf $PHP_FPM_CONF
COPY ./.docker/php/php.ini $PHP_INI
RUN docker-php-ext-install opcache
RUN pecl install apcu \
    && docker-php-ext-enable apcu
RUN pecl install mongodb \
    && docker-php-ext-enable mongodb

FROM base as dev
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

FROM base as shipment
EXPOSE 7080
ENTRYPOINT ["php-fpm"]