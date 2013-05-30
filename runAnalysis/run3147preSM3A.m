'Loading fixed parameters'
run3147FixedParameters

'dynamic configuration begins'

qTesterCalibrationSignal = load('run3147calFitChkMean.dat');
qTesterCalibrationSignal = qTesterCalibrationSignal(1,2);

torqueCal = qTesterTorque / qTesterCalibrationSignal;

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
