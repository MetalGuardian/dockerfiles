MAKEFLAGS =+ -rR --warn-undefined-variables

.PHONY: help build run

help: ## Print help
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' ${MAKEFILE_LIST} | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Builds docker image
	docker build -t react-devtools .

run: ## Runs docker container
	docker run --rm -ti \
		-v /etc/passwd:/etc/passwd:ro \
		-v /etc/group:/etc/group:ro \
		-e TERM=${TERM} \
		--net=host \
		--init \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-e DISPLAY=unix${DISPLAY} \
		--workdir=${PWD} \
		-v ${PWD}:${PWD} \
		-v ${HOME}/.config/configstore:${HOME}/.config/configstore \
		-v ${HOME}/.cache/yarn:${HOME}/.cache/yarn \
		-v ${HOME}/.yarnrc:${HOME}/.yarnrc \
		react-devtools
