FROM alpine:3.21

RUN apk update && apk add --no-cache \
    mariadb \
    mariadb-client \
    bash \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /run/mysqld /var/log/mysql /var/lib/mysql \
    && chown -R mysql:mysql /run/mysqld /var/log/mysql /var/lib/mysql

RUN	mariadb-install-db --user=mysql --datadir='/var/lib/mysql'

COPY ./mariadb/my.cnf /etc/my.cnf
RUN chown -R mysql:mysql /etc/my.cnf

COPY ./mariadb/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY ./mariadb/init.sql /docker-entrypoint-initdb.d/

EXPOSE 3306

WORKDIR /docker-entrypoint-initdb.d

ENTRYPOINT ["sh", "../entrypoint.sh"]
