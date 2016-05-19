function [R]  = Euler(u, angle)

%%Must recieve a column vector and angle in rad

u = u /norm(u) %%Normalized vector
I=eye(3)
U = u * u'
Ux = [ [0, -u(3) u(2)]; [u(3) 0 -u(1)]; [-u(2) u(1) 0]]

R = ((I * cos(angle)) + ((1-cos(angle)) * U) + (sin(angle) * Ux));