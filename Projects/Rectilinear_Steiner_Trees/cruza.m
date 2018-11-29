function [hijoUno, hijoDos] = cruza(padUno, padDos, col)
    puntoCruce = randi([1 col]);
    hijoUno = [];
    hijoDos = [];

    for c = 1:col
        mutaUno = muta(padUno(c));
        mutaDos = muta(padDos(c));
        if c <= puntoCruce
            hijoUno = [hijoUno, mutaUno];
            hijoDos = [hijoDos, mutaDos];
        else
            hijoUno = [hijoUno, mutaDos];
            hijoDos = [hijoDos, mutaUno];
        end
    end
end