MAKEFLAGS =+ -rR --warn-undefined-variables

.PHONY: help build run

help: ## Print help
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' ${MAKEFILE_LIST} | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Builds docker image
	docker build -t react-native .

run: ## Runs docker container
	docker run --rm -ti \
		-v /etc/passwd:/etc/passwd:ro \
		-v /etc/group:/etc/group:ro \
		--net=host \
		--init \
		--user=`id -u`:`id -g` \
		-e TERM \
		--entrypoint bash \
		react-native
