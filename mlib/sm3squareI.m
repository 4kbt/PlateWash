%Rev. H. Adding max/min support to data analysis.
%Rev. I. Reordering location of A,B stdDev computation, writing devs to disk.

%require no torque NaNs
assert(sum(isnan(pwData(:,torqueCol))) == 0 )


fprintf('* finding edges ');
startEdgeTimeR =  psData(findRisingEdge([psData(:,psTimeCol) psData(:,psSquareCol)]), psTimeCol); 
startEdgeTimeF =  psData(findFallingEdge([psData(:,psTimeCol) psData(:,psSquareCol)]), psTimeCol); 

startEdgeTime = min([startEdgeTimeR startEdgeTimeF]);


%for run3028ish runs.
startEdgeTime = startEdgeTime - stepPeriod;

if( (startEdgeTime - psData(1,psTimeCol) ) < 0 )
	startEdgeTime = startEdgeTime + stepPeriod;
end

qstartEdgeTime = startEdgeTime + stepPeriod/2; 

fprintf('* edges found ');


'Torque calibration using value imported by preSM3A:'
pwData(:,torqueCol) = torqueCal * pwData(:,torqueCol);
assert(sum(isnan(pwData(:,torqueCol))) == 0 )


fprintf(' * calibration complete, beginning lock-in ');

%%%% Full sensor lock in %%%%
[psLock   psSquare   psT  ] = squareLockM ( psTimeCol  , psData  , stepPeriod, startEdgeTime ,  dTime, pTime, weight);
[pwLock   pwSquare   pwT  ] = squareLockM ( pwTimeCol  , pwData  , stepPeriod, startEdgeTime ,  dTime, pTime, weight);
[ifoLock  ifoSquare  ifoT ] = squareLockM ( ifoTimeCol , ifoData , stepPeriod, startEdgeTime ,  dTime, pTime, weight);

[qpsLock  qpsSquare  qpsT ] = squareLockM ( psTimeCol  , psData  , stepPeriod, qstartEdgeTime,  dTime, pTime, weight);
[qpwLock  qpwSquare  qpwT ] = squareLockM ( pwTimeCol  , pwData  , stepPeriod, qstartEdgeTime,  dTime, pTime, weight);
[qifoLock qifoSquare qifoT] = squareLockM ( ifoTimeCol , ifoData , stepPeriod, qstartEdgeTime,  dTime, pTime, weight);

pRows = min([rows(psLock)  rows(pwLock)  rows(ifoLock)]);
qRows = min([rows(qpsLock) rows(qpwLock) rows(qifoLock)]);

pLock = [pwLock(1:pRows,:)   psLock(1:pRows,:)   ifoLock(1:pRows,:) ];
qLock = [qpwLock(1:qRows,:)  qpsLock(1:qRows,:)  qifoLock(1:qRows,:)];

numRows = min([pRows qRows]); %Added 1/3/2011

fprintf('* lockin complete, beginning A, B, differencing ');

if( mod (lockAve,2) != 0)
%		error('This code presently only keeps the sign correct for even values of lockAve'); STILL TRUE!
end
	
	windowArray = repmat(window(ones(lockAve,1)),1,columns(pLock));

for j = 1:(floor(numRows/lockAve) - 1) %changed from length(pwRows) to numRows 1/3/2011

	k = lockAve*(j-1)+1;

	%psAD(j) = psLock(i,9) -psLock(i+2,9);

	pDat = pLock(k:(k+lockAve-1),:); 
	qDat = qLock(k:(k+lockAve-1),:); 
	
	%3,4 starts force dropping of first two points from a cut to remove pneumatic transient.
	pAs =  pDat(3:2:rows(pDat),:);
	pBs =  pDat(4:2:rows(pDat),:);
	pA(j,:) = sum( pAs, 1 ) / rows(pAs);
	pB(j,:) = sum( pBs, 1 ) / rows(pBs);
	pAmax(j,:) = max( pAs,[], 1);
	pAmin(j,:) = min( pAs,[], 1);
	pBmax(j,:) = max( pBs,[], 1);
	pBmin(j,:) = min( pBs,[], 1);
	pAStdDev(j,:) = std( pAs,1) / sqrt(rows(pAs));
	pBStdDev(j,:) = std( pBs,1) / sqrt(rows(pBs));
	
	qAs =  qDat(3:2:rows(qDat),:);
	qBs =  qDat(4:2:rows(qDat),:);
	qA(j,:) = sum( qAs, 1 ) / rows(qAs);
	qB(j,:) = sum( qBs, 1 ) / rows(qBs);
	qAmax(j,:) = max( qAs,[], 1);
	qAmin(j,:) = min( qAs,[], 1);
	qBmax(j,:) = max( qBs,[], 1);
	qBmin(j,:) = min( qBs,[], 1);
	qAStdDev(j,:) = std( qAs,1) / sqrt(rows(qAs));
	qBStdDev(j,:) = std( qBs,1) / sqrt(rows(qBs));
	
	%detrending for lockin. detrending before here screws up As and Bs.
	pDat = detrend(pDat,2);
	qDat = detrend(qDat,2);

	%windowing is only beneficial to a lockin.
%	pDat = pDat.*windowArray;
%	qDat = qDat.*windowArray;

	pAs =  pDat(3:2:rows(pDat),:);
	pBs =  pDat(4:2:rows(pDat),:);
	pAd = sum( pAs, 1 ) / rows(pAs);
	pBd = sum( pBs, 1 ) / rows(pBs);
	pAsd = std( pAs,1) / sqrt(rows(pAs));
	pBsd = std( pBs,1) / sqrt(rows(pBs));
	
	qAs =  qDat(3:2:rows(qDat),:);
	qBs =  qDat(4:2:rows(qDat),:);
	qAd = sum( qAs, 1 ) / rows(qAs);
	qBd = sum( qBs, 1 ) / rows(qBs);
	qAsd = std( qAs,1 )/ sqrt(rows(pAs));
	qBsd = std( qBs,1 )/ sqrt(rows(pBs));
	

	%starts with rising edge, so in-out is A-B	
	pDiff(j,:) = pAd - pBd; 
	qDiff(j,:) = qAd - qBd; 
	pDiffDev(j,:) = sqrt(pAsd.^2 + pBsd.^2);
	qDiffDev(j,:) = sqrt(qAsd.^2 + qBsd.^2);

end

%These guys are always unblinded. Use with care.
pMU = [pDiff pA pB qDiff qA qB pDiffDev qDiffDev pAmax pAmin pBmax pBmin qAmax qAmin qBmax qBmin pAStdDev pBStdDev qAStdDev qBStdDev];

%sanity checks
if (sum(sum(isnan(pMU))) > 0 )
	sum(isnan(pMU))
end


assert( sum(sum(isnan(pMU))) == 0 )

%Blind.
if(exist('unBlind') & unBlind == true)
else
	pwData(:,torqueCol)  = 0;
	pwLock(:,torqueCol)  = 0;
	pA(:,torqueCol)      = 0;
	pB(:,torqueCol)      = 0;
	pAmax(:,torqueCol)   = 0;
	pAmin(:,torqueCol)   = 0;
	pBmax(:,torqueCol)   = 0;
	pBMin(:,torqueCol)   = 0;
	pDiff(:,torqueCol)   = 0;

	qpwLock(:,torqueCol) = 0;
	qA(:,torqueCol)      = 0;
	qB(:,torqueCol)      = 0;
	qAmax(:,torqueCol)   = 0;
	qAmin(:,torqueCol)   = 0;
	qBmax(:,torqueCol)   = 0;
	qBMin(:,torqueCol)   = 0;
	qDiff(:,torqueCol)   = 0;
	
end

fprintf( '* A-B differencing complete ');

pM = [pDiff pA pB qDiff qA qB pDiffDev qDiffDev pAmax pAmin pBmax pBmin qAmax qAmin qBmax qBmin pAStdDev pBStdDev qAStdDev qBStdDev];

sizes = [columns(pwData) columns(psData) columns(ifoData)];
times = [pwTimeCol psTimeCol ifoTimeCol];

fprintf ('* sm3square complete\n');
