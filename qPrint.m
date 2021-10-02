function [string] = qPrint(psi)
%Prints the string using sum of ket-vectors
%Works for 1, 2 and 3 qubits
if size(psi, 1) == 2
    string = sprintf('%.2f|0> + %.2f|1>', psi);
elseif size(psi, 1) == 4
    string = sprintf('%.2f|00> + %.2f|01> + %.2f|10> + %.2f|11>', psi);
elseif size(psi, 1) == 8
    string = sprintf('%.2f|000> + %.2f|001> + %.2f|010> + %.2f|011> + %.2f|100> + %.2f|101> + %.2f|110> + %.2f|111>', psi);    
else
    string = sprintf('size = %d (wrong)', size(psi, 1));
end

