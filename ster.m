function [ u ] = ster( x, z, limit )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    global uxc uyc;
    Kx = 220;
    Ky = 250;
    Kz = 0;
    Tix = 0.005;
    Tiy = 0.002;
    
    ux = z(1) - x(1); 
    uy = z(3) - x(3);
    uz = z(9) - x(9);
    
    uxc = uxc + Tix*ux;
    uyc = uyc + Tiy*uy;

    ux = ux * Kx + uxc;
    uy = uy * Ky + uyc;
    uz = uz * Kz;
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

    if uz< -limit
        uz = -limit;
    elseif uz > limit
        uz = limit;
    else
        uz = uz;
    end
    u = [ux; uy; uz];
    %u = [0, 0, 0];
end

