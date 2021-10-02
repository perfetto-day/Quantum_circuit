function [N] = qSize(psi)
%Estimating the quantity of qubits of the state

N=0;
sz = size(psi,1);
while sz ~= 1
    sz = sz/2;
    N=N+1;
end

end

