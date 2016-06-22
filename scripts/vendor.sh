#!/usr/bin/env bash

docker run --rm \
-v $HOME/dev/dam:/go/src/github.com/chzmnky/dam \
-w /go/src/github.com/chzmnky/dam \
golang:1.6 \
bash -c "go get github.com/Masterminds/glide && glide update"
