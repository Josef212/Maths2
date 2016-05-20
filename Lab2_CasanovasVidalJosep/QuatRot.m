function [v]  = QuatRot(vector, quat)

vp = [0; vector];

v1 = QuatMult(quat, vp);
qc = quatconj(quat');
v = QuatMult(v1, qc');