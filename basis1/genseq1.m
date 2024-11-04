function [ z ] = genseq1( m,q )
%GENSEQ Summary of this function goes here
%   Detailed explanation goes here
z=[];
for i=[0:(2^m)-1]
    z = [z directtransformation( [zeros(1,i) -1 zeros(1,(2^m)-1-i)], q )];
end
end