fn =  'output/bootstrapArbFitLateEighties.bootstrappedFits.dat'

[p v] = loadBSFits(fn);

v = v - mean( v(:,5:13), 2);

of = [transpose(p(1,:)) transpose(v)];

save 'output/bootstrapArbFitLateEighties.bootstrappedFits.plottable.dat' of

