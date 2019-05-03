#!/bin/bash

set -e

if [ -z "$1" -o ! -d "$1" ]; then
    echo "You must define a valid Apache version to build as parameter"
    exit 1
fi

VERSION=$1
GREEN='\033[0;32m'
NC='\033[0m' # No Color
TAG=edyan/apache:${VERSION}

cd $1

echo "Building ${TAG}"
docker build -t ${TAG} .
if [[ "$VERSION" == "2.4" ]]; then
  echo ""
  echo "${TAG} will also be tagged 'latest'"
  docker tag ${TAG} edyan/apache:latest
fi

echo ""
echo ""
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Build Done${NC}."
    echo ""
    echo "Run (with PHP) :"
    echo "  docker network create apache-test"
    echo "  docker container run -d --rm --network apache-test --name php edyan/php:latest"
    echo "  docker container run -d --rm --network apache-test --name apache${VERSION}-test-ctn -p 8080:80 ${TAG}"
    echo "  docker container exec -ti apache${VERSION}-test-ctn /bin/bash"
    echo "Once Done : "
    echo "  docker container stop apache${VERSION}-test-ctn"
    echo "  docker container stop php"
    echo "  docker network rm apache-test"
    echo ""
    echo "Or if you want to directly enter the container, then remove it : "
    echo "  docker run -ti --rm edyan_apache${VERSION}_test /bin/bash"
    echo "To push that version (and other of the same repo):"
    echo "docker push edyan/apache"
fi
