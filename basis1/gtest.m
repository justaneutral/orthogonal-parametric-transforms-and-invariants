m = 3;
n = 2^m;
n2=n^2;
R = [];
zz1 = zeros(1,n2);
zz = zz1;
zz2 = zz1;
zz3 = zz2;
n22=n2-2;
n21=n2-1;
t = m*(2^(m-1));
sed_min = 0;
sed_max = -1+4^(t)
%dec2bin(sed_max)
A=1; P=1;
sedcnt=0;
for sed1 = 0:sed_max
    sed = sed1;
    %bin2dec(sed)
    %extract basis
    z = genseq2(m,sed1);
    a=cyccor(z,z);
    %hold off
    %plot(a)
    %hold all
    a=sort(abs(a));
    a=a(n22);
    pta = max((z.^2))/(z*z');
    if (a+pta<=A+P)
        A = a;
        P = pta;
        theta = sed1;
        zz3 = zz2;
        zz2 = zz1;
        zz1 = zz;
        zz = z;
        B = cyccor(zz,zz1);
        B = sort(B);
        B = B(n21);
        C = cyccor(zz,zz2);
        C = sort(C);
        C = C(n21);
        D = cyccor(zz,zz3);
        D = sort(D);
        D = D(n21);
        sedcnt = sedcnt+1;
        R = [R theta];
        [floor(10000*A) floor(10000*B) floor(10000*C) floor(10000*D) floor(10000*P) theta]
    end
end
R
