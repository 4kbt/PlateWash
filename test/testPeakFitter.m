f0 = 20e-3;

t = 1:100000; t=t';
n = 1e-14*randn(size(t));
sig = 1e-13*sin(2*pi*f0*t);

tor = n+sig;

plot(t,tor);

pause

[b s f time]  = peakFitter3Chunk2(t,tor, 15e-3, 22e-3, 1000);

amp = sqrt(b(:,1).^2+b(:,2).^2);

m = mean(amp)
stdDev = std(amp)
meanError = std(amp)/sqrt(rows(amp))

SNR = m/meanError


mean(b)
std(b)


P = psd(t,tor);

loglog(P(:,1), sqrt(P(:,2)));

pause

NFilt = 100;

fil = fir1(100, 0.1,'high');

ftor = filter(fil,1,tor);

tf = t(NFilt:end);
ftor = ftor(NFilt:end);

plot(tf,ftor);

pause

Pf = psd(tf,ftor);

loglog(Pf(:,1), sqrt(Pf(:,2)))


[bf sf ff timef]  = peakFitter3Chunk2(tf,ftor, 15e-3, 22e-3, 1000);

ampf = sqrt(bf(:,1).^2+bf(:,2).^2);

mf = mean(ampf)
stdDevf = std(ampf)
meanErrorf = std(ampf)/sqrt(rows(ampf))

SNRf = m/meanError
pause

