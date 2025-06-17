function  lagNetDesignBode(G,phaseMargin)
% lagNetDesignBode(G,phaseMargin) draws the Bode diagrams of Transfer
% Function G and adds two lines to assist the design of a phase lag 
% compensation network with the desired phaseMargin (in degrees): 
% - a green line at -180deg + phaseMargin
% - a red line showing the function R = arg(G) - acos(1/|G|)
% These lines allow to identify the frequency at which 
% realizability conditions of the inversion formulas for a 
% phase lag network are satisfied:
% 
% Inversion formulas for phase lag network Gc(s) = (1+tau1*s)/(1+tau2*s)
% that achieves gain attenuation M and phase phi at the frequency omega (NOTE: use sind()/cosd() if phi is in deg.):
% tau1 = (M - cos(phi))/(omega*sin(phi))
% tau2 = (cos(phi) - 1/M)/(omega*sin(phi))
%
% The design is completed, so that Gc*G has the desired phaseMargin, by
% selecting a given omega (at which the realizability conditions are 
% satisfied) and then setting:
% M = 1/|G(j*omega)|
% phi = -180deg + phaseMargin - arg(G(j*omega))
%
% Realizabilty conditions:
% M < 1, -90deg < phi < 0 and M < cos(phi)
% satisfied for omega selected within the interval of frequencies at which:
% - R (red line) is below -180deg+phaseMargin (green line)
% - arg(G) is above -180deg+phaseMargin (green line)

poles_G = sort(abs(pole(G)));
wmin = poles_G(1);
wmax = poles_G(end);

if wmin == 0
    wmin = poles_G(2);
end

om1 = wmin/100;
om2 = wmax*100;

[mag,phase,om]=bode(G,{om1,om2});
mag=squeeze(mag);
phase=squeeze(phase);

for i=1:length(mag)
    if mag(i)>1
        R(i) = phase(i) - acosd(1/mag(i));
    else R(i) = NaN;
    end
end
figure,bode(G,{om1,om2})
grid on
hold on
semilogx(om,R,'r')

phase_des=ones(length(mag),1)*(-180+phaseMargin);
semilogx(om,phase_des,'g')

end

