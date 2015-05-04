fn =  'output/bootstrapArbFitEndSegment.bootstrappedFits.dat'

[p v] = loadBSFits(fn);

v = v - mean( v(:, 5:16), 2);

of = [transpose(p(1,:)) transpose(v)];

save 'output/bootstrapArbFitEndSegment.bootstrappedFits.plottable.dat' of

