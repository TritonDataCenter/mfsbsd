#!/bin/sh --                                                                                                     
set -x
set -e
set -u

. /opt/sam/vmscripts/5vm_input.sh

grub-bhyve -S -m ${CONFIGPATH}/${GUEST4}/device.map -r hd0,msdos1 -c ${GUEST4_NMDM} -M ${GUEST4_MEM} chy-${GUEST4}; bhyve -A -H -P -S -c ${GUEST4_CPUS} -U ${GUEST4_UUID} -m ${GUEST4_MEM} -s 0,hostbridge -s 4,ahci-hd,${DISKPATH}/${GUEST4}/disk0  -s 6,kvirtio-net,id=${VMNIC1_ID} -l com1,${GUEST4_NMDM} -s 31,lpc chy-${GUEST4}

