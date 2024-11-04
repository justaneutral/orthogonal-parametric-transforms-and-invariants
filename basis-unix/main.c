#include "inc.h"

int main(int argc, char *argv[])
{ FILE *iofl,*yfl,*qfl;
  char *otv,*fname,*yname,*qname;
  float x[64],y[64],z[64],s[6*32],c[6*32],iks;
  int iq[126];
  int m,n,n22,mn2,i;
  puts("\nEnter log2(N) value:");
  scanf("%d",&m);n=1;n<<=m;n22=2*n-2;mn2=m*n/2;
  printf("\n m=%d,n=%d,n22=%d,mn2=%d",m,n,n22,mn2);
  scanf("%c");
  m1:;
  puts("\nEnter values:");
  for(i=0;i<n;i++) { printf("\n %d ?",i);scanf("%f",&iks);x[i]=iks;}
  for(i=0;i<n;i++) printf("\n%f",x[i]);
  genyad(iq,n22);
  puts("\n genyad done: - press enter");
  scanf("%c");
  dek(x,n,iq,m,z);
  for(i=0;i<n;i++) printf("%f ",x[i]);
  genbaf(m,1,x,s,z,0);
  qtosc(m,s,c);
  tfr(m,1,s,c,x,z);
  puts("\n spectr:\n");
  for(i=0;i<n;i++) printf("%f ",x[i]);
  puts("\n spectr**(-1) - press enter");
  tfr(m,-1,s,c,x,z);
  for(i=0;i<n;i++) printf("%f ",x[i]);
  puts("\n next step\n");
  goto m1;
}
