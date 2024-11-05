# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    wordpress_conf.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mde-sa-- <mde-sa--@student.42porto.com>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/05 18:31:49 by mde-sa--          #+#    #+#              #
#    Updated: 2024/11/05 18:32:57 by mde-sa--         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

# Step 1: download WP CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

#2 Step 2: Move it 

cd /var/www/wordpress

chmod -R 755 /var/www/wordpress/

chown -R www-data:www-data /var/www/wordpress
