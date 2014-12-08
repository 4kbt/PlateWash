dps = load('results/psTimeDiffMerge.dat');
dpw = load('results/pwTimeDiffMerge.dat');

[hpw bpw] = hist(dpw, sqrt(rows(dpw)));
[hps bps] = hist(dps, sqrt(rows(dps)));

%shouldn't be needed.
dps = dps(dps > 0 );
dpw = dpw(dpw > 0 );
dpw = dpw(dpw < 1000);

semilogy(bpw, hpw, bps, hps)
