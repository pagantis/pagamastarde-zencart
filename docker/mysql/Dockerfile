FROM mysql:5.6

ENV VERSION 1.5.6c
ENV MYSQL_USER db
ENV MYSQL_PASSWORD db
ENV MYSQL_DATABASE db
ENV MYSQL_ROOT_PASSWORD db

COPY ./docker/resources/$VERSION/demo.sql /docker-entrypoint-initdb.d/dump.sql
