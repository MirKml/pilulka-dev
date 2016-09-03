#!/bin/bash
projectDir=$(dirname "$0")
docker exec -it $($projectDir/sqlcontainerID.sh) /bin/bash
