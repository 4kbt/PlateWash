function d = defineBrickRevolution

	d = (0:1/600:1)*2*pi;

	d = d';

	on = ones(size(d));

	d = [ d, d*0, d*0, ones(rows(d),1), on*14.5*0.0254, on*-6.5*0.0254, on*5*0.0254];
	
end
