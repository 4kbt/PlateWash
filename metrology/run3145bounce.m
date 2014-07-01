%hold on

try
run3145syncSingle
catch
end

run3147PendulumParameters

phitop=pwData(:,pwPhiTopCol);
psdTheta=pwData(:,psdCol);


angleOffset = 0.00058;

distanceDown  = phitop;
distanceDown = (phitop+892)*1e-6/(pendulumBodyWidth/2.0);
distanceUp   = -distanceDown+ angleOffset;
distanceDown = distanceDown + angleOffset;

angOut = [phitop psdTheta*psdToRadians distanceDown distanceUp];

plot(phitop,psdTheta * psdToRadians,'1.', phitop, distanceDown,'.3', phitop, distanceUp,'.3');
%plot(phitop,psdTheta*0.00625,'1.');

save 'run3145bounce.dat' angOut

hold off
