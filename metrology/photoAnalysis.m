run3147PendulumParameters

plateThickness = pendulumBodyThickness;
pendulumLength = pendulumBodyWidth; 

%import data
[PSB ASB OPB PSF ASF OPF PSLength ASLength OPLength] = photoDataParse;

[PSBM PSBE PSBA PSBAE] = photoDisplacement( PSB , plateThickness);
[ASBM ASBE ASBA ASBAE] = photoDisplacement( ASB , plateThickness);
[OPBM OPBE OPBA OPBAE] = photoDisplacement( OPB , plateThickness);


[PSFM PSFE PSFA PSFAE] = photoDisplacement( PSF , plateThickness);
[ASFM ASFE ASFA ASFAE] = photoDisplacement( ASF , plateThickness);
[OPFM OPFE OPFA OPFAE] = photoDisplacement( OPF , plateThickness);

%Process displacement, twist
ScienceGapBack = uncertaintyOverTime( [PSBM; ASBM] , [PSBE; ASBE])(end,:);
ScienceGapFront= uncertaintyOverTime( [PSFM; ASFM] , [PSFE; ASFE])(end,:);

BackDist = ScienceGapBack(1) - OPBM;
BackErr  = sqrt( ScienceGapBack(2)^2 + OPBE^2 );

FrontDist = ScienceGapFront(1) - OPFM;
FrontErr  = sqrt( ScienceGapFront(2)^2 + OPFE^2 );

Angle    =     ( BackDist  - FrontDist  ) / pendulumLength;
AngleErr = sqrt( BackErr^2 + FrontErr^2 ) / pendulumLength;

printSIErr( Angle, AngleErr, 2, -3, 'rad', 'extracted/photoTwistAng.tex');

AverageGap    = uncertaintyOverTime([BackDist; FrontDist], [BackErr; FrontErr])(end,:);

printSIErr(AverageGap(1), AverageGap(2), 2, -6, 'm', 'extracted/photoGapSize.tex');

%Tip computation
backAng =  [PSBA PSBAE; ASBA ASBAE ; OPBA OPBAE];
frontAng = [PSFA PSFAE; ASFA ASFAE ; OPFA OPFAE];

backMerge  = uncertaintyOverTime( backAng(1:2,1) , backAng(1:2,2)  ) (end,:);
frontMerge = uncertaintyOverTime( frontAng(1:2,1), frontAng(1:2,2) ) (end,:);

gapMerge = [backAng(3,:); frontAng(3,:)];

angMerge = [backMerge; frontMerge];
sciAng   = uncertaintyOverTime( angMerge(:,1), angMerge(:,2) ) (end,:);
gapAng   = uncertaintyOverTime( gapMerge(:,1), gapMerge(:,2) ) (end,:);

tipAngDiff = sciAng(1) - gapAng(1);
tipAngDiffErr = sqrt( sciAng(2).^2 + gapAng(2).^2);

printSIErr(tipAngDiff, tipAngDiffErr, 2, -3, 'rad', 'extracted/photoTipAng.tex');
