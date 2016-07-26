#!/usr/bin/env bash
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/env-setup.sh"

echo "image:" ${GO_IMAGE};
echo "app:" ${APP_NAME};
echo "version:" ${VERSION};

rm ./build/*
docker run --rm \
	-v "$GOPATH":/usr/gopath \
	-e GOPATH=/usr/gopath \
	-v $PWD:/usr/src/app \
	-w /usr/src/app \
	"$GO_IMAGE" \
	go build -v \
	-o ./build/"$APP_NAME-$VERSION";