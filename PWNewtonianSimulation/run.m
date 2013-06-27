Brick = jun10Brick


%force=zeros(numsteps,3);
%torque=zeros(numsteps,3);

force = zeros(rows(rot),3);
time = zeros(1);
torque = force;

	june10Pendulum2

	m1=Pendulum;
	m2Base = Brick;

	for i = 1:rows(rot)
%		for j = 1:columns(trans)
			
			m2=rotatePMArray(m2Base,rot(i), [0 0 1]);

			[force(i,:),torque(i,:)]=pointMatrixGravity(m1,m2);
			if(mod(i,10)==0)
				displayPoints(m1,m2);
			end
			save -text 'temp.dat' force torque ;
%		end
	end
