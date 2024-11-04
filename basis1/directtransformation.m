function [ z ] = directtransformation( x, q )
%TRANSFORMATION Summary of this function goes here
%   Detailed explanation goes here
    n = size(x); n = n(1,2); m = log2(n); iq = 1;
    for s = 0:m-1
        for k = 0:n/2-1
            z(2*k+1) = sqrt(2) * (x(k+1) * cos(q(iq)) + x(k+n/2+1) * sin(q(iq)));
            z(2*k+2) = sqrt(2) * (x(k+1) * sin(q(iq)) - x(k+n/2+1) * cos(q(iq)));
            iq = iq + 1;
        end
        x = z;
    end
    z = z/sqrt(n);
end
 