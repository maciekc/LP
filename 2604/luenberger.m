Km = 0.3309;
T = 0.0471;
K = -0.1;
omega = 1/0.231;
psi = 0.00965/omega^2;

Al = [-1/T 0 0;
      0    0 1;
      -K*omega^2/T -omega^2 -2*psi*omega];
Bl = [Km/T;0;K*Km*omega^2/T];
Cl = [1 0 0;
      0 1 0];
  
Dl = [0;0];


Ob = obsv(Al,Cl);
rank(Ob)

L = transpose(place(transpose(Al),transpose(Cl), [-1 -0.9 -1.1]));