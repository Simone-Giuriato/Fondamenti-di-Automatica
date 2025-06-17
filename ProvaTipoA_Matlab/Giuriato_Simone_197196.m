%Giruiato Simone
InitAutomaticaTipoA

%Es1
%1a
sys=ss(A,B,C,D)
G=tf(sys)

%1b
pole(G)
eig(G)
%gli autovalori coincidono con i poli per cui il sistema
%è completamente controllabile e osservabile

%Es2

%2a
syms k %mi serve da usare ma non so che valore, lo creo simbolicamente
kp=k*dcgain(G)%trovo guadagno statico per trovare errore ep
ep=1/(1+kp) %fondamentale le parentesi
k=solve(ep==0.05,k) %risolvo imponendo il dato del testo secondo varibile k
k=double(k) %trovo k in frazione e lo converto in double

%2b
Gcl=feedback(k*G,1)
figure, step(Gcl)
%Il sistema è instabile (perchè non si stabilizza in un unico valore ma
%oscilla)

%2c

%soluzione con margini ampiezza
klim=margin(G)

%soluzione con luogo radici
figure, rlocus(G)
%klim=42.2, sarebbe intersezione con asse y positive ma il mouse non è preciso, perciò uso il klim=margin(G)

%2d
k1=0.8*klim
Gcl1=feedback(k1*G,1) %prima avevo creato Gcl con k, ora Gcl1 con k1 che dipende da klim
figure, step(Gcl1)
%mi si apre figura, metto nelle proprità tempo assetstamento 5%
%ed evidenzio la caratteristica del tempo assetstamento settling time

%Es3 rete ritardatrice, uso lagnet guardo dove la rossa è giù

%3a
Mf=45
G1=k*G
lagNetDesignBode(G1,Mf)
omega=1.85
M=db2mag(-21.9)
phi=-180+Mf-(-84.5)
tau1=(M-cosd(phi))/(omega*sind(phi))
tau2=(cos(phi)-(1/M))/(omega*sind(phi))
alpha=tau1/tau2
s=tf('s')
Gc=(1+tau1*s)/(1+tau2*s)




%3b
figure, bode(G1)
hold on
bode(G1*Gc)
%visulaizzo tutti margini di fase con all stability margins

%3c
Gcl2=feedback(Gc*G1,1)
figure,step(Gcl2)
%proprità metto tampo assestamento 5% e slitting time in charetteristics