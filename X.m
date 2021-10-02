function [result] = X(psi, qtarget)
%X Operator Pauli X or NOT inverts the state

%psi - state of N-qubit curcuit
%qtarget - number of qubit from 1 to N where the gate is located

%Matrix of X
X = [0 1; 1 0];

%Creating of full N-qubits matrix with gate targeted on "qtarget"-qubit
X = OneQ_gate(psi, X, qtarget);
result = X*psi;
end

