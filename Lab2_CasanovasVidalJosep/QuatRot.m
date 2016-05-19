function [v]  = QuatRot(vector, quat)

vp = [0; vector(1); vector(2); vector(3)];

v1 = QuatMult(quat, vp);

v = QuatMult(v1, quatconj(quat));