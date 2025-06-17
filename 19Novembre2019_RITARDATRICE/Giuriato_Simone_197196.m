%Giuriato Simone

%Es1
%1a
sys=ss(A,B,C,D)
G=tf(sys)

%1b
pole(G)
eig(G)
%poli e autovalori coincidono, quindi sistema completamente controllabile
%e osservabile

%Es2

%2a
K=1
Gcl=feedback(K*G,1)
figure, step(Gcl)
%sistema stabile (va verso unico punto)


%2b
kp=K*dcgain(G)
ep=1/(1+kp) %errore a regime
Yreg=1-ep %risposta a regime
%Non avendp G un polo nell'origine allora il sistema ha un errore a regime
%finito e non nullo


%2c
figure,rlocus(G)
klim=126

%2d
K1=0.8*klim
Gcl1=feedback(K1*G,1)
figure, step(Gcl1)

%Es3

%3a
G1=G*klim
Mf=45
lagNetDesignBode(G1,Mf)
omega=9.41
M=db2mag(-4.27)
phi=-180+Mf-(-109)


%3b
tau1=(M-cosd(phi))/(omega*sind(phi))
tau2=(cosd(phi)-(1/M))/(omega*sind(phi))
%tau1<tau2


%3c
s=tf('s')
Gc=(1+tau1*s)/(1+tau2*s)
figure,bode(G1)
grid on
hold on
bode(Gc*G1) %Gc*G1 è compensato


%3d
Gcl2=feedback(G1*Gc,1)
figure, step(Gcl2)
%vuole il peak