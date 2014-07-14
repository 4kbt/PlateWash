function pf = getSIPrefix(siNum)

	if( mod(siNum,3) ~= 0 );
	        error('SI exponent not divisible by three');
	end

	%Determine proper prefix
	siPrefixes
	%9 gets the correct offset.
	siDex = siNum / 3 + 9;
	pf = siPrefixes{siDex,2};
end
