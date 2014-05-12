function d = defineBrickRevolution

	d = (0:1/60000:1)*20*pi;

	d = d';

	d = [ d, d*0, d*0, ones(rows(d),1), d*0, d*0, d*0];
	
end
