m = 3;n = 2^m;n2=n^2;
zz1 = zeros(1,n2);zz = zz1;zz2 = zz1;zz3 = zz2;
n22=n2-2;n21=n2-1;t = m*(2^(m-1));
sed_min = 0;sed_max = -1+4^(t)


A=13 % correlation threshold

%init.
R0=[];
R1=[];
R2=[];


if(size(R0) == [0 0])
    for sed0 = 0:sed_max
        a=acrmx(m,sed0);
        if(a<=A)
            R0=[R0 sed0];
            [sed0 a]
        end
    end
end

if(size(R1) == [0 0])
    S=size(R0);S=S(1,2);        
    for ind0 = 1:(S-1)
        sed0=R0(ind0);
        for ind1 = 1+ind0:S
            sed1=R0(ind1);
            a=ccrmx(m,sed0,sed1);
            if(a<=A)
            [sed0 sed1 a]
            R1=[R1 sed0 sed1];
            end
        end
    end
end


if(size(R2)==[0 0])
    S=size(R1);        
    for ind0 = [1:2:(S-2)]
        ind1 = ind0+1;
        sed0=R1(ind0);
        sed1=R1(ind1);
        for ind2 = ind1+1:2:S
            ind3 = ind2+1;
            sed2=R1(ind2);
            sed3=R1(ind3);
            a=ccrmx(m,sed0,sed2);
            if(a<=A)
                b=ccrmx(m,sed1,sed2);
                if(a<=A)
                    c=ccrmx(m,sed0,sed3);
                    if(c<=A)
                        d=ccrmx(m,sed1,sed3);
                        if(d<=A)
                            [sed0 sed1 sed2 sed3 a b c d]
                            R2=[R2 sed0 sed1 sed2 sed3];
                        end
                    end
                end
            end
        end
    end
end
R2


