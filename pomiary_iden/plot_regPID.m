close all

Tk = 10;

data1 = load('redPID_X.mat');
t = data1.wsp.time;
y = data1.wsp.signals.values(:,2) - data1.wsp.signals.values(1,2);
t = t(1:Tk*1000+1);
y = y(1:Tk*1000+1);
z(1:1000) = 0;
z(1001:10001) = 0.2;
u = data1.zad.signals.values(1:Tk*1000+1);
figure(100)
subplot(211)
plot(t,y,'b');
hold on
grid on
axis([0 10 0 0.22]);
plot(t,z,'r');
subplot(212)
plot(t,u)
axis([0 10 -0.1 1.1]);
grid on
