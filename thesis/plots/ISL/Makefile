include ../../../Makefile.inc

all: ISLShortRange.eps ISLFullRange.eps ISLShortRangeEstimate.eps

ISLShortRange.eps: %.eps: %.gpl *.dat
	$(GNU) $< 

ISLShortRangeEstimate.eps: %.eps: %.gpl *.dat absoluteAlphaMinus.dat absoluteAlphaNull.dat
	$(GNU) $< 

ISLFullRange.eps: %.eps: %.gpl *.dat
	$(GNU) $< 

absoluteAlphaMinus.dat absoluteAlphaNull.dat: *.dat absoluteAlpha.m absoluteAlphaGuts.m
	$(OCT) absoluteAlpha.m
