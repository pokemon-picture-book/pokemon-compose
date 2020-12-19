# 本番では make [cmd] e=prod とする

# local or prod
ENV=local
CONTAINER_NAMES=$(filter-out $@,$(MAKECMDGOALS))

pre:
ifdef e
ENV=${e}
endif

set-env := export ENV=$(ENV) ;\
           export COMPOSE_PATH_SEPARATOR=: ;\
           export COMPOSE_FILE=docker-compose.yml:docker-compose.$(ENV).yml ;

.PHONY: ps
ps:
	docker-compose ps $(CONTAINER_NAMES)

.PHONY: rm
rm:
	docker rm -f $(CONTAINER_NAMES)

.PHONY: up
up: pre
	$(set-env)\
	docker-compose up -d $(CONTAINER_NAMES)

.PHONY: down
down: pre
	$(set-env)\
	docker-compose down

.PHONY: rebuild
rebuild: pre
	$(set-env)\
	docker-compose build --no-cache $(CONTAINER_NAMES)