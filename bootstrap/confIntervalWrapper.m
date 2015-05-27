%Arguments are imported from the command line
args = argv();

fn = args{1,1}

load(fn)

run3147FixedParameters

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

minBinNum = max( [7 ceil( sqrt( rows(data) ) ) ] ) ; %From FixedParameters

cI =         confidenceIntervals( data, minBinNum, "TurnerSmoothing", 0);
cIA = absoluteConfidenceInterval( data, minBinNum, "TurnerSmoothing", 0);

%save inclusion limits
of = [fn '.ci'];
save( of , "cI");

%save absolute inclusion results
of = [fn '.cia'];
save( of , "cIA");
