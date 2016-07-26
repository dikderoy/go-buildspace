#!/usr/bin/env bash
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/env-setup.sh"

echo "docker executing \"go get $@\" on"
echo "image:" ${GO_IMAGE};
echo "app:" ${APP_NAME};
echo "version:" ${VERSION};
echo "--------------------------"
## install packages
docker run --rm -v "$GOPATH":/usr/libs -e GOPATH=/usr/libs "$GO_IMAGE" go get -v "$@"