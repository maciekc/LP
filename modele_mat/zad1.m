close all
clear all

global U1 uxc uyc;

global xs sy mw ms mc Rn g x0 p lin limit
%dane modelu str. 84
xs = 1.5;   % szerokoœæ suwnicy
sy = 2.5;   % d³ suwnicy
mw = 1.155;%2.49;  % masa wózka
ms = 2.2;%4.09;  % masa szyny
mc = 1;     % masa ciê¿arka
Rn = 0.0185;% promien bloków napedzajacych
g = 9.81;
p = 60;
limit = 20;
lin = 1;
if(lin ~= 1)
    x0 = [0   0   0    0   pi/2   0    0   0   0.15   0]';
else
    x0 = [0   0   0    0   0   0    0   0   0.15   0]';
end

%%
%--------------------------------------------------------------------------
%optymalizacja
X0 = [200, 0.01, 20, 100, 10];
     Px = X0(1);
     Ix = X0(2);
     Dx = X0(3);
     Pa = X0(4);
     Da = X0(5);
     %%
A = [-1 0 0 0 0;
     0 -1 0 0 0;
     0 0 -1 0 0;
     0 0 0 -1 0;
     0 0 0 0 -1;];
 B = [0 0 0 0 0]';
options = optimoptions(@fmincon,'Display','iter','MaxIterations',50);
wynik = fmincon(@cel, X0, A, B,[],[],[],[],[], options)

%%
%--------------------------------------------------------------------------
%maksymalny czas
T = 10;
%warunki pocz¹tkowe
%    xw  xw'  yw  yw'  al    al'  be  be'  R   R'
X0 = [0   0   0    0   pi/2   0    0   0   0.15   0]';

%wartosc zadana
%    xw    xw'  yw    yw'  al    al'  be  be'  R   R'
Z  = [0.25   0   0.4    0   pi/2   0    0   0   0.15   0]';

%sterowanie od czesci calkujacej
uxc = 0;
uyc = 0;

lin = 10; %1 - model liniowy, else nielinowy
[t,x, U] = rk4(@pop,X0, Z, T,lin);
if lin == 1
    x(:,5) = x(:,5) + pi/2;
end
%[t,x] = ode45(@(t,x)obiekt2(t,x),[0 10], X0);


%%
figure(1)
% -------------------------------------------------
% po³o¿enie wózka w osi x
subplot(3,2,1)
plot(t,x(:,1))
hold on
%plot(t,Z(1),'r')
plot([0,t(length(t))],[Z(1),Z(1)],'r')
grid on
xlabel('czas [s]')
ylabel('po³. wózka x[m]')

% -------------------------------------------------
% po³o¿enie wózka w osi y

subplot(3,2,2)
%plot(t(1:500),x(1:500,3))
plot(t,x(:,3))
hold on
%plot(t,Z(1),'r')
plot([0,t(length(t))],[Z(3),Z(3)],'r')
grid on
xlabel('czas [s]')
ylabel('po³. wózka y[m]')

% -------------------------------------------------
% po³o¿enie wahad³a kat alfa
subplot(3,2,3)
plot(t,x(:,5))
grid on
xlabel('czas [s]')
ylabel('Alfa [rad]')

% -------------------------------------------------
% po³o¿enie wahad³a kat beta
subplot(3,2,4)
%plot(t(1:500),x(1:500,7))
plot(t,x(:,7))

grid on
xlabel('czas [s]')
ylabel('Beta [rad]')

%-------------------------------------
% R
%-------------------------------------
% subplot(3,2,5)
% plot(t,x(:,9))
% grid on
% xlabel('czas [s]')
% ylabel('R [m]')

%-------------------------------------
% sterowanie
% ----------------------------
subplot(3,2,5)
plot(t,U(:,1))
grid on
xlabel('czas [s]')
ylabel('U_x [N]')

subplot(3,2,6)
plot(t,U(:,2))
grid on
xlabel('czas [s]')
ylabel('U_y [N]')

%%
%--------------------------------------------------
% predkosc wozka
%--------------------------------------------------
figure(2)
% -------------------------------------------------
% po³o¿enie wózka w osi x
subplot(3,2,1)
plot(t,x(:,2))
hold on
%plot(t,Z(1),'r')
%plot([0,t(length(t))],[Z(1),Z(1)],'r')
grid on
xlabel('czas [s]')
ylabel('V_x[m/s]')

% -------------------------------------------------
% po³o¿enie wózka w osi y

subplot(3,2,2)
%plot(t(1:500),x(1:500,3))
plot(t,x(:,4))
hold on
%plot(t,Z(1),'r')
%plot([0,t(length(t))],[Z(3),Z(3)],'r')
grid on
xlabel('czas [s]')
ylabel('V_y[m/s]')

% -------------------------------------------------
% po³o¿enie wahad³a kat alfa
subplot(3,2,3)
plot(t,x(:,5))
grid on
xlabel('czas [s]')
ylabel('Alfa [rad]')

% -------------------------------------------------
% po³o¿enie wahad³a kat beta
subplot(3,2,4)
%plot(t(1:500),x(1:500,7))
plot(t,x(:,7))

grid on
xlabel('czas [s]')
ylabel('Beta [rad]')

%-------------------------------------
% R
%-------------------------------------
% subplot(3,2,5)
% plot(t,x(:,9))
% grid on
% xlabel('czas [s]')
% ylabel('R [m]')

%-------------------------------------
% sterowanie
% ----------------------------
subplot(3,2,5)
plot(t,U(:,1))
grid on
xlabel('czas [s]')
ylabel('U_x [N]')

subplot(3,2,6)
plot(t,U(:,2))
grid on
xlabel('czas [s]')
ylabel('U_y [N]')

%%
figure(3)
% -------------------------------------------------

% -------------------------------------------------
% po³o¿enie wahad³a kat alfa
subplot(2,2,1)
plot(t,x(:,9))
grid on
xlabel('czas [s]')
ylabel('Alfa [rad]')

% -------------------------------------------------
% po³o¿enie wahad³a kat beta
subplot(2,2,2)
%plot(t(1:500),x(1:500,7))
plot(t,x(:,10))

grid on
xlabel('czas [s]')
ylabel('Beta [rad]')

%-------------------------------------
% R
%-------------------------------------
% subplot(3,2,5)
% plot(t,x(:,9))
% grid on
% xlabel('czas [s]')
% ylabel('R [m]')

%-------------------------------------
% sterowanie
% ----------------------------
subplot(2,2,3)
plot(t,U(:,3))
grid on
xlabel('czas [s]')
ylabel('U_z [N]')

subplot(2,2,4)
plot(t,U(:,3))
grid on
xlabel('czas [s]')
ylabel('U_z [N]')