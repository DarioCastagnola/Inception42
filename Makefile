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
	docker compose -f ./srcs/docker-compose.yml --env-file "./srcs/.env" up

all: $(NAME)

clean:
	docker rm wordpress mariadb nginx adminer
	docker rmi srcs-wordpress srcs-mariadb srcs-adminer srcs-nginx
	docker volume rm wordpress mariadb adminer

fclean: clean 
	sudo rm -rf /home/${MY_USER}/data
	

re: fclean all


.PHONY: clean fclean re
