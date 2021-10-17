all:
	mkdir -p ~/data/wp
	mkdir -p ~/data/db
	docker-compose up --build -d -f srcs/docker-compose.yml
up:
	docker-compose up --build -d -f srcs/docker-compose.yml
down:
	docker-compose down -f srcs/docker-compose.yml
clean: down
	docker stop $(docker ps -aq)
	docker rm $(docker ps -aq)
	docker rmi $(docker images -aq)
	docker volume rm $(docker volume ls -q)
	docker network rm $(sudo docker network ls -q)
	rm -rf ~/data/wp
	rm -rf ~/data/db

.PHONY: all up down clean
