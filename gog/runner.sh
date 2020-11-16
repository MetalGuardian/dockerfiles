#!/bin/bash -u
#
# Copyright 2020 Misha Brukman
# SPDX-License-Identifier: Apache-2.0
# https://misha.brukman.net/blog/2020/04/running-decade-old-games-in-containers/

declare -r DOCKER_IMAGE="game-image"
declare -r DOCKER_FLAGS="${DOCKER_FLAGS:-}"

# Build the Docker container.
build() {
  docker build -t "${DOCKER_IMAGE}" .
}

# Run the game installer.
install() {
  docker run \
      -it \
      -v "$(pwd)/source:/opt/game/source:ro" \
      -v "$(pwd)/install:/opt/game/install:rw" \
      --network none \
      --workdir "/opt/game/source" \
      ${DOCKER_FLAGS} \
      "${DOCKER_IMAGE}" \
      "${INSTALL_CMD:-./gog_botanicula_2.0.0.2.sh}"
}

# Run the container as if for installation, but substitute an interactive
# shell instead of running the game installer directly.
install-debug() {
  env INSTALL_CMD="/bin/bash" "$0" install
}

play() {
  docker run \
      -it \
      -v "$(pwd)/install:/opt/game/install:rw" \
      -v "$(pwd)/home:/home/user:rw" \
      -v "${HOME}/.Xauthority:/home/user/.Xauthority:rw" \
      -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
      -v "${XDG_RUNTIME_DIR}:/run/user/1000:rw" \
      --device /dev/snd \
      --group-add=audio \
      --env=DISPLAY \
      --env=XDG_RUNTIME_DIR=/run/user/1000 \
      --network none \
      --workdir "/opt/game/install" \
      ${DOCKER_FLAGS} \
      "${DOCKER_IMAGE}" \
      "${PLAY_CMD:-./start.sh}"
}

# Run the container as if for playing, but substitute an interactive shell
# instead of running the game directly.
play-debug() {
  env PLAY_CMD="/bin/bash" "$0" play
}

# This is where we should do some error checking and provide a useful error
# message if the user provides a command other than `build` or `install`, but
# for brevity, we're just running the provided command directly.
"$1"
