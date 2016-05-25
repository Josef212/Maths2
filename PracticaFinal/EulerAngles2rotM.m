function [R] = EulerAngles2rotM (psi, theta, phi)

R = [ cos(theta)*cos(psi), (cos(psi)*sin(theta)*sin(phi))-(cos(phi)*sin(psi)), (cos(psi)*cos(phi)*sin(theta))+(sin(psi)*sin(phi));
        cos(theta)*sin(psi), (sin(psi)*sin(theta)*sin(phi)) + (cos(psi)*cos(phi)), (sin(psi)*sin(theta)*cos(phi))-(cos(psi)*sin(phi));
        -sin(theta),        cos(theta)*sin(phi),                           cos(theta)*cos(phi)];