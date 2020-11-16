MAKEFLAGS =+ -rR --warn-undefined-variables

.PHONY: help build run

help:
	@echo "Available targets:"
	@echo " build		Builds docker image"
	@echo " run  		Runs docker container"

build:
	docker build -t java:local .

run: build
	mkdir -p /tmp/java-home
	docker run --rm -ti \
		-v /etc/passwd:/etc/passwd:ro \
		-v /etc/group:/etc/group:ro \
		-e TERM=${TERM} \
		--group-add audio \
		--user=`id -u`:`id -g` \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-e DISPLAY=unix${DISPLAY} \
		--device /dev/snd \
		--init \
		-v /etc/hosts:/etc/hosts:ro \
		-v /my/java-home:${HOME} \
		-v ${PWD}:${PWD} \
		--workdir=${PWD} \
		--memory 3gb \
		--shm-size 1gb \
		--cpuset-cpus 0 \
		--net host \
		java:local
