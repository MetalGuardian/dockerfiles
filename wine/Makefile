MAKEFLAGS =+ -rR --warn-undefined-variables

.PHONY: help build run

help: ## print help
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' ${MAKEFILE_LIST} | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Builds docker image
	docker build -t wine:local .

run: build ## Runs docker container
	mkdir -p ~/docker/wine
	docker run --rm -ti \
		-v /etc/passwd:/etc/passwd:ro \
		-v /etc/group:/etc/group:ro \
		-e TERM \
		--group-add audio \
		--user=`id -u`:`id -g` \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v ${HOME}/docker/wine:${HOME} \
		-e DISPLAY=unix${DISPLAY} \
		--device /dev/snd \
		--init \
		-v ${PWD}:${PWD} \
		--workdir=${PWD} \
		--entrypoint bash \
		--net host \
		wine:local
