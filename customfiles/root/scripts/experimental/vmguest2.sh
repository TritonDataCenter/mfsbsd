#!/bin/sh --                                                                                                     
set -x
set -e
set -u

. /opt/sam/vmscripts/5vm_input.sh

grub-bhyve -S -m ${CONFIGPATH}/${GUEST2}/device.map -r hd0,msdos1 -c ${GUEST2_NMDM} -M ${GUEST2_MEM} chy-${GUEST2}; bhyve -A -H -P -S -c ${GUEST2_CPUS} -U ${GUEST2_UUID} -m ${GUEST2_MEM} -s 0,hostbridge -s 4,ahci-hd,${DISKPATH}/${GUEST2}/disk0  -s 6,kvirtio-net,id=${VMNIC1_ID} -l com1,${GUEST2_NMDM} -s 31,lpc chy-${GUEST2}

