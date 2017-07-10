#!/bin/bash

set -e

if [ -z "$1" -o ! -d "$1" ]; then
    echo "You must define a valid Apache version to build as parameter"
    exit 1
fi
cd $1
docker build -t "inet_apache_test" .
echo ""
echo ""
if [ $? -eq 0 ]; then
    echo -e "\x1b[1;32mBuild Done. To run it: \e[0m"
    echo '  docker run -d --rm --hostname "apache-test-ctn" --name "apache-test-ctn" inet_apache_test'
    echo '  docker exec -i -t "apache-test-ctn" /bin/bash'
    echo "Once Done : "
    echo '  docker stop "apache-test-ctn"'
fi
