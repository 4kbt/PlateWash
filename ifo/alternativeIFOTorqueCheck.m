run3149sync3i



run3147FixedParameters

%Calibrate, de-mean, and blur torque data
tC = genTorqueCal;
pwData(:,torCol) = pwData(:,torCol) - mean(pwData(:,torCol));
pwData(:,torCol) = tC * pwData(:,torCol) + ...
		   torqueBlur * sqrt( 2 * stepPeriod / TheoSampleTime ) * ...
		   randn( size( pwData( : , torCol ) ) );

%		   torqueBlur * ...

s = synchronizerSort( 
	[psData( : , psTimeCol ) , psData( : , psSquareCol)], 
	[ifoData(: , ifoTimeCol) , ifoData(: , ifoDataCol )],
        [pwData( : , pwTimeCol ) , pwData( : , torCol     )]  );

p = load([HOMEDIR 'calibration/pressure/run2937pressEncOutput.dat']);

c = s(abs( diff(s(:,2))) < 1e-4 & abs(diff(s(:,2))) > 1e-10 , :);

%remove means, time offset
m = [ s(:,1) - s(1,1) s(:,2:4)-mean(s(:,2:4))];

plot(polyval(p,c(:,2)), c(:,3),'.')

save 'alternativeIFOTorqueCheck.dat' c

save 'alternativeIFOTorqueCheckRawMeanRemoved.dat' s

