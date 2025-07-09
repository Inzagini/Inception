FROM debian:latest

RUN apt update && apt upgrade && apt install -y \
	mariadb-server

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY init.sql /etc/mysql/init.sql
COPY script.sh .

RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld
RUN chmod 777 script.sh

CMD ["./script.sh"]
