%Post-analysis signal injection.
if( testInjection == 1)
	
	%Injected model parameters
	if(0 == exist('alpha'))
		alpha    = 0 
	end
	if(0 == exist('lambda'))
		lambda 	 = 300e-6
	end
	if(0 == exist('alpha1'))
		alpha1    = 0 
	end
	if(0 == exist('lambda1'))
		lambda1	 = 100e-6
	end
	if(0 == exist('alpha2'))
		alpha2    = 0 
	end
	if(0 == exist('lambda2'))
		lambda2	 = 200e-6
	end
	if(0 == exist('injSlope'))
		injSlope = 2e-12 
	end
	


	%Make force law
	yo = yukawaForceLaw(alpha, lambda, 1e-6, 3e-3, 1e-6);
	yo1 = yukawaForceLaw(alpha1, lambda1, 1e-6, 3e-3, 1e-6);
	yo2 = yukawaForceLaw(alpha2, lambda2, 1e-6, 3e-3, 1e-6);

	yo(:,2) = yo(:,1)*injSlope + yo(:,2);

	%Fake it!
	dBSArchive(:,3) = genFakeData(yo, dBSArchive);
	pM(:,torCol) = ...
		genFakeData( yo, [pM(:,aCol), pM(:,bCol), pM(:,torCol), pM(:,torerrCol)]) + ...
		genFakeData( yo1, [pM(:,aCol), pM(:,bCol), pM(:,torCol), pM(:,torerrCol)]) .* pM(:,magFieldCol ) + ...
		genFakeData( yo2, [pM(:,aCol), pM(:,bCol), pM(:,torCol), pM(:,torerrCol)]) .* pM(:,magField2Col);

end

if ( 1 == exist("fileInjection" ))

	sourceStruct = load(fileInjection);
	sourceFile = sourceStruct.(fieldnames(sourceStruct){1});

	run3147PendulumParameters
	fl = [sourceFile(:,5)-pendulumBodyThickness/2.0 sourceFile(:,13)];

	dBSArchive(:,3) = genFakeData(fl, dBSArchive);
end
