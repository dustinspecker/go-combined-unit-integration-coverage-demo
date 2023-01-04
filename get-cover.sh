#!/bin/bash
set -ex

rm -rf coverage

mkdir coverage
mkdir coverage/int
mkdir coverage/unit

go test -cover  ./... -args -test.gocoverdir="$PWD/coverage/unit/"
go build -cover -o ./bin/add ./cmd/add/

GOCOVERDIR=coverage/int ./bin/add 1 3

# show coverage individually
go tool covdata percent -i=./coverage/unit
go tool covdata percent -i=./coverage/int/

# show coverage combined
go tool covdata percent -i=./coverage/int/,./coverage/unit

# create combined coverage profile
go tool covdata textfmt -i=./coverage/int/,./coverage/unit -o coverage/profile

# display combined coverage info
go tool cover -func coverage/profile
