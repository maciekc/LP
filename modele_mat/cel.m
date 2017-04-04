function wsk = cel(X0)
    
    global xs sy mw ms mc Rn g lin p x0 limit

    %X0 = [0 pi 0 0]'; % warunek pocz¹tkowy na polozenie wahadla
    
    %Px, Ix, Dx, Pa, Da

    J = 1.1418*10^(-6);   %moment bezwladnisci
    tau_e = 0.48*10^(-3);
    tau_m = 21*10^(-3);                                                                             
    Ke = 0.02607;  %stala elektryczna
    Km = 0.0265;    %stala mechaniczna
    R = 12.5;      %opornosc
    L = 5.93*10^(-3);    %indukcyjnosc

     
     Px = X0(1);
     Ix = X0(2);
     Dx = X0(3);
     Pa = X0(4);
     Da = X0(5);
     
    opt = simset('SrcWorkspace','Current');
    sim('model_sim',10,opt);
   
    wsk = 1000 * pol + 10 * max(kat);
end