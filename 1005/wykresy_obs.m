load('os_x.mat')
%%
close all

figure(5235134)
plot(estymata.time, estymata.signals.values(:,1),'b')
hold on
grid on
plot(wsp.time, wsp.signals.values(:,2),'r')
legend('obserwator','obiekt')
xlabel('czas [s]')
ylabel('x [m]')
axis([0 15 0 0.2])
%%
figure(14121241)
plot(estymata.time, estymata.signals.values(:,3),'b')
hold on
grid on
plot(wsp.time, wsp.signals.values(:,4),'r')
legend('obserwator','obiekt')
xlabel('czas [s]')
ylabel('\alpha [rad]')

%%
%wykresy z regulatorem 
% os Y
close all

figure(35235134)
plot(zad.Time, zad.Data,'r')
grid on
hold on
plot(obs_y.time, obs_y.signals(2).values,'b')

legend('war. zadana','po³o¿enie')
xlabel('czas [s]')
ylabel('y [m]')
axis([0 30 0 0.23])

figure(124121241)
plot(obs_y.time, obs_y.signals(1).values,'b')
grid on
% legend('obiekt')
xlabel('czas [s]')
ylabel('\beta [rad]')
axis([0 30 -0.035 0.065])
