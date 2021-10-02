function [result] = Circuit2(psi)
%Circuit is described in report
%  -H-*-H-
%  -H-+-H-


psi = H(psi,1);
psi = H(psi,2);
psi = CNOT(psi, 1, 2);
psi = H(psi,1);
result = H(psi,2);
end

