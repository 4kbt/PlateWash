
try
run3147preSM3A
catch
end

t = transpose(TheoSampleTime:TheoSampleTime:(Nfilt/TheoSampleTime));
d = sin(t*2*pi*0.1);

data = [t d];

[out squareWave outTime] = squareLockM(1, data, stepPeriod, 0.0,  dTime, pTime, weight);

wStart = floor ( dTime/TheoSampleTime);
wEnd   = ceil( (stepPeriod-pTime)/TheoSampleTime);

oneWeight = [t(wStart:wEnd) squareWave(wStart:wEnd)];
lock = (floor(1.0+0.5*sin(2*pi*t./stepPeriod/2.0) ) - 0.5 )* 2;

tenLength = lockAve*stepPeriod/TheoSampleTime;
tenSwitch = [t(1:tenLength) squareWave(1:tenLength)];
tenSwitch(:,2) = tenSwitch(:,2) .* lock(1:tenLength);

W1 = psdUniform(oneWeight(:,1), oneWeight(:,2));
W10 = psdUniform(tenSwitch(:,1), tenSwitch(:,2));

weight = 0; 
[out squareWave outTime] = squareLockM(1, data, stepPeriod, 0.0,  dTime, pTime, weight);

UtenSwitch  = [t(1:tenLength) squareWave(1:tenLength)];
UtenSwitch(:,2) = UtenSwitch(:,2) .* lock(1:tenLength);

U10 = psdUniform(UtenSwitch(:,1), UtenSwitch(:,2));



save run3147windowTransferFunctionsOneW.dat oneWeight
save run3147windowTransferFunctionsTenU.dat UtenSwitch
save run3147windowTransferFunctionsTenW.dat tenSwitch

save run3147windowTransferFunctionsW1.dat   W1
save run3147windowTransferFunctionsW10.dat  W10
save run3147windowTransferFunctionsU10.dat  U10
