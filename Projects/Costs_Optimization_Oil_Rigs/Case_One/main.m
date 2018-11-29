p.cadIntAcep = 50;
p.min = 1;
p.cadInt = 550;
p.maxCad = 1;
p.frecImp = 10;
p.alfa = 0.8;
p.beta = 1.2;
p.minRazAcep = 0.90;
p.variarC = 0;
p.x0 = [1, 1, 1, 0, 0, 1, 0 ,0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1];
p.FcnObj = @cost;
p.FcnVec = @pozos_vecino2;
p.Imp = @imprime;

[X, prom, desv] = plotRecocido(p, 10);
