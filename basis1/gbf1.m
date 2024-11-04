function [c,s] = gbf1(m,k,l,x)
	q=[];z=[];
    c=[];s=[];
	n=2^m;
	n2=n/2;
	z=x.^2;
	for ir=[1:m]
        if m==ir
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
        for i=1:n2
            k7=k7+1;
            if(k8<k7)
                k7=k7-k8;
                if(l==0) 
                    q(ir*i)=q(ir*k7)
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
            if s1*s2 ~= 0
                s1=sqrt(s1)
                s2=sqrt(s2)
                if k3<0 
                    q(ir*i)=k1*atan2(s2,s1);
                end
                if k3>=0 
                    q(ir*i)=k1*atan2(s1,s2);
                end
            else
                if(l==0) 
                    q(ir*i)=0;
                end
            end
            end
        end
            c = sqrt(2).*cos(q);
            s = sqrt(2).*sin(q);
end
