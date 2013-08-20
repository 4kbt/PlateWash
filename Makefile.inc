HOMEDIR := ~/goldStandard/

OCT:= octave --no-init-file \
	--eval "HOMEDIR = \"$(HOMEDIR)\";"\
	--eval 'initializeOctave;'\
	-p $(HOMEDIR)/globalConfig/
GNU := gnuplot

MLIB := $(shell ls -d -1 $(HOMEDIR)/mlib/)

.PHONY : 
	@echo $(OCT)
	@echo $(MLIB)


