function [ z ] = genseq2( m,sed )
%GENSEQ Summary of this function goes here
%   Detailed explanation goes here
    q=[];
    for i=1:(m*(2^(m-1)))
        q(i) = mod(sed,4);
        sed = floor(sed / 4);
    end
    q = pi/4 + q*(pi/2);
    z=[];
    for i=[0:(2^m)-1]
        z = [z directtransformation( [zeros(1,i) -1 zeros(1,(2^m)-1-i)], q )];
    end
end