function [result1, result2] = cruceOp(par1, par2, tc)
pivot = randi([1 tc]);
result1 = [];
result2 = [];

for c = 1:tc
    if c <= pivot
        result1 = [result1, par1(c)];
        result2 = [result2, par2(c)];
    else
        result1 = [result1, par2(c)];
        result2 = [result2, par1(c)];
    end
end
end