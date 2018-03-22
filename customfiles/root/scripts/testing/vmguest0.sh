#!/bin/sh --                                                                                                     

set -x
set -e
set -u

. /opt/sam/vmscripts/5vm_input.sh

grub-bhyve -S -m ${CONFIGPATH}/${GUEST0}/device.map -r hd0,msdos1 -c ${GUEST0_NMDM} -M ${GUEST0_MEM} chy-${GUEST0}; bhyve -A -H -P -S -c ${GUEST0_CPUS} -U ${GUEST0_UUID} -m ${GUEST0_MEM} -s 0,hostbridge -s 4,ahci-hd,${DISKPATH}/${GUEST0}/disk0  -s 6,kvirtio-net,id=${VMNIC0_ID} -l com1,${GUEST0_NMDM} -s 31,lpc chy-${GUEST0}

