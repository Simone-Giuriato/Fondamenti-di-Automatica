
% Inizializzazione parametri 
Kt=0.1; 
J=0.01; 
N=40; 
L=0.1; 
R=2; 
Kv=0.8; 
Ks=10; 

% Inizializzazione matrici 
A = [   0,         1,        0;     
        -Ks/J, -Kv/J, (Kt*N)/J; 
        0, -(Kt*N)/L,     -R/L] 
B = [0;  
    0; 
    1/L] 
C=[1 0 0] 
D=0