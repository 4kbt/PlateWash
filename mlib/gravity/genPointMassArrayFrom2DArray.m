%Array is in the x-y plane
function o = genPointMassArrayFrom2DArray( A, xSpacing , ySpacing, zSpacing, density)

	m = xSpacing*ySpacing*zSpacing*density;


	xSize = xSpacing * columns(A);
	ySize = ySpacing * rows(A);


	xpos = (xSpacing - xSize)/2.0 + xSpacing * ( 0 : (columns(A) - 1) );
	ypos = (ySpacing - ySize)/2.0 + ySpacing * ( 0 : (rows(A)    - 1) );
	zstart = zSpacing/2.0;

	tic


	A = floor(A./zSpacing);

	o = zeros( sum(sum(A(~isnan(A)))) , 4);
sum(sum(A(~isnan(A))))
size(o)

	zSteps =( 0:(max(max(A)))  )*zSpacing + zstart;

	zSteps = zSteps';
	
	lib = ones( rows(zSteps), 4); 

	lib(:,4) = zSteps;
	lib(:,1) = lib(:,1)*m;

	tem = [];

	octr  = 1; 
	for xctr = 1:columns(A)
		for yctr = 1:rows(A)

			if(A(yctr,xctr) > 0 )
				tem = lib(1:A(yctr,xctr),:);
				tem(:,2) = tem(:,2)*xpos(xctr);
				tem(:,3) = tem(:,3)*ypos(yctr);


				o( octr: ( octr+ A(yctr,xctr) - 1 ), :) = tem;

				octr = octr+rows(tem);
			end

		end

		fraction = xctr/columns(A)*100.0;

		['Assembly is ' num2str(fraction) ' percent complete']
		toc
	end
end

