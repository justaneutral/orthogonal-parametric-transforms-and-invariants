m=2;
k=1;
l=0;
x = rand(1,2^m)
x = [1 1 1 -1]
q = gbfq(m,k,l,x);
z = directtransformation( x, q )
y = inversetransformation( z, q )