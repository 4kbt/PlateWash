include ../Makefile.inc

all: results/run3147pM3FilterMerge.dat
	$(MAKE) -C supportingPlots


ANALYSISDEPS := analyzeRun.m ../calibration/ $(MLIB) $(RUNS) $(DATA) $(GLOBAL)

#This section exists to parallelize the run analysis directly. Its job is to analyze all of the 

RUNSTOBEANALYZED := runsToBeAnalyzed.cfg
RUNLIST := RunList.dat
SUBMAKE := subMake.inc
DEPFILE := depList.txt

#Throwaway variables to make external shell commands prior to parsing the subMake.inc file
throwaway1 := $(shell $(HOMEDIR)/bin/genTargets.sh $(RUNSTOBEANALYZED) $(RUNLIST) )
#No dollar-sign on analysisdeps for a reason, see script
throwaway2 := $(shell $(HOMEDIR)/bin/makeMake.sh $(RUNLIST) $(SUBMAKE) $(DEPFILE) Filter.dat analyzeRun.m ANALYSISDEPS results/run)

#include all the actual targets
include $(SUBMAKE) 

#this variable contains the name of every analysis file to be built.
DEPLIST = $(shell cat $(DEPFILE))

#Test target to ensure things are working correctly.
listRuns : 
	echo $(DEPLIST)

#end parallelization section. 


results/run3147pM3FilterMerge.dat : $(DEPLIST) run3147pLDAFiltermerge.sh $(HOMEDIR)/bin/makeMake.sh
	./run3147pLDAFiltermerge.sh

path : 
	$(OCT) --verbose pathTest.m

clean :
	-rm results/*.dat
	-rm depList.txt
	-rm RunList.dat
	$(MAKE) -C supportingPlots clean
