function [pos val] = loadBSFits( filename );
	
	d = load(filename);

	c = columns(d);

	pos = d(:, 1:(c/2));
	val = d(:, (c/2+1):end);
end
