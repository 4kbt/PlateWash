HOMEDIR := /home/charlie/trialEotwash/Eotwash/

OCT:= octave --no-init-file \
	--eval "global HOMEDIR = \"$(HOMEDIR)\";"\
	--eval 'initializeOctave;'\
	-p $(HOMEDIR)/globalConfig/ \
	-q 

GNU    := gnuplot -e 'set term dumb' -e 'HOMEDIR = "$(HOMEDIR)"' -d

MLIB   := $(shell find  $(HOMEDIR)/mlib/        -type d) 

GLOBAL := $(shell find $(HOMEDIR)/globalConfig/ -type d)

RUNS   := $(shell find $(HOMEDIR)/runConfig/    -type d)

DATA   := $(shell find $(HOMEDIR)/data/         -type d)

MLIB   := $(MLIB) $(GLOBAL)

LYX    := lyx -batch --export "ps" -dbg info,latex

.INTERACT: 
	$(OCT) --persist

#The dash is meaningful.
.GINTERACT:
	$(GNU) -

.PHONY : 
	@echo $(OCT)
	@echo $(MLIB)

PARALLEL := -j 4

SINGLEQUOTECUTTER := sed -e "s/^.*'\(.*\)'.*$$/\1/"


