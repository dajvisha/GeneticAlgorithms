function minCost = getMinCost(population)
tam = size(population);
tam = tam(1);

for i = 1:tam
    
    G = interpretor(population(i,:));
    [costoTotal, conectividad] = costoSteiner(G);
    evaluation = [evaluation ; costoTotal conectividad];

end
end
