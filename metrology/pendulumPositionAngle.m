run3147MetrologyParameters
run3147FixedParameters

d = load ( [HOMEDIR 'runAnalysis/results/run3147pM3FilterMerge.dat']);

angColumn = psdCol + numSensors ;

%drop zero-angle points
d = d( d( : , angColumn) ~= 0 , :);

%poor man's spike clip; apologies
d = d( d( : , angColumn)  < 0 , :);


pos = d( : , pwPhiTopCol + numSensors )               ; 
ang = d( : , angColumn                ) * psdToRadians;

posAng = [pos ang];
save 'run3145bounceAngleCull.dat' posAng

%angle determination
mang     = mean(ang) - bounceTouchPosition;
sangStat =       std( ang ) / sqrt( rows( ang ) );
sangSys  = sqrt( std( ang )^2 + bounceAngleOffsetU^2 ); %std captures drifts
sang     = sqrt(sangStat^2 + sangSys^2);
angOut   = [ mang sangStat sangSys sang ];

printSIErr( mang , sang , 1 , -3 , 'rad' , 'extracted/offsetAngle.tex' );
save ("-ascii",  'extracted/offsetAngle.dat', 'angOut');



%position cut -- I believe both hops are encoder skips. The second is unquestionable.
pos = pos( abs( pos - pos( 1 ) ) < 10 ) * 1e-6; 
pos = bounceTouchPosition - pos;

%position determination
mpos = mean(pos);
sposStat =       std( pos ) / sqrt( rows( pos ) );
sposSys  = sqrt( std( pos )^2 + bounceTestU^2 ); %std captures drifts
spos     = sqrt( sposStat^2 + sposSys^2 );
posOut   = [ mpos sposStat sposSys spos ];

printSIErr( mpos , spos , 1 , -6 , 'm' , 'extracted/pfRawDist.tex' );
save ( "-ascii" , 'extracted/pfRawDist.dat' , 'posOut');
