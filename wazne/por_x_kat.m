close all
clear all

dane
%obserwator

load('pomiary\osX_bez_t.mat')
%sim('model_reg_silnik2014',30);
sim('poprawiony_model_all_X',30);

to = wsp.time;
xo = wsp.signals.values(:,2) - wsp.signals.values(1,2);

alpha_o = x_angla.signals.values;
t_oa = x_angla.time;

beta_o = y_angla1.signals.values;
t_ob = y_angla1.time;

% tas = angle.time;
% alpha_s = ster1.signals(1).values;
% % beta_s = angle.signals(2).values;
% beta_s = ster1.signals(1).values;
% 
% ts = newX.time;
% xs = newX.signals.values;
% % xs = ster1.signals(1).values;

czas = x.time;

figure(1111)
%title('porownanie katów obiekt model')
hold on 
grid on
% plot(tas, alpha_s-pi/2,'r')
plot(czas, kat.signals.values,'r')
plot(t_oa, beta_o,'b')
legend('model','obiekt')
xlabel('czas [s]')
ylabel('k¹t [m]')

figure(1112)
%title('porownanie x')
hold on 
grid on
plot(czas, x.signals.values,'r')
plot(to, xo,'b')
legend('model','obiekt')
axis([0 20 0 0.23]);
xlabel('czas [s]')
ylabel('x [m]')
%%
%--------------------------------------------------------------------------
% porownanie wzdluz osi Y
close all
clear all

dane

load('pomiary\osY_bez_t.mat')
%sim('model_reg_silnik2014',30);
sim('poprawiony_model_all_Y',30);

to = wsp.time;
xo = wsp.signals.values(:,1) - wsp.signals.values(1,1);

alpha_o = x_angla.signals.values;
t_oa = x_angla.time;

beta_o = y_angla1.signals.values;
t_ob = y_angla1.time;

czas = x.time;

figure(1111)
%title('porownanie katów obiekt model')
hold on 
grid on
% plot(tas, alpha_s-pi/2,'r')
plot(czas, kat.signals.values,'r')
plot(t_oa, alpha_o - alpha_o(1),'b')
legend('model','obiekt')
xlabel('czas [s]')
ylabel('k¹t [rad]')

figure(1112)
%title('porownanie x')
hold on 
grid on
plot(czas, x.signals.values,'r')
plot(to, xo,'b')
legend('model','obiekt')
xlabel('czas [s]')
ylabel('x [m]')