function [ cr ] = cyccor( a,b)
%CYCCOR Summary of this function goes here
%   Detailed explanation goes here
cr=[];
n1 = size(a);
n1 = n1(1,2);
n2 = size(b);
n2 = n2(1,2);
n = min(n1,n2);
for i=[1:n-1]
    cr = [cr corr(a',[b(i:n) b(1:i-1)]')];
end
end
        
