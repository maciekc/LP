close all
clear all

dane

Tx = 0.0471;
Kx = 0.3309;

R = x0(9);
a23 = -(mc/mw * g + g)/(R*Tx);

A = [0  1        0       0;
    0 -1/Tx a23*mc*R^2/p 0;
    0  0         0       1;
    0  0       a23*Tx    0];

B = [0 (Kx + mc*R)/ Tx 0 1/R]';

C = [1 0 0 0;
     0 0 1 0];
I = eye(4);
 
D = [0;0];
 
rank(obsv(A,C))

L = transpose(place(transpose(A),transpose(C), [-30 -12 -11 -13]));