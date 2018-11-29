function valido = verifica_diseno(diseno)
    contador = 0;
    if isempty(diseno) == 0
        for c = 4:23
            if ismember(1, diseno(:,c))
                contador = contador + 1;
            end
        end
    end
    
    if contador == 20 
        valido = 1;
    else 
        valido = 0;
    end
end