'setup'
torqueCol   = 16;

Nfilt = 2560*3/0.8; printInteger(Nfilt, 'extracted/calibCutLength.tex'); 

qLow = 2.5e-3;
qHigh = 3.5e-3;


'fitting one omega'
[b1 s1 f1 time1] = peakFitter3Chunk2(pwData(:,pwTimeCol), pwData(:,torqueCol), 1.0*qLow, 1.0*qHigh, Nfilt);
'fitting two omega'
[b2 s2 f2 time2] = peakFitter3Chunk2(pwData(:,pwTimeCol), pwData(:,torqueCol), 2.0*qLow, 2.0*qHigh, Nfilt);

out = [time1' time2' b1 b2 s1' s2' f1' f2'];

'read Complete'
