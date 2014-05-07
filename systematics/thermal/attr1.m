%calibration drawn from gpl file, which is by-eye SWAG.
d = load('aveTempData/merge13.dat');
[s i] = sort(d(:,1));
d = d(i,:);
d(:,3) = d(:,3)-0.292+23.847;
attr1 = resampleAndHold( [d(:,1), d(:,3)], 2 );

save 'attr1.dat' attr1
