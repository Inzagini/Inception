all: build

build:
ifeq ($(ser),)
	docker compose -f docker-compose.yml build
else
	docker compose build $(ser)
endif
up:
	docker compose -f docker-compose.yml up -d

down:
	docker compose -f docker-compose.yml down

clean: down
	docker volume rm inception_mariadbdata

prune_a:
	docker system prune --all --volumes

re: down build up

re-all: clean prune_a build up

rebuild: clean build up
	sleep 5 && docker ps | grep inception-db-1 > /dev/null || docker compose logs db
logs:
	docker compose logs app
	docker compose logs web
	docker compose logs db

.PHONY: all build up down clean re
