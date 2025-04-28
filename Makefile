# Makefile para gerenciar o setup de DevOps

.PHONY: help setup build up down logs shell

help:
	@echo "Comandos disponíveis:"
	@echo "  make setup   - Rodar o script de setup no sistema"
	@echo "  make build   - Buildar a imagem Docker"
	@echo "  make up      - Subir os containers (dev + banco de dados)"
	@echo "  make down    - Derrubar os containers"
	@echo "  make logs    - Ver os logs dos containers"
	@echo "  make shell   - Acessar o container dev via shell"

setup:
	chmod +x setup-dev-environment.sh
	./setup-dev-environment.sh

build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down

logs:
	docker-compose logs -f

shell:
	docker-compose exec dev /bin/zsh
