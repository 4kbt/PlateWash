include Makefile.inc

CURRENTDIR := $(shell pwd)
PATHINJECT := tmp/pathinject

dissertation: gitlog.log debianPackages.tex
	$(if $(shell ls data), ,$(shell ln -s ~/PWData/ data))
	$(shell bin/countXXXs.sh thesis/thesis.lyx >> data/xxxCount.dat)
	$(shell bin/commitPlot.sh > data/gitCommitTimes.dat)
	$(shell sed -i  "s|HOMEDIR := .*|HOMEDIR := $(CURRENTDIR)/|" Makefile.inc)
	$(MAKE) $(PARALLEL) -C mlib
	$(MAKE) $(PARALLEL) -C NewtonianSimulation
	$(MAKE) $(PARALLEL) -C calibration
	$(MAKE) $(PARALLEL) -C autocollimator 
	$(MAKE) $(PARALLEL) -C runAnalysis
	$(MAKE) $(PARALLEL) -C metrology 
	$(MAKE) $(PARALLEL) -C ifo
	$(MAKE) $(PARALLEL) -C systematics 
	$(MAKE) $(PARALLEL) -C bootstrap
	$(MAKE) $(PARALLEL) -C conclusion 
	$(MAKE) -C thesis 

gitlog.log: 
	git log > gitlog.log

debianPackages.txt:
	dpkg-query -l > $@
	
debianPackages.tex: debianPackages.txt
	awk '{ORS=" "}  NR > 5 {print $$2 " (" $$3 ")"}' debianPackages.txt > $@


clean:
	$(MAKE) -C mlib clean
	$(MAKE) -C calibration clean
	$(MAKE) -C runAnalysis clean
	$(MAKE) -C systematics clean 
	$(MAKE) -C bootstrap clean 
	$(MAKE) -C NewtonianSimulation clean
	$(MAKE) -C ifo clean
	$(MAKE) -C thesis clean 
