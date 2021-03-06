VOLUMES_DIR          = ${HOME}/data
WORDPRESS_VOLUME_DIR = ${VOLUMES_DIR}/wp
DATABASE_VOLUME_DIR  = ${VOLUMES_DIR}/db

all: create-volume-dirs up

no-cache: create-volume-dirs
	docker-compose -f srcs/docker-compose.yml build --no-cache
	docker-compose -f srcs/docker-compose.yml create
	docker-compose -f srcs/docker-compose.yml start

up:
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

start:
	docker-compose -f srcs/docker-compose.yml start

stop:
	docker-compose -f srcs/docker-compose.yml stop

create-volume-dirs:
	mkdir -p ${WORDPRESS_VOLUME_DIR}
	mkdir -p ${DATABASE_VOLUME_DIR}

clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all -v
	rm -rf ${WORDPRESS_VOLUME_DIR}
	rm -rf ${DATABASE_VOLUME_DIR}

re: clean all

.PHONY: all up down clean re
