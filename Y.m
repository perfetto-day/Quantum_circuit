function [result] = Y(psi, qtarget)
%Y Operator Pauli Y 

%psi - state of N-qubit curcuit
%qtarget - number of qubit from 1 to N where the gate is located

%Matrix of Y
Y = [0 -1i; 1i 0];

%Creating of full N-qubits matrix with gate targeted on "qtarget"-qubit
Y = OneQ_gate(psi, Y, qtarget);
result = Y*psi;
end