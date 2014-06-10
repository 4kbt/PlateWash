function outputBSO( outfn , BSO , injParameters, injSubCol)

	om = BSO( BSO(:,injSubCol) == -1 , :);
	on = BSO( BSO(:,injSubCol) == 0 , :);
	op = BSO( BSO(:,injSubCol) == 1 , :);

	fm = [outfn 'SysMinus.dat'];
	fn = [outfn 'SysNull.dat'];
	fp = [outfn 'SysPlus.dat'];

	save( fm , "om", "injParameters");
	save( fn , "on", "injParameters");
	save( fp , "op", "injParameters");
	

end
