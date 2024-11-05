# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mde-sa-- <mde-sa--@student.42porto.com>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/05 18:02:47 by mde-sa--          #+#    #+#              #
#    Updated: 2024/11/05 18:02:48 by mde-sa--         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt -y update && apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-out /etc/ssl/nginx-selfsigned.pem -keyout /etc/ssl/nginx-selfsigned.key \
	-subj "/C=PT/ST=Porto/L=Porto/O=42/OU=42/CN=Domain_name/UID=Db_user"

EXPOSE 443

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./conf/index.inception.html /var/www/html/index.inception.html

ENTRYPOINT ["nginx", "-g", "daemon off;"]
