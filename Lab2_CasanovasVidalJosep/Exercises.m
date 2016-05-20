%% Exercise 1
% Create and test a function that given euler axis/angle information
% returns the rotation matrix.
% Do the next verifications:
%   - Calculate the determinant
%   - Ensure that the transpose operation is equivalent to the inverse
%   - Observe what happens to a vector parallel to the axis direction
%   - Observe what happens to a vector perpendicular to the axis direction
u = [1; 0; 0];
angle = pi/2;
R = Euler(u, angle);

display('Exercise 1 =======================');

display('Rotation matrix by euler axis and angle:');
display(R);
display('Rotation matrix determinant:');
display(det(R));
display('Rotation matrix transpose:');
display(R');
display('Rotation matrix inverse:');
display(inv(R));
display('Vector1(axis):');
display(u);
display('Vector2 parallel to axis(vector1):');
u2 = [-1 0 0]';
display(u2);
display('Vector2 rotated arround Vector1:');
display(R*u2);
display('Vector3 perpendicular to axis(vecotr1)');
u3 = [0 1 0]';
display(u3);
display('Vector3 rotated arround Vector1:');
display(R*u3);


%% Exercise 2
% Use the past function and the function Cubeplot/Cubeplot2 to transform the
% orientation of the cube given by M
% Find the rotation vectors that makes:
%    - The green face points in the positive z direction and the orange
%    face in the -y direction
%    - The orange face points in the -z direction and the blue face into
%    the +y direction
%    - The red face points on the -x direction and the blue face into 
%    the -y direction.


M = [    -1  -1 1;   %Node 1
    -1   1 1;   %Node 2
    1   1 1;   %Node 3
    1  -1 1;   %Node 4
    -1  -1 -1;  %Node 5
    -1   1 -1;  %Node 6
    1   1 -1;  %Node 7
    1  -1 -1]'; %Node 8

% Call to Cubeplot
Cubeplot(M');
%- The green face points in the positive z direction and the orange
%face in the -y direction
u1 = [0 1 0]';
R1 = Euler(u1, pi/2);
M=R1*M;
Cubeplot(M');
%- The orange face points in the -z direction and the blue face into
%the +y direction
u2 = [1 0 0]';
R2 = Euler(u2, pi/2);
M=R2*M;
Cubeplot(M');
%- The red face points on the -x direction and the blue face into 
%the -y direction.
u3 = [0 1 0]';
R3 = Euler(u3, -pi/2);
u4 = [1 0 0]';
R4 = Euler(u4, pi);
M=R4*R3*M;
Cubeplot(M');

%% Exercise 3
% Create a function that implements the quaternion multiplication.
% Create a function that given a vector and a quaternion, return the vector
% rotated by the attitude encoded in the quaternion using quaternion
% multiplications.
% Test it an argument/demonstrate why your function is well implemented.

display('Exercise 3 =======================');

display('Quaternion 1.');
q = [cos(pi/4); 0; 0; sin(pi/4)];
display(q);
display('Quaternion 2.');
p = [cos(pi/4); 0; 0; sin(pi/4)];
display(p);
display('Quaternion q*p:');
w = QuatMult(q, p);
display(w);

display('Vector v, and rotation quaternion q:');
v = [1, 1, 1]';
angle=pi;
q = [cos(angle/2), sin(angle/2)*1, 0, 0]';
display(v);
display(q);
display('The vector reotated is:');
vRot = QuatRot(v, q);
display(vRot);

%% Exercise 4
% Create a large set of rotation matrices (at least 100) for which the euler axis may be 
% random (not necessarily random, but not the same) and the euler angle in
% increasing order form 0 to 6 pi. (Use a FOR LOOP)
% Make a plot of the trace of this matrices with the value of the angle in
% the x axis i.e. Trace(R(phi,e)) vs. \phi . Explain what you observe.
traces = zeros(1, 100);
c = 1;
for i = 0:(6*pi)/100:6*pi
   axis = rand(3,1);
   traces(c) = trace(Euler(axis, i));
   c = c+1;
end
x = 0:6*pi/100:6*pi;

plot(x, traces);
title('Exercise 4');

%% Exercise 5
% Create a function that given a set of euler angles, return its respective
% rotation matrix.
% Create also a function that given a rotation matrix return the
% respective rotation angles.
% 	-Ensure that the case for which theta = pi/2 + k*pi with k=1,2,.. is
% 	   well implemented

display('Exercise 5 =======================');

eul = [ pi pi/2 0 ];
display('Euler angles:');
display(eul);
display('R using the function:');
display(RotationMatrixFromEulerAngles(eul(1), eul(2), eul(3)));
display('R using matlab function:');
R = eul2rotm(eul);
display(R);

display('=====================');

display('Now get the euler angles from the matrix given:');
eulAng = EulerAnglesFromRotationMatrix(R);
display('psi:');
display(eulAng(1, 1));
display('theta:');
display(eulAng(1, 2));
display('phi:');
display(eulAng(1, 3));
















