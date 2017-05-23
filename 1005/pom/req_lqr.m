dane
clc

% load('os_y.mat')
%dane dla osi X
% Km = 0.3309;
% T = 0.0471;
% K = -0.1;
% omega = 1/0.231;
% psi = 0.00965/omega^2;
k = 0.09107;
om = 4.37;
omega = 1/om;%0.231;


beta = 0.02965;
% beta = 12.621*10^-4;

omega0 = 1/((om^2 + beta^2)^0.5);
% omega0 = om/((1 - beta^2)^0.5);

A = [0 1; 
    -1/omega0^2 -2*beta*omega0];
B = [0; k/omega0^2];
C = [1 0];
D = 0;
%dane dla osi Y
Km = 0.3184;
T = 0.0571;
K = -0.09107;
omega = 4.37;
psi = 0.02965/omega^2;


Al = [0  1     0 0;
      0 -1/T   0 0;
      0   0    0 1;
      0 -K*omega^2/T -omega^2 -2*psi*omega];
Bl = [0; Km/T; 0; K*Km*omega^2/T];
Cl = [1 0 0 0;
      0 0 1 0];

Dl = [0;0];

Ob = obsv(Al,Cl);
rank(Ob)

Q = [10 0 0 0;
     0  1 0 0;
     0  0 100 0;
     0  0 0 1];
R= 1;
 
L = transpose(place(transpose(Al),transpose(Cl), [-11 -10 -9 -11]));
X0 = [0 0 0 0];

Klqr = lqr(Al,Bl,Q,R);
for i =1:4
    if Klqr(i) < 0
        Klqr(i) = -Klqr(i);
    end
end
Klqr;
Amin = [-1 0 0 0 0;
         0 -1 0 0 0;
         0 0 -1 0 0;
         0 0 0 -1 0;
         0 0 0 0 -1];
Bmin = [0;0;0;0;0];
Q0 = [10 1 100 1 1]; 

% options = optimoptions(@fmincon,'Display','iter','MaxIterations',5);
% wynik = fmincon(@cel, Q0, Amin, Bmin,[],[],[],[],[], options);

%%
wynik = [3.9822 3.014 100.247 0.8601 11.7425];
% 100*ex + 10000*ealpha
Q = [wynik(1) 0 0 0;
     0  wynik(2) 0 0;
     0  0 wynik(3) 0;
     0  0 0 wynik(4)];
R = wynik(5);
Klqr = lqr(Al,Bl,Q,R)
% for i =1:4
%     if Klqr(i) < 0
%         Klqr(i) = -Klqr(i);
%     end
% end
% Klqr = [0.58232
% 0.1233
% 3.0552
% 0.526]';
% sim('reg_lqr2',30)

%%
wynik = [3.9822 3.014 100.247 0.8601 11.7425];
% 100*ex + 10000*ealpha
Q = [100 0 0 0;
     0  0 0 0;
     0  0 1 0;
     0  0 0 0];
R = 1;
Klqr = lqr(Al,Bl,Q,R);
% for i =1:4
%     if Klqr(i) < 0
%         Klqr(i) = -Klqr(i);
%     end
% end
Klqr 

%%
% close all
% 
% figure(5235134)
% plot(estymata.time, estymata.signals.values(:,1),'b')
% hold on
% grid on
% plot(wsp.time, wsp.signals.values(:,1),'r')
% legend('obserwator','obiekt')
% xlabel('czas [s]')
% ylabel('x [m]')
% 
% figure(14121241)
% plot(estymata.time, estymata.signals.values(:,3),'b')
% hold on
% grid on
% plot(wsp.time, wsp.signals.values(:,3),'r')
% legend('obserwator','obiekt')
% xlabel('czas [s]')
% ylabel('\alpha [rad]')


