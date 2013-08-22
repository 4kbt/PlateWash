t = 1:10000; t = t';
freq = 1e-3;
amp =  pi/10;
sig = (amp * sin(2*pi*freq*t) + amp * cos(2*pi*freq*t) ) /sqrt(2);
%keyboard-banged ends
[b s r bf o ERR COV] = peakFitter3(t, sig, freq*0.134234, freq*10.2344);

%assert( abs(bf-freq) / freq < 
%assert( abs(sqrt(b(1)^2 + b(2)^2) - amp)/amp  < 
%assert( abs(b(3) - mean(sig)) < 


noise = 0.1;
sig = sig + noise*randn(size(t));
[bn sn rn bfn on ERRn COVn] = peakFitter3(t, sig, freq*0.134234, freq*10.2344);

%assert( abs(bf-freq) / freq < 
assert( abs(sqrt(bn(1)^2 + bn(2)^2) - amp)/amp  < noise / sqrt(rows(t)) ) 
%assert( abs(b(3) - mean(sig)) < 
