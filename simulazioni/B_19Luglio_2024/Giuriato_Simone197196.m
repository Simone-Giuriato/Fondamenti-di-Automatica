Giuriato_Simone_197196

InitAutomatica_19_7_2024
%ES1
%1a
sys=ss(A,B,C,D)
G=tf(sys)
%1b
pole(G)
eig(G)
%poli e autovalori coincidono, sistema completamente osservabile e
%controllabile

%Es2

%2a
s=tf('s')
H=1/(s*(1+s))
K=20
Gcl=feedback(K*G,H)
figure,step(Gcl)
%sistema instabile 

%2b
Klim=margin(G*H) %vuole con rlocus
rlocus(G*H)
rlocus(G*H,linspace(0,1000,5000))%piu preciso
Klim=14.6

%2c
K1=0.8*Klim
Gcl1=feedback(G*K1,H)
figure,step(Gcl1)
zero(Gcl1)
pole(Gcl1)
%viene steady state=0, perchè il sisetma ha uno zero in origine

%ES3 anticipatrice--> rossa sopra della verde su blu
Mf=45
leadNetDesignBode(Klim*G*H,Mf)
omega=1.53
M=db2mag(12.6)
phi=-180+Mf-(-199)
%3a
tau1=(M-cosd(phi))/(omega*sind(phi))
tau2=(cosd(phi)-(1/M))/(omega*sind(phi))


%3b
Gc=(1+tau1*s)/(1+tau2*s)
figure,bode(Gc*G*Klim*H)
hold on
grid on
bode(G*H*Klim)

%3c
Gcl2=feedback(Gc*G*Klim,H)
figure,step(Gcl2)
hold on
step(Gcl1)