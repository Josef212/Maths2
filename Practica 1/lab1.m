%% Exercise 1

MatrixA = [ [1 1 1]; [1 -1 0]; [1 0 1] ];
vectorB = [ 3; 0; 1 ];

display(MatrixA);
display(vectorB);

[xVec, flag] = GaussJordan(vectorB, MatrixA);

display(xVec);
display(flag);

%% Exercise 2

MatrixB = [ [1 1 -1]; [1 1 0]; [3 3 2] ];
vectorC = [ 1; 2; 1 ];

display(MatrixB);
display(vectorC);

[x2Vec, flag2] = GaussJordan(vectorC, MatrixB);

display(x2Vec);
display(flag2);

%% Exercise 3
load('Ws.mat');

[x2Vec, flag2] = GaussJordan(b, A);

display(x2Vec);
display(flag2);