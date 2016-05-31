%Final assignment Maths2.
    %Aleix Cardona Zuecos
    %Josep Casanovas Vidal

% This is to test the functions

% As in our program our input are the Euler Angles, we will start from
% there.

%Here we have the three angles
psi = pi/2;
theta = 0;
phi = 0;

eu = [psi, theta, phi];

%We put the angles in a vector eu
display('Euler angles: ');
display(eu);

% Rotation matrix Test------------------------------------
REx = [ 0, -1, 0;
    1, 0, 0;
    0, 0, 1];
display('Matrix Rotation =========================');
display('The rotation matrix expected form those angle is: ');
display(REx);
display('The rotation matrix we got from our function is: ');
R = EulerAngles2rotM(eu(1),eu(2),eu(3));
display(R);

% Euler angle and axis test------------------------------------

display('Euler Axis and Angle Rotation =========================');
angleEx = pi/2;
uEx = [0, 0, 1]';
display('The euler axis expected form those angle is: ');
display(uEx);
display('The euler angle expected form those angle is: ');
display(angleEx);

[angle, u] = EulerAngleAxisFromRotMat(R);

display('The euler axis we got from our function is: ');
display(u');
display('The euler angle we got from our function is: ');
display(angle);

% Rotation vector Test------------------------------------

display('Rotation Vector =========================');
RVecEx = [ 0, 0, pi/2]';
display('The rotation vector expected form those angle is: ');
display(RVecEx);
display('The rotation vector we got from our function is: ');
RVec = RotationVector(angle, u);
display(RVec');

% Rotation quaternion Test------------------------------------

display('Rotation Quaternion =========================');
RQEx = [ (cos(pi/4)), 0, 0, (sin(pi/4))]';
display('The rotation quaternion expected form those angle is: ');
display(RQEx);
display('The rotation quaternion we got from our function is: ');
RQ = RotationQuaternion(angle, u);
display(RQ');