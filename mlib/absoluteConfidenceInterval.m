%Returns the 95% upper limit on absolute values of bootstrapped alpha fits.
%data are two columns, lambda and alpha, binning is in the lambda direction
%minBinNum gives the minimum bin size
%output format is confIntervals = [lmean lstd lmin lmax amean astd]

function confIntervals = absoluteConfidenceInterval( data, minBinNum, mode, maxLam)

	if (minBinNum < 20 ) 
		error('minBinNum is too small for a 95% confidence limit');
	end

	% 95% confidence intervals only happen exactly on the 20s.
	minBinNum = 20 * floor( minBinNum / 20 );
	NumberToExceedInterval = floor( minBinNum / 20 );

	%sort on lambda
	[sordid, sindex] = sort(data(:,1));
	sortedData = data(sindex,:);

	%Lambdas and alphas
	ls = sortedData(:,1);
	as = sortedData(:,2);

	switch mode
		case "TurnerSmoothing"
			for numCtr = 1:( rows(ls) - minBinNum)

				%Determine subset of interest
				lb = ls( numCtr:(numCtr+minBinNum) );
				ab = as( numCtr:(numCtr+minBinNum) );

				%Determine horizontal properties
				lmean(numCtr) = mean(lb);
				lstd (numCtr) = std (lb);
				lmax (numCtr) = max (lb);
				lmin (numCtr) = min (lb);

				%sort absolute alphas in bin, largest first
				sortedAlphas = flipud( sort( abs( ab ) ) ) ;

				%What's the biggest included value?
				alimit(numCtr) = sortedAlphas(  NumberToExceedInterval + 1);
			end
			
		otherwise
			error("Allowed mode is TurnerSmoothing");
	endswitch

	%format output
	confIntervals = [lmean' lstd' lmin' lmax' alimit'];
end
