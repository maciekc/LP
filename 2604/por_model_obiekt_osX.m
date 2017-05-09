close all
clear all

dane
X0 = [0 0];

k = -0.1;

KT=-1/32;
omega = 0.231;

t0=1.757;
beta = 0.00965;

omega0 = 1/((1/omega^2 + beta^2)^0.5);
% omega0 = (0.25/g)^0.5;
% omega0 = 0.16334;

A = [0 1; 
    -1/omega0^2 -2*beta*omega0];
B = [0; k/omega0^2];
C = [1 0];
D = 0;

% pol_x = load('pomiary\osX_bez_t.mat');
pol_x = load('reg_x_50_tlumienie.mat');
% pol_x = load('reg_x_50.mat');

sim('poprawiony_model_all_X2014',30);
%%
figure(876)
hold on
grid on
plot(x.time, x.signals.values,'b')
plot(pol_x.wsp.time, pol_x.wsp.signals.values(:,2),'r');
legend('model','obiekt')
xlabel('czas [s]')
ylabel('x [m]')

figure(8736)
hold on
grid on
plot(kat.time, kat.signals.values,'b')
plot(pol_x.wsp.time, pol_x.y_angla1.signals.values,'r');
legend('model','obiekt')
xlabel('czas [s]')
ylabel('\alpha [rad]')

%%
%badanie koherencji poomiêdzy sygnalami
% figure(121312)
% fs = 1000;
% [coh, f] = mscohere(kat.signals.values, pol_x.y_angla1.signals.values);
% plot(f,coh)
% ax = gca;
% ax.YLabel.String = [];
% ax.Title = []
