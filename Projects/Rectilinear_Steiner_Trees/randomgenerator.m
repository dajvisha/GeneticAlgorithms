function randomgene = randomgenerator(a)

tam = size(a);
tam = tam(2);
random = zeros(1,tam);
auxiliar = zeros(1,tam);

for i=1:tam
    random_dec = rand();
    if random_dec > .50
        random(i) = 1;
    end    
end

for i=1:tam
    if random(i) == 1
        auxiliar(i) = a(i);
    end
end

randomgene = auxiliar(auxiliar ~= 0);
end
