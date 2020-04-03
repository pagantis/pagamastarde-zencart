FROM pagantis/docker-php:7.2

ENV VERSION 1.5.6c
ENV DBHOST zencart-db
ENV DBUSER db
ENV DBPASS db
ENV DBNAME db

COPY ./docker/resources/$VERSION/* /tmp/

RUN apt-get update && apt-get install -y zip && rm -rf /var/lib/apt/lists/*
RUN cd /tmp && \
    curl -fSL https://github.com/zencart/zencart/archive/v$VERSION.zip -o $VERSION.zip && \
    unzip $VERSION && \
    cp -pr /tmp/zencart-$VERSION/* /var/www/ && \
    cp /tmp/configure.php /var/www/includes/configure.php && \
    cp /tmp/configure.php /var/www/admin/includes/configure.php && \
    rm -rf /var/www/zc_install && \
    mv /var/www/admin /var/www/adm && \
    chown -R www-data:www-data /var/www

WORKDIR /var/www
