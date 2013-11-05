include ../../../Makefile.inc

plots:
	 $(GNU) -e "filename = 'shortStrokeoHHist.dat'; title1 = 'Heat On'; filename2 = 'shortStrokeo0Hist.dat'; title2 = 'Heat Off'; plotTitle = 'Short Stroke Heating Histogram'; bottomlabel = 'torque difference (N-m)'; homedir = '$(HOMEDIR)'"  $(HOMEDIR)/glib/stock2Histogram.gpl
	 $(GNU) -e "filename = 'longStrokeoHHist.dat';  title1 = 'Heat On'; filename2 = 'longStrokeo0Hist.dat';  title2 = 'Heat Off'; plotTitle = 'Long Stroke Heating Histogram';  bottomlabel = 'torque difference (N-m)'; homedir = '$(HOMEDIR)'"  $(HOMEDIR)/glib/stock2Histogram.gpl


clean:
	-rm *.eps 
