function [q] = RotationQuaternion(phi, u)

q(1) = cos(phi/2);
qv = u * (sin(phi/2));
q(2) = qv(1);
q(3) = qv(2);
q(4) = qv(3);