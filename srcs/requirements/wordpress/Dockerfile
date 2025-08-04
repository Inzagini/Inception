FROM debian:12

RUN apt update && apt upgrade && apt install -y \
	php-fpm \
	php-mysqli \
	curl \
	default-mysql-client

COPY www.conf /etc/php/8.2/fpm/pool.d
COPY webScript.sh .
RUN chmod +x webScript.sh

ENTRYPOINT ["./webScript.sh"]
