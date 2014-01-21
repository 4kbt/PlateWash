include ../Makefile.inc

all : ifoAR.eps ifoLFSpectrum.eps


ANALYSISDEPS :=

#This section exists to parallelize the run analysis directly. Its job is to analyze all of the 

RUNSTOBEANALYZED := runsToBeAnalyzed.cfg
RUNLIST := RunList.dat
SUBMAKE := subMake.inc
DEPFILE := depList.txt
SUFFIX  := ifoTimeData.dat 

#Throwaway variables to make external shell commands prior to parsing the subMake.inc file
throwaway1 := $(shell $(HOMEDIR)/bin/genTargets.sh $(RUNSTOBEANALYZED) $(RUNLIST) )
#No dollar-sign on analysisdeps for a reason, see script
throwaway2 := $(shell $(HOMEDIR)/bin/makeMake.sh $(RUNLIST) $(SUBMAKE) $(DEPFILE) $(SUFFIX) ifoHeaderScrape.m ANALYSISDEPS trim/run)

#include all the actual targets
include $(SUBMAKE)

#this variable contains the name of every analysis file to be built.
DEPLIST = $(shell cat $(DEPFILE))

#Test target to ensure things are working correctly.
listRuns : 
	echo $(DEPLIST)

#end parallelization section. 

#$@ is the target.
trim/ifoMerge.dat : $(DEPLIST) $(MLIB)
	-rm $@
	cat $(DEPLIST) >> $@
	$(HOMEDIR)/bin/commentStrip.sh $@
	$(HOMEDIR)/bin/whiteLineStrip.sh $@
	sed -i -n '0~50p' $@

ifoAR.eps : ifoAR.gpl trim/ifoMerge.dat
	$(GNU) ifoAR.gpl

ifoLFSpectrum.eps : ifoLFSpectrum.m ifoLFSpectrum.gpl $(MLIB)
	$(OCT) ifoLFSpectrum.m
	$(GNU) ifoLFSpectrum.gpl

clean:
	-rm trim/*
	-rm ifoAR.eps

