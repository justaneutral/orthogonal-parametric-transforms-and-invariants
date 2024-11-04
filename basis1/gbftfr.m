%[c,s] = gbf(m,k,l,x)
'...........................'
m=4;
n=2^4;
T=n^2
x=[1 1 1 0 1 -1 1 -1 1 0 -1 -1 1 0 0 1]; 
d=1;
[c,s]=gbf(m,1,0,x);
z = genseq(m,d,c,s);
d=-1;
zz=genseq(m,d,c,s);
a=cyccor(z,z)
b=cyccor(zz,zz)
c=cyccor(z,zz)
hold off
plot(a)
hold all
plot(b)
plot(c)
a=sort(a);
a=a(T-2);
b=sort(b);
b=b(T-2);
c=sort(c);
c=c(T-1);
[a b c]

'xxxxxxxxxxxxxxxxxxxxxxxxxxx'