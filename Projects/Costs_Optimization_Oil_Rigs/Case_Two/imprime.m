function imprime(mejor,varargin)

if length(varargin)>=1
   actual = varargin{1};
end

if length(varargin)>=1
    fprintf('\nCosto actual = %9.4f | Mejor costo = %9.4f', actual.f, mejor.f)
else 
   fprintf('\nMejor costo = %9.4f', mejor.f)
end

if length(varargin)>=1
    fprintf('\n\nPropuesta actual:')
    [r, c] = size(actual.x);
    for i = 1:r
        row = actual.x(i,:);
        if row(1) == 1
            fprintf('\n');
            fprintf('(%4.2f, %4.2f) = {', row(2), row(3));
            count = 1;
            for j = 4:c-1
                if row(j) == 1
                    fprintf('%1.0f, ', count);
                end
                count = count + 1;
            end
            fprintf('%1.0f}', count);
        end
    end
end

fprintf('\n\nMejor propuesta:')
[r, c] = size(mejor.x);
for i = 1:r
    row = mejor.x(i,:);
    if row(1) == 1
        fprintf('\n');
        fprintf('(%4.2f, %4.2f) = {', row(2), row(3));
        count = 1;
        for j = 4:c-1
            if row(j) == 1
                fprintf('%1.0f, ', count);
            end
            count = count + 1;
        end
        fprintf('%1.0f}', count);
    end
end

fprintf('\n\n')
