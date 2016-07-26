#!/usr/bin/env bash
#setup default go-image and app-name
GO_IMAGE="golang:1.6"
APP_NAME="app"
VERSION="0.0.1"

if
	[ -n "$1" ] &&
	[ -e $1 ] &&
	[ -d $1 ]
	[ -f $1/env-setup ]
then
	eval `cat $1/env-setup`
fi

if
	[ -e .semver ] &&
	[ -f .semver ]
then
	VERSION=`cat .semver`
fi