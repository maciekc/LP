close all
clear all

dane
X0 = [0 0];


KT=-1/32;

k = -0.09107;
om = 4.37;
omega = 1/om;%0.231;

t0=1.803;%1.757;
beta = 0.02965;

omega0 = 1/((om^2 + beta^2)^0.5);

A = [0 1; 
    -1/omega0^2 -2*beta*omega0];
B = [0; k/omega0^2];
C = [1 0];
D = 0;

% pol_x = load('D:\studia\IV_rok\sem_8\PROBLEEMOWE\1204\LP-master\wszystko\wazne\pomiary\osY_bez_t.mat');
pol_x = load('reg_y_50_tlumienie.mat');
% pol_x = load('reg_x_50.mat');

to = pol_x.wsp.time;
xo = pol_x.wsp.signals.values(:,1) - pol_x.wsp.signals.values(1,1);

alpha_o = pol_x.x_angla.signals.values;
t_oa = pol_x.x_angla.time;


sim('poprawiony_model_all_Y2014',30);
%%
figure(876)
hold on
grid on
plot(x.time, x.signals.values,'b')
plot(pol_x.wsp.time, xo,'r');
legend('model','obiekt')
xlabel('czas [s]')
ylabel('y [m]')

figure(8736)
hold on
grid on
plot(kat.time, kat.signals.values,'b')
plot(pol_x.wsp.time, alpha_o-alpha_o(1),'r');
legend('model','obiekt')
xlabel('czas [s]')
ylabel('\beta [rad]')


