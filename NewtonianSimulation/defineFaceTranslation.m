function d = defineAttractorTranslation


steps = linspace(-20*0.0254, 20*0.0254, 60)
[x,y] = meshgrid(steps,steps);

	rot = [0 1 0 0]; 
pos =[];
for ctr = 1:(rows(x)*columns(x))
	pos = [pos; rot, 3*0.0254, x(ctr), y(ctr)];	
end

	d = pos
end
