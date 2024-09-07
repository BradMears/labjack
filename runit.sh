#!/bin/bash
# Start the service with AndroidStudio

export UID
export GID=`id -g`
docker compose run -i --rm --name labjack labjack
