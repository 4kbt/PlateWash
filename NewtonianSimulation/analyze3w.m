load 'SimulationOutput/may143w.dat'
d = outMatrix ;
d(:,1) = d(:,1)/2/pi*166.67;
[b3 s r bf o] = peakFitter3(d(:,1), d(:,10)*15.5*0.0254, 16e-3, 20e-3);
[b6 s r bf o] = peakFitter3(d(:,1), d(:,10)*15.5*0.0254, 34e-3, 40e-3);

b3
sqrt(b3(1)^2+b3(2)^2)
b6
sqrt(b6(1)^2+b6(2)^2)


