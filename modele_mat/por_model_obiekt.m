Tk = 6;

sim('model_reg_silnik',Tk);
    
data1 = load('regPID_X.mat');
t = data1.wsp.time;
y = data1.wsp.signals.values(:,2) - data1.wsp.signals.values(1,2);
t = t(1:Tk*1000+1);
y = y(1:Tk*1000+1);
t = data1.zad.time;
ster_o = data1.zad.signals.values();
ster_o = ster_o(1:Tk*1000+1);
   
figure(2)
t = newX.time;
yc = newX.signals.values();
t = t(1:Tk*1000+1);
yc = yc(1:Tk*1000+1);
plot(t,y,'r')
hold on 
grid on
plot(t,yc,'b')
title('Porównanie odpowiedzi obiektu i modelu')
legend('obiekt','model')

figure(3)
t = ster.time;
ster = ster.signals.values();

plot(t,ster_o,'r')
hold on 
grid on
plot(t,ster,'b')
title('Porównnie sterowania obiektu i modelu');
legend('U obiekt','U model')
axis([0 Tk -0.2 1.2])

figure(4)
plot(t,angle.signals(1).values(),'b')
hold on 
grid on
title('Porównnie przebiegów k¹tów');
legend('bez t³umienia','z t³umieniem')
xlabel('czas [s]');
ylabel('\alpha [rad]');