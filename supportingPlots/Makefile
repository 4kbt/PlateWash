include ../Makefile.inc

all : run3147filterFrequencyResponse.eps run3169filterTransfer.eps run3147windowTransferFunctions.eps

#Filter transfer functions
run3147filterFrequencyResponse.eps: run3147filterFrequencyResponse.m run3147filterFrequencyResponse.gpl
	$(OCT) run3147filterFrequencyResponse.m
	$(GNU) run3147filterFrequencyResponse.gpl

#Filters applied to real data
run3169filterTransfer.eps: run3169filterTransfer.m run3169filterTransfer.gpl
	$(OCT) run3169filterTransfer.m
	$(GNU) run3169filterTransfer.gpl

#Window functions --> needs work for delays
run3147windowTransferFunctions.eps: run3147windowTransferFunctions.m run3147windowTransferFunctions.gpl
	$(OCT)  run3147windowTransferFunctions.m
	$(GNU) run3147windowTransferFunctions.gpl

clean:
	rm *.dat
	rm *.eps

