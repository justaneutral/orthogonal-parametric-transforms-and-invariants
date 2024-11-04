function [ z ] = gbtfr( m,nap,s,c,x )
%GBTFR Summary of this function goes here
%   Detailed explanation goes here
%    subroutine tfr(m,nap,s,c,x,z)
	%nap=1;
    z = 0;
    n=2^m;
	n2=n/2;
    l1=m+1;
	for l=1:m
        lm=l1-l;
        for i=1:n2
            in2=i+n2;
            i20=i*2;
            i21=i20-1;
            if(nap>=0)
                li=lm*i;
                z(i)=x(i21)*c(li)+x(i20)*s(li);
                z(in2)=x(i21)*s(li)-x(i20)*c(li);
            else
                li=l*i;
                z(i21)=x(i)*c(li)+x(in2)*s(li);
                z(i20)=x(i)*s(li)-x(in2)*c(li);
            end
        end
        %x(1:n)=z(1:n);
    end
	%z = z ./ sqrt(n);
    z = z ./ sqrt(2);
end