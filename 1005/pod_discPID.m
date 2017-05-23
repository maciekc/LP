close all

Pdx = 10;
Dx = 0.01;
Pr = 10;
Ir = 0.005;
Dr = 2;

dane
X0 = [0 0];
reg_PD = -1;
KT=-1/32;

limitT = 0.05;

k = -0.09107;
om = 4.37;
omega = 1/om;%0.231;


beta = 0.02965;

omega0 = 1/((om^2 + beta^2)^0.5);

A = [0 1; 
    -1/omega0^2 -2*beta*omega0];
B = [0; k/omega0^2];
C = [1 0];
D = 0;

Ts0 = [0.01 0.005 0.001];

Jx = [];
Ja = [];
Ma = [];
col = ['b', 'r' , 'g'];
%%
for i=1:3
    
    Ts = Ts0(i);
    sim('discretePID2014',30)
    Jx(i) = xx.Data;
    Ja(i) = al.Data;
    Ma(i) = max(all.Data);
    figure(413241)
    plot(kat.time, kat.signals.values, col(i))
    hold on
    grid on
    figure(5342)
    plot(x.time, x.signals.values, col(i))
    grid on
    hold on
end
%%
figure(413241)
legend('f = 100 Hz','f = 200 Hz','f = 1000 Hz')
xlabel('czas [s]')
ylabel('\alpha [rad]')

figure(5342)
legend('f = 100 Hz','f = 200 Hz','f = 1000 Hz')
xlabel('czas [s]')
ylabel('x [m]')

Jx
Ja
Ma