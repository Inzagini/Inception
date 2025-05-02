FROM debian:trixie

RUN apt-get update && apt-get install nginx openssl -y

COPY ./nginx/conf.d/default.conf ./etc/nginx/conf.d/default.conf

RUN mkdir -p /var/log/nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
