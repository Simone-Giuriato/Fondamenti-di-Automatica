%Giuriato Simone

%Es1

%1a
sys=ss(A,B,C,D)
G=tf(sys)

%1b
pole(G)
eig(G)
%sistema compleatemnte controllabile e completamente osservabile
%infatti i poli e autovalori coincidono

%ES2

%2a
K=1
Gcl=feedback(K*G,1)
figure,step(Gcl)
%sistema stabile, va verso unico punto
%non avendo poli nulli allora errore finito, infatti non tende a 1 il
%grafico



%2b
%figure,rlocus(G)
rlocus(G,linspace(0,1000,5000)) %così selezioni più preciso
klim=113

klim=margin(G)%altro metodo da preferire che calcola lui più preciso
%qui studio quando è stabile al variare di k(klim) NON DEVO METTERE GCL
%perchè li ho già un k fissato

%2c
K1=0.8*klim
Gcl1=feedback(G*K1,1)
figure,step(Gcl1)

%ES3

Gcl_lim=feedback(klim*G,1)
figure,step(Gcl_lim,2) %ciò che metti qua è la percentuale di tempo assestamento
%se metti 5 devi fare proprità modificare tepo assestamento nei 2 grafici
%finali con la stessa percentuale
T0=0.738-0.628

%3a Gc=kp*(1+1/(Ti*s)+Td*s) sempre la stessa formula per entrambe, se non
%ho un termine tipo Ti sparisce e anche quello moltiplicato per Ti...
%regolatore PD
kp=0.5*klim
Td=0.2*T0
s=tf('s')
GcPD=(kp*(1+Td*s))
GclPd=feedback(GcPD*G,1)
%regolatore PID
kp=0.6*klim
Ti=0.5*T0
Td=0.125*T0
GcPID=kp*(1+1/(Ti*s)+Td*s)
GclPID=feedback(GcPID*G,1)

%3b
figure,step(GclPd)
figure,step(GclPID)

%il sistema compensato sia tramite regolatore PID sia PD risulatano avere
%errore a regime nullo (perchè entrambi tendono a 1)
%MA il regolatore PD risulta avere minore tempo di assestamento e minore
%sovraelongazione, pertanto è preferibile PD (vince ciò che è minore)

