function costo = calcula_costo(red)
    coordenadas_perforaciones = [1 1; 2 1; 3 1; 2 2; 3 2; 3 3; 4 3; 4 4;
        6 4; 4 5; 6 6; 9 5; 4 7; 8 7; 5 8; 6 8; 10 8; 6 9; 8 9; 10 9];
    costo_h = 0;
    costo_ck = 0;
    centroides = calcula_centroides(red);
    tempsize = size(red);
    a = 1;
    contador = 0;
    temporal_h = 0;
    temporal_ck = 0;
    
    for i = 1:tempsize(1,1)
       red(i,2) = centroides(i,1);
       red(i,3) = centroides(i,2);
    end
    
    for r = 1:tempsize(1,1)
        for c = 4:23
            if red(r, 1) == 1 && red(r,c) == 1
                temporal_h = sqrt((coordenadas_perforaciones(c-3,1) - centroides(r,1))^(2) + (coordenadas_perforaciones(c-3,2) - centroides(r,2))^(2));
                temporal_h = a * (temporal_h + (0.5 + (0.5 * coordenadas_perforaciones(c-3,1))^2 + .1 * coordenadas_perforaciones(c-3,2)) )^2;
                contador = contador + 1;
            end
            costo_h = costo_h + temporal_h;
        end
        temporal_ck = 12.1497 * (contador)^0.6770 ;
        costo_ck = costo_ck + temporal_ck;
    end
    costo = costo_ck + costo_h;
end
