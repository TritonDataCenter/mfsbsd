#!/bin/sh --
#
# Installs vpc(8) into ${PREFIX}/bin
#
# vpc_install.sh
#
# example: vpc_install.sh
#

set -e
set -u

/usr/local/bin/go get github.com/joyent/freebsd-vpc/cmd/vpc
/usr/bin/install -g wheel -o root -m 0755 $(/usr/local/bin/go env GOPATH)/bin/vpc /usr/local/bin
