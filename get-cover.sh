#!/bin/bash
set -ex

rm -rf coverage

mkdir coverage
mkdir coverage/int
mkdir coverage/unit

go test -cover  ./... -args -test.gocoverdir="$PWD/coverage/unit/"
go build -cover -o ./bin/add ./cmd/add/

# demonstrate running binary twice and creating multiple code coverage reports for integration tests
# success
GOCOVERDIR=coverage/int ./bin/add 1 3

# will fail because no args provided
if GOCOVERDIR=coverage/int ./bin/add ; then
  echo "add should exit with non-zero exit code when no args provided"
  exit 1
fi

# show coverage individually
go tool covdata percent -i=./coverage/unit
go tool covdata percent -i=./coverage/int/

# show coverage combined
go tool covdata percent -i=./coverage/int/,./coverage/unit

# create combined coverage profile
go tool covdata textfmt -i=./coverage/int/,./coverage/unit -o coverage/profile

# display combined coverage info
go tool cover -func coverage/profile
