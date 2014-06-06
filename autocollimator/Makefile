include ../Makefile.inc

FN := run3077free

all : $(FN).eps

run3077thetaPSD.dat:$(FN).m
	$(OCT) $(FN).m

$(FN).eps: $(FN).gpl run3077thetaPSD.dat
	$(GNU) $(FN).gpl

clean: 
	-rm *.eps
	-rm *.dat


