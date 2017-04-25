close all

dane
%-----------------------------------------------------------------------
% estymacja modelu k¹tów

global beta t Tk omega
global par_table

Tk = 30;
X0(1) = 1.2; %wzmocnienie
X0(2) = 0.18;
par_table = [];

data1 = load('pomiary\przebiegX+.mat');
t = data1.wsp.time;
beta = data1.y_angla1.signals.values;
% figure(999)
% plot(data1.sterowanie.time,data1.sterowanie.signals.values);

% options = optimoptions(@lsqnonlin,'Display','iter');
% par = lsqnonlin(@celAngle, X0, [],[],options)
% tabMW = [1;par_table(1,1)];

% for i =2:1:size(par_table,2)
%     s = size(tabMW,2);
%     if tabMW(2,s) ~= par_table(1,i) 
%         tabMW = [tabMW [s+1;par_table(1,i)]];
%     end
% end
%omega = 0.182;
figure(1234)
grid on;
hold on;
plot(t, beta,'r')
psi = 0;
% K = par(1);
% T = par(2);
sim('model_kat',Tk);
plot(newAngle.Time,newAngle.Data,'b')
legend('pomiar','model');
%%
% r = size(tabMW,2);
% MW = tabMW(2,:);
% 
% figure(1)
% plot(tabMW(1,:),MW,'or');
% 
% l = legend('MW', 'Location','east');
% grid on
% axis([0 r min((MW))-1 max(MW)+1]);
% xlabel('iteracja');
% title('Estymacja parametrów');
% % print('D:/studia/IV_rok/sem_8/PROBLEEMOWE/sprawozdanie/fig/par_y','-depsc')
% 
% %%
% reg_PD = 1;
% sim('model_reg_silnik',Tk);
%     
% data1 = load('regPID_X.mat');
% t = data1.wsp.time;
% y = data1.wsp.signals.values(:,2) - data1.wsp.signals.values(1,2);
% t = t(1:Tk*1000+1);
% y = y(1:Tk*1000+1);
% t = data1.zad.time;
% ster_o = data1.zad.signals.values();
% ster_o = ster_o(1:Tk*1000+1);
%    
% figure(2)
% t = newX.time;
% yc = newX.signals.values();
% t = t(1:Tk*1000+1);
% yc = yc(1:Tk*1000+1);
% plot(t,y,'r')
% hold on 
% grid on
% plot(t,yc,'b')
% title('Porównanie odpowiedzi obiektu i modelu')
% legend('obiekt','model')
% xlabel('czas [s]');
% ylabel('x [m]');
% 
% figure(3)
% t = ster.time;
% ster = ster.signals.values();
% 
% plot(t,ster_o,'r')
% hold on 
% grid on
% plot(t,ster,'b')
% title('Porównnie sterowania obiektu i modelu');
% legend('U obiekt','U model')
% axis([0 Tk -0.2 1.2])
% xlabel('czas [s]');
% ylabel('sterowanie [PWM]');
% 
% figure(4)
% plot(t,angle.signals(1).values(),'b')
% hold on 
% grid on
% title('Porównnie przebiegów k¹tów');
% legend('bez t³umienia','z t³umieniem')
% xlabel('czas [s]');
% ylabel('\alpha [rad]');

