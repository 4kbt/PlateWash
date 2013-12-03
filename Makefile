include Makefile.inc

CURRENTDIR = $(shell pwd)

dissertation: gitlog.log
	$(if $(shell ls data), ,$(shell ln -s /mnt/ssd/PWData/ data))
	$(shell bin/countXXXs.sh thesis/thesis.lyx >> data/xxxCount.dat)
	$(shell sed -i  "s|HOMEDIR := .*|HOMEDIR := $(CURRENTDIR)/|" Makefile.inc)
	$(MAKE) -j 3 -C mlib
	$(MAKE) -C calibration
	$(MAKE) -j 3 -C runAnalysis
	$(MAKE) -j 3 -C systematics 
	$(MAKE) -j 3 -C bootstrap
	$(MAKE) -C thesis 

gitlog.log: 
	git log > gitlog.log

clean:
	$(MAKE) -C mlib clean
	$(MAKE) -C calibration clean
	$(MAKE) -C runAnalysis clean
	$(MAKE) -C systematics clean 
	$(MAKE) -C bootstrap clean 
	$(MAKE) -C thesis clean 
