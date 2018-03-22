#!/bin/sh --                                                                                                     
set -x
set -e
set -u

. /opt/sam/vmscripts/5vm_input.sh

grub-bhyve -S -m ${CONFIGPATH}/${GUEST3}/device.map -r hd0,msdos1 -c ${GUEST3_NMDM} -M ${GUEST3_MEM} chy-${GUEST3}; bhyve -A -H -P -S -c ${GUEST3_CPUS} -U ${GUEST3_UUID} -m ${GUEST3_MEM} -s 0,hostbridge -s 4,ahci-hd,${DISKPATH}/${GUEST3}/disk0  -s 6,kvirtio-net,id=${VMNIC1_ID} -l com1,${GUEST3_NMDM} -s 31,lpc chy-${GUEST3}

