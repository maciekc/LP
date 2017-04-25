function wsk = celAngle(X0)
     
    global beta par_table Tk omega K psi
    global xs sy ms mc Rn g x0 p lin limit
     K = X0(1);
     psi = 0;
     T = X0(2);
     %tau = X0(3);
     
%    par_table = [par_table [mw]];
    opt = simset('SrcWorkspace','Current');
    sim('model_kat',Tk,opt);
    
    %t = dataPID.time;

    %yc = dataPID.signals(1).values();
    t = newAngle.Time;
    yc = newAngle.Data;
    wsk = 1000*(beta - yc);
end