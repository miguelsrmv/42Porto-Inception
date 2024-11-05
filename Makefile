# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mde-sa-- <mde-sa--@student.42porto.com>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/05 14:36:01 by mde-sa--          #+#    #+#              #
#    Updated: 2024/11/05 14:52:50 by mde-sa--         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

WP_DATA = /home/Coding/42Porto/CommonCore/Inception/data/wordpress/
DB_DATA = /home/Coding/42Porto/CommonCore/Inception/data/mariadb/
DOMAIN_NAME = login.42.fr

all: up

up: build
	@mkdir -p $(WP_DATA)
	@mkdir -p $(DB_DATA)
	@sudo hostsed add 127.0.0.1 $(DOMAIN_NAME)
	@docker compose -f ./srcs/docker-compose.yml up -d

down:
	@docker compose -f ./srcs/docker-compose.yml down

build:
	@docker compose -f ./srcs/docker-compose.yml build
