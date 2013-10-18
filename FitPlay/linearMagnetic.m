function [value partials dataNames fitNames] = linearMagnetic( data, dataNames, fitParams, fitNames)

	%Define expectations
	expectedData = {"position (m)" "magnetic field (T)"};
	expectedFits = {"linear magnetic" "magneticLambda"};

	linearYukawaSystematic
end
