function estado = genera_estado(estado_actual)
    % Genera 20 plataformas y su conjunto de pozos
    plataformas = genera_plataformas();

    % Selecciona una cantidad aleatoria de plataformas
    [red, seleccionados] = genera_red(plataformas);
    
    % Verifica que se cubran todos los pozos al menos una vez
    while verifica_diseno(seleccionados) ~= 1
        plataformas = genera_plataformas();
        [red, seleccionados] = genera_red(plataformas);
    end
    estado = red;
end

