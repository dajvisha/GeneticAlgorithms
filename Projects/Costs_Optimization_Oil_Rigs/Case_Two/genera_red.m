function [red, seleccionados] = genera_red(plataformas)
    seleccionados = [];
    for i = 1:20
        prob = rand();
        if prob > .75
            plataformas(i, 1) = 1;
            seleccionados = [seleccionados ; plataformas(i, :)];
        end
    end
    red = plataformas;
end