function d = defineBrickRevolutionWRTTiltmeter

	h = (64-33.5)*0.0254
	separation = 23*12*0.0254
	locationAngle = pi/4*0

	d = (0:1/30:1)*2*pi;

	d = d';

	d = [ d, d*0, d*0, ones(rows(d),1), d*0+separation*sin(locationAngle), d*0+separation*cos(locationAngle), d*0+h];
	
end
