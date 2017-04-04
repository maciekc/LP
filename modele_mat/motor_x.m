function [ dx ] = motor_x(x, u, aw)

    global xs sy mw ms mc Rn g p
    
    w = x(1); %predkosc katowa
    i = x(2); % prad
    
    %----------------------------------------------------------------------
    %parametry silnika
    %----------------------------------------------------------------------
    %  TODO 
    %  policzyæ J
    J = 1.1418*10^(-6);   %moment bezwladnisci
    tau_e = 0.48*10^(-3);
    tau_m = 21*10^(-3);                                                                             
    Ke = 0.02607;  %stala elektryczna
    Km = 0.0265;    %stala mechaniczna
    R = 12.5;      %opornosc
    L = 5.93*10^(-3);    %indukcyjnosc
    
    M = mw + mc;
    
    dw = (Km * i - aw * M * Rn / p - 0.001* w) / J;
    di = (u - R*i - Ke * w) / L;

    dx = [dw, di];
end
