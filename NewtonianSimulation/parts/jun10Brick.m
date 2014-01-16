function Brick = jun10Brick

	run3147PendulumParameters


	Brick = genPointMassRect(brickMass, brickWidth, brickWidth, brickHeight, 4,4,4);

	Brick = translatePMArray(Brick , [brickRadius 0 brickElevation]);

	Brick = [Brick; rotatePMArray(Brick, pi, [0 0 1])];

end
