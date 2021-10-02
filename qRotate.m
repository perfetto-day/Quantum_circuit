function [Rot] = qRotate(o,f, psi)
%Function that rotates the state to angles tetta (o) and phi (f)
%Using the matrix that was created in the report

R = [cos(o/2) sin(o/2)*exp(-1i*f); sin(o/2)*exp(-1i*f) cos(o/2)];
Rot = R*psi;
end

