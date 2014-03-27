function X2 = chiSquareWSystematics( pM , x)
	global HOMEDIR
	columnNames;

	%Uncomment for diagnostic output
%	transpose(x)

	C = x(1);
	L = x(2);
	A = x(3);
	BA = x(4);
	BL = x(5);
	B2L = x(6);
	B2A = x(7);

%	Nsyst = 3;
%	prototype = ones (Nsyst,1);
%	alphas = alphas*prototype;
%	lambdas = L*prototype;

%	alphas = [A; 0 ; 0];

	alphas =  [A; BA; B2A];
	lambdas = [L; BL; B2L]* 1e-4;
	slope = C * 1e-12;
	
	DoNotExtractFixedParameters = 1;
	run3147FixedParameters;

	x1Vec = pM(:,aCol);
	x2Vec = pM(:,bCol);
	sx1Vec = pM(:,aErrCol);
	sx2Vec = pM(:,bErrCol);

	BMat = [ones(rows(x1Vec),1) pM(:,magFieldCol) pM(:,magField2Col) ];
	sBMat =[zeros(rows(x1Vec),1) ones(rows(x1Vec),1)*0.01, ones(rows(x1Vec),1)*0.0001];

	[GBV varG] = evalYukawaSystematicAveAndVariance(x1Vec, x2Vec, sx1Vec, sx2Vec, BMat, sBMat, alphas, lambdas, slope);

	%Uncomment for diagnostic information
%	diag = [(GBV- pM(:,torCol)).^2 varG pM(:,torerrCol).^2  varG ./ pM(:,torerrCol).^2];
%	[max(diag); mean(diag); median(diag); min(diag); std(diag)]


%	hist(log10((pM(:,torCol) - GBV ).^2  %lqr
 %               ./(pM(:,torerrCol).^2 +varG)),100)
%	hist(log10(abs(GBV)), 100)
%	hold on;
%	hist(log10(abs(pM(:,torCol) - GBV )), 100)
%	hist(log10(abs(pM(:,torerrCol))), 100)
%	hold off; 

	X2 = sum( (pM(:,torCol) - GBV ).^2  %lqr
		./(pM(:,torerrCol).^2 +varG )
		); %sum

%	X2PerNDF = [X2 X2/(rows(pM) - rows(x))]

	if(isnan(X2))
		warning("X2 threw a NaN");
		X2 = Inf;
	end

	if(X2 < 0)
		printf('leasqrDiff, varG, torque^2, varG/torerr^2\n');
		diag = [(GBV- pM(:,torCol)).^2 varG pM(:,torerrCol).^2  varG ./ pM(:,torerrCol).^2];
		[max(diag); mean(diag); median(diag); min(diag); std(diag)]
		transpose(x)

		errmsg = transpose(x);

		save -append 'negErrors.dat' errmsg

		error("Chi squared is less than zero. That is impossible! Go fix it!");
	end
end
