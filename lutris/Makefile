MAKEFLAGS =+ -rR --warn-undefined-variables

.PHONY: help build run

help: ## print help
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' ${MAKEFILE_LIST} | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Builds docker image
	docker build -t lutris:local .

run: build ## Runs docker container
	mkdir -p /my/home/lutris
	docker run --rm -ti \
		-v /etc/passwd:/etc/passwd:ro \
		-v /etc/group:/etc/group:ro \
		-e TERM \
		--group-add audio \
		--group-add video \
		--user=`id -u`:`id -g` \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /my/home/lutris:${HOME} \
		-e DISPLAY=unix${DISPLAY} \
		--device /dev/snd \
		--device /dev/dri \
		--init \
		-v ${PWD}:${PWD} \
		--workdir=${PWD} \
		--entrypoint bash \
		--net host \
		--security-opt=seccomp:unconfined \
		--cpus=2 \
		lutris:local

