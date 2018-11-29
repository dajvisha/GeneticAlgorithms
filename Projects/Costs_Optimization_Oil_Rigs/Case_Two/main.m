estado_inicial = genera_estado([]);

p.cadIntAcep = 50;
p.min = 1;
p.cadInt = 4000;
p.maxCad = 3;
p.frecImp = 50;
p.alfa = 0.95;
p.beta = 1.2;
p.minRazAcep = 0.95;
p.variarC = 0;
p.x0 = estado_inicial;
p.FcnObj = @calcula_costo;
p.FcnVec = @genera_estado;
p.Imp = @imprime;

[X, prom, desv] = plotRecocido(p, 5);