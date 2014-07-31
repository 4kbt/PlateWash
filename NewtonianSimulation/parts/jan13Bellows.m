function B = jan13Bellows()

	run3147PendulumParameters

	Bellows = genPointMassAnnlSheet(bellowsMass, 0, bellowsDiameter/2.0, 
					bellowsLength, 7, 7);

	B = translatePMArray( Bellows, [bellowsDistance bellowsOffset bellowsHeight]);
end
