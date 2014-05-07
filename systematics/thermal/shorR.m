%calibration drawn from gpl file, which is by-eye SWAG.
d = load('aveTempData/merge5.dat');
[s i] = sort(d(:,1));
d = d(i,:);
d(:,3) = 5.6540 * d(:,3) + 20.6718;
shorR = resampleAndHold( [d(:,1), d(:,3)], 2 );

save 'shorR.dat' shorR 
