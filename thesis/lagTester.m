for pad = 1:2:20

for lag = 10:5:100
run3142sync3;
%set lag
run3142preSM3A
dTime = lag;
pTime = pad;

sm3squareA
%aggregate

eval(['save "run3142lag' num2str(lag) 'pad' num2str(pad) 'pM3FilterOnlyNoFIR.dat" pM']);

%take difference from reference run.

end
end
