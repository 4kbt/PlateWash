## Torque Calibration

include ../Makefile.inc

CALFILES= $(shell ls run*calFitChk.dat)
NOFILES = 'ls: cannot access *.hippo: No such file or directory'

ifeq ( $(CALIBFILES), $(NOFILES) ) 
	CALIBFILES=''
	echo 'Woo!'
else
	CALIBFILES = CALFILES
endif

all: run3147calFitChk.eps

$(MLIB) $(CALIBFILES):run3147calibFitAll.m 
	$(OCT) run3147calibFitAll.m

CALIBMERGEFILE=run3147calFitChkMerge.dat

#run3147calFitChkMerge.dat: $(CALIBFILES)
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

