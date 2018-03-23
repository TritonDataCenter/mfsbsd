#!/bin/sh --

set -x
set -e
set -u

. /root/scripts/testing/A240227X7700430/input.sh

vpc switch create --switch-id=${VPCSW0_ID} --vni=${VNI}

# Generated via:
#
# for i in `seq 0 19`; do printf 'vpc vmnic create --vmnic-id=${VMNIC%d_ID}\nvpc switch port add --switch-id=${VPCSW0_ID} --port-id=${VPCP%d_ID}\nvpc switch port connect --port-id=${VPCP%d_ID} --interface-id=${VMNIC%d_ID}\n\n' $i $i $i $i; done

vpc vmnic create --vmnic-id=${VMNIC0_ID}
vpc switch port add --switch-id=${VPCSW0_ID} --port-id=${VPCP0_ID}
vpc switch port connect --port-id=${VPCP0_ID} --interface-id=${VMNIC0_ID}

vpc vmnic create --vmnic-id=${VMNIC1_ID}
vpc switch port add --switch-id=${VPCSW0_ID} --port-id=${VPCP1_ID}
vpc switch port connect --port-id=${VPCP1_ID} --interface-id=${VMNIC1_ID}

vpc vmnic create --vmnic-id=${VMNIC2_ID}
vpc switch port add --switch-id=${VPCSW0_ID} --port-id=${VPCP2_ID}
vpc switch port connect --port-id=${VPCP2_ID} --interface-id=${VMNIC2_ID}

vpc vmnic create --vmnic-id=${VMNIC3_ID}
vpc switch port add --switch-id=${VPCSW0_ID} --port-id=${VPCP3_ID}
vpc switch port connect --port-id=${VPCP3_ID} --interface-id=${VMNIC3_ID}

vpc vmnic create --vmnic-id=${VMNIC4_ID}
vpc switch port add --switch-id=${VPCSW0_ID} --port-id=${VPCP4_ID}
vpc switch port connect --port-id=${VPCP4_ID} --interface-id=${VMNIC4_ID}

vpc vmnic create --vmnic-id=${VMNIC5_ID}
vpc switch port add --switch-id=${VPCSW0_ID} --port-id=${VPCP5_ID}
vpc switch port connect --port-id=${VPCP5_ID} --interface-id=${VMNIC5_ID}

vpc vmnic create --vmnic-id=${VMNIC6_ID}
vpc switch port add --switch-id=${VPCSW0_ID} --port-id=${VPCP6_ID}
vpc switch port connect --port-id=${VPCP6_ID} --interface-id=${VMNIC6_ID}

vpc vmnic create --vmnic-id=${VMNIC7_ID}
vpc switch port add --switch-id=${VPCSW0_ID} --port-id=${VPCP7_ID}
vpc switch port connect --port-id=${VPCP7_ID} --interface-id=${VMNIC7_ID}

vpc vmnic create --vmnic-id=${VMNIC8_ID}
vpc switch port add --switch-id=${VPCSW0_ID} --port-id=${VPCP8_ID}
vpc switch port connect --port-id=${VPCP8_ID} --interface-id=${VMNIC8_ID}

vpc vmnic create --vmnic-id=${VMNIC9_ID}
vpc switch port add --switch-id=${VPCSW0_ID} --port-id=${VPCP9_ID}
vpc switch port connect --port-id=${VPCP9_ID} --interface-id=${VMNIC9_ID}

vpc vmnic create --vmnic-id=${VMNIC10_ID}
vpc switch port add --switch-id=${VPCSW0_ID} --port-id=${VPCP10_ID}
vpc switch port connect --port-id=${VPCP10_ID} --interface-id=${VMNIC10_ID}

vpc vmnic create --vmnic-id=${VMNIC11_ID}
vpc switch port add --switch-id=${VPCSW0_ID} --port-id=${VPCP11_ID}
vpc switch port connect --port-id=${VPCP11_ID} --interface-id=${VMNIC11_ID}

vpc vmnic create --vmnic-id=${VMNIC12_ID}
vpc switch port add --switch-id=${VPCSW0_ID} --port-id=${VPCP12_ID}
vpc switch port connect --port-id=${VPCP12_ID} --interface-id=${VMNIC12_ID}

vpc vmnic create --vmnic-id=${VMNIC13_ID}
vpc switch port add --switch-id=${VPCSW0_ID} --port-id=${VPCP13_ID}
vpc switch port connect --port-id=${VPCP13_ID} --interface-id=${VMNIC13_ID}

vpc vmnic create --vmnic-id=${VMNIC14_ID}
vpc switch port add --switch-id=${VPCSW0_ID} --port-id=${VPCP14_ID}
vpc switch port connect --port-id=${VPCP14_ID} --interface-id=${VMNIC14_ID}

vpc vmnic create --vmnic-id=${VMNIC15_ID}
vpc switch port add --switch-id=${VPCSW0_ID} --port-id=${VPCP15_ID}
vpc switch port connect --port-id=${VPCP15_ID} --interface-id=${VMNIC15_ID}

vpc vmnic create --vmnic-id=${VMNIC16_ID}
vpc switch port add --switch-id=${VPCSW0_ID} --port-id=${VPCP16_ID}
vpc switch port connect --port-id=${VPCP16_ID} --interface-id=${VMNIC16_ID}

vpc vmnic create --vmnic-id=${VMNIC17_ID}
vpc switch port add --switch-id=${VPCSW0_ID} --port-id=${VPCP17_ID}
vpc switch port connect --port-id=${VPCP17_ID} --interface-id=${VMNIC17_ID}

vpc vmnic create --vmnic-id=${VMNIC18_ID}
vpc switch port add --switch-id=${VPCSW0_ID} --port-id=${VPCP18_ID}
vpc switch port connect --port-id=${VPCP18_ID} --interface-id=${VMNIC18_ID}

vpc vmnic create --vmnic-id=${VMNIC19_ID}
vpc switch port add --switch-id=${VPCSW0_ID} --port-id=${VPCP19_ID}
vpc switch port connect --port-id=${VPCP19_ID} --interface-id=${VMNIC19_ID}


vpc switch port add --switch-id=${VPCSW0_ID} --port-id=${UPLINK_PORT_ID} --uplink --l2-name=${UPLINK_IF} --ethlink-id=${ETHLINK0_ID}

# for i in `seq 0 19`; do printf 'vpc vmnic get --vmnic-id=${VMNIC%d_ID}\n' $i; done
vpc vmnic get --vmnic-id=${VMNIC0_ID}
vpc vmnic get --vmnic-id=${VMNIC1_ID}
vpc vmnic get --vmnic-id=${VMNIC2_ID}
vpc vmnic get --vmnic-id=${VMNIC3_ID}
vpc vmnic get --vmnic-id=${VMNIC4_ID}
vpc vmnic get --vmnic-id=${VMNIC5_ID}
vpc vmnic get --vmnic-id=${VMNIC6_ID}
vpc vmnic get --vmnic-id=${VMNIC7_ID}
vpc vmnic get --vmnic-id=${VMNIC8_ID}
vpc vmnic get --vmnic-id=${VMNIC9_ID}
vpc vmnic get --vmnic-id=${VMNIC10_ID}
vpc vmnic get --vmnic-id=${VMNIC11_ID}
vpc vmnic get --vmnic-id=${VMNIC12_ID}
vpc vmnic get --vmnic-id=${VMNIC13_ID}
vpc vmnic get --vmnic-id=${VMNIC14_ID}
vpc vmnic get --vmnic-id=${VMNIC15_ID}
vpc vmnic get --vmnic-id=${VMNIC16_ID}
vpc vmnic get --vmnic-id=${VMNIC17_ID}
vpc vmnic get --vmnic-id=${VMNIC18_ID}
vpc vmnic get --vmnic-id=${VMNIC19_ID}

vpc list
