%% Parametri numerici 
  
La = 0.5; 
Ra = 5; 
Km = 75; 
n = 25; 
J = 0.25; 
f = 2.5; 

%% Matrici A,B,C,D 
  
A=[-Ra/La 0 -Km/n/La; 0 0 1; Km/n/J 0 -f/J]; 
B=[1/La 0 0]'; 
C=[0 1 0]; 
D=0; 
 
