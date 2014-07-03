%%%%%%%%%%%%%%%%%
%  synchronizerSort 
%
%  Synchronizes an arbitrary number of discontinuous data sets
%  Each data set is a two-column vector of [ time , data] 
%  The output is [time, data1, data2, ...  ]
%  
%%%%%%%%%%%%%%%%

function out = synchronizerSort( varargin )

	%Simpler name; Octave uses "lazy copy", no memory overhead here.
	d = varargin; clear varargin

	%How many datasets?
	N = columns(d);

	%Accumulator variable; not preallocating for readability.
	D = [];
	
	%Loop over data
	for ctr = 1:N
		dRows = rows(d{1,ctr});

		%tag incoming data
		d{1,ctr} = [d{1,ctr} ctr*ones(dRows,1)];

		%concatenate data
		D = [D; d{1,ctr}];	
	end

	%allocate "out"	
	out = zeros(rows(D),N+1);

	%sort on time, get index
	[ds , is] = sort(D(:,1));

	%implement the sort, using index
	DS = D(is,:) ; 

	%pre-loop setup - this variable represents the state at time "ctr"
	now = zeros(1,N+1);

	%loop over sorted data
	for(ctr = 1:rows(DS))
	
		%Update time
		now(1) = DS(ctr,1);

		%Uses data tag to update the correct column.
		now(DS(ctr,3)+1) = DS(ctr, 2);
	
		out(ctr,:) = now;
	end
end

%!test
%! a = [1 2; 3 4];
%! b = [1.5 1; 2.5 2];
%! c = [0 1; 5 9];
%! o2 = synchronizerSort(a,b);
%! o3 = synchronizerSort(a,b,c);
%! assert( o2 == [ 1 2 0; 1.5 2 1; 2.5 2 2; 3 4 2] );
%! assert( o3 == [ 
%!		0   0 0 1;
%!		1   2 0 1;
%!		1.5 2 1 1;
%!		2.5 2 2 1;
%!		3   4 2 1;
%!		5   4 2 9 ] );
