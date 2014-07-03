%%%%%%%%%%%%%%%%%
%  Synchronizer2 - Charlie 8/3/2011
%
%  Synchronizes two discontinuous data sets.
%  Each data set is a two-column vector of [ time , data] 
%  The output is [time, data1, data2]
%  
%%%%%%%%%%%%%%%%

function out = synchronizer2sort(d1, d2)

	%allocate "out"	
	out = zeros((rows(d1)+rows(d2)),3);

	%tag incoming data
	d1 = [d1 1*ones(rows(d1),1)];
	d2 = [d2 2*ones(rows(d2),1)];
	
	%concatenate
	D = [d1;d2];
	
	%sort on time, get index
	[ds , is] = sort(D(:,1));

	%implement the sort, using index
	DS = D(is,:) ; 

	%pre-loop setup	
	now = zeros(1,3);

	%loop over sorted data
	for(ctr = 1:rows(DS))
	
		%Update time
		now(1) = DS(ctr,1);

		%Uses data tag to properly allocate the record.
		now(DS(ctr,3)+1) = DS(ctr, 2);
	
		out(ctr,:) = now;
	end
	
	
end
