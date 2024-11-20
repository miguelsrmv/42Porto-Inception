# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mde-sa-- <mde-sa--@student.42porto.com>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/08 10:57:58 by mde-sa--          #+#    #+#              #
#    Updated: 2024/11/08 11:01:22 by mde-sa--         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt-get update -y && apt-get install mariadb-server -y

COPY ./conf/mariadb_setup.sh /mariadb_setup.sh

RUN chmod +x /mariadb_setup.sh

EXPOSE 3306

CMD ["/mariadb_setup.sh"]
