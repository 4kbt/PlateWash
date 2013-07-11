include ../Makefile.inc

PREREQUISITES =  *.m $(HOMEDIR)/calibration/pressure/run2937pressEncOutput.dat $(MLIB) $(HOMEDIR)/runAnalysis/results/run3147pM3FilterMerge.dat


yukawaFit : $(PREREQUISITES)
	$(OCT)  yukawaWrapper.m

yukawaFitTest : $(PREREQUISITES)
	$(OCT) --eval 'alpha = 100;  lambda = 200e-6; injSlope =  5e-11;' yukawaWrapper.m
	$(OCT) --eval 'alpha = 0;    lambda = 200e-6; injSlope = -4e-12;' yukawaWrapper.m
	$(OCT) --eval 'alpha = -100; lambda = 200e-6; injSlope =  6e-12;' yukawaWrapper.m
	$(OCT) --eval 'alpha = 500;  lambda = 200e-6; injSlope = -1e-11;' yukawaWrapper.m
	$(OCT) --eval 'alpha = 1;    lambda = 100e-6; injSlope = -2e-12;' yukawaWrapper.m
	$(OCT) --eval 'alpha = 1;    lambda = 56e-6;  injSlope = -3e-11;' yukawaWrapper.m
	$(OCT) --eval 'alpha = -1;   lambda = 56e-6;  injSlope = -1e-11;' yukawaWrapper.m
	$(OCT) --eval 'alpha = 200;  lambda = 30e-6;  injSlope =  0e-11;' yukawaWrapper.m
	$(OCT) --eval 'alpha = 500;  lambda = 200e-6; injSlope =  1e-11;' yukawaWrapper.m

arbFit : $(PREREQUISITES)
	$(OCT) arbFitWrapper.m

arbFitTest : $(PREREQUISITES)
	$(OCT) --eval 'alpha = 100;  lambda = 200e-6; injSlope =  5e-11;' arbFitWrapper.m
	$(OCT) --eval 'alpha = 0;    lambda = 200e-6; injSlope = -4e-12;' arbFitWrapper.m
	$(OCT) --eval 'alpha = -100; lambda = 200e-6; injSlope =  6e-12;' arbFitWrapper.m
	$(OCT) --eval 'alpha = 500;  lambda = 200e-6; injSlope = -1e-11;' arbFitWrapper.m
	$(OCT) --eval 'alpha = 1;    lambda = 100e-6; injSlope = -2e-12;' arbFitWrapper.m
	$(OCT) --eval 'alpha = 1;    lambda = 56e-6;  injSlope = -3e-11;' arbFitWrapper.m
	$(OCT) --eval 'alpha = -1;   lambda = 56e-6;  injSlope = -1e-11;' arbFitWrapper.m
	$(OCT) --eval 'alpha = 200;  lambda = 30e-6;  injSlope =  0e-11;' arbFitWrapper.m
	$(OCT) --eval 'alpha = 500;  lambda = 200e-6; injSlope =  1e-11;' arbFitWrapper.m
#clean : 
#	rm *.dat
