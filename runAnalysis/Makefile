include ../Makefile.inc

all: results/run3147pM3FilterMerge.dat results/run3147pM3iFilterMerge.dat
	$(MAKE) $(PARALLEL) -C supportingPlots


ANALYSISDEPS := analyzeRun.m ../calibration/ $(MLIB) $(RUNS) $(DATA) $(GLOBAL)

#This section exists to parallelize the run analysis directly. Its job is to analyze all of the 

RUNSTOBEANALYZED := runsToBeAnalyzed.cfg
RUNLIST := RunList.dat
SUBMAKE := subMake.inc
DEPFILE := depList.txt
SUFFIX  := Filter.dat

#Throwaway variables to make external shell commands prior to parsing the subMake.inc file
throwaway1 := $(shell $(HOMEDIR)/bin/genTargets.sh $(RUNSTOBEANALYZED) $(RUNLIST) )
#No dollar-sign on analysisdeps for a reason, see script
throwaway2 := $(shell $(HOMEDIR)/bin/makeMake.sh $(RUNLIST) $(SUBMAKE) $(DEPFILE) $(SUFFIX) analyzeRun.m ANALYSISDEPS results/run)

#include all the actual targets
include $(SUBMAKE) 

#this variable contains the name of every analysis file to be built.
DEPLIST = $(shell cat $(DEPFILE))

#Test target to ensure things are working correctly.
listRuns : 
	echo $(DEPLIST)

#end parallelization section. 


#Begin ifo parallelization
IRUNSTOBEANALYZED := iforunsToBeAnalyzed.cfg
IRUNLIST := iRunList.dat
ISUBMAKE := isubMake.inc
IDEPFILE := idepList.txt
ISUFFIX  := iFilter.dat

#Throwaway variables to make external shell commands prior to parsing the subMake.inc file
ithrowaway1 := $(shell $(HOMEDIR)/bin/genTargets.sh $(IRUNSTOBEANALYZED) $(IRUNLIST) )
#No dollar-sign on analysisdeps for a reason, see script
ithrowaway2 := $(shell $(HOMEDIR)/bin/makeMake.sh $(IRUNLIST) $(ISUBMAKE) $(IDEPFILE) $(ISUFFIX) ianalyzeRun.m ANALYSISDEPS results/run)

#include all the actual targets
include $(ISUBMAKE) 

#this variable contains the name of every analysis file to be built.
IDEPLIST = $(shell cat $(IDEPFILE))

#Test target to ensure things are working correctly.
ilistRuns : 
	echo $(IDEPLIST)

#end parallelization section. 




#PW analysis
results/run3147pM3FilterMerge.dat : $(DEPLIST) pLDAFilterMerge.sh $(HOMEDIR)/bin/makeMake.sh $(HOMEDIR)/extracted/*.tex
	./pLDAFilterMerge.sh
	wc -l results/run3147pM3FilterMerge.dat | awk '{print $$1}' > ../extracted/numberOfCuts.tex
	$(OCT) --eval "run3147FixedParameters"
	$(HOMEDIR)/bin/mathify.sh $(HOMEDIR)/extracted/*.tex
	cat $(HOMEDIR)/extracted/calibCutLength.tex\
	    $(HOMEDIR)/extracted/TheoSampleTimeNoSI.tex\
	    $(HOMEDIR)/extracted/numberOfCuts.tex |\
	     sed 's/\$$/\t/' | tr -d '\n' | \
	     awk '{print $$1*$$2*$$3}' > $(HOMEDIR)/extracted/totalAcceptedSeconds.tex


#IFO Analysis
results/run3147pM3iFilterMerge.dat : $(IDEPLIST) pLDAiFilterMerge.sh $(HOMEDIR)/bin/makeMake.sh $(HOMEDIR)/extracted/*.tex
	./pLDAiFilterMerge.sh
	wc -l results/run3147pM3iFilterMerge.dat | awk '{print $$1}' > ../extracted/numberOfIFOCuts.tex
	$(OCT) --eval "run3147FixedParameters"
	$(HOMEDIR)/bin/mathify.sh $(HOMEDIR)/extracted/*.tex


snippetPlot.eps : snippetPlot.gpl results/run3147pM3FilterMerge.dat
	$(GNU) snippetPlot.gpl

path : 
	$(OCT) --verbose pathTest.m

clean :
	-rm results/*.dat
	-rm depList.txt
	-rm RunList.dat
	$(MAKE) -C supportingPlots clean
