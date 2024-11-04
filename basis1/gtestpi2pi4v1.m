m = 2;n = 2^m;n2=n^2;
zz1 = zeros(1,n2);zz = zz1;zz2 = zz1;zz3 = zz2;
n22=n2-2;n21=n2-1;t = m*(2^(m-1));
sed_min = 0;sed_max = -1+4^(t)
R0 = [];
A=34 % correlation threshold
for sed0 = 0:sed_max
    a=acrmx(m,sed0);
    if(a<=A)
        R0=[R0 sed0];
        [sed0 a]
    end
end

R1=[];
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
R1


