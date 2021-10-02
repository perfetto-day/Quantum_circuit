function [result] = BELL(psi, q1, q2)
%Two-qubit matrix operator to build Bell states
%psi - state of N-qubit curcuit
%q1 - number of first qubit to be entagled [1; N]
%q2 - number of second qubit to be entagled [1; N]
%  -H-*---
%  ---+---


%Estimating the quantity of qubits
N=0;
sz = size(psi,1);
while sz ~= 1
    sz = sz/2;
    N=N+1;
end

%Making of Bell states process
psi = H(psi, q1);
psi = CNOT(psi, q1, q2);

result = psi;
end

