%% Prova MATLAB Tipo C: script di avvio (da NON modificare!)
%  Per la consegnam creare un proprio script con i comandi eseguiti man 
%  mano nello svolgimento degli esercizi

% Inizializzazione parametri (sistema svolgitore-avvolgitore con "ballerino")
Lf=3;
Ef=9;
md=0.5;
Bd=2;
Kd=1.5;
R=0.2;
V1=3;

% Inizializzazione matrici A, B, C, D
A = [ -V1/Lf, -(2*Ef)/Lf,      0;
        2/md,     -Bd/md, -Kd/md;
           0,          1,      0]       
B = [ (Ef*R)/Lf; 0; 0]
C = [ 0   0   1]
D = 0
