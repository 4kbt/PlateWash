d = load('fringes33052nd.dat');

dd = diff(d(:,2:3));

d3 = [ d( 1:(end - 1) , 2:3 ) dd ];

save 'run3305fringeDiff.dat' d3
