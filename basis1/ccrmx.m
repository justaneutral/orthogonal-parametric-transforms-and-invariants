function [a]=ccrmx(m,sed0,sed1)
    z=genseq2(m,sed0);
    zz=genseq2(m,sed1);
    a=max(abs(floor(100*cyccor(z,zz))));
end
