%This function injects uncertainties into the applied-systematic test channels iafter the lockin.
function pM = injectSystematicChannelUncertainties( pM )
	global HOMEDIR

	run3147FixedParameters

	pM(:, magFieldACol + ABErrOffset) = ...
		ones(rows(pM) , 1) * AppliedMagneticFieldUncertainty  ; 

	pM(:, magField2ACol + ABErrOffset) = ...
		ones(rows(pM) , 1) * AppliedMagneticFieldUncertainty^2; 

	pM(:, magFieldBCol + ABErrOffset) = ...
	pM(:, magFieldACol + ABErrOffset) ;

	pM(:, magField2BCol + ABErrOffset) = ...
	pM(:, magField2ACol + ABErrOffset) ;

	
	pM(:, temperatureACol + ABErrOffset) = ...
		ones(rows(pM) , 1) * heaterTemperatureUncertainty ; 
	pM(:, tempGradientACol + ABErrOffset) = ...
		ones(rows(pM) , 1) * heaterTempGradientUncertainty ; 

	pM(:, temperatureBCol  + ABErrOffset) = ...
	pM(:, temperatureACol  + ABErrOffset) ;
	pM(:, tempGradientBCol + ABErrOffset) = ...
	pM(:, tempGradientACol + ABErrOffset) ;

end
