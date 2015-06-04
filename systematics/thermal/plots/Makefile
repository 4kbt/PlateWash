include ../../../Makefile.inc

plots:
	 $(GNU) -e "filename = 'shortStrokeolHist.dat'; title1 = 'Heat On Leg 1'; filename2 = 'shortStrokeo0Hist.dat'; title2 = 'Heat Off'; filename3 = 'shortStrokeorHist.dat'; title3 = 'Heat On Leg 2'; plotTitle = 'Short Stroke Heating Histogram'; bottomlabel = 'torque difference (N-m)'; homedir = '$(HOMEDIR)'"  $(HOMEDIR)/glib/stock3Histogram.gpl
	 $(GNU) -e "filename = 'longStrokeolHist.dat';  title1 = 'Heat On Leg 1'; filename2 = 'longStrokeo0Hist.dat';  title2 = 'Heat Off'; filename3 = 'longStrokeorHist.dat'; title3 = 'Heat On Leg 2'; plotTitle = 'Long Stroke Heating Histogram';  bottomlabel = 'torque difference (N-m)'; homedir = '$(HOMEDIR)'"  $(HOMEDIR)/glib/stock3Histogram.gpl


clean:
	-rm *.eps 
