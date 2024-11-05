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

NGINX_IMAGE=my_nginx

nginx_build:
	# Builds nginx image
	sudo docker build srcs/requirements/nginx -t $(NGINX_IMAGE) 

nginx_run:
	# Runs nginx image
	sudo docker run -d -p 8080:80 $(NGINX_IMAGE) 

nginx_clean:
	@echo "Stopping all nginx-related containers..."
	@CONTAINERS=$$(sudo docker ps -q --filter "ancestor=$(NGINX_IMAGE)"); \
	if [ -n "$$CONTAINERS" ]; then \
		sudo docker stop $$CONTAINERS; \
	else \
		echo "No running containers to stop."; \
	fi

	@echo "Removing all nginx-related containers..."
	@CONTAINERS=$$(sudo docker ps -aq --filter "ancestor=$(NGINX_IMAGE)"); \
	if [ -n "$$CONTAINERS" ]; then \
		sudo docker rm -f $$CONTAINERS; \
	else \
		echo "No stopped containers to remove."; \
	fi

	@echo "Removing all nginx-related images..."
	@IMAGES=$$(sudo docker images -q $(NGINX_IMAGE)); \
	if [ -n "$$IMAGES" ]; then \
		sudo docker rmi -f $$IMAGES; \
	else \
		echo "No images to remove."; \
	fi

nginx_re: 
	@make nginx_clean
	@make nginx_build
	@make nginx_run
