try
	['Calibration Setup for ' num2str(nameCtr)];
	eval(['run' num2str(nameCtr) 'sync3']);

	run3147FixedParameters

	qLow = qTesterFreq1-qTesterChunkCalibWidth1;
	qHigh =qTesterFreq1+qTesterChunkCalibWidth1;

	out = OneTwoOmegaChunkCalibFit( pwData, pwTimeCol, torqueCol, qLow, qHigh, Nfilt);

	eval(['save "' HOMEDIR '/calibration/run' num2str(nameCtr) 'calFitChk.dat" out']);

	['Calibration Complete for run ' num2str(nameCtr)]

catch
	['error in ' num2str(nameCtr) '!!!!!!!!!!!!!!!!!!!!!!!']
	lasterr
	errorMessage
end
