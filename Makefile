all: build

build:
	docker compose -f docker-compose.yml build

up:
	docker compose -f docker-compose.yml up -d

down:
	docker compose -f docker-compose.yml down

clean: down
	docker volume rm wordpress_db wordpress_website

prune_av:
	docker system prune --all --volumes

re: down build up

re-all: prune_av re


.PHONY: all build up down clean re
