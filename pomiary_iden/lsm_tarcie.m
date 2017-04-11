close all
clear all
global y t Tk
global par_table
%K = 0.05
%T = 10
Tk = 26;
X0 = [0.5, 5, 5];
%     K    T  tau
par_table = [];

%-------------------------------------------------------------------------
%parametry i odpowiedŸ wzorcowa obiektu
K = 0.05;
T = 10;


data1 = load('tarcie_x.mat');
t = data1.EX1.time;
y = data1.EX1.signals.values(:,1) - data1.EX1.signals.values(1,1);
t = t(1:Tk*100+1);
y = y(1:Tk*100+1);
sim('zadana',Tk);

options = optimoptions(@lsqnonlin,'Display','iter');
par = lsqnonlin(@cel_t, X0, [0,0,1],[],options)
tabK = [1;par_table(1,1)];
tabT = [1;par_table(2,1)];
tabTau = [1;par_table(3,1)];

for i =2:1:size(par_table,2)
    s = size(tabK,2);
    if tabK(2,s) ~= par_table(1,i) || tabT(2,s) ~= par_table(2,i)
        tabK = [tabK [s+1;par_table(1,i)]];
        tabT = [tabT [s+1;par_table(2,i)]];
        tabTau = [tabTau [s+1;par_table(3,i)]];
    end
end
%%
r = size(tabK,2);
K2 = tabK(2,:);
T2 = tabT(2,:);
T2tau = tabTau(2,:);
figure(1)
plot(tabK(1,:),K2,'or');
hold on
plot(tabT(1,:),T2,'*b');
hold on
plot(tabTau(1,:),T2tau,'dg');
% plot([0 r], [K K], 'r');
% plot([0 r], [T T], 'b');
l = legend('K`', 'T`', 'tau`', 'Location','east');
%title(l,'legenda');%, 'K','T');
grid on
axis([0 r min([min(T2),min(K2), min(T2tau)])-1 max([max(T2),max(K2), max(T2tau)])+1]);
xlabel('iteracja');
title('Estymacja parametrów');
print('D:/studia/IV_rok/sem_8/PROBLEEMOWE/sprawozdanie/fig/par_xt','-depsc')


K = par(1);
T = par(2);
tau = par(3);
sim('model_sim_t',Tk);
yc = data.signals(1).values();
t = data.time;


figure(2)
subplot(211)
plot(t,y,'b')
hold on
plot(t, yc, 'r')
grid on
l = legend('Y','Y_est','Location','northeast');
%title(l,'legenda');
xlabel('czas [s]');
ylabel('przemieszczenie x[m]');

subplot(212)
plot(ramp.Time, ramp.Data);
grid on;
xlabel('czas [s]');
ylabel('sterowanie ');
%axis([0 10 -0.6 0.6]);
print('D:/studia/IV_rok/sem_8/PROBLEEMOWE/sprawozdanie/fig/prze_xt','-depsc')




% close all
% 
% global y t Tk
% global par_table
% %K = 0.05
% %T = 10
% Tk = 26;
% X0 = [0.5, 5, 5];
% %     K    T  tau
% par_table = [];
% 
% %-------------------------------------------------------------------------
% %parametry i odpowiedŸ wzorcowa obiektu
% K = 0.05;
% T = 10;
% % sim('model_sim',40);
% % t = data.time;
% % u = data.signals(2).values();
% % y = data.signals(1).values();
% 
% data1 = load('tarcie_x.mat')
% t = data1.EX1.time;
% y = data1.EX1.signals.values(:,1) - data1.EX1.signals.values(1,1);
% t = t(1:Tk*100+1);
% y = y(1:Tk*100+1);
% 
% options = optimoptions(@lsqnonlin,'Display','iter');
% par = lsqnonlin(@cel, X0, [0,0,1],[],options)
% tabK = [1;par_table(1,1)];
% tabT = [1;par_table(2,1)];
% tabTau = [1;par_table(3,1)];
% 
% for i =2:1:size(par_table,2)
%     s = size(tabK,2);
%     if tabK(2,s) ~= par_table(1,i) || tabT(2,s) ~= par_table(2,i)
%         tabK = [tabK [s+1;par_table(1,i)]];
%         tabT = [tabT [s+1;par_table(2,i)]];
%         tabTau = [tabTau [s+1;par_table(3,i)]];
%     end
% end
% %%
% r = size(tabK,2);
% K2 = tabK(2,:);
% T2 = tabT(2,:);
% T2tau = tabTau(2,:);
% figure(1)
% plot(tabK(1,:),K2,'or');
% hold on
% plot(tabT(1,:),T2,'*b');
% hold on
% plot(tabTau(1,:),T2tau,'dg');
% % plot([0 r], [K K], 'r');
% % plot([0 r], [T T], 'b');
% l = legend('K`', 'T`', 'tau`','Location','east');
% %title(l,'legenda');%, 'K','T');
% grid on
% axis([0 r min([min(T2),min(K2),min(T2tau)])-1 max([max(T2),max(K2),max(T2tau)])+1]);
% xlabel('iteracja');
% title('Estymacja parametrów');
% print('D:/studia/IV_rok/sem_8/PROBLEEMOWE/sprawozdanie/fig/par_x','-depsc')
% 
% 
% K = par(1);
% T = par(2);
% tau = par(3);
% sim('model_sim',Tk);
% yc = data.signals(1).values();
% t = data.time;
% 
% 
% figure(2)
% %subplot(212)
% plot(t,y,'b')
% hold on
% plot(t, yc, 'r')
% grid on
% l = legend('Y','Y_est','Location','east');
% %title(l,'legenda');
% xlabel('czas [s]');
% ylabel('przemieszczenie x[m]');
% print('D:/studia/IV_rok/sem_8/PROBLEEMOWE/sprawozdanie/fig/prze_x','-depsc')
% 
% 
% 
