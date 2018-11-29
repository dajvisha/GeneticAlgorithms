function gene = interpretor(binary)

tam = size(binary);
tam = tam(2);

aux = zeros(1,tam);
gene = zeros(1, tam);
    
for i = 1:tam
        aux(i) = i;
end
    
for i=1:tam
    if binary(i) == 1
        gene(i) = aux(i);
    end
end

gene = gene(gene ~= 0);
    
end