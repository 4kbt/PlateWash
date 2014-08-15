run1690sync2

%23 is the old theta, ps encoder was actually running!
o = synchronizer2sort( [pwData(:,pwTimeCol), (pwData(:,23) -mean(pwData(:,23)))* psdToRadians], ...
			[psData(:,psTimeCol), psData(:,13)]);

o = o(2:end, :);


save 'run1690attractorTwist.dat' o
