function pop = cruce(population)
tam = size(population);
tr = tam(1);
tc = tam(2);
pop = [];

for r = 1:tr-1
    parent1 = population(r, :);
    parent2 = population(r+1, :);
    [res1, res2] = cruceOp(parent1, parent2, tc);
    pop = [pop; res1];
    pop = [pop; res2];
end  
end
