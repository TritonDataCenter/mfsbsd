#!/bin/sh --                                                                             


set -x
set -e
set -u

ifconfig cc0 promisc up
kldload vmmnet || /usr/bin/true
sysctl debug.bootverbose=1
sysctl kern.msgbuf_clear=1
2vm_setup.sh
vmguest0.sh
