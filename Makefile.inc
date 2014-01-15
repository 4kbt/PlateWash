HOMEDIR := /home/charlie/homeVersion/Eotwash/

OCT:= octave --no-init-file \
	--eval "HOMEDIR = \"$(HOMEDIR)\";"\
	--eval 'initializeOctave;'\
	-p $(HOMEDIR)/globalConfig/ \
	-q 

GNU    := gnuplot -e 'set term dumb'

MLIB   := $(shell find  $(HOMEDIR)/mlib/        ) 

GLOBAL := $(shell find $(HOMEDIR)/globalConfig/ )

RUNS   := $(shell find $(HOMEDIR)/runConfig/    )

DATA   := $(shell find $(HOMEDIR)/data/         )

MLIB   := $(MLIB) $(GLOBAL)

LYX    := lyx -batch --export "pdf" -dbg info,latex

.INTERACT: 
	$(OCT) --persist

.PHONY : 
	@echo $(OCT)
	@echo $(MLIB)

PARALLEL := -j 3

SINGLEQUOTECUTTER := sed -e "s/^.*'\(.*\)'.*$$/\1/"


