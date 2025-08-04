FROM debian:12

RUN apt update && apt upgrade && apt install -y \
	mariadb-server

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY script.sh .

RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld
RUN chmod 777 script.sh

ENTRYPOINT ["./script.sh"]
