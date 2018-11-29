function newPop = cruzaMuta(oldPop)
    dim = size(oldPop);
    ren = dim(1);
    col = dim(2);
    newPop = [];

    lim = ren / 2;
    tam = 1;
    
    while tam <= lim
        indexUno = randi([1 ren]);
        indexDos = randi([1 ren]);
        
        while indexUno == indexDos
            indexDos = randi([1 ren]);
        end
        
        padUno = oldPop(indexUno, : );
        padDos = oldPop(indexDos, : );
        
        [hijoUno, hijoDos] = cruza(padUno, padDos, col);
        newPop = [newPop; hijoUno; hijoDos];
       
        tam = tam + 1;
    end       
end