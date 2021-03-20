# 本番では make [cmd] e=prod とする

# local or prod
ENV=local
CONTAINER_NAMES=$(filter-out $@,$(MAKECMDGOALS))

set-env:
ifdef e
	ENV=${e}
endif

set-docker-env := export ENV=$(ENV) ;\
           export COMPOSE_PATH_SEPARATOR=: ;\
           export COMPOSE_FILE=docker-compose.yml:docker-compose.$(ENV).yml ;

.PHONY: logs
logs:
	docker logs -f $(CONTAINER_NAMES)

.PHONY: ps
ps:
	docker-compose ps $(CONTAINER_NAMES)

.PHONY: rm
rm:
	docker rm -f $(CONTAINER_NAMES)

.PHONY: up
up: set-env init-web
	$(set-docker-env)\
	docker-compose up -d $(CONTAINER_NAMES)

.PHONY: restart
restart: set-env
	$(set-docker-env)\
	docker-compose restart $(CONTAINER_NAMES)

.PHONY: down
down: set-env
	$(set-docker-env)\
	docker-compose down

.PHONY: rebuild
rebuild: set-env
	$(set-docker-env)\
	docker-compose build --no-cache $(CONTAINER_NAMES)