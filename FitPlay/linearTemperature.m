function [value partials dataNames fitNames] = linearTemperature( data, dataNames, fitParams, fitNames)

	%Define expectations
	expectedData = {"position (m)" "attractor temperature (K)"};
	expectedFits = {"linear temperature" "temperatureLambda"};

	linearYukawaSystematic
end
