function next_state = pozos_vecino2(curr_state)
    next_state = curr_state;
    
    piv = randi([1 18]);
    dir = randi([1 2]);
    
    % Genera una primera mutacion
    i = piv;
    
    if dir == 1
        while i >= 1
            prob = randi([1 100]);
            if next_state(i) == 1 && prob <= 50
                next_state(i) = 0;
            end
            if next_state(i) == 0 && prob > 50
                next_state(i) = 1;
            end
            i = i - 1;
        end
    else
        while i <= 18
            prob = randi([1 100]);
            if next_state(i) == 1 && prob <= 50
                next_state(i) = 0;
            end
            if next_state(i) == 0 && prob > 50
                next_state(i) = 1;
            end
            i = i + 1;
        end
    end

    while validate(next_state) ~= 1
        i = piv;
    
        if dir == 1
            while i >= 1
                prob = randi([1 100]);
                if next_state(i) == 1 && prob <= 50
                    next_state(i) = 0;
                end
                if next_state(i) == 0 && prob > 50
                    next_state(i) = 1;
                end
                i = i - 1;
            end
        else
            while i <= 18
                prob = randi([1 100]);
                if next_state(i) == 1 && prob <= 50
                    next_state(i) = 0;
                end
                if next_state(i) == 0 && prob > 50
                    next_state(i) = 1;
                end
                i = i + 1;
            end
        end
    end
end
