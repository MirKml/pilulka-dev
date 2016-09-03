#!/bin/bash
projectDir=$(dirname "$0")

usage() {
cat << EOF
build the image for the service
Usage: ${0##*/} imageName
Possible image names: apache, phpMyAdmin, ipilulka.cz, edi, all
If 'all' is passed, all images are built.
EOF
}

buildApache() {
    docker build -t pilulka:php5.6-apache $projectDir/php5.6-apache
}

buildPhpMyAdmin() {
    docker build -t pilulka:phpMyAdmin $projectDir/phpMyAdmin
}

buildIpilulkacz() {
    docker build -t pilulka:ipilulka.cz $projectDir/ipilulka.cz 
}

buildEdi() {
    docker build -t pilulka:edi $projectDir/edi
}

case "$1" in
    apache)
        buildApache
        exit 0;
        ;;
    phpMyAdmin)
        buildPhpMyAdmin
        exit 0;
        ;;
    ipilulka.cz)
        buildIpilulkacz
        exit 0;
        ;;
    edi)
        buildEdi
        exit 0;
				;;
    all)
        buildApache
        buildPhpMyAdmin
        buildIpilulkacz
        exit 0;
        ;;
    *)
        usage
        exit 0;
        ;;
esac

# for vim modeline: (do not edit)
# vim: set ts=4 sw=4 et
