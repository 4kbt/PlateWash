%complicated guts of angled-plate torque calculation
%L = Lambda
%T = Theta
%a = lower horizontal coordinate
%b = upper horizontal coordinate
%tp = plate thickness
% This is intended to function with vectorized everything.


function o =  yukawaAngleCore( L , T , a, b , tp)

	%Sanity
	assert(a < b) ;
	assert(L > 0); 
	assert(T ~= 0 );

	%save a few ops
	ToL = T ./ L ; 

 	o = L.^3 ./ T.^2 .* ( 
		exp( -b .* ToL ) .* ( b .* ToL + 1) 
	      - exp( -a .* ToL ) .* ( a .* ToL + 1) 
		) .* (1 - exp( -tp./ L ) ); 

end

%!test
%! assert( yukawaAngleCore( 1 , 1, -1 , 1 , 1 ) == 
%!            (1 - 1/e) * 1 * ( 2/e ) )

%!test
%! u = ones(5, 1);
%! o = yukawaAngleCore( u , u, -u , u , 1 );
%! assert( o == (1 - 1/e) * 1 * ( 2/e ) )
%! assert(size(u) == size(o));

