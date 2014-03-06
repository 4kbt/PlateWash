x = ones(100,1);
sx = 0.1*x;
B = ones(100,3);
sB = 0.1*B;
L = ones(3,1);
A = L;
C = 1;

FBar(x,sx,B,A,L,C)

varF(x,sx,B,sB,A,L,C)
