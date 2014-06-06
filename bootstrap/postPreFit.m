%Sanity check
if rows(pM) < 2
        pM
        error('Insufficient data in pM. Wrong channel? Cut too hard?');
end

%These are the data which will be fit.
dBSArchive = [pM(:,aCol) pM(:,bCol) pM(:,torCol) pM(:,torerrCol)];

