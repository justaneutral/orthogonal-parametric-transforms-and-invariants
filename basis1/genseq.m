function [ z ] = genseq( m,d,c,s )
%GENSEQ Summary of this function goes here
%   Detailed explanation goes here
z=[];
for i=[0:(2^m)-1]
    z = [z gbtfr(m,d,s,c,[zeros(1,i) 1 zeros(1,(2^m)-1-i)])];
end
end