function [result] = H(psi, qtarget)
%Hadamard matrix 

%psi - state of N-qubit curcuit
%qtarget - number of qubit from 1 to N where the gate is located

%Matrix of H
H = 1/sqrt(2)*[1 1; 1 -1];

%Creating of full N-qubits matrix with gate targeted on "qtarget"-qubit
H = OneQ_gate(psi, H, qtarget);
result = H*psi;
end