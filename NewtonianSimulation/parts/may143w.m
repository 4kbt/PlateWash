function m2 = jan13ScrewGaps

	m1 = [0.1, 7*0.0254, 0 , 0];
	
	m2 = [];

	for i = 0:2
		m2 = [m2; rotatePMArray(m1, i*2*pi/3, [0 0 1])];
	end

end

