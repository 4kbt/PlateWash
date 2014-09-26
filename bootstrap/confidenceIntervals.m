load 'output/bootstrapYukawa.Sysa0l0.0002slop0SysNull.dat'
%load 'output/bootstrapYukawa.Sysa50000l0.0002slop-1e-11SysNull.dat'

data = on;

[sordid, sindex] = sort(data(:,2));

sortedData = data(sindex,:);

nstd = 7;

ls = sortedData(:,2);
as = sortedData(:,3);

%Trim to integermultiple of nstd
aCut = floor( rows(as) / nstd ); 


ar = reshape(as(1:(aCut*nstd)), [nstd aCut]);
lr = reshape(ls(1:(aCut*nstd)), [nstd aCut]);

amean = mean(ar);
astd = std(ar); 

lmean = mean(lr);
lstd  = std(lr);
lmax  = max(lr);
lmin  = min(lr);

o = [lmean' lstd' lmin' lmax' amean' astd'];

save 'output/confidenceInterval.dat' o


