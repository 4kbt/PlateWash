###
HOMEDIR := ~/goldStandard/

OCT= octave -p /home/charlie/goldStandard/mlib/ \
	-p /home/charlie/goldStandard/runConfig/\
	-p /home/charlie/goldStandard/globalConfig/
GNU=gnuplot

MLIB := $(shell ls -d -1 $(HOMEDIR)/mlib/)

PHONY : 
	@echo $(OCT)
	@echo $(MLIB)


