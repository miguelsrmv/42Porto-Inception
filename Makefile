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

WP_DATA = /home/miguel/Coding/42Porto/CommonCore/Inception/data/wordpress/
DB_DATA = /home/miguel/Coding/42Porto/CommonCore/Inception/data/mariadb/
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

clean: down
	@echo "** REMOVING IMAGES **"
	@docker rmi -f $$(docker images -qa)
	@echo "** REMOVING VOLUMES **"
	@docker volume rm $$(docker volume ls -q)
	@echo "** DELETING DATA ** "
	@sudo rm -rf $(WP_DATA)
	@sudo rm -rf $(DB_DATA)
	@echo "** REMOVING DOMAIN NAME **"
	@sudo hostsed rm 127.0.0.1 $(DOMAIN_NAME)

re: clean up
	
prune:
	docker system prune -a

status:
	@clear
	@docker ps -a
	@echo ""
	@docker image ls
	@echo ""
	@docker volume ls
	@echo ""
	@docker network ls
	@echo ""
	
.PHONY: all up down build clean re
