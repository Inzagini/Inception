CERT:= ./requirements/nginx/ssl/server.cert ./requirements/nginx/ssl/server.key
KEY_GEN_PATH:= ./requirements/nginx/keygen.sh

all: build

build: $(CERT)
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
	yes | docker system prune --all --volumes

re: down build up

re-all: down prune_a build up

rebuild: clean build up
	sleep 5 && docker ps | grep inception-db-1 > /dev/null || docker compose logs db
logs:
	docker compose logs nginx
	docker compose logs wordpress

$(CERT):
	@echo "🔐 SSL cert or key not found. Generating with keygen.sh..."
	chmod +x $(KEY_GEN_PATH)
	$(KEY_GEN_PATH)

.PHONY: all build up down clean re
