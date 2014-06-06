%Imports raw data, analyzes it, saves the result.

pause = 0;
more off; 

clear -x nameCtr pause HOMEDIR LoadIFO
try

	run3147FixedParameters

	ifoLoadFlag = '';
	if( exist('LoadIFO'))
		ifoLoadFlag =  'i'
	end

	%Import data file. NameCtr is inherited from a --eval statement at the command line.  See relevant Makefile (/goldStandard/runAnalysis/)
	eval(['run' num2str(nameCtr) 'sync3' ifoLoadFlag]);

	%Check for NaNs in the torque column
	assert(sum(isnan(pwData(:,torqueCol))) == 0 )

	%Get ready
	run3147preSM3A

	%Analyze!
	sm3squareA

	pM = injectSystematicChannelUncertainties(pM);

	runName = num2str(nameCtr);

	if( 0 == FAKING_THE_INTERFEROMETER_ENTIRELY)
		runName = [runName 'i']
	end
	
	%Save blinded results
	eval(['save "results/run' runName 'pM3Filter.dat" pM sizes times']);
	eval(['save "results/run' runName 'pM3FilterOnly.dat" pM']);

	%Save unblinded results
	pM = pMU; 
	eval(['save "alwaysUnblindedResults/run' runName 'pM3Filter.dat" pM sizes times']);
	eval(['save "alwaysUnblindedResults/run' runName 'pM3FilterOnly.dat" pM']);
	clear pM;

catch
	nameCtr
	errorMessage
	lasterror
	error
end
