%%%%%%%%%%%%%%%%%
%  Synchronizer2 - Charlie 8/3/2011
%
%  Synchronizes two discontinuous data sets.
%  Each data set is a two-column vector of [ time , data] 
%  The output is [time, data1, data2]
%  
%%%%%%%%%%%%%%%%

function out = synchronizer2sort(d1, d2)

	
	out = zeros((rows(d1)+rows(d2)),3);

	%d1 = [d1 ones(rows(d1),1) zeros(rows(d1),4)];
	%d2 = [d2 zeros(rows(d1),1) ones(rows(d2) zeros(rows(d2),3)];
	
	d1 = [d1 1*ones(rows(d1),1)];
	d2 = [d2 2*ones(rows(d2),1)];
	
	D = [d1;d2];
	
	[ds , is] = sort(D(:,1));
	
	DS = D(is,:) ; 
	
	now = zeros(1,3);
	

	for(ctr = 1:rows(DS))
	
		now(1) = DS(ctr,1);
		now(DS(ctr,3)+1) = DS(ctr, 2);
	
		out(ctr,:) = now;
	
	        %if(mod(ctr,10000) == 0)
	        	%ctr/rows(DS)
	       % end
	end
	
	
end
