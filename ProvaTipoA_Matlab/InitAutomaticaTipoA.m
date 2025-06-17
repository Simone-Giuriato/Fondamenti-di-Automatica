%% Prova MATLAB Tipo A: script di avvio (da NON modificare, per la consegna
%  creare un proprio script con i comandi eseguiti man mano nello
%  svolgimento degli esercizi

% Inizializzazione parametri (altoparlante ad attrazione elettromagnetica)
m = 0.1;
b = 0.4;
Ke = 0.6;
R = 4;
L = 0.5;
Ka = 0.5;
 
% definizione matrici A,B,C,D
A=[-R/L 0 -Ka/L;0 0 1;Ka/m -Ke/m -b/m]
B=[1/L 0 0]'
C=[0 1 0]
D=0
