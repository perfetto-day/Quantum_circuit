function [result] = CCNOT(psi, qcontrolled)
%CCNOT double controlled NOT
%Last qubit is controlled, two controlling qubits
%psi - quantum state of N-qubits
%qcontrolled - number of controlled qubit
%Controlling qubits are qcontrolled-1 and qcontrolled-2
CCNOT = [1 0 0 0 0 0 0 0;
         0 1 0 0 0 0 0 0;
         0 0 1 0 0 0 0 0;
         0 0 0 1 0 0 0 0;
         0 0 0 0 1 0 0 0;
         0 0 0 0 0 1 0 0;
         0 0 0 0 0 0 0 1;
         0 0 0 0 0 0 1 0];

%Creating of N-qubit matrix with CCNOT gate in it
CCNOT = ThreeQ_gate(psi, CCNOT,qcontrolled);
result = CCNOT*psi;
end

