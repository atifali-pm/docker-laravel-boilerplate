setup:
	@make build
	@make up 
	@make composer-update
build:
	docker-compose build --no-cache --force-rm
stop:
	docker-compose stop
up:
	docker-compose up -d
composer-update:
	docker exec laravel-boiler-plate bash -c "composer update"
data:
	docker exec laravel-boiler-plate bash -c "php artisan migrate"
	docker exec laravel-boiler-plate bash -c "php artisan db:seed"
run-command:
	docker exec laravel-boiler-plate bash -c "$(filter-out $@,$(MAKECMDGOALS))"

%:
	@:
