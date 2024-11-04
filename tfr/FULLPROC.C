#include <stdio.h>
#include <io.h>
#include <fcntl.h>
#include <sys\types.h>
#include <sys\stat.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>


void dek(double *x, int n,int *iq, int m, double *y);
void genyad(int *iq, int n22);
void genbaf(int m,int k,double *x,double *q,double *z,int l);
void qtosc(int m,double *s,double *c);
void tfr(int m,int nap,double *s,double *c,double *x,double *z);


void main(void)
{ 
	FILE *iofl,*yfl,*qfl;
	char *otv,*fname,*yname,*qname;
	double x[64],y[64],z[64],s[6*32],c[6*32];
	float iks[64];
	int m,n,n22,mn2,i,cycsft,iq[126];
  
	puts("\nType log of length");
	scanf("%d",&m);
	n=1;
	n<<=m;
	n22=2*n-2;
	mn2=m*n/2;
  
	printf("\n m=%d,n=%d,n22=%d,mn2=%d",m,n,n22,mn2);
	
#ifdef _INVARIANTS_
	genyad(iq,n22);	
#endif // _INVARIANTS_	
	m1:;
	puts("\nEnter samples");
	for(i=0;i<n;i++)
	{ 
		printf("\n %d ?",i);
		scanf("%f",&iks[i]);
		x[i]=(double)iks[i];
	}
	
#ifdef _INVARIANTS_
	for(cycsft=0;cycsft<n;cycsft++)
	{
#endif //_INVARIANTS_	
		for(i=0;i<n;i++) printf("\n%f",(float)x[i]);
#ifdef _INVARIANTS_  
		puts("\nInvariants:\n");
  
		dek(x,n,iq,m,z);
#else
		puts("\nsamples:\n");
#endif
		for(i=0;i<n;i++) printf("%f ",x[i]);
  
		genbaf(m,1,x,s,z,1);
  		qtosc(m,s,c);
		tfr(m,1,s,c,x,z);
  
		puts("\n spectrum:\n");
		for(i=0;i<n;i++) printf("%f ",x[i]);
		
		puts("\n spectrum**(-1)");
		tfr(m,-1,s,c,x,z);
		for(i=0;i<n;i++) printf("%f ",x[i]);


#ifdef _INVARIANTS_		
		x[0]=(double)iks[0];
		for(i=1;i<n;i++)
		{ 
			iks[i-1]=iks[i];
			x[i]=(double)iks[i];
		}
		iks[n-1]=(float)x[0];
		
		for(i=0;i<n;i++)
		{ 
			x[i]=(double)iks[i];
		}
	}	
#endif //_INVARIANTS_	
	puts("\n next step\n");
	goto m1;
}
