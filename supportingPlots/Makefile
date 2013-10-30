include ../Makefile.inc

#Filter transfer functions
FFR := run3147filterFrequencyResponse
$(FFR).eps: $(FFR).m $(FFR).gpl
	$(OCT) $(FFR).m
	$(GNU) $(FFR).gpl

#Filters applied to real data
FILT := run3169filterTransfer
$(FILT).eps : $(FILT).m $(FILT).gpl
	$(OCT) $(FILT).m
	$(GNU) $(FILT).gpl

#Window functions --> needs work for delays
WIND := run3147windowTransferFunctions
$(WIND).eps : $(WIND).m $(WIND).gpl
	$(OCT) $(WIND).m
	$(GNU) $(WIND).gpl

clean : 
	-rm *.eps
