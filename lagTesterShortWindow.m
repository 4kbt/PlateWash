%for pad = 1:2:20

windowWidth = 6;

for lag = 1:windowWidth:128

pad = 128-lag - windowWidth ; 

try
	run3142sync3;
	%set lag
	run3142preSM3A
	dTime = lag;
	pTime = pad;

	sm3squareA
	%aggregate

	eval(['save "run3142lag' num2str(lag) 'pad' num2str(pad) 'pM3FilterOnlyShortWindow.dat" pM']);

	%take difference from reference run.

catch
	'BORKED!'	
end

end
%end
