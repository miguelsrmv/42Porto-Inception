# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: miguel <miguel@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/05 18:02:47 by mde-sa--          #+#    #+#              #
#    Updated: 2024/12/14 11:12:36 by miguel           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt -y update && apt install -y nginx openssl gettext

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-out /etc/ssl/nginx-selfsigned.pem -keyout /etc/ssl/nginx-selfsigned.key \
	-subj "/C=PT/ST=Porto/L=Porto/O=42/OU=42/CN=${DOMAIN_NAME}/UID=${DB_USER}" #TODO: Change OU to 42Porto?

EXPOSE 443

COPY ./conf/nginx_template.conf /etc/nginx/conf.d/nginx_template.conf

ENTRYPOINT ["/bin/bash", "-c", "envsubst '$DOMAIN_NAME' < /etc/nginx/conf.d/nginx_template.conf > /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"]
