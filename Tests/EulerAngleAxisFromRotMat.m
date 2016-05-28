function [phi, U] = EulerAngleAxisFromRotMat(R)

phi = acos((trace(R)-1)/2);

Ux = ((R - R')/2*sin(phi));

U(1) = Ux(3, 2);
U(2) = Ux(1, 3);
U(3) = Ux(2, 1);