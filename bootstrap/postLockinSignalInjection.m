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
	dBSArchive(:,3) = interp1(yo(:,1), yo(:,2), dBSArchive(:,1)) - interp1(yo(:,1), yo(:,2), dBSArchive(:,2))\
		          + randn(rows(dBSArchive), 1).*dBSArchive(:,4);
end

