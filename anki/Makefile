MAKEFLAGS =+ -rR --warn-undefined-variables

.PHONY: help build run

help: ## Print help
	@echo "Available targets:"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' ${MAKEFILE_LIST} | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Builds docker image
	docker build -t anki-application .

run: ## Runs docker container
	mkdir -p ${HOME}/.local/share/Anki2
	docker run --rm -ti \
		-v /etc/passwd:/etc/passwd:ro \
		-v /etc/group:/etc/group:ro \
		-v ${HOME}/.local/share/Anki2:/data \
		-w /data \
		-e TERM \
		--group-add audio \
		--user=`id -u`:`id -g` \
		--net=host \
		--init \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-e DISPLAY=unix${DISPLAY} \
		--device /dev/snd \
		anki-application
