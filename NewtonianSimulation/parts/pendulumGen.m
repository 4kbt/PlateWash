more off;

%d  = load('charlieOldAttractorFine.dat');
d = load('June2011TaScanFiberUpXupperLeft.dat');


%d(:,3) = d(:,3) - mean(d(:,3));


d(:,1) = d(:,1) - mean(d(:,1));
d(:,2) = d(:,2) - mean(d(:,2));

[b s r] = ols(d(:,3), d(:,1:2)); 

d(:,3) =  d(:,3) - d(:,1:2)*b;

d(:,3) = d(:,3) - mean(d(:,3));


d = d*1e-3;

d(:,3) = d(:,3) + 15e-6;
d = d( d(:,3) < 20e-6  ,:);
tic
o = scanToPMArray (d, 100e-6,100e-6, 2.5e-6, 4507);
o( o(:,2) > 0.006,1) = 100e-6*100e-6*2.5e-6*16667; 

save 'pendulum200x200x2.5.TiTa.dat'  o

toc

