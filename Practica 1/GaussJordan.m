function [x, flag]  = GaussJordan(b, A)

vecSize = size(b);
matrixSize = size(A);

if matrixSize(1) ~= matrixSize(2) || matrixSize(1) ~= vecSize(2)
    x = nan;
    flag = -1;
else
    Aa = [A; b'];
    display('Matrix A concatenated with the vector b: ');
    display(Aa);
    AaMatrixSize = size(Aa);
    Vp;
    for columns = 1:AaMatrixSize(2)
        
        
        if pivot == 0
            flag = 1;
        else
            flag = 3;
        end
        
        for rows = 1:AaMatrixSize(1)
            
        end
        
    end
    
    for rows = 1:AaMatrixSize(1)
       x(rows,:) = Aa(Vp(rows), end)/Aa(Vp(rows), rows);
    end
    
end