NAME = inception

$(NAME):
	docker compose -f ./srcs/docker-compose.yml --env-file "./srcs/.env" up

all: $(NAME)

clean:
	docker rm wordpress mariadb nginx
	docker rmi srcs-wordpress srcs-mariadb
	docker volume rm wordpress mariadb

fclean: clean
	sudo rm -rf /home/dariocastagnola/data wordpress mariadb
	

re: fclean all


.PHONY: prepare clean fclean re
