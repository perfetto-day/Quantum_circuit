function [result] = OneQ_gate(psi, gate, qtarget)
%OneQ_gate is function that creates a matrix operator with the gate "gate"
%exclusively for the state "psi" (same verical size as "psi")

%psi - quantum state
%gate - matrix operator for the gate (should be 2x2 or one-qubit
%qtarget - number of qubit from 1 to N where the gate is located


I = [1 0; 0 1];

%Estimating the quantity of qubits
N=0;
sz = size(psi,1);
while sz ~= 1
    sz = sz/2;
    N=N+1;
end

%Check if qtarget is in range of N
if qtarget > N
    disp('error: Targeted qubit is over the range\n');
    i = N;

%Creating of matrix for N-qubit gate with targeted qubit
%Creating of "qtarget"-qubit matrix 
elseif qtarget == 1
    operator = gate;
    i = 1;    
else
    i = 2;
    operator = I;
    while i < qtarget
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

