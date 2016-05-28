%% Exercise 1
% The point p has coordinates
p_A = [3, 4]';
% on a frame A and coordinates
p_B = [-2.5, 0.5]';
% on a frame B

%It is known that the angle between x axis of frame {A} and the y axes from
%Fram is 30 deg counterclockwise. 

% 1.1 Which are the coordinates of the origin of A seen from B?
% 1.2 Which are the coordinates of the origin of B seen from A?
% 1.3 Which are the coordinates of a point q expressed in A if
q_B = [3,1]'; %?

% -------------------------------
display('Exercise 1 =================');
%We know that the rotation of this transformation is:
b_R_a = [cos(-1.0472), sin(-1.0472);
            -sin(-1.0472), cos(-1.0472)];
%If we rotate p_A we will know p in B only rotated so we will be able to
%calculate the affine transformation
p_BR = b_R_a * p_A;
display('p_A rotated is:');
display(p_BR);
t = p_B - p_BR;
display('t is:');
display(t);
%Now we can calculate the affine matrix
BR_A = [b_R_a(1, 1), b_R_a(1, 2), t(1,1);
        b_R_a(2, 1), b_R_a(2,2), t(2,1)
        0,              0,          1];
display('Affine matrix is:');
display(BR_A);
display('Affine matrix inverse is:');
display(inv(BR_A));

%Comprobation
display('Comprobation===');
display('p_A to B:');
p_AH = [p_A(1,1), p_A(2, 1), 1]';
B_p_A = BR_A * p_AH;
display(B_p_A);

display('p_B to A:');
p_BH = [p_B(1,1), p_B(2, 1), 1]';
A_p_B = (inv(BR_A)) * p_BH;
display(A_p_B);

%Ex 1.1 now we have the affine matrix from A to B and the inverse, we can
%calc A origin in B
display('Ex 1.1===');
o_A = [0, 0, 1]';
B_o_A = BR_A * o_A; %A origin in B
display('A origin seen from B is:');
display(B_o_A);

%Ex 1.2 now we have the affine matrix from A to B and the inverse, we can
%calc B origin in A
display('Ex 1.2===');
o_B = [0, 0, 1]';
A_o_B = (inv(BR_A)) * o_B; %B origin in A
display('B origin seen from A is:');
display(A_o_B);

%Ex 1.3 now we have the affine matrix from A to B and the inverse, we can
%calc q on A frane
display('Ex 1.3===');
q_BH = [q_B(1,1), q_B(2,1), 1]';
A_q_B = (inv(BR_A)) * q_BH; %q_B seen from A
display('q_B seen from A is:');
display(A_q_B);

%% Exercise 2
display('Exercise 2 =================');
% Let {A}, {B} and {C}, be 3 different reference frames. From them we know
% that:
%      - The origin of B with respect A is
oAB = [3,1,-2]';
%      - The origin of C with respect B is
oBC = [-3, 1,-2]';

% The three frames has different orientations in space.
% In fact:
%       -The set of Euler angles stored in eta as eta = (psi,theta,phi)
eta = [25;145;30]; % Expressed in degrees
%            represents 3 consecutive rotations about z, y, and x
%            respectively that allows to transform from {A} to {B}
%
%       - The quaternion
q = 1/7*[-sqrt(3)*3.5;3;-1;-1.5];
%         will allows to express in {B} a vector defined in {C}, if {C} and {B}
%         had the same origin

%   -Let in addition v1 and v2 to be points which coordinates are known in
%   {C}.
v1_C = [0;2;0];
v2_C = [0;2;5];

% With the information provided above determine:
%
%   2.1- The affine expression (no matrix here!) that allows to relate a vector originally given
%       in {C} to {B}.
%
%   2.2 The affine matrix that allows to express a vector originally given
%       in {C} to {A}.
%
%   2.3 The vectors v1_C and v2_C forms a segment. Make a 3d plot (plot3() in
%   matlab), representing how the segment is seen on {A} in red, on {B} in
%   blue and on {C} in green.

% Make use of the provided function quatmult to multiply quaternions.

display('Rotation matrix from euler angles set eta:');
display(eta);
eta = eta * (pi/180);
display(eta);
B_R_A = RotationMatrixFromEulerAngles(eta(3,1), eta(2,1), eta(1,1));
display(B_R_A);
display(oAB);
display(B_R_A * oAB);

A_R_B = B_R_A';
oB = [0, 0, 0]';
display((A_R_B*oB));

%% Exercise 3.
display('Exercise 3 =================');
% The points described by the columns of the matrix A
 
A = load('AEx3.mat');
A = A.A;

% are points contained into a circle, and they are defined in a world frame W.

% A camera is situated at point

cc = [1; 6; 1];

% defined in the world frame. Moreover the orientation of this camera frame
% is achieved by rotating the world frame -90 degs about its y axis followed by -20
% degrees about the resulting z axis.

%If the camera has a focal length of 1/34 m:

% 3.1 Make a plot with the view of the points of the circle projected into the camera plane.
%
% 3.2 Make also a 3D plot where all the scene is drawn in the world
% coordinates. The scene must contain the 2 reference frames (2 orthogonal sets of vectors)
% and the circle points. You can use the provided function cameraproj.


%% Exercise 4
display('Exercise 4 =================');
%The columns of the next matrix, represents the coordinates od 4 points
%defined in a world frame.

A = load('AEx4.mat');
A = A.A;

%From this 4 points, two segments are defined. The segment one, goes from
% the point defined by the first column to the point defined by the second
% column. The second segment is defined by the other two points.

% A camera frame is seeing the scene. The origin of the world frame seen
% from the camera frame is given by the vector

wc = [4.665;3.735;-0.5395];


%And the orientation of the camera frame is obtained after rotating the
%world frame -170 degs about the direction
u = [0.01;-.2;1];


% With the data provided determine:
%
% 4.1 The minimum angle that both segments forms (hint, they intersect)
%
% 4.2 The angle that both segments forms in the image plane
%
% 4.3 Deliver a 3D representation of the scene with all the coordinates
% refered to the world frame
%
% 4.4 Deliver the 3D scene representations but with all the coordinates
% refered to the camera frame
