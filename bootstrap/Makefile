include ../Makefile.inc

yukawaFit : run3147bootstrapYukawa.m $(HOMEDIR)/calibration/pressure/run2937pressEncOutput.dat $(MLIB) $(HOMEDIR)/runAnalysis/results/run3147pM3FilterMerge.dat run3147preFit.m
	$(OCT) run3147bootstrapYukawa.m

arbFit : run3147bootstrapArbFit.m $(HOMEDIR)/calibration/pressure/run2937pressEncOutput.dat $(MLIB) $(HOMEDIR)/runAnalysis/results/run3147pM3FilterMerge.dat run3147preFit.m
	$(OCT) run3147bootstrapArbFit.m

#clean : 
#	rm *.dat
