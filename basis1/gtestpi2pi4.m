m = 3;n = 2^m;n2=n^2;
zz1 = zeros(1,n2);zz = zz1;zz2 = zz1;zz3 = zz2;
n22=n2-2;n21=n2-1;t = m*(2^(m-1));
sed_min = 0;sed_max = -1+4^(t)
A=14 % correlation threshold
R = [0 0 0];
sed=zeros(1,K);
z=zeros(K,n2);
a=zeros(K,K);
for sed0 = 0:(sed_max-4)
    z=genseq2(m,sed0);
    v=sort(abs(floor(100*cyccor(z,z))));
    a00=v(n22);
    if(a00<=A)
        [sed0 a00]
        for sed1 = sed0+1:(sed_max-3)
            zz=genseq2(m,sed1);
            v=sort(abs(floor(100*cyccor(zz,zz))));
            a11=v(n22);
            if(a11<=A)
                [sed0 sed1 a00 a11]
                v=sort(abs(floor(100*cyccor(zz,z))));
                a10=v(n21);
                if(a10<=A)
                    [sed0 sed1 a00 a11 a10]
                    for sed2 = sed1+1:(sed_max-2)
                        zzz=genseq2(m,sed2);
                        v=sort(abs(floor(100*cyccor(zzz,zzz))));
                        a22=v(n22);
                        if(a22<=A)
                            [sed0 sed1 sed2 a00 a11 a22 a10]
                            v=sort(abs(floor(100*cyccor(zzz,z))));
                            a20=v(n21);
                            if(a20<=A)
                                [sed0 sed1 sed2 a00 a11 a22 a10 a20]
                                v=sort(abs(floor(100*cyccor(zzz,zz))));
                                a21=v(n21);
                                if(a21<=A)
                                    [sed0 sed1 sed2 a00 a11 a22 a10 a20 a21]
                                    v=[sed0 sed1 sed2];
                                    R=[R;v];
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
R

