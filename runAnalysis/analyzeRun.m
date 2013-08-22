%Imports raw data, analyzes it, saves the result.

pause = 0;
more off; 
path

clear -x nameCtr pause HOMEDIR
try

	run3147FixedParameters

	%Import data file. NameCtr is inherited from a --eval statement at the command line.  See relevant Makefile (/goldStandard/runAnalysis/)
	eval(['run' num2str(nameCtr) 'sync3']);

	%Check for NaNs in the torque column
	assert(sum(isnan(pwData(:,torqueCol))) == 0 )

	%Get ready
	run3147preSM3A

	%Analyze!
	sm3squareA

	%Save blinded results
	eval(['save "results/run' num2str(nameCtr) 'pM3Filter.dat" pM sizes times']);
	eval(['save "results/run' num2str(nameCtr) 'pM3FilterOnly.dat" pM']);

	%Save unblinded results
	pM = pMU; 
	eval(['save "alwaysUnblindedResults/run' num2str(nameCtr) 'pM3Filter.dat" pM sizes times']);
	eval(['save "alwaysUnblindedResults/run' num2str(nameCtr) 'pM3FilterOnly.dat" pM']);
	clear pM;

catch
	nameCtr
	errorMessage
	lasterror
	error
end
