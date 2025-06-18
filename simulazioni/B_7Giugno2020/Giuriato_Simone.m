%Giuriato Simone

Initscript

%ES1
%1a
sys=ss(A,B,C,D)
G=tf(sys)

%1b
pole(G)
eig(G)

%i poli e autovalori coincidono, sistema completamente osservabile e
%completamente controllabile
%NOTA: non ho poli in origine--> errore finito

%ES2

%2a
K=1
Gcl=feedback(K*G,H)
figure,step(Gcl)
%sistema stabile

%2b
Klim=margin(G*H)
%o
rlocus(G*H)
Klim=5.2e+03

%2c
K1=0.8*Klim
Gcl1=feedback(G*K1,H)
figure,step(Gcl1)

%2d
kp=K1*dcgain(G*H)
ep=1/(1+kp)
y=1-ep
%Valore risposta a regime 0.943, il sisetma ha un errore in regime perchè
%Non ha poli in origine

%ES3 ritardatrice riga rossa sotto
Mf=30
lagNetDesignBode(G*H*Klim,Mf)
omega=0.706
M=db2mag(-21.4)
phi=-180+Mf-(-136)

%3a
tau1=(M-cosd(phi))/(omega*sind(phi))
tau2=(cosd(phi) -(1/M))/(omega*sind(phi))
tau2 =

   63.1082
 tau1 =

    5.1827
 %tau1<tau2

%3b
Gc=(1+tau1*s)/(1*tau2*s)
figure,bode(G*H*Klim)
hold on
grid on
bode(G*H*Gc*Klim)

%3c
Gcl2=feedback(G*Klim*Gc,H)
figure,step(Gcl2)