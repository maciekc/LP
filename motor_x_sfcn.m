function [sys,x0,str,ts]=motor_x_sfcn(t,x,u,flag)
switch flag
case 0 % inicjalizacja
str = [];
ts = [0 0];
s = simsizes;
s.NumContStates = 2; % liczba stanów ci¹g³ych
s.NumDiscStates = 0; % liczba stanów dyskretnych
s.NumOutputs = 2; % liczba wyjœæ
s.NumInputs = 2; % liczba wejœæ
s.DirFeedthrough = 0; % wejœcie nie przenosi siê bezpoœrednio na wyjœcie
s.NumSampleTimes = 1; % czas próbkowania
sys = simsizes(s);
%x0 = [W0, I0];
x0 = [0 0];
case 1 % pochodne
aw = u(1);
U = u(2);
sys = motor_x(x,U,aw);
 
case 3 % wyjœcie
sys = x;
case {2 4 9}
sys =[];
otherwise
error(['unhandled flag =',num2str(flag)]);
end



