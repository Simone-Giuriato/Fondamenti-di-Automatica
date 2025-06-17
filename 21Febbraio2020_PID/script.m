% Parametri
Ra = 1; 
La = 0.1; 
Km = 8; 
Kt = 4; 
Bt = 0.8; 
Jt = 0.2;


A = [-Ra/La,     0,       -Km/La;
      0,        0,        1;
     Km/Jt, -Kt/Jt,   -Bt/Jt];

B = [1/La; 0; 0];

C = [0, 1, 0];

D = 0;
