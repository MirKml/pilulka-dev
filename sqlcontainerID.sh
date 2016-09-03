#!/bin/bash
projectDir=$(dirname "$0")
$projectDir/compose.sh ps db | tail -n1 | cut -d' ' -f1
