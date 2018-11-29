function [result, minCost] = evaluator(population)
tam = size(population);
tam = tam(1);
result = [];
minCost = 10000;

for i = 1:tam
    G = interpretor(population(i,:));
    [costoTotal, conectividad] = costoSteiner(G);
    
    if conectividad == 1
        if costoTotal < minCost
            minCost = costoTotal;
            result = G;
        end
    end
end
end
