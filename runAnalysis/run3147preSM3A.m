'Loading fixed parameters'
run3147FixedParameters

'generating filter windows'
%order is important here, in order to ensure supportingplots/run3147filter stuff gets access to fTorque
%units are in units of the Nyquist Frequency (but not in radians?)
fTorque  = fir1(Nfilt, (  [filterLow,qTesterFreq1-qTesterWidth1,qTesterFreq1+qTesterWidth1,qTesterFreq-qTesterWidth,qTesterFreq+qTesterWidth,filterHigh]/NyquistFrequency ));
fSensors = fir1(Nfilt, [filterSensorHigh/NyquistFrequency] );

'calibrating IFO'
if( exist('ifoData'))
	ifoData(:,ifoDataCol) = ( (ifoData(:,ifoDataCol) - IFOFringeBot) / (IFOFringeTop-IFOFringeBot) ) * IFODistPerFringe;
end

'dynamic configuration begins'

%genTorqueCal is a no-argument function that imports the torque calibration.
torqueCal = genTorqueCal;

'calibrating attractor'
pressEncP = getPressEncP(HOMEDIR);
psData(:,psSquareCol) = (touch2937 - polyval(pressEncP, psData(:,psSquareCol)) )*1e-6;

%One of at least two locations where torques can be injected. 
if( fakeTheData == 1)

	'injecting fake data!'

	simTor = simulatedTorque( [pwData(:,pwTimeCol), pwData(:,torqueCol)], [psData(:,psTimeCol), psData(:,psSquareCol)],...
	yukawaForceLaw( 100, 100e-6, 1e-6, 3e-3, 1e-6),...
	2e-14);

	%As data have been faked, it's okay to unblind.
	unBlind = 1;

	pwData(:,torqueCol) = simTor(:,2) / torqueCal;

end

'filtering data'

pwData(:, torqueCol)   = filter(fTorque , 1 ,pwData(: , torqueCol  ));
psData(:, psSquareCol) = filter(fSensors, 1 ,psData (:, psSquareCol));
ifoData(:,ifoDataCol)  = filter(fSensors, 1 ,ifoData(:, ifoDataCol ));

%truncating FIR filter windups
psData =  psData (Ncut:end,:);
pwData =  pwData (Ncut:end,:);
ifoData = ifoData(Ncut:end,:);

%remove mean torque
pwData(:,torqueCol) = pwData(:,torqueCol) - mean(pwData(:,torqueCol));

'dynamic configuration ends'
