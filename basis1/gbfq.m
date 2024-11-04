function [q] = gbfq(m,k,l,x)
%GBF Summary of this function goes here
%   Detailed explanation goes here
%%function [ q ] = genbaf(m,k,x,l)
%genbaf
%  Detailed explanation goes here
	%k=1;
    %m=2;
    n=2^m;
	n2=n/2;
    %x(1:n) = [-1 1 -6 1];
	z(1:n)=x(1:n).^2;
    q(1:n2*m)=0;
    c(1:n2*m)=0;
    s(1:n2*m)=0;
    
	for ir=1:m
        if(m==ir)
            k1=(-1)^(k-1);
        else
            k1=1;
        end
        k8=2^(ir-1);
        k7=0;
        k5=n/k8;
        k6=k5-1;
        k2=k5/2;
        k4=k2-1;
        k3=(-1)^floor((k-1)/k2);
        for ii=1:n2
            k7=k7+1;
            if(k8<k7)
                k7=k7-k8;
                if(l==0)
                    q(ir*ii)=q(ir*k7);
                end
            else
                k9=k5*k7;
                s1=0.0;
                s2=0.0;
                for j=0:k4
                    s1=s1+z(k9-j);
                end
                for j=k2:k6
                    s2=s2+z(k9-j);
                end
                s1=sqrt(s1);
                s2=sqrt(s2);
                if(k4==0)
                    s1=x(k9);
                    s2=x(k9-k2);
                end
                if(k3<0)
                    q(ir*ii)=k1*atan2(s2,s1);
                end
                if(k3>0)
                    q(ir*ii)=k1*atan2(s1,s2);
                end
            end
        end
    end
    
%     sq2=sqrt(2.0);
% 	c(1:n2*m)=cos(q(1:n2*m)).*sq2;
% 	s(1:n2*m)=sin(q(1:n2*m)).*sq2;
%     z(1:n)=0;
end
