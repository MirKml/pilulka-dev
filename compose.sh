#!/bin/bash
projectDir=$(dirname "$0")
export COMPOSE_PROJECT_NAME=pilulka
docker-compose -f $projectDir/docker-compose.yml "$@"
