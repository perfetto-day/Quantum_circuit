function [result] = Z(psi, qtarget)
%Z Operator Pauli Z

%psi - state of N-qubit curcuit
%qtarget - number of qubit from 1 to N where the gate is located

%Matrix of Z
Z = [1 0; 0 -1];

%Creating of full N-qubits matrix with gate targeted on "qtarget"-qubit
Z = OneQ_gate(psi, Z, qtarget);
result = Z*psi;
end