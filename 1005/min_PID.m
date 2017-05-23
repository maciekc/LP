clc
X0 = [0 0];

k = -0.1;

KT=-1/32;
omega = 0.231;

t0=1.757;
beta = 0.00965;

omega0 = 1/((1/omega^2 + beta^2)^0.5);

A = [0 1; 
    -1/omega0^2 -2*beta*omega0];
B = [0; k/omega0^2];
C = [1 0];
D = 0;


PX0 = [10 5 10 5 2];

Amin = [-1 0 0 0 0;
         0 -1 0 0 0;
         0 0 -1 0 0;
         0 0 0 -1 0;
         0 0 0 0 -1];
Bmin = [0;0;0;0;0]; 

reg_PD = -1;
KT=-1/32;

warning('off','all')
options = optimoptions(@fmincon,'Display','iter','MaxIterations',5);
wynik = fmincon(@celPID, PX0, Amin, Bmin,[],[],[],[],[], options);

%%
Pdx = wynik(1);
Dx = wynik(2);
Pr = wynik(3);
Ir = wynik(4);
Dr = wynik(5);

%    23.8693    0.2277    8.3209    0.3110    4.1513


%%
%k = -0.1;
Pdx = 10;
Dx = 0.01;
Pr = 10;
Ir = 0.005;
Dr = 2;