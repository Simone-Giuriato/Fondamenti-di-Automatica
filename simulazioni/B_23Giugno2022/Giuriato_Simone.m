%Giuriato Simone

script

%ES1
%1a
sys=ss(A,B,C,D);
G=tf(sys);

%1b
pole(G)
eig(G)

%poli e autovalori coincidono, quindi sistema completamente osservabile e
%completamente raggiungibile
%NOTA: polo in origine--> errore nullo

%ES2
%inizializzo H in retroazione
s=tf('s');
H=1/(1+s*0.5);
clear s

%2a
K=1;
Gcl=feedback(G*K,H);
figure,step(Gcl)
%sistema satbile

%2b
%Klim=margin(L); sisetma instabile con L... usa rlocus 
rlocus(L,linspace(0,1000,5000))
Klim=6.05;

%2c
K1=0.8*Klim;
Gcl1=feedback(K1*G,H);
figure,step(Gcl1)

%2d
kp=K*dcgain(G);
kp=K1*dcgain(G);
kp=dcgain(K1*G);
ep=1/(1+kp);
y=1-ep;

%valore a regime=1 poichè errore a regime=0, infatti ho un polo in origine

%ES3
K0=Klim; 
Gcl_lim=feedback(K0*G,H); %qui è un Gcl con K0 che sarebbe Klim
figure,step(Gcl_lim,100)
T0=70-42;
%3a
%regolatore Pd
Kp=0.5*K0;
Td=0.2*T0;
s=tf('s');
GcPD=Kp*(1+Td*s);
%regolatore PID
Kp=0.6*K0;
Ti=0.5*T0;
Td=0.125*T0;
GcPID=Kp*(1+1/(Ti*s)+Td*s);

%3b
GclPD=feedback(GcPD*G,H)
GclPID=feedback(GcPID*G,H)
figure,step(GclPD)
hold on
step(GclPID)


%% Il PD fornisce una prestazione migliore in assoluto, cioè 
%sia in termini di tempo di assestamento che di overshoot (massima sovraelongazione percentuale), 
%entrambi minori di quelli ottenuti con il PID

%uso comodo anche stepinfo(GclPD)