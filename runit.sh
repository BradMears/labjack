#!/bin/bash

export UID
export GID=`id -g`
docker compose run --rm --name labjack labjack
