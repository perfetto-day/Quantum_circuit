function [Prob] = qProb(phi,P)
%Probability of projection to specific axis described by P
%P = <phi|P||phi>
%Used in the report
Prob = phi' * P * phi;
end

