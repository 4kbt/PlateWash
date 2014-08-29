fundamentalConstants
run3147pendulumParameters

m = 18 * m_p; 

vT = sqrt(k_B * T / m );

tau = sqrt( pi / 2 ) *  R^2 / ( d * vT * log(1 + (R/d)^2 ) ); 

f0 = 1.5e3

wt = 2 * pi * f0 * tau; 

F = A * P / d * wt^2 / ( 1 + wt^2 );
