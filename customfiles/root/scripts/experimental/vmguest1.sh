#!/bin/sh --                                                                                                     
set -x
set -e
set -u

. /opt/sam/vmscripts/5vm_input.sh

grub-bhyve -S -m ${CONFIGPATH}/${GUEST1}/device.map -r hd0,msdos1 -c ${GUEST1_NMDM} -M ${GUEST1_MEM} chy-${GUEST1}; bhyve -A -H -P -S -c ${GUEST1_CPUS} -U ${GUEST1_UUID} -m ${GUEST1_MEM} -s 0,hostbridge -s 4,ahci-hd,${DISKPATH}/${GUEST1}/disk0  -s 6,kvirtio-net,id=${VMNIC1_ID} -l com1,${GUEST1_NMDM} -s 31,lpc chy-${GUEST1}

