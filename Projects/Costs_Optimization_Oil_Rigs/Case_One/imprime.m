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
    fprintf('\n\nPropuesta actual: {')
    count = 1;
    for i = 1:18
        if actual.x(i) == 1
            fprintf('%d ', count);
        end
        count = count + 1;
    end
    fprintf('}')
end

fprintf('\n\nMejor propuesta: {')
count = 1;
for i = 1:18
    if mejor.x(i) == 1
        fprintf('%d ', count);
    end
    count = count + 1;
end

fprintf('}\n\n\n')
