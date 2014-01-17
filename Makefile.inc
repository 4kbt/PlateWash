HOMEDIR := /home/charlie/trialEotwash/Eotwash/

OCT:= octave --no-init-file \
	--eval "HOMEDIR = \"$(HOMEDIR)\";"\
	--eval 'initializeOctave;'\
	-p $(HOMEDIR)/globalConfig/ \
	-q 

GNU    := gnuplot -e 'set term dumb' -e 'HOMEDIR = "$(HOMEDIR)"'

MLIB   := $(shell find  $(HOMEDIR)/mlib/        -type d) 

GLOBAL := $(shell find $(HOMEDIR)/globalConfig/ -type d)

RUNS   := $(shell find $(HOMEDIR)/runConfig/    -type d)

DATA   := $(shell find $(HOMEDIR)/data/         -type d)

MLIB   := $(MLIB) $(GLOBAL)

LYX    := lyx -batch --export "pdf" -dbg info,latex

.INTERACT: 
	$(OCT) --persist

.PHONY : 
	@echo $(OCT)
	@echo $(MLIB)

PARALLEL := -j 3

SINGLEQUOTECUTTER := sed -e "s/^.*'\(.*\)'.*$$/\1/"


