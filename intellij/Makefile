MAKEFLAGS =+ -rR --warn-undefined-variables

.PHONY: help build run

help:
	@echo "Available targets:"
	@echo " build		Builds docker image"
	@echo " run  		Runs docker container"

build:
	docker build -t intellij:local .

up:
	docker-compose build --pull
	docker-compose up -d

start:
	docker-compose exec intellij /opt/intellij/bin/idea.sh

shell:
	docker-compose exec intellij bash

run: build
	mkdir -p /my/home/intellij
	mkdir -p ${HOME}/intellij
	docker run --rm -ti \
		-v /etc/passwd:/etc/passwd:ro \
		-v /etc/group:/etc/group:ro \
		--user=`id -u`:`id -g` \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-e DISPLAY=unix${DISPLAY} \
		--init \
		-v /my/home/intellij:${HOME} \
		-v ${HOME}/intellij:${HOME}/intellij \
		intellij:local

# shell: build
# 	mkdir -p /my/home/intellij
# 	mkdir -p ${HOME}/intellij
# 	docker run --rm -ti \
# 		-v /etc/passwd:/etc/passwd:ro \
# 		-v /etc/group:/etc/group:ro \
# 		--user=`id -u`:`id -g` \
# 		--init \
# 		-v /my/home/intellij:${HOME} \
# 		-v ${HOME}/intellij:${HOME}/intellij \
# 		intellij:local \
# 		bash
