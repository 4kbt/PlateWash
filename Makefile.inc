HOMEDIR := /home/charlie/trialEotwash/Eotwash/

OCT:= octave --no-init-file \
	--eval "HOMEDIR = \"$(HOMEDIR)\";"\
	--eval 'initializeOctave;'\
	-p $(HOMEDIR)/globalConfig/ \
	-q 

GNU := gnuplot -e 'set term dumb'

MLIB := $(shell ls -d -1 $(HOMEDIR)/mlib/) 

GLOBAL := $(shell ls -d -1 $(HOMEDIR)/globalConfig/)

RUNS := $(shell ls -d -1 $(HOMEDIR)/runConfig/)

DATA := $(shell ls -d -1 $(HOMEDIR)/data/)

MLIB := $(MLIB) $(GLOBAL)

LYX := lyx -batch --export "pdf" -dbg info,latex

.INTERACT: 
	$(OCT) --persist

.PHONY : 
	@echo $(OCT)
	@echo $(MLIB)

SINGLEQUOTECUTTER := sed -e "s/^.*'\(.*\)'.*$$/\1/"


