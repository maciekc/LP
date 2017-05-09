%------------------------------------------------------
% rysowanie przebgow wozka dla roznych dlugosci liny
clear all
dane

kat_x = load('kat_x.mat');
kat_y = load('kat_y.mat');

%[A,B,C,D] = tf2ss([0.107],[omega^2 0 1]);
k = 0.107;
omega = 0.231;

X0 = [0.293 0];
t0=1.757;
beta = 0.00965;

omega0 = 1/((4.333^2 - beta^2)^0.5);

A = [0 1; 
    -1/omega0^2 -2*beta*omega0];
B = [0; k/omega0^2];
C = [1 0];
D = 0;

Ao = A;
Bo = B;
Co = C;
Do = D;

sim('katy_sym',30);

kat_s.signals.values(t0*1000:end) = kat_s.signals.values(1:end - t0*1000+1);
kat_s.signals.values(1:t0*1000) = X0(1);

close all;
figure(4343)
% subplot(211)
hold on
grid on
plot(kat_x.wsp2.time, kat_x.wsp2.signals.values,'r');
plot(kat_s.time , kat_s.signals.values, 'b')
xlabel('czas [s]')
ylabel('\alpha [rad]')
legend('obiekt','symulacja')

%%
%-------------------------------------------------------------------------
%k¹t y

kat_y = load('kat_y.mat');

k = 0.09107;
om = 4.37;
omega = 1/om;%0.231;

X0 = [0.2738 0];
t0=1.803;%1.757;
beta = 0.02965;
% beta = 12.621*10^-4;

omega0 = 1/((om^2 + beta^2)^0.5);
% omega0 = om/((1 - beta^2)^0.5);

A = [0 1; 
    -1/omega0^2 -2*beta*omega0];
B = [0; k/omega0^2];
C = [1 0];
D = 0;
% A = [0 1; 
%     -omega0^2 -2*beta*omega0];
% B = [0; k*omega0^2];
% C = [1 0];
% D = 0;


beta0 = beta;%0.0175;
omega01 = 1/((4.349^2 + beta0^2)^0.5);
k1 = 0.09807;

Ao = [0 1; 
    -1/omega01^2 -2*beta0*omega01];
Bo = [0; k1/omega01^2];
Co = [1 0];
Do = 0;

sim('katy_sym',30);

kat_s.signals.values(t0*1000:end) = kat_s.signals.values(1:end - t0*1000+1);
kat_s.signals.values(1:t0*1000) = X0(1);

kat_o.signals.values(t0*1000:end) = kat_o.signals.values(1:end - t0*1000+1);
kat_o.signals.values(1:t0*1000) = X0(1);

close all;
figure(4343)
% subplot(211)
hold on
grid on
plot(kat_o.time , kat_o.signals.values,'r');
plot(kat_s.time , kat_s.signals.values, 'b')
xlabel('czas [s]')
ylabel('\beta [rad]')
legend('obiekt','symulacja')


%---------------------------------------------------------------------------
%wyrysowanie katow dla eksperymaentu

figure(5463)
plot(kat_y.wsp3.time, kat_y.wsp3.signals.values - 0.02685,'r')
grid on
hold on;
plot(kat_y.wsp3.time, kat_s.signals.values,'b')
xlabel('czas [s]')
ylabel('\beta [rad]')
legend('obiekt','symulacja')
%%
figure(121312)
fs = 1000;
[coh, f] = mscohere(kat_o.signals.values, kat_s.signals.values,[],[],[],fs);
plot(f,coh)
ax = gca;
ax.YLabel.String = [];
ax.Title = []