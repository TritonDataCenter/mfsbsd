#!/bin/sh --

set -x
set -e
set -u

. /root/scripts/testing/A240227X7700430/input.sh

if [ -z "$1" ]; then
	printf "error: Please specify the VM ID\n"
	exit 1
fi
ID=$1

eval VMNAME="\${GUEST${ID}_NAME}"
eval NMDM_DEV="\${GUEST${ID}_NMDM}"
eval MEM="\${GUEST${ID}_MEM}"
eval CPUS="\${GUEST${ID}_CPUS}"
eval VMID="\${GUEST${ID}_UUID}"
eval VMNIC_ID="\${VMNIC${ID}_ID}"

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
