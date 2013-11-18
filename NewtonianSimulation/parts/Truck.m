function Truck = jun10Brick

	rhoPb = 11340

	brickHeight = 8*0.0254
	brickWidth  = 4*0.0254

	brickRadius = 25*0.0254
	brickElevation = 16*0.0254 %to center

	truckMass = 1.5e3;
	truckHeight = 1;
	truckWidth = 2;
	truckLength = 3.5;

	Truck = genPointMassRect(truckMass, brickWidth, truckWidth,truckHeight, 4,4,4);

end
