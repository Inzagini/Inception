all: build

build:
	docker-compose -f docker-compose.yml build

up:
	docker-compose -f docker-compose.yml up -d

down:
	docker-compose -f docker-compose.yml down

# clean: down
# 	docker volume rm wordpress_db wordpress_website

prune_a:
	docke system prune -a

re: down build up

.PHONY: all build up down clean re
