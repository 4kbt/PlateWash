%data are two columns, lambda and alpha, binning is in the lambda direction
%minBinNum gives the minimum bin size
%output format is confIntervals = [lmean lstd lmin lmax amean astd]

function confIntervals = confidenceIntervals( data, minBinNum, mode, maxLam)

	%sort on lambda
	[sordid, sindex] = sort(data(:,1));
	sortedData = data(sindex,:);

	%Lambdas and alphas
	ls = sortedData(:,1);
	as = sortedData(:,2);

	switch mode
		case "FixedNumberBins"
			%Trim to integermultiple of nstd
			aCut = floor( rows(as) / minBinNum ); 

			%recutting into a bin/matrix of data
			ar = reshape(as(1:(aCut*minBinNum)), [minBinNum aCut]);
			lr = reshape(ls(1:(aCut*minBinNum)), [minBinNum aCut]);

			%Alpha properties per bin
			amean = mean(ar);
			astd  = std(ar); 

			%lambda properties
			lmean = mean(lr);
			lstd  = std(lr);
			lmax  = max(lr);
			lmin  = min(lr);

		case "FixedWidthBins"

			histMin = 0;
			binScaleStep = 1.1; %fractional increment in bin size at each loop iteration
			binStep = ( maxLam - ls(1) ) / ( rows(ls) / minBinNum)/binScaleStep ; 

			while( histMin < minBinNum )

				%Just to be sure.
				clear binN

				binStep = binStep * binScaleStep;

				bins = ls(1) : binStep : maxLam; 

				[binN binI] = histc( ls , bins );

				histMin = min(binN(1:(end - 1) ));
			end
			bins = bins';


			for binCtr = 1:( rows(bins) - 1 )

				%Get contents of the bin
				lb = ls( find ( ( ls > bins(binCtr) ) & (ls < bins(binCtr+1) ) ) );
				ab = as( find ( ( ls > bins(binCtr) ) & (ls < bins(binCtr+1) ) ) );

				lmean(binCtr) = mean(lb);
				lstd (binCtr) = std (lb);
				lmax (binCtr) = max (lb);
				lmin (binCtr) = min (lb);

				amean(binCtr) = mean(ab);
				astd (binCtr) = std (ab);
			end
		case "TurnerSmoothing"
			for numCtr = 1:( rows(ls) - minBinNum)
				lb = ls( numCtr:(numCtr+minBinNum) );
				ab = as( numCtr:(numCtr+minBinNum) );

				lmean(numCtr) = mean(lb);
				lstd (numCtr) = std (lb);
				lmax (numCtr) = max (lb);
				lmin (numCtr) = min (lb);

				amean(numCtr) = mean(ab);
				astd (numCtr) = std (ab);
			end
			
		otherwise
			error("Allowed modes are FixedNumberBins and FixedWidthBins");
	endswitch

	%format output
	confIntervals = [lmean' lstd' lmin' lmax' amean' astd'];
end
