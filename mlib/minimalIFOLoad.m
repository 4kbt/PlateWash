function o = minimalIFOLoad( nameCtr, HOMEDIR )

	run3147FixedParameters

	rootDir = HOMEDIR;
	subDir = '/data/';
	runPrefix = [ ' = fopen("' rootDir subDir 'run']

	iforunNumber = num2str(nameCtr);
	eval(['ifoHeaderFile' runPrefix iforunNumber 'ifo.dat", "rt");'] ) ;
	ifoLoadData;

	o = ifoData;
end
