%Imports raw data, analyzes it, saves the result.

pause = 0;
more off; 

	run3147FixedParameters

	ifoLoadFlag = '';
	if( exist('LoadIFO'))
		ifoLoadFlag =  'i'
	end

	%Import data file. NameCtr is inherited from a --eval statement at the command line.  See relevant Makefile (/goldStandard/runAnalysis/)
	eval(['run' num2str(nameCtr) 'sync3' ifoLoadFlag]);

	%export timing info
	if( exist( "pwTimeInfo" ))
		timeOut = [pwRunNum pwTimeInfo];
		save 'results/unCorrectedpwTimeInfo.dat' -append timeOut;
	end
	if( exist( "psTimeInfo" ))
		timeOut = [psRunNum psTimeInfo];
		save 'results/unCorrectedpsTimeInfo.dat' -append timeOut;
	end


	save( ['results/run' pwrunNumber 'pwTimeDiff.dat'], "pwRawTimeDiff");
	save( ['results/run' psrunNumber 'psTimeDiff.dat'], "psRawTimeDiff");
	save( ['results/run' iforunNumber 'ifoTimeDiff.dat'], "ifoRawTimeDiff");
