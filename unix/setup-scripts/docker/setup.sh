#!/bin/sh

function install_docker() {
	DOCKER=$(which docker)

  if [ -z "$DOCKER" ]; then
		sudo apt install docker
  else
    docker version
  fi
}
