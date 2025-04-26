FROM alpine:3.21

RUN apk update && apk add --no-cache \
	mariadb \
	mariadb-client

RUN mkdir -p /run/mysqld \
	&& chown -R mysql:mysql /run/mysqld

RUN mkdir -p /var/log/mysql \
	 && chown -R mysql:mysql /var/log/mysql

COPY /mariadb/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

COPY ./mariadb/my.cnf /etc/my.cnf

EXPOSE 3306

ENTRYPOINT ["/mariadb/entrypoint.sh"]
CMD ["--user=mysql", "--console"]
