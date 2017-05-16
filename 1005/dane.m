close all
clear all

global U1 uxc uyc;

global xs sy mw ms mc Rn g x0 p lin limit
%dane modelu str. 84
xs = 1.5;   % szerokoœæ suwnicy
sy = 2.5;   % d³ suwnicy
mw = 1.155;%2.49;  % masa wózka
ms = 2.2;%4.09;  % masa szyny
mc = 0.741;%1;     % masa ciê¿arka
Rn = 0.0185;% promien bloków napedzajacych
g = 9.81;
p = 60;
limit = 20;
lin = 1;
if(lin ~= 1)
    x0 = [0   0   0    0   pi/2   0    0   0   0.50   0]';
else
    x0 = [0   0   0    0   0   0    0   0   0.50   0]';
end

Tk = 6;

reg_PD = 0*-1; %w³¹czone -1 /wy³¹czone t³umienie

Pdy = 10;
Dy = 0.01;

Pdx = 10;
Dx = 0.01;

Kw = -0.7;
Tw = 0.182^2;
Aw1 = [0 1 0;
     -1/Tw 0 0;
     0 1 0];
Bw1 = [0; Kw/Tw; 0];


Aw = [0 1 ;
     -1/Tw 0];
Bw = [0; Kw/Tw];
Cw = [1 0;
     0 1];
Dw = [0;0];

% [A,B,C,D]=tf2ss(-0.108, [0.185^2 0 1]);

%omega = (x0(9)/g)^0.5;
omega = 1/4.4880;

limitT = 0.05;

T0 = 0.001;
