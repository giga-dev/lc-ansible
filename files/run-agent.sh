#!/bin/sh -x
. `pwd`/env.sh
nohup sh ${XAP_HOME}/bin/gs-agent.sh gsa.global.lus=${AGT_GLOBAL_LUS_CNT} gsa.lus=${AGT_LUS_CNT} gsa.global.gsm=${AGT_GLOBAL_GSM_CNT} gsa.gsm=${AGT_GSM_CNT} gsa.gsc=${AGT_GSC_CNT}
