fn =  'output/bootstrapArbFit.bootstrappedFits.dat'

[p v] = loadBSFits(fn);

of = [transpose(p(1,:)) transpose(v)];

save 'output/bootstrapArbFit.bootstrappedFits.plottable.dat' of

