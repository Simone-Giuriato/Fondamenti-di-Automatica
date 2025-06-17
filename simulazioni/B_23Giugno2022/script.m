% Inizializzazione parametri 
J1=120; 
J2=80; 
b=2; 

% Inizializzazione matrici 
A = [ 0, 1,     0; 
    0, 0,  b/J1; 
    0, 0, -b/J2]; 

B = [0;  -1/J1; 1/J2]; 
C=[-1 0 0];
D=0;