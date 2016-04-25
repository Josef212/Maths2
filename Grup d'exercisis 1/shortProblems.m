%% Exercise 1

a = 10;
 
b = 2.5*(10^23);

c = 2 +3i;

d = exp((2*pi) /3);

display(a);
display(b);
display(c);
display(d);


%% Exercise 2

aVec = [ 3.14 15 9 26 ];

bVec = [ 2.71; 8; 28; 182];

cVec = (5:-0.2: -5);

dVec = logspace(0, 1);

eVec = 'Hello';

display(aVec);
display(bVec);
display(cVec);
display(dVec);
display(eVec);



%% Exercise 3

aMat = 2*ones(9);

v = [ 1 2 3 4 5 4 3 2 1];
bMat = diag(v);

a = (1:1:100);
cMat = reshape(a, [10 10]);

dMat = nan([3 4]);

eMat = [ [13 -1 5]; [-22, 10, -87] ];

fMat = rand(5, 3); %% Know it's wrong

display(aMat);
display(bMat);
display(cMat);
display(dMat);
display(eMat);
display(fMat);

%% Exercise 4

a = 10;
x = 1/( 1 ^(-(a-15)/6  ) );

y = ( sqrt(a) + b^(1/21) )^ (pi);


%% Exercise 5
aVec = [ 3.14 15 9 26 ];
bVec = [ 2.71; 8; 28; 182];
cVec = (5:-0.2: -5);
dVec = logspace(0, 1);

xVec = (1/(sqrt(2.*pi.*2.5^2))).^((-cVec.^2)/(2.*2.5.^2));
yVec = sqrt((aVec.').^2 + bVec.^2);
zVec = log(1./dVec);

display(xVec);
display(yVec);
display(zVec);

%% Exercise 6
aVec = [ 3.14 15 9 26 ];
bVec = [ 2.71; 8; 28; 182];
cVec = (5:-0.2: -5);
dVec = logspace(0, 1);
eVec = 'Hello';
aMat = 2*ones(9);
v = [ 1 2 3 4 5 4 3 2 1];
bMat = diag(v);
a = (1:1:100);
cMat = reshape(a, [10 10]);

xMat = (aVec * bVec)*(aMat^2);
yMat = bVec*aVec;
y2Mat = aVec*bVec;
zMat = det(cMat).*(aMat.*bMat)';


display(xMat);
display(yMat);
display(y2Mat);
display(zMat);

%% Exercise 7
a = (1:1:100);
cMat = reshape(a, [10 10]);
eMat = [ [13 -1 5]; [-22, 10, -87] ];

cSum = sum(cMat);
eMean = mean(eMat);
eMat2 = eMat;
eMat2(1,:) = [1 1 1];
cSub = cMat(2:9, 2:9);
lin = (1:1:20);
lin(2:2:20) = -lin(2:2:20);
vector = rand(1,5);
vector2 = vector;
[row, column] = find(vector2<0.5);
vector2(row, column) = 0;


display(cSum);
display(eMean);
display(eMat);
display(eMat2);
display(cSub);
display(lin);
display(vector);
display(vector2);

%% Exercise 8
p = figure();
t = (0:0.1:2*pi);
plot(sin(t));
hold on;
plot(cos(t), '--r');
xlabel('xlabel');
ylabel('ylabel');
title('Sin and Cos plot.');
legend('Sin','Cos');
xlim([0 10*(2*pi)]);
%%If I use the xlim from 0 to 2pi the plot doesn't print properly.
ylim([-1.4 1.4]);