%Returns the three axis force on mass1 by mass2 (vector)
function force=Gmmr2Array(mass1, mass2)

	%CODATA '06
	G=6.67428e-11;

	%Which way does the force act?
	rvec=mass2(:,2:4)- ones(rows(mass2),1)*mass1(2:4);

	%Pythagoras for modulus
	r=sqrt(sum( (rvec.*rvec) , 2));
	
	force=rvec'*(G*mass1(1)*mass2(:,1)./ r.^3);

end
