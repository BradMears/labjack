#!/bin/bash
# Start the service with AndroidStudio

export UID
export GID=`id -g`
docker compose run --rm --name labjack labjack
#docker run -i --rm --name labjack bradmears/labjack
