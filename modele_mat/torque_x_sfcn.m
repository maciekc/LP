function [sys,str,ts]=torque_x_sfcn(t,x,u,flag)
global x22
switch flag
case 0 % inicjalizacja
str = [];
ts = [0 0];
s = simsizes;
s.NumContStates = 0; % liczba stan�w ci�g�ych
s.NumDiscStates = 0; % liczba stan�w dyskretnych
s.NumOutputs = 3; % liczba wyj��
s.NumInputs = 13; % liczba wej��
s.DirFeedthrough = 0; % wej�cie nie przenosi si� bezpo�rednio na wyj�cie
s.NumSampleTimes = 1; % czas pr�bkowania
sys = simsizes(s);
%x0 = [W0, I0];

case 1 % pochodne
%aw = u(1);
%U = u(2);
% sys  = torque_x(x,u)
% x0;
case 3 % wyj�cie
sys = torque_x(x,u);
case {2 4 9}
sys =[];
otherwise
error(['unhandled flag =',num2str(flag)]);
end



