#include <stdio.h>
#include <io.h>
#include <fcntl.h>
#include <sys\types.h>
#include <sys\stat.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "dek.c"
#include "genyad.c"
#include "tfr.c"
#include "genbaf.c"
#include "qtosc.c"


void main(void)
{ 
	FILE *iofl,*yfl,*qfl;
	char *otv,*fname,*yname,*qname;
	float x[64],y[64],z[64],iq[126],s[6*32],c[6*32],iks;
	int m,n,n22,mn2,i;
  
	puts("\nType log of length");
	scanf("%d",&m);n=1;n<<=m;n22=2*n-2;mn2=m*n/2;
  
	printf("\n m=%d,n=%d,n22=%d,mn2=%d",m,n,n22,mn2);
	scanf("%c");
	
	m1:;
	puts("\nEnter samples");
	for(i=0;i<n;i++) { printf("\n %d ?",i);scanf("%f",&iks);x[i]=iks;}
	for(i=0;i<n;i++) printf("\n%f",x[i]);
  
	genyad(iq,n22);
	puts("\nInvariants : - press enter");
  
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
