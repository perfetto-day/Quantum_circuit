function [result] = ThreeQ_gate(psi, gate, q3target)
%OneQ_gate is function that creates a matrix operator with the gate "gate"
%exclusively for the state "psi" (same verical size as "psi")

%psi - quantum state of N-qubits
%gate - matrix operator for the gate (should be 8x8 or three-qubit
%q3target - number of third qubit from 3 to N where the gate is located
%first qubit number is q3target-2
%first qubit number is q3target-1


I = [1 0; 0 1];

%Estimating the quantity of qubits
N=0;
sz = size(psi,1);
while sz ~= 1
    sz = sz/2;
    N=N+1;
end

%Check if qtarget is in range of N
if q3target > N || q3target < 3 
    disp('error: Targeted qubit is over the range\n');

%Creating of matrix for N-qubit gate with 3-qubit gate
%Creating of "q3target"-qubit matrix 
elseif q3target == 3
    operator = gate;
    i = 3;    
else
    i = 4;
    operator = I;
    while i < q3target
        operator = kron(operator, I);
        i = i + 1;
    end
    operator = kron(operator, gate);
end

%Creating of full N-cubit matrix
while i < N
    operator = kron(operator, I);
    i = i + 1;
end

result = operator;
end

