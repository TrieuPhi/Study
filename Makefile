IMAGE_NAME ?= study-quartz
PORT ?= 8080
WS_PORT ?= 3001

.PHONY: docker-build docker-run docker-run-sudo docker-dev docker-dev-sudo

# Build image once (or whenever Dockerfile/dependencies change)
docker-build:
	docker build -t $(IMAGE_NAME) .

# Run for daily content editing (no rebuild needed)
docker-run:
	docker run --rm -it -p $(PORT):8080 -p $(WS_PORT):3001 -v "$(PWD)/content:/usr/src/app/content" $(IMAGE_NAME)

# Same as docker-run but with sudo, useful if docker group permissions are not fixed yet
docker-run-sudo:
	sudo docker run --rm -it -p $(PORT):8080 -p $(WS_PORT):3001 -v "$(PWD)/content:/usr/src/app/content" $(IMAGE_NAME)

# Build and run in one command
docker-dev: docker-build docker-run

# Build and run in one command (sudo variant)
docker-dev-sudo:
	sudo docker build -t $(IMAGE_NAME) .
	sudo docker run --rm -it -p $(PORT):8080 -p $(WS_PORT):3001 -v "$(PWD)/content:/usr/src/app/content" $(IMAGE_NAME)
