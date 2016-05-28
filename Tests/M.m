u = [ 1, 0 ,0]';
phi = pi/2;

vR = RotationVector(phi, u);
display(vR);
qR = RotationQuaternion(phi, u);
display(qR);
R = EulerAngles2rotM(0, 0, phi/2);
display(R);
eu= EulerAnglesFromRotationMatrix(R);
display(eu);
[angle, vec] = EulerAngleAxisFromRotMat(R);
display(angle);
display(vec);