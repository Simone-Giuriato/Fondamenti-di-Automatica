%Giuriato Simone 197196

InitAutomaticaTipoD

%ES1
%1a
sys=ss(A,B,C,D)
G=tf(sys)
%1b
pole(G)
eig(G)
%poli e autovalori coincidono, infatti il sistema è completamente
%osservabile e completamento controllabile
%Nota: polo NON in origine--> errore valore finito

%Es2
%2a
syms k
kp=k*dcgain(G)
ep=1/(1+kp)
k=solve(ep==0.02,k)
k=double(k)


%2b
Gcl=feedback(k*G,1)
figure,step(Gcl)
%sistema stabile


%2c
klim=margin(G)
rlocus(G)
rlocus(G,linspace(0,1000,5000))


%2d
K1=0.8*klim
Gcl1=feedback(G*K1,1)
figure,step(Gcl1)


%ES3
k0=klim
Gcl0=feedback(klim*G,1)
figure,step(Gcl0,5)%ho messo 5%
T0=2.95-1.85


%3a
%regolatore PI
kp=0.45*k0
Ti=0.85*T0
pidstd(kp,Ti)
s=tf('s')
GcPD=kp*(1+(1/(Ti*s)))
GclPD=feedback(GcPD*G,1)
GcPI=GcPD
GclPI=GclPD

%%regolatore PID
kp=0.6*k0
Ti=0.5*T0
Td=0.125*T0
pidstd(kp,Ti,Td)
GcPID=kp*(1+(1/(Ti*s))+Td*s)
GclPID=feedback(GcPID*G,1)


%3b
figure,step(GclPI)
hold on
step(GclPID)

%è preferibile in assoluto sia per massima sovraelongazione sia per tempo
%assestamento (minori) il regolatore PID






