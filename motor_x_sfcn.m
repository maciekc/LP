function [sys,x0,str,ts]=motor_x_sfcn(t,x,u,flag)
switch flag
case 0 % inicjalizacja
str = [];
ts = [0 0];
s = simsizes;
s.NumContStates = 2; % liczba stan�w ci�g�ych
s.NumDiscStates = 0; % liczba stan�w dyskretnych
s.NumOutputs = 2; % liczba wyj��
s.NumInputs = 2; % liczba wej��
s.DirFeedthrough = 0; % wej�cie nie przenosi si� bezpo�rednio na wyj�cie
s.NumSampleTimes = 1; % czas pr�bkowania
sys = simsizes(s);
%x0 = [W0, I0];
x0 = [0 0];
case 1 % pochodne
aw = u(1);
U = u(2);
sys = motor_x(x,U,aw);
 
case 3 % wyj�cie
sys = x;
case {2 4 9}
sys =[];
otherwise
error(['unhandled flag =',num2str(flag)]);
end



