function [P] = qProject(o, f, sign)
%Operator for projecting to n(o, f) for spin = +-1/2 
%P = 1/2 * (1 +- sigma*n) 
%Will calculate operator for +1/2 for any sign other than "-"
%Using the matrix that was created in the report

if sign == "-"
    P = 1/2*[1-cos(o) -sin(o)*exp(-1i*f); -sin(o)*exp(1i*f) 1+cos(o)];
else
    P = 1/2*[1+cos(o) sin(o)*exp(-1i*f); sin(o)*exp(1i*f) 1-cos(o)];
end

