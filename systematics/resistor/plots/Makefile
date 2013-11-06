include ../../../Makefile.inc

RP := resistorPlot

$(RP).eps: $(RP).gpl resistorMerge.dat capacitorMerge.dat
	$(GNU) $(RP).gpl

DEPS := $(shell ls -1 longStroke3*.dat)

resistorMerge.dat : resistorMerge.sh $(DEPS)
	./resistorMerge.sh

capacitorMerge.dat : capacitorMerge.sh $(DEPS)
	echo $(DEPS)
	./capacitorMerge.sh

clean:
	-rm *.eps 
