function [ z ] = inversetransformation( x, q )
%TRANSFORMATION Summary of this function goes here
%   Detailed explanation goes here
    n = size(x); n = n(1,2); m = log2(n); iq = size(q); iq=iq(1,2);
    for s = (m-1):(-1):0
        for k = (n/2-1):-1:0
            z(k+1) = sqrt(2) * (x(2*k+1) * cos(q(iq)) + x(2*k+2) * sin(q(iq)));
            z(k+n/2+1) = sqrt(2) * (x(2*k+1) * sin(q(iq)) - x(2*k+2) * cos(q(iq)));            
            iq = iq - 1;
        end
        x = z;
    end
    z = z/sqrt(n);
end
 