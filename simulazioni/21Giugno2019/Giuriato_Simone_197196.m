%Giuriato Simone 197196

Initscript

%Es1
%1a
sys=ss(A,B,C,D);
G=tf(sys);

%1b
pole(G)
eig(G)
%poli e autovalori coincidono, sistema completamente controllabile e
%osservabile

%Es2

%2a
K=1;
Gcl=feedback(K*G,1);
figure,step(Gcl)
%sistema stabile

%2b
%Klim=margin(G*K)
%vuole con rlocus
rlocus(G*K)
rlocus(G*K,linspace(0,1000,5000))%piu preciso
Klim=143;

%2c
K1=0.8*Klim;
Gcl1=feedback(K1*G,1);
figure,step(Gcl1)

%2d
%come si vede dalla figura il valore a regime della risposta è pari a 1
%L'errore a regime infatti è nullo, nota che G ha un polo in origine 
ke=dcgain(G*K1);
ep=1/(1+ke);

%Es3
K0=Klim;
Gcl0=feedback(K0*G,1);
figure,step(Gcl0)
figure,step(Gcl0,2)%diminuisco il tempo
T0=1.24-0.765;
%3a

%%regolatore PD
Kp=0.5*K0;
Td=0.2*T0;
s=tf('s');
GcPD=Kp*(1+Td*s);
%%regolatore PID
Kp=0.6*K0;
Ti=0.5*T0;
Td=0.125*T0;
GcPID=Kp*(1+(1/(Ti*s))+Td*s);


%3b
GclPD=feedback(GcPD*G,1);
GclPID=feedback(GcPID*G,1);
figure,step(GclPID)
hold on
step(GclPD)

%In termini di massima sovraelongazione il regolatore PD risulta più
%efficiente, ed anche in termini di tempo d'assestamento avendo valori
%minori.

