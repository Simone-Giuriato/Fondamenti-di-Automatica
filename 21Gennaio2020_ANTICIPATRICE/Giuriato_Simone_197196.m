%Giuriato Simone 

%Es1
%1.a
script_iniziale
sys=ss(A,B,C,D)
G=tf(sys)

%1.b
pole(G)
eig(A)
%poli e autovalori coincidono infatti il sistema é
% completamente osservabile e controllabile

%Es2

%2.a
k=1
Gcl=feedback(k*G,1)%feedback calcola funzione trasf in retroazione Gcl
figure,step(Gcl)%figure apre una scheda, step disegna funzione a gradino
%stabile (va verso un punto 0.5)
%errore sarebbe 1-punto in cui si stabilizza (carattheristic-->steady)

%se chiede errore:
kp=k*dcgain(G); %trovo guadagno statico, non mettere Gcl ma solo G e se avessi un altro blocco in retorazione G*K (qui è G*1 dove 1 è la retorazione)
e=1/(1+kp)%trovo errore a regime con formula dove serve guadagno statico

%che è uguale a y=1-errore
y=1-e

%se diceva trova k tramite l errore, devo dichiare syms k cosante
%simbolica, faccio passaggi dell errore e poi
k=solve(ep=0.05,k) %mi da in frazione vogli double
k=double(k)

% e poi magari col k trovi la funzione trasferimento e fai il 2.a con
% feedback e step
%2.b
figure, rlocus(G) %mi chiede luogo radici con rlocus faccio
%apre la figura, trovo intersezione con asse y positivo e prendo punto più vicino, prendo il
%Gain che è 25.3 e lo assegno a klim
klim=25.3

%se ti fa usare margine d'ampiezza ti trova un valore più preciso:
klim=margin(G) %qui fai senza passre per figura, se ci fosse G in retro H dovevi mettere G*H


%es2.c
%faccio come in 2.a ma con k che mi dice lui come è fatto col mio klim che
%è il gain
k1=0.8*klim
Gcl1=feedback(k1*G,1)
figure,step(Gcl1) %ricordarsi di mettere siitng(assestamento) time o peak a seconda di quello che chiede e modificare nelle 
%Propriteis, opzioni, la percentuale di tempo assetamento. Matlab da di
%base 2%
%sistema stabile (si stabilizza in unico punto)

%Es3 rete ANTICIPATRICE (alpha=tau2/tau1), fosse ritarda (alpha=tau1/tau2)
%usa funzioni del prof lead--> anticipatrice, lag-->ritardatrice
%dati doi es 3
Mf=40
G1=klim*G

%3.a
leadNetDesignBode(G1,Mf)
omega=47.6 %linea rossa sopra la verde, prendo punto in blu, frequenza
M=db2mag(11.8)%Magnitude nel grafico sopra con frequenza che ho preso, CAMBIO SEGNO
phi=-180+Mf-(-210)%formule... che da lui

%3.b
tau1=(M-cosd(phi))/(omega*sind(phi))
tau2=(cosd(phi)-(-1/M))/(omega*sind(phi))
alpha=tau2/tau1 %verifico che rispetti i vincoli di alpha e quale tau piu piccolo

%3.c
s=tf('s')%mi serve s la dichiaro come funzione trasferminaeto di se stessa
Gc=(1+tau1*s)/(1+tau2*s)%formula Gc=1+tau...
figure,bode(G1)%grafico di Bode G1 (sistema non compensato senza controllore)
hold on %sovrappongo grafico successivo
bode(G1*Gc) %grafico bode sistema compensato perchè ho controllore Gc (non apro una nuova shceda lo voglio hold on)


%3.d
Gcl2=feedback(Gc*G1,1)% ricordo che G1 sarebbe G*klim, mi dice lui che è retroazione unitaria
figure,step(Gcl2)
%mettere temo assestamento da opzioni su 5% o ciò che duce lui
%mettere charattheristic setting time, e andarci sopra e salvare immagine





