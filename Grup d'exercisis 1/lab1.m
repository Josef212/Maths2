

%% Exercise 1

MatrixA = [ [1 1 1]; [1 -1 0]; [1 0 1] ];
vectorB = [ 3; 0; 1 ];

display(MatrixA);
display(vectorB);

[xVec, flag] = GaussJordan(vectorB, MatrixA);

display(xVec);
display(flag);


%% Exercise 2

MatrixC = [ [1 1 1]; [1 -1 0]; [1 0 1] ];
vectorD = [ 3; 0; 1 ];

display(MatrixC);
display(vectorD);

[xVec, flag] = GaussJordan(vectorD, MatrixC);

display(xVec);
display(flag);