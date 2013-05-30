pause = 0;
more off; 

for nameCtr = 3147:3166

	clear -x nameCtr pause

	try
		eval(['run' num2str(nameCtr) 'sync3']);
		run3147calibFitCheck
		eval(['save "' HOMEDIR 'run' num2str(nameCtr) 'calFitChk.dat" out']);
	catch
		['error in ' num2str(nameCtr) '!!!!!!!!!!!!!!!!!!!!!!!']
	end

end

