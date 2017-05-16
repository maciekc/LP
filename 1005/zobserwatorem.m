dane

%dane dla osi X
% Km = 0.3309;
% T = 0.0471;
% K = -0.1;
% omega = 1/0.231;
% psi = 0.00965/omega^2;

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

L = transpose(place(transpose(Al),transpose(Cl), [-11 -10 -9 -11]));
X0 = [0 0 0 0];
%%
%--------------------------------------------------------------------------
%porownanie obserwatora i obiektu
close all

figure(5235134)
plot(estymata.time, estymata.signals.values(:,1),'b')
hold on
grid on
plot(wsp.time, wsp.signals.values(:,1),'r')
legend('obserwator','obiekt')
xlabel('czas [s]')
ylabel('x [m]')

figure(14121241)
plot(estymata.time, estymata.signals.values(:,3),'b')
hold on
grid on
plot(wsp.time, wsp.signals.values(:,3),'r')
legend('obserwator','obiekt')
xlabel('czas [s]')
ylabel('\alpha [rad]')
