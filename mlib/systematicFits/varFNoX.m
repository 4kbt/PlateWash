%x is a column vector, length N
%sx is a column vector, length N
%B is a matrix, size NxL
%sB is a matrix, size NxL
%A and L are size Lx1
% in general, N >> L. 

function vF = varFNoX(x,sx,B,sB,A,L,C, enableSystematics, Pstruct, Astruct)

	T = YukFiniteSizeCorrections(L, Pstruct, Astruct);

	ALT = (A.*L.^2.*T);

	%Sum it all up
	warning ("off", "Octave:broadcast"); %for x-sx2/L term

	IL = 1./L.';

	%compute vF
	vF =   (Pstruct.YPF)^2 * exp( 2 * ( -x * IL) ) .* (sB.^2*enableSystematics  ) * ALT.^2 ;

	if(isnan(vF))
		warning('varF2 threw a NaN');
	end

end

%Tests - must be positive, if sx and sb are zero, then vF should be zero.
%	svF = std(vF);
%
%	if( vF < -2*svF)
%		min(vF)
%		svF 
%		error('variance of F is less than zero. Furthermore, it is too negative. Fix.');
%	end

