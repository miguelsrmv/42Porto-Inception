# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mde-sa-- <mde-sa--@student.42porto.com>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/05 18:02:52 by mde-sa--          #+#    #+#              #
#    Updated: 2024/11/05 18:31:07 by mde-sa--         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt -y update && apt install -y \
	curl \
	mariadb-client \
	netcat \
	php \
	php-mysql \
	php-fpm

COPY ./conf/wp.conf.sh /

RUN  chmod +x wp_conf.sh

RUN mkdir -p /var/www/wordpress

EXPOSE 9000

ENTRYPOINT ["./wordpress_conf.sh"]
