function [result] = CNOT(psi, qcontrolling, qcontrolled)
%CNOT Controlled NOT inverts the state of controlled qubit if controlled
%state is |1>
%psi - N-qubit quantum state
%qcontrolling - Controlling cubit position number
%qcontrolled - Controlled cupit position number


CNOT = [ 1 0 0 0; 
         0 1 0 0; 
         0 0 0 1; 
         0 0 1 0];

%Estimating the quantity of qubits
N=0;
sz = size(psi,1);
while sz ~= 1
    sz = sz/2;
    N=N+1;
end

%Checking if numbers of qubits are no more than N and different
if qcontrolled > N || qcontrolling > N || qcontrolled < 1 || qcontrolling < 1
    disp("number of qubits is incorrect: q1, q2 > N")
elseif qcontrolled == qcontrolling

%Creating matrix operator and changing states

%Swapping controlled qubit with controlling+1 to get them side by side so
%the matrix CNOT (4x4) can be used and then swapping everything back
elseif qcontrolled > qcontrolling
    if qcontrolling == qcontrolled - 1
        psi = TwoQ_gate(psi, CNOT, qcontrolled)*psi;
    else
        psi = SWAP(psi, qcontrolling+1, qcontrolled); 
        psi = TwoQ_gate(psi, CNOT, qcontrolling+1)*psi;
        psi = SWAP(psi, qcontrolling+1, qcontrolled);
    end

%Swapping controlling qubit with controlled+1 to get them side by side and
%swapping them to invert so the matrix CNOT (4x4) can be used and then
%swapping everything back 
else %qcontrolled < qcontrolling
    if qcontrolling == qcontrolled + 1
        psi = SWAP(psi, qcontrolling, qcontrolled);
        psi = TwoQ_gate(psi, CNOT, qcontrolling)*psi;
        psi = SWAP(psi, qcontrolling, qcontrolled);
    else
        psi = SWAP(psi, qcontrolled+1, qcontrolling);
        psi = SWAP(psi, qcontrolled, qcontrolled+1);
        psi = TwoQ_gate(psi, CNOT, qcontrolled+1)*psi;
        psi = SWAP(psi, qcontrolled, qcontrolled+1);
        psi = SWAP(psi, qcontrolled+1, qcontrolling);
    end
end
result = psi; 
end

