function B = jan13Bellows()

rhoCopper= 8960
bellowsPressure = 50/14

bellowsLength = 70e-3
bellowsDiameter = 25e-3
bellowsWallThickness = 0.020*0.0254

bellowsMass = pi * (bellowsDiameter/2.0)^2*bellowsLength * rhoAir*bellowsPressure

bellowsDistance = 180e-3
bellowsHeight = 0
bellowsOffset = 0

Bellows = genPointMassAnnlSheet(bellowsMass, bellowsDiameter/2 - bellowsWallThickness, bellowsDiameter/2.0, bellowsLength, 7, 7);

	B = translatePMArray( Bellows, [bellowsDistance bellowsOffset bellowsHeight]);

end
