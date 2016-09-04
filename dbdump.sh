#!/bin/bash
# calls the mysql dump for the database container, it's common task, so I made this shortcut
projectDir=$(dirname "$0")
$projectDir/manage.sh exec db mysqldump -u root -plocaldb "$@"
