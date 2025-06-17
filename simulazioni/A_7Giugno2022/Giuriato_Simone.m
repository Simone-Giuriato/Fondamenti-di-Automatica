%Giuriato Simone

script_iniziale

%ES1

%1a
sys=ss(A,B,C,D);
G=tf(sys);

%1b
pole(G)
eig(G)
%poli e autovalori coincidono, sisetma completamente controllabile e
%completamente osservabile
%NOTA: ho poli in origine--> errore nullo

%ES2
%2a
K=1;
Gcl=feedback(K*G,1);
figure,step(Gcl)
%sistema stabile (si stabilizza verso unico punto)

%2b
%Klim=margin(G);
rlocus(G,linspace(0,1000,5000)) %linspace ho più punti selezionabili
Klim=116;

%2c
K1=0.8*Klim;
Gcl1=feedback(G*K1,1);
figure,step(Gcl1)

%2d
kp=K*dcgain(G); %il dcgain va calcolato su G, K dentro perchè è noto, se fosse incognita lo moltiplico fuori
ep=1/(1+kp);%ep=0 perchè kp=inf
y=1-ep; %1
%errore regime nullo e quindi valore a regime  y(t)=1 si poteva intuire dal
%fatto che un polo di G sta in origine

%ES3 rete anticipatrice leadNetDesignBode.m, vedere quando rossa sopra
Mf=30;
leadNetDesignBode(G*Klim,30)
omega=10.9; %frequency
M=db2mag(6.29);%cambiare di segno il magnitude
phi=-180+Mf-(-190) ;
%3a
tau1=(M-cosd(phi))/(omega*sind(phi));
tau2=(cosd(phi)-(1/M))/(omega*sind(phi));
%tau2<tau1

%3b
s=tf('s');
Gc=(1+tau1*s)/(1+tau2*s);
figure,bode(G*Klim)
grid on
hold on
bode(Gc*G*Klim)

%3c
Gcl2=feedback(Gc*G*Klim,1);
figure,step(Gcl2)