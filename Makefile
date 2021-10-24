VOLUMES_DIR          = ${HOME}/data
WORDPRESS_VOLUME_DIR = ${VOLUMES_DIR}/wp
DATABASE_VOLUME_DIR  = ${VOLUMES_DIR}/db

all: create-volume-dirs up

up:
	docker-compose -f srcs/docker-compose.yml up --build -d

no-cache: create-volume-dirs
	docker-compose -f srcs/docker-compose.yml build --no-cache
	docker-compose -f srcs/docker-compose.yml create
	docker-compose -f srcs/docker-compose.yml start

down:
	docker-compose -f srcs/docker-compose.yml down

create-volume-dirs:
	mkdir -p ${WORDPRESS_VOLUME_DIR}
	mkdir -p ${DATABASE_VOLUME_DIR}

clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all -v
	rm -rf ${WORDPRESS_VOLUME_DIR}
	rm -rf ${DATABASE_VOLUME_DIR}

re: clean all

.PHONY: all up down clean re
