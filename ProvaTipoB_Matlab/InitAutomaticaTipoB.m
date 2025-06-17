%% Prova MATLAB Tipo B: script di avvio (da NON modificare!)
%  Per la consegnam creare un proprio script con i comandi eseguiti man 
%  mano nello svolgimento degli esercizi

% Inizializzazione parametri (meccanismo di trasmissione del moto per robot
% collaborativo, es. Light-Weight Robot progettato dall'ente di ricerca
% tedesco DLR)
J1=0.1;
J2=0.1;
K=0.2;
b=0.08;
Km=50;
 
% definizione matrici A,B,C,D
A=[0 1 -1;-K/J1 -b/J1 b/J1;K/J2 b/J2 -b/J2]
B=[0;Km/J1;0]
C=[0 0 1]
D=0

