FROM debian:latest

RUN apt update && apt upgrade && apt install -y nginx

COPY default /etc/nginx/sites-available/.

RUN mkdir /etc/nginx/ssl && chmod 700 /etc/nginx/ssl
COPY ssl/ /etc/nginx/ssl
RUN chmod 600 /etc/nginx/ssl/*

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
