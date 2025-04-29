FROM alpine:3.21

RUN apk update && apk add --no-cache \
    mariadb \
    mariadb-client \
    bash \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /run/mysqld /var/log/mysql /var/lib/mysql \
    && chown -R mysql:mysql /run/mysqld /var/log/mysql /var/lib/mysql

COPY ./mariadb/my.cnf /etc/my.cnf
COPY ./mariadb/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 3306

CMD ["./entrypoint.sh"]
