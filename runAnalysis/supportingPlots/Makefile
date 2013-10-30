include ../../Makefile.inc

OCT := $(OCT) --eval "addpath([HOMEDIR \"/runAnalysis/\"]);"

FFR := run3147filterFrequencyResponse
FILT := run3169filterTransfer
WIND := run3147windowTransferFunctions

all: $(FFR).eps $(FILT).eps $(WIND).eps

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

clean : 
	-rm *.eps
