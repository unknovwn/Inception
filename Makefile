all:
	mkdir -p ~/data/wp
	mkdir -p ~/data/db
	docker-compose -f srcs/docker-compose.yml up --build -d
up:
	docker-compose -f srcs/docker-compose.yml up --build -d
down:
	docker-compose -f srcs/docker-compose.yml down
clean: down
	docker stop $(docker ps -aq)
	docker rm $(docker ps -aq)
	docker rmi $(docker images -aq)
	docker volume rm $(docker volume ls -q)
	docker network rm $(sudo docker network ls -q)
	rm -rf ~/data/wp
	rm -rf ~/data/db

.PHONY: all up down clean
