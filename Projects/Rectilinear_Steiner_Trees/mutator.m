function mutants = mutator(population)
tam = size(population);
tr = tam(1);
tc = tam(2);
mutants = population;
changed = 0;

for r = 1:tr
    for c = 1:tc
        if rand() > .95 %Probabilidad de mutación = .7
            if mutants(r,c) == 1
                mutants(r,c) = 0; %Cambiar de 1 a 0. 
                changed = 1;
            end
            if mutants(r,c) == 0
                if changed == 1
                    mutants(r,c) = 1; %Cambiar de 0 a 1.
                end
            end
        end
    end
end  
end
