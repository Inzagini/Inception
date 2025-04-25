FROM alpine:3.21

RUN apk update && apk add --no-cache nginx

COPY ./nginx/conf.d/default.conf ./etc/nginx/conf.d/default.conf
COPY ./nginx/nginx.conf ./etc/nginx/nginx.conf

RUN mkdir -p /var/log/nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
