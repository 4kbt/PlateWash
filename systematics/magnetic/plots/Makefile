include ../../../Makefile.inc

plots:
	$(GNU) -e "filename = 'longStrokeolHist.dat';  title1 = '+0.8 A'; filename2 = 'longStrokeo0Hist.dat';  title2 = 'Coil Off'; plotTitle = 'Long Stroke Magnetic Histogram';  bottomlabel = 'torque difference (N-m)'; homedir = '$(HOMEDIR)'"  $(HOMEDIR)/glib/stock2Histogram.gpl
	$(GNU) -e "filename = 'shortStrokeolHist.dat';  title1 = '+0.8 A'; filename2 = 'shortStrokeo0Hist.dat';  title2 = 'Coil Off'; filename3 = 'shortStrokeorHist.dat'; title3 = '-0.8 A'; plotTitle = 'Short Stroke Magnetic Histogram';  bottomlabel = 'torque difference (N-m)'; homedir = '$(HOMEDIR)'"  $(HOMEDIR)/glib/stock3Histogram.gpl


clean:
	-rm *.eps 
