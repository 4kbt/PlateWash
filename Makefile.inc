HOMEDIR := ~/goldStandard/

OCT:= octave --no-init-file \
	--eval "HOMEDIR = \"$(HOMEDIR)\";"\
	--eval 'initializeOctave;'\
	-p $(HOMEDIR)/globalConfig/
GNU := gnuplot

MLIB := $(shell ls -d -1 $(HOMEDIR)/mlib/)

LYX := lyx -batch --export "pdf" -dbg 1

.INTERACT: 
	$(OCT) --persist

.PHONY : 
	@echo $(OCT)
	@echo $(MLIB)

SINGLEQUOTECUTTER := sed -e "s/^.*'\(.*\)'.*$$/\1/"


