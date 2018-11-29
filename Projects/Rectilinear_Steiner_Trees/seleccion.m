function newPop = seleccion(oldPop)
    dim = size(oldPop);
    ren = dim(1);
    col = dim(2);
    newPop = [];
    
    indices = randperm(ren, ren);
    
    for i = 1 : ren - 1
        indUno = oldPop(indices(i), : );
        indDos = oldPop(indices(i + 1), : );
        
        elemUno = interpretor(indUno);
        elemDos = interpretor(indDos);
        
        [costUno, conUno] = costoSteiner(elemUno);
        [costDos, conDos] = costoSteiner(elemDos);
        
        if costUno < costDos
            if conUno == 1
                newPop = [newPop; indUno];
            else
                newPop = [newPop; indDos];
            end
        else
            if conDos == 1
                newPop = [newPop; indDos];
            else
                newPop = [newPop; indUno];
            end
        end
    end
    
    indUno = oldPop(ren, : );
    indDos = oldPop(1, : );
    
    elemUno = interpretor(indUno);
    elemDos = interpretor(indDos);
        
    [costUno, conUno] = costoSteiner(elemUno);
    [costDos, conDos] = costoSteiner(elemDos);
        
    if costUno < costDos
        newPop = [newPop; indUno];
    else
        newPop = [newPop; indDos];
    end
end
