# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ltrinchini <ltrinchini@student.42lyon.f    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/12 14:27:37 by ltrinchi          #+#    #+#              #
#    Updated: 2023/05/03 15:25:41 by ltrinchini       ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

DOCKER = docker
DOCKER_COMPOSE = docker-compose
LOGIN = ltrinchini
PATH_TO_INIT_SCRIPT = ./init.sh
PATH_TO_DOCKER_COMPOSE_YML = ./srcs/docker-compose.yml
PATH_TO_DATA = /Users/$(LOGIN)/data
PATH_TO_DATA_MARIADB = $(PATH_TO_DATA)/mariadb
PATH_TO_DATA_WORDPRESS = $(PATH_TO_DATA)/wordpress

RM = rm -rf
MKDIR = mkdir -p

all: up

up:
	$(MKDIR) $(PATH_TO_DATA_MARIADB)
	$(MKDIR) $(PATH_TO_DATA_WORDPRESS)
	sudo bash $(PATH_TO_INIT_SCRIPT)
	$(DOCKER_COMPOSE) -f $(PATH_TO_DOCKER_COMPOSE_YML) up --build -d

down:
	$(DOCKER_COMPOSE) -f $(PATH_TO_DOCKER_COMPOSE_YML) down

clean:
	$(DOCKER_COMPOSE) -f $(PATH_TO_DOCKER_COMPOSE_YML) down --rmi all -v

ps:
	$(DOCKER_COMPOSE) -f $(PATH_TO_DOCKER_COMPOSE_YML) ps

fclean: clean
	$(RM) $(PATH_TO_DATA)

re: fclean all

.PHONY: all up down clean fclean re
.SILENT:
