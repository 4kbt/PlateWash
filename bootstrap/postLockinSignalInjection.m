%Post-analysis signal injection.
if( testInjection == 1)
	
	%Injected model parameters
	if(0 == exist('alpha'))
		alpha    = 1 
	end
	if(0 == exist('lambda'))
		lambda 	 = 100e-6
	end
	if(0 == exist('injSlope'))
		injSlope = 2e-12 
	end

	%Make force law
	yo = yukawaForceLaw(alpha, lambda, 1e-6, 3e-3, 1e-6);

	yo(:,2) = yo(:,1)*injSlope + yo(:,2);

	%Fake it!
	dBSArchive(:,3) = genFakeData(yo, dBSArchive);
end

if ( 1 == exist("fileInjection" ))

	sourceStruct = load(fileInjection);
	sourceFile = sourceStruct.(fieldnames(sourceStruct){1});

	run3147PendulumParameters
	fl = [sourceFile(:,5)-pendulumBodyThickness/2.0 sourceFile(:,13)];

	dBSArchive(:,3) = genFakeData(fl, dBSArchive);
end
