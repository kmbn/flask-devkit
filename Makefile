.PHONY: test

COMPOSE_PROJECT_NAME=flask-devkit

COMPOSE_SERVICE_NAME=flask

COMPOSE_FILE=docker-compose.yml

OVERRIDE_CI_FILE=docker-compose.ci.yml

COMPOSE=docker-compose -p $(COMPOSE_PROJECT_NAME)

EXEC=docker exec -it -e "TERM=xterm-256color" $(COMPOSE_PROJECT_NAME)_$(COMPOSE_SERVICE_NAME)_1 pipenv

RUN=$(EXEC) run

CI=docker-compose -p $(COMPOSE_PROJECT_NAME) -f $(COMPOSE_FILE) -f $(OVERRIDE_CI_FILE)


# Docker commands
build:
	$(COMPOSE) build

up:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

logs:
	$(COMPOSE) logs -f


# Lint app
lint:
	$(RUN) isort -rc . && \
	black . && \
	flake8 . && \
	mypy .


# Test app
test:
	$(RUN) pytest


# Test app and generate coverage
coverage:
	$(RUN) pytest --cov=flask_app

# Pipenv commands
install:
	$(EXEC) install $(PKG)

installdev:
	$(EXEC) install --dev $(PKG)

uninstall:
	$(EXEC) uninstall $(PKG)


# CI commands
build_ci:
	$(CI) build
