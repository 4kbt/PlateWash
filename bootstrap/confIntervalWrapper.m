args = argv();

fn = args{1,1}

load(fn)

if( exist ("om") )
	d = om;
end
if( exist ("on") )
	d = on;
end
if( exist ("op") )
	d = op;
end

data = [d(:,2) d(:,3)]; 

minBinNum = 14; %Not sure how to pass configuration argument here.

cI = confidenceIntervals( data, minBinNum, "TurnerSmoothing", 0);

of = [fn '.ci'];

save( of , "cI");
