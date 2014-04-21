fprintf('# defining parameters ');

if(exist("DoNotExtractFixedParameters"))
        function printInteger() ;  end
        function printSigNumber() ; end
        function printSigError();  end
	function fprintf(); 	   end
end


%From run3077free.m
fprintf('FREQUENCY IS NOT PROPERLY DEFINED. CHECK run3077free.m for provenance!!!! Post-fit best fit is 13.2 mHz');
fundamentalConstants

pendulumF0=0.0128; 
pendulumF0Width = 4e-3;
pendulumQ=3500;
pendulumI=2.369e-6;
kappa=4*pi*pi*pendulumF0*pendulumF0*pendulumI; printSigNumber(kappa,[HOMEDIR 'extracted/kappa.tex'],1);
psdWidth=1.016e-2; printDecimal(psdWidth*10.0, [HOMEDIR 'extracted/detectorWidthMillimeters.tex'], 2); %Quoted number from OSI for SC-10.
focalLength=400e-3;

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
dTime = 55;   printInteger(dTime, [HOMEDIR 'extracted/dTime.tex']);
pTime = 15;   printInteger(pTime, [HOMEDIR 'extracted/pTime.tex']);
stepPeriod = 128; printInteger(stepPeriod, [HOMEDIR 'extracted/stepPeriod.tex']);

weight = 1;

lockAve = 20;  printInteger(lockAve, [HOMEDIR 'extracted/lockAve.tex']);

TheoSampleTime = 0.8; printDecimal(TheoSampleTime,[HOMEDIR 'extracted/TheoSampleTime.tex'], 1);

thermalTorqueNoise = sqrt(4*k_B*293*kappa/pendulumQ/(2*pi/(2*stepPeriod)));  printSigNumber(thermalTorqueNoise, [HOMEDIR 'extracted/thermalTorqueNoise.tex'], 2);
thermalAngleNoise = sqrt(4*k_B*293*kappa/pendulumQ/(2*pi/(2*stepPeriod)))/kappa;  printSigNumber(thermalAngleNoise, [HOMEDIR 'extracted/thermalAngleNoise.tex'], 2);

qTesterFreq1=3e-3;
qTesterWidth1=0.2e-3;
qTesterChunkCalibWidth1 = 0.5e-3;

fitOneOmega = false;
doNotFitTwoOmega = 1;

qTesterFreq   = 3*2e-3;
qTesterWidth  = 0.2e-3;
qTesterTorque = 1.678e-14;
printSigNumber(qTesterTorque, [HOMEDIR 'extracted/qTesterTorque.tex'],3);

spikeChopWidth = 100/TheoSampleTime; % in samples

doNotRemoveSpikes = 1;

fprintf('# setup ');

columnNames; %script that defines all the data columns

fprintf('# filtering ');
Nfilt = 2560*3/TheoSampleTime; printInteger(Nfilt, [HOMEDIR 'extracted/calibCutLength.tex']);
Ncut = floor(Nfilt*1.5);


NyquistFrequency = 1.0/TheoSampleTime/2;
printSigNumber(NyquistFrequency, [HOMEDIR 'extracted/NyquistFrequency.tex'], 3);

% FIR filter bandpass selection
% if changing these off integer millihertz, change print statements below.
filterLow        = 0.001; printInteger( 1000*filterLow       ,  [HOMEDIR 'extracted/filterLow.tex']);
filterHigh       = 0.1;   printInteger( 1000*filterHigh      ,  [HOMEDIR 'extracted/filterHigh.tex']);
filterSensorHigh = NyquistFrequency;   printInteger( 1000*filterSensorHigh,  [HOMEDIR 'extracted/filterSensorHigh.tex']);

printInteger( 1.0./filterHigh/2, [HOMEDIR 'extracted/filterHighLag.tex']);

%Fit configuration
pfTouch =  56+17+ 12+2 ;  %swag
touch2937 =  147 -2 + pfTouch;
%Distance cut
shortCut = (pfTouch+10)*1e-6;


%Commented because thresholding is now dynamic in torErrThresh()
%torErrThresh = 1e-14;
torErrMin    = 1e-18;

%fprintf('# read Complete \n')

%'INSUFFICENT bootstrap counts'
NumberOfYukawaBootstraps = 100; %was 1000
NumberOfArbFitBootstraps = NumberOfYukawaBootstraps; % was 300

foilResonance = 1580;
foilResonanceErr = 5;      printSigError(foilResonance, foilResonanceErr         , [HOMEDIR '/extracted/foilResonance.tex']);

foilThickness = 12e-6; printSigNumber(foilThickness, [HOMEDIR '/extracted/foilThickness.tex'], 2);

foilDensity = 8230; printSigNumber(foilDensity, [HOMEDIR '/extracted/foilDensity.tex'], 2);

foilDiameter = 77e-3; printSigNumber(foilDiameter, [HOMEDIR '/extracted/foilDiameter.tex'], 2);


IFOFringeTop = 3.28;
IFOFringeBot = 1.639;

IFODistPerFringe = 370e-9;
IFODistCal = IFODistPerFringe/(3.28-1.639);


%Systematic uncertainties
NumFitSystematics = 3;
enableSystematics = 1;
if(enableSystematics == 0)
	fprintf('Systematic uncertainties disabled!');
end
SysNoX = 1;
if(SysNoX == 1)
	fprintf('Systematics handling by bootstrap');
end

SysUB = 1e20;
LamLB = 1e-6/XLUnits;
LamUB = 1/XLUnits;
SloUB = Inf; %1e-9/XSUnits;

%1e-8 gives beautiful fits, of course.
AppliedMagneticFieldUncertainty = 1e-3; %TotalBogus!
