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

%plot( d( : , pwTimeCol + numSensors)/86400 , d(:, pwPhiTopCol + numSensors) );

%angle determination
mang = mean(ang) - bounceTouchPosition;
%the standard deviation of the mean just feels inappropriate
sang = sqrt( std(ang)^2 + bounceAngleOffsetUncertainty^2);
angOut = [mang sang];

printSIErr(mang, sang, 1, -3, 'rad', 'extracted/offsetAngle.tex');
save ("-ascii",  'extracted/offsetAngle.dat', 'angOut');



%position cut -- I believe both hops are encoder skips. The second is unquestionable.
pos = pos( abs( pos - pos( 1 ) ) < 10 ) * 1e-6; 
pos = bounceTouchPosition - pos;

%position determination
mpos = mean(pos);
spos =  sqrt(std(pos).^2 + bounceTestUncertainty^2); %again, the standard dev of the mean feels inappropriate.
posOut = [mpos spos];

printSIErr( mpos, spos, 1, -6, 'm', 'extracted/pfRawDist.tex');
save ("-ascii", 'extracted/pfRawDist.dat', 'posOut');
