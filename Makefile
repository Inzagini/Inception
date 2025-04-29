all: build

build:
	docker compose -f docker-compose.yml build

up:
	docker compose -f docker-compose.yml up -d

down:
	docker compose -f docker-compose.yml down

# clean: down
# 	docker volume rm wordpress_db wordpress_website

prune_a:
	docker system prune --all --volumes

re: down build up

re-all:down prune_a build up

logs:
	docker compose logs app
	docker compose logs web
	docker compose logs db

.PHONY: all build up down clean re
