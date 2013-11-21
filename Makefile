include Makefile.inc

dissertation:
	ln -s ~/PWData/ data 
	$(MAKE) -C calibration
	$(MAKE) -j 3 -C runAnalysis
	$(MAKE) -j 3 -C systematics 
	$(MAKE) -j 3 -C bootstrap
	$(MAKE) -C thesis 

clean:
	$(MAKE) -C calibration clean
	$(MAKE) -C runAnalysis clean
	$(MAKE) -C systematics clean 
	$(MAKE) -C bootstrap clean 
	$(MAKE) -C thesis clean 
