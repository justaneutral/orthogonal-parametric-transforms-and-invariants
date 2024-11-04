%[c,s] = gbf(m,k,l,x)
'...........................'
m=2;
n=2^m;
k=(2^(m-1))*m;
T=n^2;
d=-1;
x = [0 0 0 0];
[ c,s ] = gbf( m,1,0,x );
z = gbtfr(m,d,c,s,x)
'xxxxxxxxxxxxxxxxxxxxxxxxxxx'