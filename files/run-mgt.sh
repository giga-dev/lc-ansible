#!/bin/sh -x

GROUP=$1
GSHOME=$2
LOCATORS=`sed s/,$// locators.txt`
unzip $GSHOME/bin/advanced_scripts.zip -d $GSHOME/bin/

sed -i "1i export JAVA_HOME=$GSHOME/../java" $GSHOME/bin/setenv.sh || error_exit $? "Failed updating setenv.sh"
sed -i "1i export NIC_ADDR=\"#eth0:ip#\"" $GSHOME/bin/setenv.sh || error_exit $? "Failed updating setenv.sh"
sed -i "1i export GSA_JAVA_OPTIONS=\"-Xmx512m -Dcom.gs.agent.auto-shutdown-enabled=true -Dcom.gs.security.enabled=false -Dcom.gs.multicast.enabled=false\"" $GSHOME/bin/gs-agent.sh || error_exit $? "Failed updating gs-agent.sh"
# sed -i "1i export GSC_JAVA_OPTIONS=\"-Xmx1200m -Dcom.gigaspaces.grid.gsc.serviceLimit=5 -Dcom.gs.security.enabled=true -Dcom.gs.multicast.enabled=false\"" $GSHOME/bin/gs-agent.sh || error_exit $? "Failed updating gsc.sh"
sed -i "1i export GSM_JAVA_OPTIONS=\"-Xmx1g -Xmx1g -Dcom.gs.grid.gsm.pending-dispatch-delay=5000 -Dcom.sun.jini.reggie.initialUnicastDiscoveryPort=4242 -Dgsm.excludeGscOnFailedInstance.disabled=true -Dcom.gs.multicast.enabled=false -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -Xmn100m -XX:ParallelGCThreads=4 -XX:+HeapDumpOnOutOfMemoryError  -XX:HeapDumpPath=/tmp/oom.hprof -Dcom.gs.transport_protocol.lrmi.connect_timeout=30000\"" $GSHOME/bin/gs-agent.sh || error_exit $? "Failed updating gs-agent.sh"
sed -i "1i export LUS_JAVA_OPTIONS=\"-Xmx1g -Xmx1g -Dcom.gs.multicast.enabled=false -Dcom.sun.jini.reggie.initialUnicastDiscoveryPort=4242 -Dcom.gs.multicast.discoveryPort=4242 -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -Xmn100m -XX:ParallelGCThreads=4 -XX:+HeapDumpOnOutOfMemoryError  -XX:HeapDumpPath=/tmp/oom.hprof -Dcom.gs.transport_protocol.lrmi.connect_timeout=30000\"" $GSHOME/bin/gs-agent.sh || error_exit $? "Failed updating gs-agent.sh"
sed -i "1i export EXT_JAVA_OPTIONS=\"-Xmx5120m -Xms512m -XX:+UseConcMarkSweepGC -Dcom.sun.jini.reggie.initialUnicastDiscoveryPort=4242 -Dcom.gs.security.enabled=false -Dcom.gs.multicast.discoveryPort=4242 -Dcom.gs.multicast.enabled=false  -Dcom.gs.jini_lus.groups=$GROUP -Dcom.gs.jini_lus.locators=$LOCATORS\"" $GSHOME/bin/setenv.sh || error_exit $? "Failed updating setenv.sh"
sed -i "1i export LOOKUPGROUPS=$GROUP" $GSHOME/bin/setenv.sh || error_exit $? "Failed updating setenv.sh"
sed -i "1i export LOOKUP_GROUPS_PROP=-Dcom.gs.jini_lus.groups=$GROUP" $GSHOME/bin/setenv.sh || error_exit $? "Failed updating setenv.sh"
sed -i "1i export LOOKUPLOCATORS=$LOCATORS" $GSHOME/bin/setenv.sh || error_exit $? "Failed updating setenv.sh"
sed -i "1i export LOOKUP_LOCATORS_PROP=-Dcom.gs.jini_lus.locators=$LOCATORS" $GSHOME/bin/setenv.sh || error_exit $? "Failed updating setenv.sh"
sed -i "1i export PATH=$JAVA_HOME/bin:$PATH" $GSHOME/bin/setenv.sh || error_exit $? "Failed updating setenv.sh"

sed s/"\${JAVA_OPTIONS} -DagentId=\${AGENT_ID}"/"\${JAVA_OPTIONS} -Dcom.gigaspaces.tools.excel.verbose=true -DagentId=\${AGENT_ID} -Xloggc:\/tmp\/\$\$_gc.log -XX:+PrintClassHistogramAfterFullGC -XX:+PrintClassHistogramBeforeFullGC -XX:OnOutOfMemoryError=\"jstack -l -F  %p \> \/tmp\/\%p.thread.dump\.\`date +\%y_\%m_\%d.\%H_\%M_\%S\`\.txt\""/g $GSHOME/bin/gs.sh > $GSHOME/bin/gs.sh.backup2

cp $GSHOME/bin/gs.sh $GSHOME/bin/gs.sh.backup
cp $GSHOME/bin/gs.sh.backup2 $GSHOME/bin/gs.sh
rm $GSHOME/bin/gs.sh.backup2
chmod 755 $GSHOME/bin/gs.sh

nohup sh $GSHOME/bin/gs-agent.sh gsa.global.lus=0 gsa.lus=1 gsa.global.gsm=0 gsa.gsm=1 gsa.gsc=0
