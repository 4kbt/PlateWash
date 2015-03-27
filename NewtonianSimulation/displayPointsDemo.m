p = jan13Pendulum;
b = jun10Brick; 

b = rotatePMArray(b, pi/2, [0 0 1]);

displayPoints(p,b);

print('plots/displayPointsDemo.eps', '-depsc');

