more off


load 'SimulationOutput/may142w.dat'
oM = outMatrix ;

d = [];

for ctr = 1:100
	d = [d; 2*pi*ctr+ oM(:,1), oM(:,2:end)];
end


f0 = 3.1e-3
width = 1e-3

d(:,1) = d(:,1)/2/pi / f0;

for harm = 1:20
	[b s r bf o] = peakFitter3(d(:,1), d(:,12), harm*f0-width, harm*f0+width);

	amps(harm,:) = [b' bf]
end

P = psd(d(:,1), d(:,12) - mean (d(:,12)));

loglog(P(:,1), sqrt(P(:,2))/sqrt(d(end,1)), amps(:,4), sqrt(amps(:,1).^2+amps(:,2).^2),'+')

