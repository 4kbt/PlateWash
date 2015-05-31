prePreFit

%Load analyzed torque data
pM      = load( [ HOMEDIR 'runAnalysis/results/run3147pM3FilterMerge.dat'] );
totalPA = load( [ HOMEDIR 'metrology/extracted/totalErr.dat' ] ) ;
totalPAUncertainty = totalPA( 4 );

%Save for conclusion plot
save 'output/onLoad.dat' pM

%Cut away auxiliary systematics; could be one line, but less transparent
pM = pM( pM(:, resistorTestCol  ) == 0 , : );
pM = pM( pM(:, capacitorTestCol ) == 0 , : );
pM = pM( pM(:, pneumaticTestCol ) == 0 , : );

%save for conclusion plot
save 'output/afterClericalFix.dat' pM

%Define which columns have fitted signals
signalColumns = [0; magFieldACol; magField2ACol; temperatureACol; tempGradientACol];
signalColString = {"Gravity" "MagneticField" "MagneticField^2" "AttractorTemp" "AttractorTempGradient"};

%Script to verify proper blinding.
CheckImposeBlind

%Minimum noise threshold (yes, will be repeated)
pM = pM( (pM(:,torerrCol)   > torErrMin),:);

%Inject signals, if needed
postLockinSignalInjection;

%Torque threshold cut
torUB = torErrThresh(pM(:,torqueCol));
pM = pM( (abs(pM(:,torCol)) < torUB),:);
pM = pM( (pM(:,torerrCol)   < torUB),:);

%Minimum noise threshold (yes, repeated)
pM = pM( (pM(:,torerrCol)   > torErrMin),:);

%Execute distance cuts
distanceCuts

%save for conclusion plot
save 'output/afterAnalysisCuts.dat' pM

postPreFit
