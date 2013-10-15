include ../../Makefile.inc

all : lagSNR.eps lagFrequencySNR.eps pwTransferFunction.eps

lagSNR.eps : lagSNR.gpl
	$(GNU) lagSNR.gpl

lagFrequencySNR.eps : lagFrequencySNR.gpl
	$(GNU) lagFrequencySNR.gpl

pwTransferFunction.eps : pwTransferFunction.gpl
	$(GNU) pwTransferFunction.gpl

clean : 
	-rm *.eps
	-rm *.pdf
