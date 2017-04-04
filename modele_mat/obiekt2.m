function [ dx ] = obiekt2(t, x)

limit = 10;
lin = 1;
global U1;
zadana  = [0.05   0   0.06    0   pi/2   0    0   0   1   0]';

    %-------------------------------------------------
    %sterowanie
    
    
    ux = zadana(1) - x(1); 
        uy = zadana(3) - x(3); 
     
        ux = ux * 10;
        uy = uy * 10;
        if ux< -limit
            ux = -limit;
        elseif ux > limit
            ux = limit;
        else
            ux = ux;
        end
        
        if uy< -limit
            uy = -limit;
        elseif uy > limit
            uy = limit;
        else
            uy = uy;
        end
        u = [ux; uy; 0];
        U1 = [U1, u];
    %------------------------------------------------------
    
    %dane modelu str. 84
    xs = 1.5;   % szerokoœæ suwnicy
    sy = 2.5;   % d³ suwnicy
    mw = 2.49;  % masa wózka
    ms = 4.09;  % masa szyny
    mc = 1;     % masa ciê¿arka
    Rn = 0.0185;% promien bloków napedzajacych
    g = 9.81;
    
    %wsp tarcia
    k1 = 75;%350;
    k2 = 75;%375;
    k3 = 75;%416;
    %si³y tarcia
    Tx = k1*mw*x(2);
    Ty = k2*(mw+ms)*x(4);
    Tr = k3*mc*x(10);
    
    T1 = Tx/mw;
    T2 = Ty/(mw+mc);
    T3 = Tr/mc;
    
    N1 = u(1) - T1;
    N2 = u(2) - T2;
    N3 = u(3) - T3;
    
    ni1 = mc/mw;
    ni2 = mc/(mw + ms);
    
    if lin == 1%model liniowy
        dx= zeros(10,1);
        dx(1) = x(2);
        dx(2) = N1-ni1*x(5)*N3;
        dx(3) = x(4);
        dx(4) = N2-ni2*x(7)*N3;
        dx(5) = x(6);
        dx(6) = (N1-ni1*x(5)*N3 - g*x(5)-2*x(6)*x(10))/x(9); 
        dx(7) = x(8);
        dx(8) = (N2-ni2*x(7)*N3+g*x(7)+2*x(8)*x(10))/x(9);
        dx(9) = x(10);
        dx(10) = N3 +g;
    
    else %model nieliniowy
        dx= zeros(10,1);
        
        V5 = cos(x(5))*sin(x(5))*(x(8))^2*x(9) - 2*x(10)*x(6) + g*cos(x(5))*cos(x(7));
        V6 = 2*x(8)*(cos(x(5))*x(6)*x(9) + sin(x(5))*x(10)) + g*sin(x(7));
        V7 = (sin(x(5)))^2*(x(8))^2*x(9) + g*sin(x(5))*cos(x(7)) + x(6)*x(6)*x(9);
        dx(1) = x(2);
        dx(2) = N1-ni1*cos(x(5))*N3;
        dx(3) = x(4);
        dx(4) = N2-ni2*sin(x(7))*sin(x(5))*N3;
        dx(5) = x(6);
        dx(6) = (sin(x(5))*N1 - N2*sin(x(7))*cos(x(5))  + (ni1 - ni2*(sin(x(7)))^2)*sin(x(5))*cos(x(5))*N3 - V5)/x(9); 
        dx(7) = x(8);
        dx(8) = -(cos(x(7))*N2 + ni2*sin(x(5))*sin(x(7))*cos(x(7))*N3 + V6)/(sin(x(5))*x(9));
        dx(9) = x(10);
        dx(10) = -cos(x(5))*N1 - sin(x(5))*sin(x(7))*N2 -(1+ni1*(cos(x(5)))^2+ni2*(sin(x(5)))^2*(sin(x(5)))^2)*N3+V7;
     end
    
end