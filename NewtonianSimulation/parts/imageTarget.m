function Face = imageTarget

	rho = 9000; 
	thickness = 0.0254;
	iRadius = 12*0.0254;
	oRadius = 13*0.0254;

	eyeRadius = 2*0.0254;
	mWidth = 8*0.0254;
	mHeight = 1*0.0254;

	

	Face = genPointMassAnnlSheet(rho*thickness*(oRadius.^2 - iRadius.^2)*pi, iRadius, oRadius, thickness, 5,50);

	Eye = genPointMassAnnlSheet(rho*thickness*(eyeRadius.^2)*pi, 0,eyeRadius,thickness, 5, 5);
	Mouth = genPointMassRect(rho*mWidth*mHeight*thickness, thickness, mWidth, mHeight, 5, 10, 10);

	LEye = translatePMArray(Eye, [0, 3*0.0254,  4*0.0254]); 
	REye = translatePMArray(Eye, [0, -3*0.0254, 4*0.0254]); 

	Mouth = translatePMArray(Mouth, [0, 0,-5*0.0254]);

	Face = [Face; LEye; REye; Mouth];
		
end
