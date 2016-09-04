#!/bin/bash
projectDir=$(dirname "$0")
$projectDir/manage.sh exec db mysqldump -u root -plocaldb "$@"
