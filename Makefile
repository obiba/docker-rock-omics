#
# Docker helper
#

docker_compose_file=docker-compose.yml
no_cache=false
tag=latest

# Build Docker image
build-image:
	sudo docker build --no-cache=$(no_cache) -t="datashield/rock-omics:$(tag)" .

push-image:
	sudo docker image push datashield/rock-omics:$(tag)


up:
	docker-compose -f $(docker_compose_file) up -d --remove-orphans

down:
	docker-compose -f $(docker_compose_file) down

stop:
	docker-compose -f $(docker_compose_file) stop

start:
	docker-compose -f $(docker_compose_file) start

restart:
	docker-compose -f $(docker_compose_file) restart

pull:
	docker-compose -f $(docker_compose_file) pull --include-deps

logs:
	docker-compose -f $(docker_compose_file) logs -f

build:
	docker-compose -f $(docker_compose_file) build --no-cache

clean:
	rm -rf target
