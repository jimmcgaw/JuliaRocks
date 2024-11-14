shell:
	julia --project=.

build:
	docker compose build

start:
	docker compose up -d

stop:
	docker compose down

restart: stop
	docker compose up -d