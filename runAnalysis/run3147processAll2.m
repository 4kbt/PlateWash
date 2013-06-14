addpath('../mlib');
pause = 0;
more off; 
path

for nameCtr = 3147:3166
%for nameCtr = 3224:3224

	clear -x nameCtr pause

	try
		eval(['run' num2str(nameCtr) 'sync3']);
		run3147preSM3A
		sm3squareA
		eval(['save "results/run' num2str(nameCtr) 'pM3Filter.dat" pM sizes times']);
		eval(['save "results/run' num2str(nameCtr) 'pM3FilterOnly.dat" pM']);
	catch
		printf('Error in %s.\nMessage: %s\nFile: %s\nLine: %s\nScope: %s\nContext: %s\n', num2str(nameCtr), lasterror.message , lasterror.stack.file, lasterror.stack.line , lasterror.stack.scope , lasterror.stack.context);
	end

end

