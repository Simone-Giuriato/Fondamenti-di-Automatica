% Inizializzazione dei parametri numerici per il controllo della diffusione
% di un farmaco nell'organismo umano, secondo il modello compartimentale
V1=8;
V2=16;
V3=10;
k10=0.15;
k12=0.4;
k13=0.8;
k21=0.6;
k31=1.25;

% Inizializzazione matrici del modello
A = [- k10 - k21 - k31, (V2*k12)/V1, (V3*k13)/V1;
       (V1*k21)/V2,        -k12,           0;
       (V1*k31)/V3,           0,        -k13]
B = [ 1/V1;
        0;
        0]
C = [ 1   0   0]
D = 0