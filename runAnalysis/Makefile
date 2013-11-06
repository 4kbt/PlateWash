include ../Makefile.inc

FILTRESULTS := $(shell ls -d -1 results/*Filter.dat )
ONLYRESULTS := $(shell ls -d -1 results/*FilterOnly.dat )

RAWRESULTS := $(FILTRESULTS) $(ONLYRESULTS)

all: results/run3147pM3FilterMerge.dat
	$(MAKE) -C supportingPlots


ANALYSISDEPS := analyzeRun.m ../calibration/ ../mlib/ ../globalConfig

#Begin STRANGE section
#This section exists to parallelize the run analysis directly. Its job is to analyze all of the 

RUNSTOBEANALYZED := runsToBeAnalyzed.dat
RUNLIST := RunList.dat
SUBMAKE := subMake.inc
DEPFILE := depList.txt

#Throwaway variables to make external shell commands prior to parsing the subMake.inc file
throwaway1 := $(shell $(HOMEDIR)/bin/genTargets.sh $(RUNSTOBEANALYZED) $(RUNLIST) )
#No dollar-sign on analysisdeps for a reason, see script
throwaway2 := $(shell $(HOMEDIR)/bin/makeMake.sh $(RUNLIST) $(SUBMAKE) $(DEPFILE) Filter.dat analyzeRun.m ANALYSISDEPS)

#include all the actual targets
include subMake.inc

#this variable contains the name of every analysis file to be built.
DEPLIST = $(shell cat $(DEPFILE))

#Test target to ensure things are working correctly.
listRuns : $(DEPLIST)
	echo $(DEPLIST)

#end STRANGE section


results/run3147pM3FilterMerge.dat : $(DEPLIST) run3147pLDAFiltermerge.sh
	./run3147pLDAFiltermerge.sh

path : 
	$(OCT) --verbose pathTest.m

clean :
	-rm results/*.dat
	$(MAKE) -C supportingPlots clean
