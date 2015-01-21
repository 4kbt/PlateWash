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

minBinNum = NBinConfInterval; %From FixedParameters

cI = confidenceIntervals( data, minBinNum, "TurnerSmoothing", 0);

of = [fn '.ci'];

save( of , "cI");
