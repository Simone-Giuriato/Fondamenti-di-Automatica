% Inizializzazione parametri 
Kc=240; 
Kr=160; 
Kg=160; 
Ka=200; 
Cr=40; 
Cg=20; 
Cs=80; 
% Inizializzazione matrici 
A = [ -(Kg + Kr)/Cs,  Kg/Cs,  Kr/Cs;       
    Kg/Cg, -Kg/Cg,     0;       
    Kr/Cr,      0, -(Ka + Kr)/Cr] 
B = [Kc/Cs;  
0; 
0] 
C=[1 0 0] 
D=0 
s=tf('s'); 
% Inizializzazione FdT attuatore 
Ga=1/(1+s*0.1) 
% Inizializzazione FdT sensore 
H=1/(1+s*0.4)