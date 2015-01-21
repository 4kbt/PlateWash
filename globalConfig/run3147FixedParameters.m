fprintf('# defining parameters ');

try
	if( 1 == DoNotExtractFixedParameters)
		function printInteger() ;  end
		function printSigNumber() ; end
		function printSigError();  end
		function printDecimal();   end
		function printSI();   end
		function printSIErr();   end
		function fprintf(); 	   end
	end
catch
end


%From run3077free.m
fprintf('FREQUENCY IS NOT PROPERLY DEFINED. CHECK run3077free.m for provenance!!!! Post-fit best fit is 13.2 mHz');
fundamentalConstants

pendulumF0=0.0128; %some provenance in run3077 
pendulumF0Width = 4e-3;
pendulumQ=3500;
pendulumI=2.369e-6;
kappa=4*pi*pi*pendulumF0*pendulumF0*pendulumI; 
printSI(kappa, 1, -9, 'N-m', [HOMEDIR 'extracted/kappa.tex']);
psdWidth=10.16e-3; psdWidthErr = 0.01e-3; % Quoted number from OSI for SC-10; err uses their sigfigs. 
printSIErr(psdWidth, psdWidthErr, 1, -3, 'm', [HOMEDIR 'extracted/detectorWidthMillimeters.tex']); 
focalLength=400e-3;
autocolNoise = 5e-8; 
printSI(autocolNoise,  1, -9, 'rad/$\sqrt{\mbox{Hz}}$', [HOMEDIR 'extracted/autocolNoise.tex']);

psdToRadians = psdWidth/focalLength/2.0/2.0; printDecimal(psdToRadians*2.0*1000, [HOMEDIR 'extracted/autocollDynamicRangePeak2PeakmRad.tex'], 2); %2 for detector width, 2 for single-bounce.

%Controls the post-lockin blinding.
unBlind = 0 ;
%Injects before the lockin
fakeTheData = 0;
%Controls the use of "postLockinSignalInjection"
testInjection = 1;


%end 3077free.m

%This is now defined in Makefile.inc 
%HOMEDIR = '~/goldStandard/'

%units are seconds 
%35+5+25
dTime = 65;   printInteger(dTime, [HOMEDIR 'extracted/dTime.tex']);
%25+10
pTime = 35;   printInteger(pTime, [HOMEDIR 'extracted/pTime.tex']);
deadTimeLimitFreq = 1 / ( 2 * ( dTime + pTime ) );
	      printSI(deadTimeLimitFreq, 2, -3, 'Hz', ...
		    [HOMEDIR 'extracted/deadTimeLimitFreq.tex'] );
stepPeriod = 128; printInteger(stepPeriod, [HOMEDIR 'extracted/stepPeriod.tex']);
printSI(1/(stepPeriod*2), 4, -3, 'Hz',  [HOMEDIR 'extracted/switchFrequency.tex']);

weight = 1;

lockAve = 20;  printInteger(lockAve, [HOMEDIR 'extracted/lockAve.tex']);

TheoSampleTime = 0.8; 
printSI(TheoSampleTime, 3,-3,'s',[HOMEDIR 'extracted/TheoSampleTime.tex']);
printDecimal(TheoSampleTime,[HOMEDIR 'extracted/TheoSampleTimeNoSI.tex'], 1);

thermalTorqueNoise = sqrt(4*k_B*293*kappa/pendulumQ/(2*pi/(2*stepPeriod)));  
printSI(thermalTorqueNoise, 2, -15, 'N-m/$\sqrt{\mbox{Hz}}$', [HOMEDIR 'extracted/thermalTorqueNoise.tex']);
thermalAngleNoise = sqrt(4*k_B*293*kappa/pendulumQ/(2*pi/(2*stepPeriod)))/kappa;
printSI(thermalAngleNoise,  2, -9, 'rad/$\sqrt{\mbox{Hz}}$',  [HOMEDIR 'extracted/thermalAngleNoise.tex']);

qTesterFreq1=3e-3;
qTesterWidth1=0.2e-3;
qTesterChunkCalibWidth1 = 0.5e-3;

qTesterFreq   = 3*2e-3;
qTesterWidth  = 0.2e-3;
qTesterTorque = 1.678e-14;
printSI(qTesterTorque, 2, -15, 'N-m', [HOMEDIR 'extracted/qTesterTorque.tex']);

spikeChopWidth = 100/TheoSampleTime; % in samples

doNotRemoveSpikes = 1;

fprintf('# setup ');

columnNames; %script that defines all the data columns

%correct time column for run 1690
try
	if(pwrunNumber == '1690')
		pwTimeCol = 18;
	end
catch
end


fprintf('# filtering ');
Nfilt = 2560*3/TheoSampleTime; printInteger(Nfilt, [HOMEDIR 'extracted/calibCutLength.tex']);
Ncut = floor(Nfilt*1.5);


NyquistFrequency = 1.0/TheoSampleTime/2;
printSI(NyquistFrequency, 3, 0, 's', [HOMEDIR 'extracted/NyquistFrequency.tex']);

% FIR filter bandpass selection
% if changing these off integer millihertz, change print statements below.
filterLow        = 0.001; printInteger( 1000*filterLow       ,  [HOMEDIR 'extracted/filterLow.tex']);
filterHigh       = 0.1;   printInteger( 1000*filterHigh      ,  [HOMEDIR 'extracted/filterHigh.tex']);
filterSensorHigh = NyquistFrequency;   printInteger( 1000*filterSensorHigh,  [HOMEDIR 'extracted/filterSensorHigh.tex']);

printInteger( 1.0./filterHigh/2, [HOMEDIR 'extracted/filterHighLag.tex']);

%Fit configuration

%pftouch, touch2937, and shortCut are defined in columnNames for portability
%pfTouch =  56+17+ 12+2 ;  %swag
%touch2937 =  147 -2 + pfTouch;
%Distance cut
%shortCut = (pfTouch+10)*1e-6;

printSI(shortCut, 2, -6, 'm', [HOMEDIR 'extracted/shortCut.tex']);
IFOTouchThreshold = 4e-9;


%Commented because thresholding is now dynamic in torErrThresh()
%torErrThresh = 1e-14;
torErrMin    = 1e-18;
%Used to for artifically increasing noise to provide partial-blindness.
torqueBlur   = 1e-12;  printSI(torqueBlur, 1, -15, 'N-m', [HOMEDIR 'extracted/torqueBlur.tex']);

%fprintf('# read Complete \n')

%'INSUFFICENT bootstrap counts'
NumberOfYukawaBootstraps = 30; %was 1000
NumberOfArbFitBootstraps = NumberOfYukawaBootstraps; % was 300

foilResonance = 1580;
foilResonanceErr = 5;      
printSIErr(foilResonance, foilResonanceErr,1, 3, 'Hz', [HOMEDIR '/extracted/foilResonance.tex']);

[foilThickness foilThicknessErr foilStd] = getFoilThickness;

printSIErr(foilThickness, foilThicknessErr , 1, -6,'m', [HOMEDIR '/extracted/foilThickness.tex']);

foilDensity = 8230; printSI(foilDensity, 2, 3, 'g/m$^3$', [HOMEDIR '/extracted/foilDensity.tex']);

foilDiameter = 77e-3; printSI(foilDiameter, 2, -3, 'm', [HOMEDIR '/extracted/foilDiameter.tex']);


IFOFringeTop = 3.28;
IFOFringeBot = 1.639;

IFODistPerFringe = 370e-9;
IFODistCal = IFODistPerFringe/(3.28-1.639);
injectIFOSystematic = 1;



%Systematic uncertainties
NumFitSystematics = numSystematics+1;
%enableSystematics = 1; Done in columnNames for speed :-/
if(enableSystematics == 0)
	fprintf('Systematic uncertainties disabled!');
end
%SysNoX = 1; In columnNames for speed
if(SysNoX == 1)
	fprintf('Systematics handling by bootstrap');
end

SysUB = 25;
LamLB = log10(1e-15/XLUnits);
LamUB = log10(10/XLUnits);
SloUB = log10(1e-4/XSUnits) - logCrossover;

%1e-8 gives beautiful fits, of course.
AppliedMagneticFieldUncertainty = 1e-3; %TotalBogus!
heaterTemperatureUncertainty = 0.020; %TotalBogus!
heaterTempGradientUncertainty = 0.001; %TotalBogus!

NBinConfInterval = 14; %bin width for confidence interval determination
printInteger( NBinConfInterval, [HOMEDIR 'extracted/NBinConfInterval.tex']);

