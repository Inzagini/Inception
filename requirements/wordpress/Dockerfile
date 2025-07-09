FROM debian:latest

RUN apt update && apt upgrade && apt install -y \
	php-fpm \
	php-mysqli \
	curl

COPY www.conf /etc/php/8.2/fpm/pool.d
COPY webScript.sh .
RUN chmod +x webScript.sh

CMD ["./webScript.sh"]
