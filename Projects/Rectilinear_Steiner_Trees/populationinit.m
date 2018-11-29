function Pop = populationinit(chromsize, popsize)
    Pop = zeros(popsize,chromsize);
    
    for r = 1:popsize
        for c = 1:chromsize
            Pop(r,c) = round(rand());
        end
    end     
end
