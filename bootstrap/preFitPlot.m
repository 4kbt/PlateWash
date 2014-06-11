
%These data should probably be dumped to a plot included in the thesis. 
%plot(dBSArchive(:,1), dBSArchive(:,2),'+');
%pause
%plot(pM(:,aCol), pM(:,bCol),'+');
%pause

%These data should land in the thesis too. 
%plot3(dBSArchive(:,1), dBSArchive(:,2), dBSArchive(:,3),'+');
preFitPlotData = [ dBSArchive(:,1), dBSArchive(:,2), dBSArchive(:,3)];
if(exist('alpha') && exist('lambda') && exist('injSlope'))
	preFitPlotFile = ['output/preFitPlotData.a' num2str(alpha) 'l' num2str(lambda) 'slop' num2str(injSlope) '.dat'];
else
	preFitPlotFile = ['output/preFitPlotData.dat'];
end

save( preFitPlotFile, "preFitPlotData");
%pause
