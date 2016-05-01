function result = arrayEqual(array1,array2)
%Compares 2 arrays and returns 1 if they are equal and 0 if they aren't
%   Element-by-element wise check to be sure they are the same.
%   if result = -1: the arrays have different sizes
%   if result =  0: the arrays are different
%   if result =  1: the arrays are equal
result = 1;
if(length(array1) == length(array1))
    for i = 1:length(array1)
        if(array1(i) ~= array2(i))
            result = 0;
            break
        end
    end
else
    result = -1;   
end