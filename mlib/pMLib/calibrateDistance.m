%Calibrate duty/microe.
if( ~exist('pressEncP'))
        pressEncP = getPressEncP(HOMEDIR);
end

%Calibrate distance
pM(:,aCol) = (touch2937 - polyval(pressEncP, pM(:,aCol)) ) * 1e-6;
pM(:,bCol) = (touch2937 - polyval(pressEncP, pM(:,bCol)) ) * 1e-6;
pM(:,aErrCol) = pM(:,aErrCol) * pressEncP(1)*-1*1e-6;
pM(:,bErrCol) = pM(:,bErrCol) * pressEncP(1)*-1*1e-6;
%Confusingly, this flips max and min, but if it's used consistently, it's okay.
pM(:,aMaxCol) = (touch2937 - polyval(pressEncP, pM(:,aMaxCol)) ) * 1e-6;
pM(:,bMaxCol) = (touch2937 - polyval(pressEncP, pM(:,bMaxCol)) ) * 1e-6;

