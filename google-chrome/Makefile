MAKEFLAGS =+ -rR --warn-undefined-variables

.PHONY: help build run

help:
	@echo "Available targets:"
	@echo " build		Builds docker image"
	@echo " run  		Runs docker container"

build:
	docker build -t google-chrome:local .

run: build
	mkdir -p /tmp/chrome-home
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
		-v /tmp/chrome-home:${HOME} \
		--memory 2gb \
		--cpuset-cpus 0 \
		--net host \
		google-chrome:local
