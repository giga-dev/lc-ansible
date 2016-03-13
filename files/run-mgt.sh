#!/bin/sh -x
. `pwd`/env.sh
nohup sh ${XAP_HOME}/bin/gs-agent.sh gsa.global.lus=${MGT_GLOBAL_LUS_CNT} gsa.lus=${MGT_LUS_CNT} gsa.global.gsm=${MGT_GLOBAL_GSM_CNT} gsa.gsm=${MGT_GSM_CNT} gsa.gsc=${MGT_GSC_CNT}