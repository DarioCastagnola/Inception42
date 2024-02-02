NAME = inception
MY_USER = ${USER}

$(NAME):
	@if [ ! -f srcs/.env ]; then \
	touch srcs/.env ; \
	echo DOMAIN_NAME=dcastagn.42.fr >> srcs/.env ; \
	echo MYSQL_ROOT_PASSWORD=4321 >> srcs/.env ; \
	echo MYSQL_USER=arma7 >> srcs/.env ; \
	echo MYSQL_PASSWORD=1234 >> srcs/.env ; \
	echo WORDPRESS_ADMIN_USER=armabeto >> srcs/.env ; \
	echo WORDPRESS_ADMIN_PASSWORD=4321 >> srcs/.env ; \
	echo WORDPRESS_ADMIN_EMAIL=dcastagn42@gmail.com >> srcs/.env ; \
	echo WORDPRESS_USER_USERNAME=justgnu >> srcs/.env ; \
	echo WORDPRESS_USER_EMAIL=dcastagn42@gmail.com >> srcs/.env ; \
	echo WORDPRESS_USER_PASSWORD=1234 >> srcs/.env ; \
	echo WORDPRESS_TITLE=summonersrift >> srcs/.env ; \
	echo MYSQL_DATABASE=mariadb >> srcs/.env ; \
	fi
	@if [ ! -d /home/${MY_USER}/data ]; then \
	mkdir -p /home/${MY_USER}/data/wordpress ; \
	mkdir -p /home/${MY_USER}/data/mariadb ; \
	mkdir -p /home/${MY_USER}/data/adminer ; \
	fi
	docker compose -f ./srcs/docker-compose.yml --env-file "./srcs/.env" up

all: $(NAME)

clean:
	@docker rm -f wordpress mariadb adminer nginx 2>/dev/null
	@docker rmi -f srcs-wordpress srcs-mariadb srcs-adminer srcs-nginx 2>/dev/null
	@docker volume rm -f wordpress mariadb adminer 2>/dev/null

fclean: clean 
	sudo rm -rf /home/${MY_USER}/data
	

re: fclean all


.PHONY: clean fclean re
