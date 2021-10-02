function [result] = Circuit1(psi)
%Circuit is described in report
%  -X-*-X-
%  ---+---

psi = X(psi, 1);
psi = CNOT(psi, 1, 2);
result = X(psi, 1);
end

