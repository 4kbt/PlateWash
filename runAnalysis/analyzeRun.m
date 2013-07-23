%Must be called with the variable nameCtr set to a value. See relevant Makefile (/goldStandard/runAnalysis/)

addpath('../mlib');
pause = 0;
more off; 
path

clear -x nameCtr pause

try
	eval(['run' num2str(nameCtr) 'sync3']);
	run3147preSM3A
	sm3squareA
	eval(['save "results/run' num2str(nameCtr) 'pM3Filter.dat" pM sizes times']);
	eval(['save "results/run' num2str(nameCtr) 'pM3FilterOnly.dat" pM']);
catch
	nameCtr
	errorMessage
end
