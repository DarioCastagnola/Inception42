NAME = inception

$(NAME):
	docker compose -f ./srcs/docker-compose.yml --env-file "./srcs/.env" up

all: $(NAME)

clean:
	docker rm wordpress mariadb nginx adminer
	docker rmi srcs-wordpress srcs-mariadb srcs-adminer srcs-nginx
	docker volume rm wordpress mariadb adminer

fclean: clean
	sudo rm -rf /home/dariocastagnola/data wordpress mariadb adminer
	

re: fclean all


.PHONY: clean fclean re
