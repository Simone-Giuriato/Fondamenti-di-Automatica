
% Inizializzazione parametri: 
M_L = 1000; 
M_E=800; 
B_L=500; 
B_E=300; 
K=150; 
% Inizializzazione matrici: 
A = [ -B_L/M_L,        0,      0;
       0, -B_E/M_E, K/M_E; 
       1,       -1,    0;]
B=[1/M_L; 0; 0] 
C=[0 0 1] 
D=0 
 
% Inizializzazione ramo di feedback: 
s=tf('s'); 
H=1/(1+s*0.1) 