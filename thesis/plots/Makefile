include ../../Makefile.inc

all : lagSNR.eps lagFrequencySNR.eps pwTransferFunction.eps
	make $(PARALLEL) -C ISL

lagSNR.eps : lagSNR.gpl
	$(GNU) lagSNR.gpl

lagFrequencySNR.eps : lagFrequencySNR.gpl
	$(GNU) lagFrequencySNR.gpl

pwTransferFunction.eps : pwTransferFunction.gpl
	$(GNU) pwTransferFunction.gpl

ForceLaw.eps: 248plot.gpl
	$(GNU) 248plot.gpl

clean : 
	make -C ISL clean
	-rm *.eps
	-rm *.pdf
