clear all
close all

zad(1:1000) = 0;
zad(1001:30001) = 0.2;
%%
close all
load('pom\Q5.mat')

figure(41221312)
subplot(211)
plot(wsp.time,wsp.signals.values(:,1)-0.1)
grid on
hold on
plot(wsp.time, zad,'r')
subplot(212)
plot(wsp.time, wsp.signals.values(:,3))
grid on

ea = zeros(1,9);
ex = zeros(1,9);
przer = zeros(1,9);
for i = 1:9
    load(strcat('pom\Q',num2str(i)))
    
    ea(i) = sum((wsp.signals.values(:,3)).^2*0.001);
    
    ex(i) = sum((wsp.signals.values(:,1)-zad').^2*0.001);
    
    przer(i) = max(wsp.signals.values(:,3));
end

ea
ex
przer

%%
close all
load('pom\Q7.mat')

zad(1:30001) = 0.2;
figure(41221312)
subplot(211)
plot(wsp.time, zad,'r')
hold on
plot(wsp.time,wsp.signals.values(:,1)-0.1,'b')
grid on
hold on
subplot(212)
plot(wsp.time, wsp.signals.values(:,3),'b')
grid on
hold on

figure(543141)
plot(sterowanie.time, sterowanie.signals.values,'b')
grid on 
hold on

load('pom\Q8.mat')

figure(41221312)
subplot(211)
plot(wsp.time,wsp.signals.values(:,1)-0.1,'g')

legend('war. zadana','reg. nr 7','reg. nr 8')
xlabel('czas [s]')
ylabel('x [m]')
axis([0 15 -0.1 0.38])
subplot(212)
plot(wsp.time, wsp.signals.values(:,3),'g')
grid on
legend('reg. nr 7','reg. nr 8')
xlabel('czas [s]')
ylabel('k¹t [rad]')
axis([0 15 -0.2 0.1])

figure(543141)
plot(sterowanie.time, sterowanie.signals.values,'g')
legend('reg. nr 1','reg. nr 4')
xlabel('czas [s]')
ylabel('sterowanie [PWM]')
axis([0 30 -0.8 1.1])
