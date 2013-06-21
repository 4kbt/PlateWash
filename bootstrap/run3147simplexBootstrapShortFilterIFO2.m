more off
%Calibrate duty/microe.
if( ~exist('pressEncP'))
	run2937pressEnc
end

pfTouch =  56 +17 + 12 +2%swag
pfTouch = pfTouch+20 % added to clip out badness? 
touch3002 =  147 -2 + pfTouch

bootstrapOut = [];

aCol = 105;
bCol = 170;

torCol = 65-23;
torerrCol = 7*65-23;

ifoACol = 65*2-23;

aMaxCol = 65*9 - 23; 
bMaxCol = 65*11 - 23;

highCut = 2.97;
lowCut = 1.83;

%Interferometer thresholds.

'NOT using pLDA format! This algorithm only compatible with a *pM3.dat file'
%For run3147pM3FilterI, drop the pM=
pM= load('run3147pM3iFilterMerge.dat');
pM = pM( (pM(:,ifoACol) < highCut & pM(:,ifoACol)> lowCut) , :); 

dBSArchive = [pM(:,aCol) pM(:,bCol) pM(:,torCol) pM(:,torerrCol) pM(:, aMaxCol), pM(:,bMaxCol)];  



clear out 

pause = 0 ; 

for bootStrapCounter = 1:300

bootStrapCounter

d = bootstrapData(dBSArchive);

'bootstrapping complete'

d(:,1) = touch3002 - polyval(pressEncP, d(:,1));
d(:,2) = touch3002 - polyval(pressEncP, d(:,2));
d(:,5) = touch3002 - polyval(pressEncP, d(:,5));
d(:,6) = touch3002 - polyval(pressEncP, d(:,6));

%Save the real data
dArchive = d; 
dSci = dArchive; 


%pMSci = pMSci(1:1334,:);
dSci = dSci(dSci(:,1) >= pfTouch,:);
dSci = dSci(dSci(:,2) >= pfTouch,:);
dSci = dSci(dSci(:,5) >= pfTouch,:);
dSci = dSci(dSci(:,6) >= pfTouch,:);

dSci = chuckDataLine (dSci, 3);  %%%%% IS THIS LEGAL?! <-- probably, especially if only applied once. 

xSci = dSci(:,1:2);


data = [xSci(:,2), xSci(:,1) , dSci(:,3), dSci(:,4)];


preData= [ data(:,1)*1e-6, data(:,2)*1e-6, data(:,3),data(:,4)];
preData(:,3:4) = preData(:,3:4) * 370/1.5;
%xpositions = (pfTouch*1e-6):100e-6:900e-6;

xpos1 = (pfTouch*1e-6):15e-6:300e-6;
xpos2 = xpos1(end):50e-6:900e-6; 

xpositions = [xpos1 xpos2(2:end)];



csFunc = @(fitp)  -chiSquareVectorPolyLinearSpline(preData,xpositions, fitp);

[fito , csMax, nf] = nmsmax(csFunc, 0.5*(randn(size(xpositions))-0.5), [1e-10 inf inf 0 0 1]);

bsO = [xpositions' (fito'- mean(fito(4:(end-3))))];

bootstrapOut = [bootstrapOut; bsO]; 

save 'run3147simplexBootstrapShortFilterIOutx2March052013.15umAnd50um.LinearMaxCut.dat' bootstrapOut

end %bsCnt
