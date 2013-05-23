pause = 0;
more off; 

for nameCtr = 3147:3166
%for nameCtr = 3224:3224

	clear -x nameCtr pause

	try
		eval(['run' num2str(nameCtr) 'sync3']);
		run3147preSM3A
		sm3squareA
		eval(['save "runAnalysisResults/run' num2str(nameCtr) 'pM3Filter.dat" pM sizes times']);
		eval(['save "runAnalysisResults/run' num2str(nameCtr) 'pM3FilterOnly.dat" pM']);
	catch
		['error in ' num2str(nameCtr) '!!!!!!!!!!!!!!!!!!!!!!!']
		lasterror
	end

end

