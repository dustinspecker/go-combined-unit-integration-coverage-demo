# combined-coverage-demo

> Demonstrate combining code coverage from unit tests and integrations into a single profile.

## Purpose

[Go 1.20](https://go.dev/testing/coverage/) adds support for collecting code coverage during integration tests by creating binaries ready to collect coverage.

This [demo](get-cover.sh) shows the following:
1. Collecting code coverage for unit tests in binary format instead of traditional text format
1. Building a binary ready to collect coverage
1. Executing the binary in a successful manner
1. Executing the binary in a manner that will take a failure path
1. Showing the coverage from unit tests alone
1. Showing the coverage from integration tests alone
1. Showing the combined coverage of unit tests and integration tests
1. Converting binary coverage report to text format
1. Displaying the combined coverage using the text format

Steps using the binary coverage report using `go tool covdata`, while steps
consuming the text format use `go tool cover`. Both of these can be seen in [get-cover.sh](get-cover.sh).

## Usage

1. Install Go 1.20 RC2 or newer
1. Run `./get-cover.sh`
