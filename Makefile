include Makefile.inc

dissertation: 
	$(if ls data, ,$(shell ln -s ~/PWData/ data))
	$(MAKE) -j 3 -C mlib
	$(MAKE) -C calibration
	$(MAKE) -j 3 -C runAnalysis
	$(MAKE) -j 3 -C systematics 
	$(MAKE) -j 3 -C bootstrap
	$(MAKE) -C thesis 

clean:
	$(MAKE) -C mlib clean
	$(MAKE) -C calibration clean
	$(MAKE) -C runAnalysis clean
	$(MAKE) -C systematics clean 
	$(MAKE) -C bootstrap clean 
	$(MAKE) -C thesis clean 
