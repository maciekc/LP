close all
clear all

global U1 uxc uyc;

global xs sy mw ms mc Rn g x0 p lin limit
%dane modelu str. 84
xs = 1.5;   % szeroko�� suwnicy
sy = 2.5;   % d� suwnicy
mw = 1.155;%2.49;  % masa w�zka
ms = 2.2;%4.09;  % masa szyny
mc = 1;     % masa ci�arka
Rn = 0.0185;% promien blok�w napedzajacych
g = 9.81;
p = 60;
limit = 20;
lin = 1;
if(lin ~= 1)
    x0 = [0   0   0    0   pi/2   0    0   0   0.15   0]';
else
    x0 = [0   0   0    0   0   0    0   0   0.15   0]';
end

Tk = 6;

reg_PD = 0; %w��czone/wy��czone t�umienie