function P =tiltmeterPendulum 

	'tiltmeterPendulum'

	%end masses
	m = 1.8 
	r = 15*0.0254

	P = [m r 0 0; m -r 0 0];

end
