'Loading fixed parameters'
run3147FixedParameters

'calibrating IFO'
ifoData(:,ifoDataCol) = ( (ifoData(:,ifoDataCol) - IFOFringeBot) / (IFOFringeTop-IFOFringeBot) ) * IFODistPerFringe;

'dynamic configuration begins'

qTesterCalibrationSignal = load([HOMEDIR '/calibration/run3147calFitChkMean.dat']);
qTesterCalibrationSignal = qTesterCalibrationSignal(1,2);

torqueCal = qTesterTorque / qTesterCalibrationSignal;

if( fakeTheData == 1)

	'injecting fake data!'

	simTor = simulatedTorque( [pwData(:,pwTimeCol), pwData(:,torqueCol)], [psData(:,psTimeCol), psData(:,psSquareCol)],\
	yukawaForceLaw( 100, 100e-6, 1e-6, 3e-3, 1e-6),\
	2e-14);

	unBlind = 1;

	pwData(:,torqueCol) = simTor(:,2) / torqueCal;

end

%units are in units of the Nyquist Frequency (but not in radians?)
fTorque  = fir1(Nfilt, (  [filterLow,qTesterFreq1-qTesterWidth1,qTesterFreq1+qTesterWidth1,qTesterFreq-qTesterWidth,qTesterFreq+qTesterWidth,filterHigh]/NyquistFrequency ));
fSensors = fir1(Nfilt, [filterSensorHigh/NyquistFrequency] );

pwData(:, torqueCol)   = filter(fTorque , 1 ,pwData(: , torqueCol  ));
psData(:, psSquareCol) = filter(fSensors, 1 ,psData (:, psSquareCol));
ifoData(:,ifoDataCol)  = filter(fSensors, 1 ,ifoData(:, ifoDataCol ));

psData =  psData (Ncut:end,:);
pwData =  pwData (Ncut:end,:);
ifoData = ifoData(Ncut:end,:);

pwData(:,torqueCol) = pwData(:,torqueCol) - mean(pwData(:,torqueCol));

'dynamic configuration ends'


