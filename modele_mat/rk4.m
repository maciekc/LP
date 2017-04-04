function [t,x, U]=rk4(fun, x0,zadana,tf, lin)
%-----------------rk4, war. pocz, war. zadana, czas koncowy, lin = 1 -
%model liniowy else nieliniowy

    if lin == 1
        zadana(5) = zadana(5) - pi/2;
        x0(5) = x0(5) - pi/2;
    end
    n=length(x0);
    h=0.01;
    nt = tf/h;
    x=zeros(nt,n);
    tmp=zeros(n,1);
    xtmp=x0;
    x(1,:)=x0';
    t=0;
    dx1=zeros(n,1);dx2=dx1;dx3=dx1;dx4=dx1;
    h_2=h/2; h_6=h/6; h_26=2*h_6;
    
    limit = 20; %ograniczenie sterowania
    for i=1:nt
%         if i == 1
%             ux = zadana(1);
%             uy = zadana(3);
%         else
%             ux = zadana(1) - x(i,1); 
%             uy = zadana(3) - x(i,3); 
%         end
       
        u = ster(xtmp, zadana, limit);
        %u = [0.2, 0, 0];
        dx1=fun(xtmp,u,lin);
        tmp=xtmp+h_2*dx1;t=t+h_2;
        
        u = ster(tmp, zadana, limit);
        dx2=fun(tmp,u,lin);
        tmp=xtmp+h_2*dx2;
        
        u = ster(tmp, zadana, limit);
        dx3=fun(tmp,u,lin);
        tmp=xtmp+h*dx3;t=t+h_2;
        
        u = ster(tmp, zadana, limit);
        dx4=fun(tmp,u,lin);
        xtmp=xtmp+h_6*(dx1+dx4)+h_26*(dx2+dx3);
        
        x(i+1,:)=xtmp';
        U(i+1,:) = u;
    end
t=linspace(0,tf,nt+1)';