all: build

build:
	@docker build --tag=jouz/docker-bind .
