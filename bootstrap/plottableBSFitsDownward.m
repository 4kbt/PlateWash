fn =  'output/bootstrapArbFitDownward.bootstrappedFits.dat'

[p v] = loadBSFits(fn);

v = v - mean(v(:, 16:27) , 2);

of = [transpose(p(1,:)) transpose(v)];

save 'output/bootstrapArbFitDownward.bootstrappedFits.plottable.dat' of

