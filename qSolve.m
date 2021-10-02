function [result] = qSolve(psi)
%Finds the constants and place them to the matrix
sz = size(psi, 1);

if sz == 2
    q0 = psi'*[1 0]';
    q1 = psi'*[0 1]';
    result = [q0 q1];
elseif sz == 4
    q00 = psi'*[1 0 0 0]';
    q01 = psi'*[0 1 0 0]';
    q10 = psi'*[0 0 1 0]';
    q11 = psi'*[0 0 0 1]';
    result = [q00 q01; q10 q11];
else
    result = false;
end
