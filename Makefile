CERT:= ./srcs/requirements/nginx/ssl/test.crt ./srcs/requirements/nginx/ssl/test.key
KEY_GEN_PATH:= ./srcs/requirements/nginx/keygen.sh

all: build

build: $(CERT)
	docker compose -f srcs/docker-compose.yml build
up:
	mkdir -p /home/quannguy/data/DB
	mkdir -p /home/quannguy/data/WordPress
	docker compose -f srcs/docker-compose.yml up -d

down:
	docker compose -f srcs/docker-compose.yml down

clean: down
	@echo "Cleaning volume and data directories..."
	docker volume rm srcs_mariadb_data srcs_wordpress_data || true
	sudo rm -rf /home/quannguy/data/DB/* /home/quannguy/data/WordPress/*
	@echo "Clean complete. Next build will start fresh."

prune_a:
	yes | docker system prune --all --volumes

re: down build up

re-all: down prune_a build up

rebuild: clean build up
	sleep 5 && docker ps | grep inception-db-1 > /dev/null || docker compose logs db
logs:
	docker compose -f srcs/docker-compose.yml logs nginx
	docker compose -f srcs/docker-compose.yml logs mariadb
	docker compose -f srcs/docker-compose.yml logs wordpress

$(CERT):
	@echo "🔐 SSL cert or key not found. Generating with keygen.sh..."
	chmod +x $(KEY_GEN_PATH)
	$(KEY_GEN_PATH)

.PHONY: all build up down clean re
