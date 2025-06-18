%Giuriato Simone

Initscript

%Es1
%1a
sys=ss(A,B,C,D)
G=tf(sys)
%1b
pole(G)
eig(G)

%Poli e autovalori coincidono, infatti sistema completamente controllabile
%e osservabile

%ES2
K=1
Gcl=feedback(Ga*G*K,H)
figure,step(Gcl)
%sistema stabile (va verso unico punto, NON varia su e giu)
%2a
Klim=margin(G*Ga*H)%piu preciso
rlocus(G*Ga*H)
rlocus(G*Ga*H, linspace(0,1000,5000)) %posso selezionare punti piu precisi
Klim=10.6


%2b
K1=Klim*0.8
Gcl1=feedback(K1*Ga*G,H)
figure,step(Gcl1)

%2c
kp=K1*dcgain(Ga*G*H) %tutto ciò che non è feedabck uso anello aperto (moltplicco tutto)
ep=1/(1+kp)
y=1-ep
%si eveinceva anche dal grafico valore a regime 0.958 questo perchè il
%sistema Non ha polo in origine e quindi errore a regime assume un valore
%finito

%Es3 K0=Klim T=0periodo  Gc=Kp*(1+(1/Ti*s)+Td*s)

K0=Klim
Gcl0=feedback(K0*Ga*G,H)
figure,step(Gcl0)
figure,step(Gcl0,2)%diminuisco il tempo per vedere meglio le oscillazioni
T0=1.23-0.323
%3a
%regolatore PI
Kp=0.45*K0
Ti=0.85*T0
PI=Kp*(1+1/(Ti*s)) %parentesi nel denominatore, occhio Kp e kp le K maiuscole son due cose diverse
%regolatore PID
Kp=0.6*K0
Ti=0.5*T0
Td=0.125*T0
PID=Kp*(1+1/Ti/s+Td*s) 


%3b
%regolatore PI
GclPID=feedback(PID*Ga*G,H)
GclPI=feedback(PI*Ga*G,H)

%In termini di Overshot il PID è più efficiente ed anche in termini di
%tempo d'assetsamento poichè possiede valori minori
%Entrambi hanno errore nullo poichè valore a regime=1 