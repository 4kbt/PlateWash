include ../../Makefile.inc

plots : attractorScan.eps pendulumScan1.eps pendulumScan2.eps screenScan.eps

attractorScan.eps: charlieOldAttractorFine.dat attractorScan.gpl
	$(GNU) attractorScan.gpl

pendulumScan1.eps: June2011TaScanFiberUpXupperLeft.dat pendulumScan1.gpl
	$(GNU) pendulumScan1.gpl
	
pendulumScan2.eps: June2011TaScanFiberUpXupperRight.dat pendulumScan1.gpl
	$(GNU) pendulumScan2.gpl

screenScan.eps: charlieScreen.dat screenScan.gpl
	$(GNU) screenScan.gpl

clean : 
	-rm *.eps
