#!/bin/sh --

set -x
set -e
set -u

. /root/scripts/testing/3Q5WMK2/input.sh

VMNAME=${GUEST0_NAME}
NMDM_DEV=${GUEST0_NMDM}
MEM=${GUEST0_MEM}
CPUS=${GUEST0_CPUS}
VMID=${GUEST0_UUID}
VMNIC_ID=${VMNIC0_ID}

grub-bhyve -S \
           -m ${CONFIGPATH}/${VMNAME}/device.map \
           -r hd0,msdos1 \
           -c ${NMDM_DEV} \
           -M ${MEM} \
           chy-${VMNAME}

bhyve -A -H -P -S \
      -c ${CPUS} \
      -U ${VMID} \
      -m ${MEM} \
      -s 0,hostbridge \
      -s 4,ahci-hd,${DISKPATH}/${VMNAME}/disk0 \
      -s 6,kvirtio-net,id=${VMNIC_ID} \
      -l com1,${NMDM_DEV} \
      -s 31,lpc \
      chy-${VMNAME}
