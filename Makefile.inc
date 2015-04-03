HOMEDIR := /home/charlie/jessieMaster/Eotwash/

OCT:= octave --no-init-file \
	--eval "global HOMEDIR = \"$(HOMEDIR)\";"\
	--eval 'initializeOctave;'\
	--eval 'ignore_function_time_stamp("all");'\
	-p $(HOMEDIR)/globalConfig/ \
	-q 

GNU    := gnuplot -e 'set term dumb' -e 'HOMEDIR = "$(HOMEDIR)"' -d

MLIB   := $(shell find  $(HOMEDIR)/mlib/        -type d) 

GLOBAL := $(shell find $(HOMEDIR)/globalConfig/ -type d)

RUNS   := $(shell find $(HOMEDIR)/runConfig/    -type d)

DATA   := $(shell find $(HOMEDIR)/data/         -type d)

MLIB   := $(MLIB) $(GLOBAL)

LYXINTERACT := lyx -userdir $(HOMEDIR)/.lyx
.LYXINTERACT:
	$(LYXINTERACT)

LYX	:= $(LYXINTERACT) -batch --export "pdf2" -dbg info,latex

.INTERACT: 
	$(OCT) --persist --eval 'ignore_function_time_stamp("system");'

#The dash is meaningful.
.GINTERACT:
	$(GNU) -

.PHONY : 
	@echo $(OCT)
	@echo $(MLIB)

PARALLEL := -j 8 

SINGLEQUOTECUTTER := sed -e "s/^.*'\(.*\)'.*$$/\1/"


