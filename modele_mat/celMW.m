function wsk = celMW(X0)
     
    global y par_table Tk mw
    global xs sy ms mc Rn g x0 p lin limit
     mw = X0;
     %tau = X0(3);
     
    par_table = [par_table [mw]];
    opt = simset('SrcWorkspace','Current');
    sim('model_reg_silnik',Tk,opt);
    
    %t = dataPID.time;

    %yc = dataPID.signals(1).values();
    t = newX.time;
    yc = newX.signals.values;
    wsk = 1000*(y - yc);
end