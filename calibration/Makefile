## Torque Calibration

CALIBFILES=$(shell ls run*calFitChk.dat)

$(CALIBFILES):run3147calibFitAll.m
        octave run3147calibFitAll.m

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

