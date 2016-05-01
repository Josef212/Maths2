function [x, flag]  = GaussJordan(b, A)

[rowsA,columnsA] = size(A);
rowsB = size(b);

if columnsA ~= rowsB
    x = nan;
    flag = -1;
else
    Aa = [A, b];
    rowsDone = zeros(1, rowsA);
    vP = zeros(1, rowsA);
    
    for c = 1:columnsA
        
        nonPivotedR = zeros(rowsA, columnsA+1);
        
        for i = 1:rowsB
           if rowsDone(i) == 0
               nonPivotedR(i,:) = Aa(i,:);
           end
        end
        
        [maxValR, maxValC] = max(abs(nonPivotedR));
        
        vP(c) = maxValC(c);
        rowP = Aa(vP(c),:);
        pivot = maxValR(c);
        rowsDone(vP(c)) = 1;
        
        if pivot == 0
            flag = 1;
        else
            flag = 0;
            
            for r = 1:rowsA
                row = Aa(r,:);
                if arrayEqual(rowP, row) == 0
                    row = row - (rowP*(Aa(r,c)/rowP(c)));
                    Aa(r,:) = row;
                end
            end
        end
        
    end
    
    if flag == 0
        for rows = rowsA:-1:1
        x(rows) = Aa(vP(rows), end)/Aa(vP(rows), rows);
        end
    end
end