function outputBSO( outfn , BSO , injParameters, injSubCol, signalColString, fittedData)

	%Compose output string
	for ctr = 1:columns(signalColString)
		signalColString(ctr) = ["Lambda\t" cell2mat(signalColString(ctr))];
	end

	%Add slope name
	signalColString(2:end+1) = signalColString;
	signalColString(1) = "Slope";

	outString = strjoin("\t" , signalColString);

	

	om = BSO( BSO(:,injSubCol) == -1 , :);
	on = BSO( BSO(:,injSubCol) ==  0 , :);
	op = BSO( BSO(:,injSubCol) ==  1 , :);

	dm = fittedData( fittedData(:,4) == -1 , : );
	dn = fittedData( fittedData(:,4) ==  0 , : );
	dp = fittedData( fittedData(:,4) ==  1 , : );

	fm = [outfn 'SysMinus.dat'];
	fn = [outfn 'SysNull.dat'];
	fp = [outfn 'SysPlus.dat'];

	dfm = [fm '.plt'];
	dfn = [fn '.plt'];
	dfp = [fp '.plt'];

	save( fm , "outString",  "om", "injParameters");
	save( fn , "outString",  "on", "injParameters");
	save( fp , "outString",  "op", "injParameters");
	
	save( dfm , "dm");
	save( dfn , "dn");
	save( dfp , "dp");
end
