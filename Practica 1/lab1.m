

%% Exercise 1

MatrixA = [ [1 1 1]; [1 -1 0]; [1 0 1] ];
vectorB = [ 3; 0; 1 ];

display(MatrixA);
display(vectorB);

[xVec, flag] = GaussJordan(vectorB, MatrixA);

display(xVec);
display(flag);