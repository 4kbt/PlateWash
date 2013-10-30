include ../../Makefile.inc

OCT := $(OCT) --eval "addpath([HOMEDIR \"/runAnalysis/\"]);"
OCT := $(OCT) --eval "addpath([HOMEDIR \"/calibration/pressure/\"]);"

FFR := run3147filterFrequencyResponse
FILT := run3169filterTransfer
WIND := run3147windowTransferFunctions
LAG20:= run3220torqueLag

all: $(FFR).eps $(FILT).eps $(WIND).eps $(LAG20).eps

#Filter transfer functions
$(FFR).eps: $(FFR).m $(FFR).gpl
	$(OCT) $(FFR).m
	$(GNU) $(FFR).gpl

#Filters applied to real data
$(FILT).eps : $(FILT).m $(FILT).gpl
	$(OCT) $(FILT).m
	$(GNU) $(FILT).gpl

#Window functions --> needs work for delays
$(WIND).eps : $(WIND).m $(WIND).gpl
	$(OCT) $(WIND).m
	$(GNU) $(WIND).gpl

#Run3220 torque lag
$(LAG20).eps : $(LAG20).m $(LAG20).gpl
	$(OCT) $(LAG20).m
	$(GNU) $(LAG20).gpl

clean : 
	-rm *.eps
	-rm *.dat
