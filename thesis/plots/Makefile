include ../../Makefile.inc

TRI := triangleExample

all : lagSNR.eps lagFrequencySNR.eps pwTransferFunction.eps ForceLaw.eps ifoSim.eps run1646contactPotential.eps $(TRI).eps
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

$(TRI).eps : $(TRI).m $(TRI).gpl
	$(OCT) $(TRI).m
	$(GNU) $(TRI).gpl

clean : 
	make -C ISL clean
	-rm *.eps
	-rm *.pdf
