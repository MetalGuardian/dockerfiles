MAKEFLAGS =+ -rR --warn-undefined-variables

.PHONY: help build run

help:
	@echo "Available targets:"
	@echo " build		Builds docker image"
	@echo " run  		Runs docker container"

build:
	docker build -t goland:local .

run: build
	mkdir -p /my/home/goland
	docker run --rm -ti \
		-v /etc/passwd:/etc/passwd:ro \
		-v /etc/group:/etc/group:ro \
		-e GOPATH=${HOME}/go \
		--user=`id -u`:`id -g` \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-e DISPLAY=unix${DISPLAY} \
		--init \
		-v /my/home/goland:${HOME} \
		-v ${HOME}/go:${HOME}/go \
		--net none \
		goland:local

shell: build
	mkdir -p /my/home/goland
	docker run --rm -ti \
		-v /etc/passwd:/etc/passwd:ro \
		-v /etc/group:/etc/group:ro \
		-e GOPATH=${HOME}/go \
		--user=`id -u`:`id -g` \
		--init \
		-v /my/home/goland:${HOME} \
		-v ${HOME}/go:${HOME}/go \
		--net host \
		goland:local \
		bash
