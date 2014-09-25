%This script handles errors for chiSquareWSystematics

if(isnan(X2))
	warning("X2 threw a NaN");
	X2 = 1e90;
end

if(X2 < 0)
	printf('leasqrDiff, varG, torque^2, varG/torerr^2\n');
	diag = [(GBV- pM(:,fitColumn)).^2 varG pM(:,fitErrColumn).^2  varG ./ pM(:,fitErrColumn).^2];
	[max(diag); mean(diag); median(diag); min(diag); std(diag)]
	transpose(x)

	errmsg = transpose(x);

	save -append 'negErrors.dat' errmsg

	error("Chi squared is less than zero. That is impossible! Go fix it!");
end
