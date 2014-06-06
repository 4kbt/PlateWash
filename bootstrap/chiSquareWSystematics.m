function X2 = chiSquareWSystematics( pM , x, signalColumns, fitColumn)
	global HOMEDIR
	columnNames;
	fitErrColumn = diffErrOffset + fitColumn;

	%Uncomment for diagnostic output
%	transpose(x)

	if(length(x) < 3)
		size(x)
		error('insufficient number of arguments in x');
	end
	if(mod(length(x),2) == 0)
		error('wrong number of arguments to x')
	end
	if( rows(x) ~=1 & columns(x) ~=1)
		error('x is a matrix, should be a vector');
	end


	alphas =[]; lambdas = [];
	for( rowctr = 2:2:length(x))
		lambdas = [lambdas; x(rowctr)  ];
		alphas  = [alphas ; x(rowctr+1)];
	end

	lambdas = lambdas * XLUnits;
	slope = x(1) * XSUnits;
	
	DoNotExtractFixedParameters = 1;
	run3147FixedParameters;

	x1Vec = pM(:,aCol);
	x2Vec = pM(:,bCol);
	sx1Vec = pM(:,aErrCol);
	sx2Vec = pM(:,bErrCol);

	%Dynamic allocation of signal and error columns.
	BMat  = [];
	sBMat = [];
	for( sigCtr = 1:rows(signalColumns))
		if( signalColumns(sigCtr) == 0 )

			BMat  = [ BMat  ones( rows(x1Vec) , 1 ) ];
			sBMat = [ sBMat zeros(rows(x1Vec) , 1 ) ];
		else
			BMat  = [ BMat  pM(:, signalColumns(sigCtr)) ];
			sBMat = [ sBMat pM(:, signalColumns(sigCtr) + ABErrOffset) ]; 
		end
	end

	[GBV varG] = evalYukawaSystematicAveAndVariance(x1Vec, x2Vec, sx1Vec, sx2Vec, BMat, sBMat, alphas, lambdas, slope, enableSystematics, SysNoX);

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

	X2 = sum( (pM(:,fitColumn) - GBV ).^2  %lqr
		./(pM(:,fitErrColumn).^2 +varG )
		); %sum

%	X2PerNDF = [X2 X2/(rows(pM) - rows(x))]

	if(isnan(X2))
		warning("X2 threw a NaN");
		X2 = Inf;
	end

	if(X2 < 0)
		printf('leasqrDiff, varG, torque^2, varG/torerr^2\n');
		diag = [(GBV- pM(:,fitColumn)).^2 varG pM(:,fitErrColumn).^2  varG ./ pM(:,fitErrColumn).^2];
		[max(diag); mean(diag); median(diag); min(diag); std(diag)]
		transpose(x)

		errmsg = transpose(x);

		save -append 'negErrors.dat' errmsg

		error("Chi squared is less than zero. That is impossible! Go fix it!");
	end
end
