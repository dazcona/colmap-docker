run:
	@docker-compose up -d --build
dev:
	@nvidia-docker exec -it col_container bash
build:
	@docker-compose build
down:
	@docker-compose down -v
status:
	@docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
logs:
	@docker logs col_container -f