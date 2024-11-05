FROM debian:bullseye

RUN apt -y update && apt install -y nginx openssl

EXPOSE 80

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./conf/index.inception.html /var/www/html/index.inception.html

ENTRYPOINT ["nginx", "-g", "daemon off;"]
