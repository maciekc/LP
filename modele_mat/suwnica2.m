function [ dx ] = suwnica2(x, u)

    
    global xs sy mw ms mc Rn g lin
    
    N1 = u(1);
    N2 = u(2);
    N3 = g; 
    
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