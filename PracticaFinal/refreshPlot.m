function refreshPlot(M,V)   
con = [1 2 3 4;
    5 6 7 8;
    4 3 7 8;
    1 2 6 5;
    1 4 8 5;
    2 3 7 6];
    

    for q = 1:6
        V(q).Vertices = M(:,con(q,:))';
    end
    drawnow;