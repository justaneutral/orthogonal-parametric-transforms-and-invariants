m = 3;
n = 2^m;
t = m*(2^(m-1));
sed_min = 0;
sed_max = -1+4^(t)
dec2bin(sed_max)

sed = 45264;

%extract basis
basis=[];
for i=1:t
    basis(i) = mod(sed,4);
    sed = sed / 4;
end
basis = pi/4 + basis*(pi/2);
z=directtransformation([1 0 0 0 0 0 0 0],basis)
inversetransformation(z,basis)
