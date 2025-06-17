R = 2; 
L = 0.2; 
Km = 5; 
Jm = 0.5;  
bm = 0.5; 
Kp = 0.25;  
Ko = 2; 
alphap = 1; 

%% Matrici A, B, C, D
A = [-R/L     -Km/L      0;
      Km/Jm   -bm/Jm   -Kp/Jm;
      0       Ko*Kp    -Ko*alphap];

B = [1/L; 0; 0];
C = [0 0 1];
D = 0;