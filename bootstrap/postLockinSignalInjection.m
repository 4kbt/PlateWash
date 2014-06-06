%Post-analysis signal injection.
if( testInjection == 1)
	%Injected model parameters
	if(0 == exist('alpha'))
		alpha    = 6 
	end
	if(0 == exist('lambda'))
		lambda 	 = 310e-6
	end
	if(0 == exist('alpha1'))
		alpha1    = -10 
	end
	if(0 == exist('lambda1'))
		lambda1	 = 100e-6
	end
	if(0 == exist('alpha2'))
		alpha2    = 66
	end
	if(0 == exist('lambda2'))
		lambda2	 = 50e-6
	end
	if(0 == exist('injSlope'))
		injSlope = -4e-12 
	end
	
	alphasInjected = [alpha alpha1 alpha2];
	lambdasInjected = [lambda lambda1 lambda2]; 

	%Expand columns
	if(columns(alphasInjected) < (numSystematics+1) )
		alphasInjected( 1, (numSystematics+1) ) = 0;
	end
	if(columns(lambdasInjected)< (numSystematics+1) )
		lambdasInjected( 1, (numSystematics+1) ) = 100e-6;
		lambdasInjected( lambdasInjected == 0 )  = 100e-6;
	end

	%Make force law
	yo = yukawaForceLaw(alpha, lambda, 1e-6, 3e-3, 1e-6);
	yo1 = yukawaForceLaw(alpha1, lambda1, 1e-6, 3e-3, 1e-6);
	yo2 = yukawaForceLaw(alpha2, lambda2, 1e-6, 3e-3, 1e-6);

	yo(:,2) = yo(:,1)*injSlope + yo(:,2);

	%Fake it!
%	dBSArchive(:,3) = genFakeData(yo, dBSArchive);
	pM(:,torCol) = ...
		genFakeData( yo , [pM(:,aCol), pM(:,bCol), pM(:,torCol), pM(:,torerrCol)]) + ...
		genFakeData( yo1, [pM(:,aCol), pM(:,bCol), pM(:,torCol), 0*pM(:,torerrCol)]) .* pM(:,magFieldACol ) + ...
		genFakeData( yo2, [pM(:,aCol), pM(:,bCol), pM(:,torCol), 0*pM(:,torerrCol)]) .* pM(:,magField2ACol);

%	pM(:,torCol)

%	[GB V] = evalYukawaSystematicAveAndVariance(pM(:,aCol) , pM(:,bCol), pM(:,aErrCol), pM(:,bErrCol), [ones(rows(pM),1) , pM(:,magFieldACol), pM(:,magField2ACol)], ...
%			[zeros(rows(pM),1), ones(rows(pM), 1)*0.01, ones(rows(pM), 1)*0.0001], [alpha; alpha1; alpha2], [lambda; lambda1; lambda2], injSlope)
%clear pause
%	plot(pM(:,torCol), '.', G,'.');

%pause

	injectedSignalArray = [injSlope/XSUnits];
	for injCtr = 1:columns(alphasInjected)
		injectedSignalArray = [ injectedSignalArray lambdasInjected(injCtr)/XLUnits alphasInjected(injCtr) ];
	end
	
	X2Check = chiSquareWSystematics(pM, injectedSignalArray, signalColumns, torCol)
	if(  X2Check > 2* rows(pM))
		X2PerRows = X2Check/rows(pM)
		error('chiSquared of the correct fit is too large!')
	end
end

if ( 1 == exist("fileInjection" ))

	sourceStruct = load(fileInjection);
	sourceFile = sourceStruct.(fieldnames(sourceStruct){1});

	run3147PendulumParameters
	fl = [sourceFile(:,5)-pendulumBodyThickness/2.0 sourceFile(:,13)];

	pM(:,torCol) = genFakeData(fl,  [pM(:,aCol), pM(:,bCol), pM(:,torCol), pM(:,torerrCol)]);
end
