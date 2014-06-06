d = load('aveTempData/merge15.dat');
[s i] = sort(d(:,1));
d = d(i,:);
d(:,3) = d(:,3)+0.36-0.22-0.292+23.847;
baseP = resampleAndHold( [d(:,1), d(:,3)], 2 );

save 'baseP.dat' baseP
