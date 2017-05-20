all: build

build:
		@docker build --tag=jouz/docker-bind:latest .

release: build
		@docker build --tag=jouz/docker-bind:$(shell cat VERSION) 
