%Giuriato Simone 197196

%Es1
InitAutomaticaTipoB

%1a
sys=ss(A,B,C,D)
G=tf(sys)


%1b
pole(G)
eig(G)
%poli di G e autovalori di A,coincidono quindi
%sistema completamente controllabile e osservabile
%(ho polo in origine in teoria ho errore nullo)

%Es2

%2a
k=1
Gcl=feedback(G*k,1)
figure, step(Gcl)
%sistema instabile


%2b obbligato con rlocus
figure,rlocus(G)
klim=0.017 %ho preso quello dal prof a me darebbe 0.018 ma ho la roba del puntatore storto


%2c
k1=0.8*klim
Gcl1=feedback(k1*G,1)
figure,step(Gcl1)


%2d
pole(G*k1)%moltpilicare per un fattore costante non cambia, lo vedevo subito dai poli di G
pole(G)

%se avevo funzione retroazione moltplicare per k1 cambiava, ma DEVO usare
%funzione trasferimento non anello chiuso

%ho polo nell'origine quindi errore a regime nullo


%ES3 rete anticipatrice tau2/tau1, prendere freq rossa sopra della linea verde su linea blu


%3a
Mf=45
G1=G*k
leadNetDesignBode(G1,Mf)
omega=42
M=db2mag(12.9)
phi=-180+Mf-(-181)
tau1=(M-cosd(phi))/(omega*sind(phi))
tau2=(cosd(phi)-(1/M))/(omega*sind(phi))
alpha=tau2/tau1
s=tf('s')
Gc=(1+tau1*s)/(1+tau2*s)

%3b
figure,bode(G1)%non compensato
grid on
hold on
bode(Gc*G1)%compensato è G1*Gc perche ho il controllore Gc

%3c
figure,rlocus(G)
bode(Gc*G1)
Gcl2=feedback(Gc*G1,1)
%charattheristcs --> peak perchè vuole sovraelongazione
