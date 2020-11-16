MAKEFLAGS =+ -rR --warn-undefined-variables

.PHONY: help build run

help:
	@echo "Available targets:"
	@echo " build		Builds docker image"
	@echo " run  		Runs docker container"

build:
	docker build -t ripme:local .

run: build
	xhost +"local:docker@"
	mkdir -p /my/ripme-home
	mkdir -p /my/ripme
	docker run --rm -ti \
		-v /etc/passwd:/etc/passwd:ro \
		-v /etc/group:/etc/group:ro \
		-e TERM=${TERM} \
		--group-add audio \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-e DISPLAY=unix${DISPLAY} \
		--init \
		--user=`id -u`:`id -g` \
		-v /etc/hosts:/etc/hosts:ro \
		-v /my/ripme-home:${HOME} \
		-v /my/ripme:/app/rips \
		--memory 1gb \
		--shm-size 50mb \
		--cpuset-cpus 0 \
		--net host \
		ripme:local
