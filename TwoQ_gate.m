function [result] = TwoQ_gate(psi, gate, q2target)
%OneQ_gate is function that creates a matrix operator with the gate "gate"
%exclusively for the state "psi" (same verical size as "psi")

%psi - quantum state of N-qubits
%gate - matrix operator for the gate (should be 4x4 or two-qubit
%q2target - number of second qubit from 2 to N where the gate is located
%first qubit number is q2target-1


I = [1 0; 0 1];

%Estimating the quantity of qubits
N=0;
sz = size(psi,1);
while sz ~= 1
    sz = sz/2;
    N=N+1;
end

%Check if qtarget is in range of N
if q2target > N || q2target < 2 
    disp('error: Targeted qubit is over the range\n');

%Creating of matrix for N-qubit gate with 2-qubit gate
%Creating of "q2target"-qubit matrix 
elseif q2target == 2
    operator = gate;
    i = 2;    
else
    i = 3;
    operator = I;
    while i < q2target
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

