%Giuriato Simone 197196

InitAutomaticaTipoC

%Es1

%1a
sys=ss(A,B,C,D)
G=tf(sys)

%1b
pole(G)
eig(G)
%poli e autovalori coincidono infatti sisetma completamente
%controllabile e completamente osservabile
%NOTA: polo in origine-_> errore a regime sarà nullo

%ES2
%2a
s=tf('s')
H=1/(1+(s/50))
K=1
Gcl=feedback(K*G,H)
figure, step(Gcl)
%Il sistema è stabile (tende a 1 infatti errore nullo)
%si nota che con feedabck H in retroazione va messo dopo virgola (sistema
%anello chiuso)

%2b
L=G*H
klim=margin(L)
rlocus(L)
rlocus(L,linspace(0,1000,5000)) %prendo più punti nel grafico
%klim=6.2...
%NOTA: uso rlocus(L) dove L=G*H che lo dice lui ma devo moltplicare la
%retorazione non come prima dopo la virgola

%2c
K1=0.8*klim
Gcl1=feedback(K1*G,H)

%2d
kp=dcgain(K1*G*H)%nota che ho messo K1*G*H, dove non è GcL (feedback) devo moltplicare tutto
ep=1/(1+kp)
%da un errore regime nullo, infatti polo vito primo sta in origine
y=1-ep %di conseguenza valore regime 1

%ES3 %GcPID=kp*(1+(1/(Ti*s))+Td*s)
k0=klim %me lo dice lui
Gcl0=feedback(k0*G,H) %devo fare anello retroazione
step(Gcl0,2) %ho messo Ta=2 così nei grafici dopo mette sempre Ta2, se mettessi 
% Ta=5 dopo devo modificare nei grafici successivi in proprities
T0=1.58-0.52 %prendo due massimi consecutivi

%3a
%regolatore PD
kp=0.5*k0
Td=0.2*T0
GcPD=kp*(1+Td*s)
GclPD=feedback(GcPD*G,H)
%regolatore PID
0.6*k0
T0=1.58-0.52
Ti=0.5*T0
Td=0.125*T0
GcPID=kp*(1+1/(Ti*s)+Td*s)
GclPID=feedback(GcPID*G,H)

%3b
figure, step(GclPID)
hold on
step(GclPD)

%il regolatore PID sarebbe preferibile per il tempo d'assetsamento avendolo
%minore, mentre il regolatore PD preferibile per la massima
%sovraelongazione essendo appunto minore

