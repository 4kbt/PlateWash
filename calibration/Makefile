## Torque Calibration

include ../Makefile.inc

CALFILES := $(shell ls run*calFitChk.dat)

#The following empty assignment is meaningful. 
NOFILES := 

ifeq ($(CALFILES), $(NOFILES)) 
 CALIBFILES := 'run3147calFitChk.dat'
else
 CALIBFILES := $(CALFILES)
endif

all: run3147calFitChk.eps


$(CALIBFILES):run3147calibFitAll.m run3147calibFitCheck.m $(MLIB) $(RUNS) $(DATA)
	$(OCT) run3147calibFitAll.m

CALIBMERGEFILE=run3147calFitChkMerge.dat

$(CALIBMERGEFILE): $(CALIBFILES)
	./run3147calFitChkMerge.sh

CALIBMEANFILE=run3147calFitChkMean.dat run3147calFitChkMergeCut.dat
CALIBMEANM=run3147calFitChkMean.m

$(CALIBMEANFILE):$(CALIBMERGEFILE) $(CALIBMEANM)
	$(OCT) $(CALIBMEANM)

run3147calFitChk.eps: run3147calFitChk.gpl $(CALIBMERGEFILE) $(CALIBMEANFILE)
	$(GNU) run3147calFitChk.gpl


clean: 
	-rm *.dat 
	-rm *.eps

