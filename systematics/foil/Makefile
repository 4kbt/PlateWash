include ../../Makefile.inc

all : foilTension.m torqueConv.dat
	$(OCT) foilTension.m


TORQUECONV := $(HOMEDIR)/extracted/translationTorqueFit.tex
torqueConv.dat : $(TORQUECONV)
	$(HOMEDIR)/bin/texErrToVec.sh $(TORQUECONV) > torqueConv.dat
	

