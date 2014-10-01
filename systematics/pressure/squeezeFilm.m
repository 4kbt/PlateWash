fundamentalConstants
run3147FixedParameters

%external variables
load ([HOMEDIR '/systematics/foil/foilTension.dat']);
P = load ( [HOMEDIR '/systematics/pressure/finalPressure.dat']);


m = 18 * m_p; 

R = foilDiameter; 
T = 293;

vT = sqrt(k_B * T / m );

d = 1e-6:1e-6:1000e-6;

tau = sqrt( pi / 2 ) *  R^2 ./ ( d .* vT .* log(1 + (R./d).^2 ) ); 
A = pi * R^2; 

f0  = foilResonance;

wt = 2 * pi * f0 * tau; 

F = A * P ./ d .* wt.^2 ./ ( 1 + wt.^2 );

IntrinsicQ = 10*f0; %approximate ringdown time.

%From levy paper and wallet card. 
%Q = k * d / ( A * P * wt^2 / ( 1 + wt^2 ) )
Q = foilTension * d ./ ( A * P * wt.^2 ./ ( 1 + wt.^2 ) );
%CrossoverDistance = IntrinsicQ ./ ( foilTension  ./ ( A * P * wt.^2 ./ ( 1 + wt.^2 ) ) )

out = [d' Q'];

intrinsicOut = [ d' IntrinsicQ * ones(size(d')) ];

save 'foilQ.dat' out

save 'foilIntrinsicQ.dat' intrinsicOut


