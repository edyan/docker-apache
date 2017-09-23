#!/bin/bash

set -e

if [ -z "$1" -o ! -d "$1" ]; then
    echo "You must define a valid Apache version to build as parameter"
    exit 1
fi
cd $1
docker build -t "apache_test" .
echo ""
echo ""
echo -e "\x1b[1;32mBuild Done. To run it: \e[0m"
echo '  docker run --rm --hostname "apache-test-ctn" --name "apache-test-ctn" apache_test'
echo ""
echo "Or if you want to directly enter the container to run some commands: "
echo '  docker run -ti --rm apache_test /bin/sh'


