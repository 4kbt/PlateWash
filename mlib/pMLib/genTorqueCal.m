function o = genTorqueCal()

	global HOMEDIR

	run3147FixedParameters

	qTesterCalibrationSignal = load([HOMEDIR '/calibration/run3147calFitChkMean.dat']);
	qTesterCalibrationSignal = qTesterCalibrationSignal(1,2);

	torqueCal = qTesterTorque / qTesterCalibrationSignal;

	o = torqueCal; 

end
