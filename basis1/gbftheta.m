function [ c,s ] = gbftheta( theta )
%GBFTHETA Summary of this function goes here
%   Detailed explanation goes here
c = pi./180.*theta;
s = sqrt(2).*sin(c);
c = sqrt(2).*cos(c);
end