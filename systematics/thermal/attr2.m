%calibration drawn from gpl file, which is by-eye SWAG.
d = load('aveTempData/merge16.dat');
[s i] = sort(d(:,1));
d = d(i,:);
d(:,3) = d(:,3)+0.4-0.12-0.292+23.847;
attr2 = resampleAndHold( [d(:,1), d(:,3)], 2 );

save 'attr2.dat' attr2
