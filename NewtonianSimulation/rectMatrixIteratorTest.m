clear

more off

m1 = [1 0 0 0];
m2 = m1; 

trans = (1:100)';

ang = [0 1 0 0];
ang = repmat(ang, rows(trans), 1);

tR = [ang trans zeros(rows(trans), 2)];

[f t] = rectMatrixIterator(m1, m2, tR)



%CODATA '06
G = 6.67428e-11

g = G ./ trans.^2;

if ( max( abs(f(:,1) ./g -1)) > 3e-16)
  error('failure in translation test');
end

