#!/bin/sh -x
export LOOKUPLOCATORS=`sed s/,$// locators.txt`
export XAP_LOOKUP_LOCATORS=${LOOKUPLOCATORS}
export JAVA_HOME="${XAP_HOME}/../java"
export PATH="${JAVA_HOME}/bin:${PATH}"
export NIC_ADDR="#${INTERFACE_NAME}:ip#"
export XAP_NIC_ADDRESS=${NIC_ADDR}