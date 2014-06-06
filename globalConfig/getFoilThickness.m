function [m err s] = getFoilThickness
	global HOMEDIR
	
	d = load([HOMEDIR '/globalConfig/foilMeas.dat']);

	dd = abs(diff(d))*1e-6;

	m = mean(dd);

	s = std(dd)*sqrt(2); %sqrt(2) for correlation

	err = s/sqrt(rows(dd));

end
