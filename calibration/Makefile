## Torque Calibration
include ../Makefile.inc

everything : all 
	$(MAKE) -C pressure

#Parallelized make! Woohoo!
#Inspiration here:
#http://stackoverflow.com/questions/1490949/how-to-write-loop-in-makefile

NUMBERS := $(shell cat calibRuns.cfg)
PREF := $(addprefix run,${NUMBERS})
CALIBFILES :=$(addsuffix calFitChk.dat,${PREF})

#There's a try/catch in calibfitcheck that should be removed. Keeping for continuity.
${CALIBFILES} : run%calFitChk.dat : calibRuns.cfg run3147calibFitCheck.m
	$(OCT) --eval "nameCtr=$*" run3147calibFitCheck.m

CALFILES := $(shell ls run*calFitChk.dat)


all: run3147calFitChk.eps

CALIBMERGEFILE := run3147calFitChkMerge.dat

$(CALIBMERGEFILE): $(CALIBFILES)
	./run3147calFitChkMerge.sh

CALIBMEANFILE :=run3147calFitChkMean.dat run3147calFitChkMergeCut.dat
CALIBMEANM :=run3147calFitChkMean.m

$(CALIBMEANFILE):$(CALIBMERGEFILE) $(CALIBMEANM)
	$(OCT) $(CALIBMEANM)

run3147calFitChk.eps: run3147calFitChk.gpl $(CALIBMERGEFILE) $(CALIBMEANFILE)
	$(GNU) run3147calFitChk.gpl


clean: 
	-rm *.dat 
	-rm *.eps

