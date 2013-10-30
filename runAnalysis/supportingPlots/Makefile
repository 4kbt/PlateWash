include ../../Makefile.inc

OCT := $(OCT) --eval "addpath([HOMEDIR \"/runAnalysis/\"]);"
OCT := $(OCT) --eval "addpath([HOMEDIR \"/calibration/pressure/\"]);"

FFR := run3147filterFrequencyResponse
FILT := run3169filterTransfer
WIND := run3147windowTransferFunctions
LAG20:= run3220torqueLag
LAG24:= run3224torqueLag
LAG69:= run3169lags

all: $(FFR).eps $(FILT).eps $(WIND).eps $(LAG20).eps $(LAG24).eps $(LAG69).eps

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

#Run3224 torque lag
$(LAG24).eps : $(LAG24).m $(LAG24).gpl
	$(OCT) $(LAG24).m
	$(GNU) $(LAG24).gpl

#Run3169 lags
$(LAG69).eps : $(LAG69).m $(LAG69).gpl
	$(OCT) $(LAG69).m
	$(GNU) $(LAG69).gpl


clean : 
	-rm *.eps
	-rm *.dat
