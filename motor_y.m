function [ dx ] = motor_y(x, u, aw)

    global xs sy mw ms mc Rn g
    
    w = x(1); %predkosc koatowa
    i = x(2); % prad
    
    %----------------------------------------------------------------------
    %parametry silnika
    %----------------------------------------------------------------------

    J = 1.1418*10^(-6);   %moment bezwladnisci
    tau_e = 0.48*10^(-3);
    tau_m = 21*10^(-3);                                                                             
    Ke = 0.02607;  %stala elektryczna
    Km = 0.0265    %stala mechaniczna
    R = 12.5;      %opornosc
    L = 5.93*10^(-3);    %indukcyjnosc
    
    M = mw + mc + ms;
    
    w = x(1);
    i = x(2);
    dw = Km/J * i - aw * M * Rn / J;
    di = u/L - R/L - Ke * w / L;

    dx = [dw, di];
end
