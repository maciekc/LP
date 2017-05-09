close all

%---------------------------------------------------------------------
% rysowanie tarcia

sim('zadana');

% data1 = load('tarcie_y+.mat')
% data2 = load('tarcie_y-.mat')
data1 = load('tarcie_x.mat')
data2 = load('tarcie_x-.mat')

% v1 = data1.EX1.signals.values(:,2) - data1.EX1.signals.values(1,2);
% v2 = data2.EX1.signals.values(1,2) - data2.EX1.signals.values(:,2);

v1 = data1.EX1.signals.values(:,1) - data1.EX1.signals.values(1,1);
v2 = data2.EX1.signals.values(1,1) - data2.EX1.signals.values(:,1);

%v2(2587:end) = v2(2586);
v2(2500:end) = v2(2499);

figure(1)
subplot(211)
hold on
grid on
yyaxis left
ylabel('y_w [m]')
plot(data1.EX1.time, v1)
yyaxis right
plot(ramp.Time, ramp.Data,'r')
legend('y+','U')
xlabel('czas [s]')
ylabel('U [PWM]')
xlim([0 20])

% axis([0 30 -0.1 0.6]);

subplot(212)
hold on
grid on
yyaxis left
ylabel('y_w [m]')
plot(data2.EX1.time, -v2)
yyaxis right
ylim([-0.2 0])
plot(ramp.Time, -ramp.Data, 'r')
legend('y-', 'U')
xlabel('czas [s]')
ylabel('U [PWM]')
xlim([0 20])
% axis([0 30 -0.6 0.1]);

%%
figure(2)
subplot(412)
%title('To = 0.001')
plot(data1.EX1.time, data1.EX1.signals.values(:,2)) 
grid on
xlabel('czas [s]')
ylabel('yw [m]')

subplot(413)
%title('To = 0.001')
plot(data1.EX1.time, data1.EX1.signals.values(:,3)) 
grid on
xlabel('czas [s]')
ylabel('\alpha [rad]')

subplot(414)
%title('To = 0.001')
plot(data1.EX1.time, data1.EX1.signals.values(:,4)) 
grid on
xlabel('czas [s]')
ylabel('\beta [rad]')

%%
%---------------------------------------------------------------------
%przebiegi symulacja tylko suwnica
close all
u = 1;
sim('model_suw_reg',10);
t = wsp.time;
x = wsp.signals(1).values();
vx = wsp.signals(2).values();
uu = ster.signals(1).values();

figure(1)
subplot(311)
plot(t,x,'b')
grid on
hold on 
%plot(zad.Time, zad.Data, 'r')
%legend('przemieszczenie [m]', 'war. zadana')
xlabel('czas [s]');
ylabel('x [m]');
subplot(312)
plot(t,vx)
grid on
hold on
xlabel('czas [s]');
ylabel('V_x [m/s]');
subplot(313)
plot(t,uu)
grid on
hold on
xlabel('czas [s]');
ylabel('sterowanie [m/s^2]');
%print('D:/studia/IV_rok/sem_8/PROBLEEMOWE/sprawozdanie/fig/wsp_suwnica_lin','-depsc')

%------------------------------------------------------------------
%katy
t = wsp.time;
a = katy.signals(1).values();
uu = ster.signals(1).values();

figure(2)
subplot(211)
plot(t,a)
grid on
hold on
xlabel('czas [s]');
ylabel('\alpha [rad]');
subplot(212)
plot(t,uu)
grid on
hold on
xlabel('czas [s]');
ylabel('sterowanie [m/s^2]');

%----------------------------------------------------------------------
% bez sterowania
u = 0;
sim('model_suw_reg',10);
t = wsp.time;
x = wsp.signals(1).values();
vx = wsp.signals(2).values();
uu = ster.signals(1).values();

figure(1)
subplot(311)
plot(t,x,'k')
grid on
hold on 
plot(zad.Time, zad.Data, 'r')
legend('z t³umieniem','bez t³umienia', 'war. zadana','Location','southeast')
xlabel('czas [s]');
ylabel('x [m]');
subplot(312)
plot(t,vx,'k')
grid on
xlabel('czas [s]');
ylabel('V_x [m/s]');
legend('z t³umieniem','bez t³umienia','Location','southwest');
subplot(313)
plot(t,uu,'k')
grid on
xlabel('czas [s]');
ylabel('sterowanie [m/s^2]');
legend('z t³umieniem','bez t³umienia', 'Location','best');
%print('D:/studia/IV_rok/sem_8/PROBLEEMOWE/sprawozdanie/fig/wsp_suwnica_lin','-depsc')

%------------------------------------------------------------------
%katy
t = wsp.time;
a = katy.signals(1).values();
uu = ster.signals(1).values();

figure(2)
subplot(211)
plot(t,a,'k')
grid on
xlabel('czas [s]');
ylabel('\alpha [rad]');
legend('z t³umieniem','bez t³umienia', 'Location','southeast');
subplot(212)
plot(t,uu,'k')
grid on
xlabel('czas [s]');
ylabel('sterowanie [m/s^2]');
legend('z t³umieniem','bez t³umienia', 'Location','northeast');
%print('D:/studia/IV_rok/sem_8/PROBLEEMOWE/sprawozdanie/fig/katy_suwnica_lin','-depsc')



