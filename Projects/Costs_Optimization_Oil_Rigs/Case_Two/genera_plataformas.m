function plataformas = genera_plataformas()
    plataformas = zeros(20,23);
    for r = 1:20
        for c = 4:23
            prob = rand();
            if prob > 0.75
                plataformas(r,c) = 1;
            end 
        end
    end
    plataformas = calcula_centroides(plataformas);
end
