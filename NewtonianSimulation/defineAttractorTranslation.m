function d = defineAttractorTranslation

	run3147PendulumParameters
	

	d = linspace(0, 1e-3, 30);

	d = d';

	rot = [0 1 0 0]; 

%	yOffset = -3.5e-3;
	yOffset = 0;

	xOffset = pendulumBodyThickness/2.0;

	y = ones(rows(d),1)*yOffset;
	x = ones(rows(d),1)*xOffset;


	d = [ repmat(rot, rows(d), 1), d+x, y, zeros(rows(d), 1)];

end
