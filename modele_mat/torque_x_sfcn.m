function [sys,str,ts]=torque_x_sfcn(t,x,u,flag)
global x22
switch flag
case 0 % inicjalizacja
str = [];
ts = [0 0];
s = simsizes;
s.NumContStates = 0; % liczba stanów ci¹g³ych
s.NumDiscStates = 0; % liczba stanów dyskretnych
s.NumOutputs = 3; % liczba wyjœæ
s.NumInputs = 13; % liczba wejœæ
s.DirFeedthrough = 0; % wejœcie nie przenosi siê bezpoœrednio na wyjœcie
s.NumSampleTimes = 1; % czas próbkowania
sys = simsizes(s);
%x0 = [W0, I0];

case 1 % pochodne
%aw = u(1);
%U = u(2);
% sys  = torque_x(x,u)
% x0;
case 3 % wyjœcie
sys = torque_x(x,u);
case {2 4 9}
sys =[];
otherwise
error(['unhandled flag =',num2str(flag)]);
end



