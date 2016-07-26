#!/usr/bin/env bash
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/env-setup.sh"

echo "docker executing \"go $@\" on"
echo "image:" ${GO_IMAGE};
echo "app:" ${APP_NAME};
echo "version:" ${VERSION};
echo "--------------------------"
docker run --rm -v "$GOPATH":/usr/src -w /usr/src "$GO_IMAGE" go "$@"