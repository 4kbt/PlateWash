function d = defineBrickRevolution

	d = (0:1/30:1)*2*pi;

	d = d';

	d = [ d, d*0, d*0, ones(rows(d),1), d*0+0.67, d*0+0.56, d*0+0.21];
	
end