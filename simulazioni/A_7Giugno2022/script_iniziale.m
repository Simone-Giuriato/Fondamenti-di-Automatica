Cl=0.5;
Cf=1;
M=3;
V=2;
Ac=0.6;
beta=50;

A=[ 0 1 0 0;
 0 -Cf/M Ac/M -Ac/M;
 0 -Ac*beta/V -Cl*beta/V Cl*beta/V;
 0 Ac*beta/V -Cl*beta/V -Cl*beta/V]
B=[0;0;beta/V;-beta/V]
C=[1 0 0 0]
D=0 
