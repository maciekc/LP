function [ dx] = all(x, U)

    lin = 2;
    global xs sy mw ms mc Rn g
    
    %wsp tarcia
    k1 = 82;%75;
    k2 = 100;%75;
    k3 = 75;%75;
    %si³y tarcia
    
    %----------------------------------------------------------------------
    %silnik
    
    w = x(11); %predkosc katowa
    i = x(12); % prad
    
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
    
    Mx = mw + mc;
    
    dwx = Km/J * i - dx(2) * Mx * Rn / J;
    dix = U/L - R*i/L - Ke * w / L;

    %dx = [dw, di];
    
    
    %----------------------------------------------------------------------
    %suwnica
    
    if x(2) >= 0 
        Tx = k1*mw*x(2) + 7.5;%10;
    else
        Tx = k1*mw*x(2) - 7.5;%10;
    end
    if x(4) >= 0 
        Ty = k2*(mw+ms)*x(4) + 5;%22;
    else
        Ty = k2*(mw+ms)*x(4) - 5;%22;
    end
    if x(10) >= 0
        Tr = -g*mc - x(10) * k3;%142;
    else
        Tr = g*mc - x(10) * k3;%218;
    end
    %Tr = k3*mc*x(10);
    
    T1 = Tx/mw;
    T2 = Ty/(mw+mc);
    T3 = Tr/mc;
    
    u = [dwx 0 0];
    u = u * Rn; % przejscie z przyspieszenia katowego na liniowe
    N1 = u(1) - T1;
    N2 = u(2) - T2;
    N3 = u(3) - T3;
    
    ni1 = mc/mw;
    ni2 = mc/(mw + ms);
    
    if lin == 1%model liniowy
        dx= zeros(10,1);
        dx(1) = x(2);                                       %xw
        dx(2) = N1-ni1*x(5)*N3;                             %xw'
        dx(3) = x(4);                                       %yw
        dx(4) = N2+ni2*x(7)*N3;                             %yw'
        dx(5) = x(6);                                       %a
        dx(6) = (N1-ni1*x(5)*N3 - g*x(5)-2*x(6)*x(10))/x(9);%a' 
        dx(7) = x(8);                                       %b    
        dx(8) = -(N2 + ni2*x(7)*N3 + g*x(7) + 2*x(8)*x(10))/x(9);  %b'
        dx(9) = x(10);                                      %R
        dx(10) = -N3 +g;                                    %R'
    
    else %model nieliniowy
        dx= zeros(10,1);
        
        V5 = cos(x(5))*sin(x(5))*(x(8))^2*x(9) - 2*x(10)*x(6) + g*cos(x(5))*cos(x(7));
        V6 = 2*x(8)*(cos(x(5))*x(6)*x(9) + sin(x(5))*x(10)) + g*sin(x(7));
        V7 = (sin(x(5)))^2*(x(8))^2*x(9) + g*sin(x(5))*cos(x(7)) + x(6)*x(6)*x(9);
        
        dx(1) = x(2);
        dx(2) = N1+ni1*cos(x(5))*N3;
        dx(3) = x(4);
        dx(4) = N2 + ni2*sin(x(7))*sin(x(5))*N3;
        dx(5) = x(6);
        dx(6) = (sin(x(5))*N1 - N2*sin(x(7))*cos(x(5))  + (ni1 - ni2*(sin(x(7)))^2)*sin(x(5))*cos(x(5))*N3 + V5)/x(9); 
        dx(7) = x(8);
        dx(8) = -(cos(x(7))*N2 + ni2*sin(x(5))*sin(x(7))*cos(x(7))*N3 + V6)/(sin(x(5))*x(9));
        dx(9) = x(10);
        dx(10) = -cos(x(5))*N1 - sin(x(5))*sin(x(7))*N2 -(1+ni1*(cos(x(5)))^2+ni2*(sin(x(5)))^2*(sin(x(7)))^2)*N3+V7;
     end
    
end