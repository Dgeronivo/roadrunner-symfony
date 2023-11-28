info:
	@echo "Available command: deploy"

build-no-cache:
	@docker-compose build --no-cache

build:
	@docker-compose build

up:
	@docker-compose up

deploy:
	@docker-compose down
	@docker-compose up -d --build
