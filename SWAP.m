function [result] = SWAP(psi, qubit1, qubit2)
%SWAP swaps states of cubits with numbers qubit1 and qubit2
%Qubits shouldn't be neseccerily close to each other
%psi - N-qubit quantum state
%qubit1 - number of first qubit to be swapped [1; N]
%qubit2 - number of second qubit to be swapped [1; N]

SWAP = [1 0 0 0; 
        0 0 1 0; 
        0 1 0 0; 
        0 0 0 1];

%Estimating the quantity of qubits
N=0;
sz = size(psi,1);
while sz ~= 1
    sz = sz/2;
    N=N+1;
end

%Checking if numbers of qubits are in correct order q1 < q2
if qubit1 > qubit2
    q1 = qubit2;
    q2 = qubit1;
    qubit1 = q1;
    qubit2 = q2;
else
    q1 = qubit1;
    q2 = qubit2;
end

%Checking if numbers of qubits are no more than N and different
if qubit1 > N || qubit2 > N || qubit1 < 1 || qubit2 < 1
    disp("number of qubits is incorrect: q1, q2 > N or < 1")
elseif qubit1 == qubit2

%Swapping process
else
    %Swapping qubits' states by pairs n-1|n to get q2 on place of q1
    while q2 ~= qubit1
        psi = TwoQ_gate(psi, SWAP, q2)*psi;
        q2 = q2 - 1;
    end
    q1 = q1 +1;
    %Swapping qubits' states by pairs n-1|n to get q1 on place of q2
    while q1 ~= qubit2
        psi = TwoQ_gate(psi, SWAP, q1+1)*psi;
        q1 = q1 + 1;
    end
end   
    
result = psi;
end

