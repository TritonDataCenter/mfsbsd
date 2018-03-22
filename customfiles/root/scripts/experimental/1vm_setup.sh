#!/bin/sh --

set -x
set -e
set -u

. $HOME/vmscripts/1vm_input.sh

kldload vmm vmmnet nmdm vpc || true

vpc switch create --switch-id=${VPCSW0_ID} --vni=${VNI}

vpc vmnic create --vmnic-id=${VMNIC0_ID}
vpc switch port add --switch-id=${VPCSW0_ID} --port-id=${VPCP0_ID}
vpc switch port connect --port-id=${VPCP0_ID} --interface-id=${VMNIC0_ID}

vpc switch port add --switch-id=${VPCSW0_ID} --port-id=${UPLINK_PORT_ID} --uplink --l2-name=${UPLINK_IF} --ethlink-id=${ETHLINK0_ID}

vpc vmnic get --vmnic-id=${VMNIC0_ID}

vpc list
