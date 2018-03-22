#!/bin/sh --                                                                             


set -x
set -e
set -u

SESSION=$USER

ifconfig cc1 promisc up
kldload vmmnet || /usr/bin/true
sysctl debug.bootverbose=1
sysctl kern.msgbuf_clear=1

tmux -2 new-session -d -s $SESSION


tmux neww -t $SESSION:1 chyves tomas0 console
tmux neww -t $SESSION:2 chyves tomas1 console
tmux neww -t $SESSION:3 2vm_setup.sh
sleep 10;
tmux neww -t $SESSION:4 vmguest0.sh
sleep 10;
tmux neww -t $SESSION:5 vmguest1.sh

