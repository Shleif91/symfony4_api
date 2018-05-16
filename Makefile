USER := shleif

dev:
	@docker-compose stop && \
		 sudo docker-compose up -d --build && \
		 sudo chown -R $(USER):$(USER) ./app

stop:
	@docker-compose stop

start:
	@docker-compose start

chown:
	@sudo chown -R $(USER):$(USER) ./app
