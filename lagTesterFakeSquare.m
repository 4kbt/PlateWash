%for pad = 1:2:20
for pad = 19

for lag = 10:5:100
run3142sync3;

%set lag
run3142preSM3A
sqW = genSquareWaveFunction( 3.90625e-3, 0.8, rows(pwData)*0.8/256);

sqW(:,2) = sqW(:,2) + randn(size(sqW(:,2)));

pwData(:,torqueCol) = sqW(:,2);

dTime = lag;
pTime = pad;

sm3squareA
%aggregate

eval(['save "run3142lag' num2str(lag) 'pad' num2str(pad) 'pM3FilterOnlyfakeSquare.dat" pM']);

%take difference from reference run.

end
end
