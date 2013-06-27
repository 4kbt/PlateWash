function Brick = jun10Brick

	rhoPb = 11340

	brickHeight = 8*0.0254
	brickWidth  = 4*0.0254

	brickRadius = 25*0.0254
	brickElevation = 16*0.0254 %to center

	Brick = genPointMassRect(brickWidth**2*brickHeight*rhoPb, brickWidth, brickWidth, brickHeight, 4,4,4);

	Brick = translatePMArray(Brick , [brickRadius 0 brickElevation]);

	Brick = [Brick; rotatePMArray(Brick, pi, [0 0 1])];

end
