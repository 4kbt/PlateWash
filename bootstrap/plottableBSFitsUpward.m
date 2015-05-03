fn =  'output/bootstrapArbFitUpward.bootstrappedFits.dat'

[p v] = loadBSFits(fn);

of = [transpose(p(1,:)) transpose(v)];

save 'output/bootstrapArbFitUpward.bootstrappedFits.plottable.dat' of

