function wsk = cel(X)

limitT = 0.05;


k = 0.09107;
om = 4.37;
omega = 1/om;%0.231;


beta = 0.02965;
% beta = 12.621*10^-4;

omega0 = 1/((om^2 + beta^2)^0.5);
% omega0 = om/((1 - beta^2)^0.5);

A = [0 1; 
    -1/omega0^2 -2*beta*omega0];
B = [0; k/omega0^2];
C = [1 0];
D = 0;

Km = 0.3184;
T = 0.0571;
K = -0.09107;
omega = 4.37;
psi = 0.02965/omega^2;


Al = [0  1     0 0;
      0 -1/T   0 0;
      0   0    0 1;
      0 -K*omega^2/T -omega^2 -2*psi*omega];
Bl = [0; Km/T; 0; K*Km*omega^2/T];
Cl = [1 0 0 0;
      0 0 1 0];

Dl = [0;0];

Q = [X(1) 0 0 0;
     0  X(2) 0 0;
     0  0 X(3) 0;
     0  0 0 X(4)];
R= X(5);
 
L = transpose(place(transpose(Al),transpose(Cl), [-11 -10 -9 -11]));
X0 = [0 0 0 0];

Klqr = lqr(Al,Bl,Q,R);
for i =1:4
    if Klqr(i) < 0
        Klqr(i) = -Klqr(i);
    end
end
% Klqr;

opt = simset('SrcWorkspace','Current');
sim('reg_lqr2',30,opt);
    
wsk = 1000*ex + 10000*ealpha;
end