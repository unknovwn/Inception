all:
	mkdir -p ~/data/wp
	mkdir -p ~/data/db
	docker-compose -f srcs/docker-compose.yml up --build -d
up:
	docker-compose -f srcs/docker-compose.yml up --build -d
down:
	docker-compose -f srcs/docker-compose.yml down
clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all -v
	rm -rf ~/data/wp
	rm -rf ~/data/db
re: clean all

.PHONY: all up down clean re
