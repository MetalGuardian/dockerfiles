MAKEFLAGS =+ -rR --warn-undefined-variables

.PHONY: help build run

help: ## Print help
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' ${MAKEFILE_LIST} | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Builds docker image
	docker build -t android-emulator .

run: ## Runs docker container
	xhost +local:docker; \
	docker run --rm -ti \
		-v /etc/passwd:/etc/passwd:ro \
		-v /etc/group:/etc/group:ro \
		-e TERM=${TERM} \
		--group-add audio \
		--net=host \
		--init \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-e DISPLAY=unix${DISPLAY} \
		-v /tmp/.cache-android:/opt/android-sdk-linux/.android \
		--device /dev/snd \
		--device /dev/kvm \
		android-emulator \
		bash; \
		# /opt/android-sdk-linux/emulator/emulator -avd test -gpu off; \
	xhost -local:docker

create:
	echo no | avdmanager create avd -n test -d 8 -k "system-images;android-26;default;x86_64"
	# avdmanager create avd -n test -t android-${ANDROID_COMPILE_SDK} --abi google_apis/x86

start:
	emulator64-x86 -avd test
	# emulator64-x86 -avd test -no-window -no-audio &
	# -noaudio -no-window -gpu off -verbose -qemu -usbdevice tablet -vnc :0
