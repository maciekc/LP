function wsk = celPID(X)

dane
X0 = [0 0];
reg_PD = -1;
KT=-1/32;
% 
% k = -0.1;
% 
% KT=-1/32;
% omega = 0.231;
% 
% beta = 0.00965;
% 
% omega0 = 1/((1/omega^2 + beta^2)^0.5);
% 
% A = [0 1; 
%     -1/omega0^2 -2*beta*omega0];
% B = [0; k/omega0^2];
% C = [1 0];
% D = 0;
limitT = 0.05;


k = -0.09107;
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
% assignin('base','X',X);

Pdx = X(1);
Dx = X(2);
Pr = X(3);
Ir = X(4);
Dr = X(5);

% set_param('poprawiony_model_all_X2014_2','AlgebraicLoopSolver','TrustRegion')
% opt = simset('SrcWorkspace','Current', 'solver','ode4', 'FixedStep', 0.001 )
% sim('poprawiony_model_all_X2014_2',10,opt);
opt = simset('SrcWorkspace','Current');

sim('poprawiony_model_all_X2014_2',10,opt);
% wsk = 1000 * sum(((kat.signals.values).^2)) + 10 * sum(((x.signals.values).^2));
wsk = 100*al.Data + xx.Data*2000 + 500 * max(all.Data);
end