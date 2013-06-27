function d = defineAttractorTranslation

	d = linspace(0, 2e-3, 30);

	d = d';

	rot = [0 1 0 0]; 

	yOffset = -3.5e-3;

%need getter function here: 
	pendulumThickness = 2e-3;

	xOffset = pendulumThickness/2.0;

	y = ones(rows(d),1)*yOffset;
	x = ones(rows(d),1)*xOffset;


	d = [ repmat(rot, rows(d), 1), d+x, y, zeros(rows(d), 1)];

end
