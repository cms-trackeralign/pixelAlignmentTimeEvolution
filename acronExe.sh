#!/bin/bash
# acrontab -e
# enter: 0 6 * * * /afs/cern.ch/user/k/kiesel/alignment/timeEvolution/acronExe.sh

logFile=/afs/cern.ch/user/k/kiesel/alignment/timeEvolution/acron.log
echo >> $logFile 2>&1
date >> $logFile 2>&1
export SCRAM_ARCH=slc6_amd64_gcc453 >> $logFile 2>&1
export VO_CMS_SW_DIR=/cvmfs/cms.cern.ch >> $logFile 2>&1
source $VO_CMS_SW_DIR/cmsset_default.sh >> $logFile 2>&1

cd /cvmfs/cms.cern.ch/slc6_amd64_gcc530/cms/cmssw/CMSSW_9_2_0 >> $logFile 2>&1
eval `scramv1 runtime -sh` >> $logFile 2>&1
cd /afs/cern.ch/user/k/kiesel/alignment/timeEvolution >> $logFile 2>&1
python makePlots.py >> $logFile 2>&1

