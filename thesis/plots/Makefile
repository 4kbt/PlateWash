include ../../Makefile.inc

all : lagSNR.eps lagFrequencySNR.eps pwTransferFunction.eps ForceLaw.eps ifoSim.eps run1646contactPotential.eps
	make $(PARALLEL) -C ISL

lagSNR.eps : lagSNR.gpl
	$(GNU) lagSNR.gpl

lagFrequencySNR.eps : lagFrequencySNR.gpl
	$(GNU) lagFrequencySNR.gpl

pwTransferFunction.eps : pwTransferFunction.gpl
	$(GNU) pwTransferFunction.gpl

ForceLaw.eps: 248plot.gpl
	$(GNU) 248plot.gpl

ifoSim.eps: ifoSim.gpl
	$(GNU) $<

run1646contactPotential.eps: run1646contactPotential.gpl
	$(GNU) $<

clean : 
	make -C ISL clean
	-rm *.eps
	-rm *.pdf
