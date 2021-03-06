function wsk = cel(X0)
     
    global y par_table Tk
     K = X0(1);
     T = X0(2);
     %tau = X0(3);
     
    par_table = [par_table [K;T]];
    opt = simset('SrcWorkspace','Current');
    sim('model_sim',Tk,opt);
    
    t = data.time;

    u = data.signals(2).values();
    yc = data.signals(1).values();
   
    wsk = y - yc;
end