function mutacion = muta(value)
    mutacion = value;
    
    if rand() > .995
        if value == 1
            mutacion = 0;
        else
            mutacion = 1;
        end
    end
end
