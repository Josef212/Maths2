function [qp]  = QuatMult(q, p)

qo = q(1);
po = p(1);

qv = q(2:4);
pv = p(2:4);

qpo = (qo * po) - (qv' * pv);
qpv = (po * qv) + (qo * pv) + (cross(qv, pv));

qp = [qpo; qpv(1); qpv(2); qpv(3)]; 