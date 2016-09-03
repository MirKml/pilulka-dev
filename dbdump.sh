#!/bin/bash
projectDir=$(dirname "$0")
docker exec $($projectDir/sqlcontainerID.sh) mysqldump -u root -plocaldb "$@"
