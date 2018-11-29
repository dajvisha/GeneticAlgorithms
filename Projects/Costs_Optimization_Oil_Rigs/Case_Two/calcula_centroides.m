function centroides = calcula_centroides(red)
    centroides = red;
    contador = 0;
    coordenadas = [0 0];
    coordenadas_perforaciones = [1 1; 2 1; 3 1; 2 2; 3 2; 3 3; 4 3; 4 4;
        6 4; 4 5; 6 6; 9 5; 4 7; 8 7; 5 8; 6 8; 10 8; 6 9; 8 9; 10 9];
    tempsize = size(red);

    for r = 1:tempsize(1,1)
        for c = 4:23
            if red(r,c) == 1
                coordenadas = coordenadas + coordenadas_perforaciones(c-3,:);
                contador = contador + 1;
            end
        end 
        coordenadas = coordenadas / contador;
        centroides(r, 2) = coordenadas(1);
        centroides(r, 3) = coordenadas(2);
        contador = 0;
        coordenadas = [0 0];
    end          
end