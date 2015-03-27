include ../../Makefile.inc

OCT := $(OCT) --eval "addpath([HOMEDIR \"/runAnalysis/\"]);"
OCT := $(OCT) --eval "addpath([HOMEDIR \"/calibration/pressure/\"]);"

FFR := run3147filterFrequencyResponse
TIM47:= run3147filterTimeDomain
FILT := run3169filterTransfer
WIND := run3147windowTransferFunctions
LAG20:= run3220torqueLag
LAG24:= run3224torqueLag
LAG69:= run3169lags
TOR67:= run3167torqueNoise
NOT47:= run3147NoiseOverTime
AOT47:= run3147AttractorOverTime
ALB47:= run3147attractorLeakBack
FBV47:= run3147feedbackVoltage
TYP47:= run3147typical
IFO47:= run3147ifoTriangle
RAN47:= run3147randomAttractorExample
ERR47:= run3147attractorPositionError
TIMIN:= timingPlot

all: $(FFR).eps $(FILT).eps $(WIND).eps $(LAG20).eps $(LAG24).eps $(LAG69).eps $(TOR67).eps $(NOT47).eps $(ALB47).eps $(AOT47).eps $(FBV47).eps $(TYP47).eps $(IFO47).eps $(RAN47).eps $(TIM47).eps

#Filter transfer functions
$(FFR).eps: $(FFR).m $(FFR).gpl
	$(OCT) $(FFR).m
	$(GNU) $(FFR).gpl

$(TIM47).eps: $(FFR).m $(TIM47).gpl
	$(OCT) $(FFR).m
	$(GNU) $(TIM47).gpl

#Filters applied to real data
$(FILT).eps : $(FILT).m $(FILT).gpl
	$(OCT) $(FILT).m
	$(GNU) $(FILT).gpl

#Window functions --> needs work for delays
$(WIND).eps : $(WIND).m $(WIND).gpl
	$(OCT) $(WIND).m
	$(GNU) $(WIND).gpl

#Run3220 torque lag
$(LAG20).eps : $(LAG20).m $(LAG20).gpl
	$(OCT) $(LAG20).m
	$(GNU) $(LAG20).gpl

#Run3224 torque lag
$(LAG24).eps : $(LAG24).m $(LAG24).gpl
	$(OCT) $(LAG24).m
	$(GNU) $(LAG24).gpl

#Run3169 lags
$(LAG69).eps : $(LAG69).m $(LAG69).gpl
	$(OCT) $(LAG69).m
	$(GNU) $(LAG69).gpl

#Run3167 torque noise
$(TOR67).eps : $(TOR67).m $(TOR67).gpl
	$(OCT) $(TOR67).m
	$(GNU) $(TOR67).gpl

run3147NoiseThroughTheDay.eps $(NOT47).eps : $(NOT47).gpl $(HOMEDIR)/glib/
	$(GNU) $(NOT47).gpl

$(AOT47).eps : $(AOT47).gpl $(HOMEDIR)/glib/
	$(GNU) $(AOT47).gpl

$(FBV47).eps : $(FBV47).gpl $(HOMEDIR)/glib/ $(HOMEDIR)/globalConfig/
	$(GNU) $(FBV47).gpl

$(ALB47).eps : $(ALB47).m $(ALB47).gpl
	$(OCT) $(ALB47).m
	$(GNU) $(ALB47).gpl

$(TYP47)Torque.dat : $(TYP47).m
	$(OCT) $(TYP47).m 


$(TYP47).eps : $(TYP47)Torque.dat $(TYP47).gpl
	$(GNU) $(TYP47).gpl

$(IFO47).eps : $(IFO47).gpl
	$(GNU) $<

$(RAN47).eps : $(RAN47).m $(RAN47).gpl
	$(OCT) $<
	$(GNU) $(RAN47).gpl

$(ERR47).eps : $(ERR47).gpl
	$(GNU) $<

$(TIMIN).eps : $(TIMIN).gpl
	$(GNU) $<

clean : 
	-rm *.eps
	-rm *.dat
