#include <math.h>

void qtosc(int m,double *s,double *c)
{ 
	int n,i;
  	double sq2;
  
	n=1;
	n<<=(m-1);
	n*=m;
  
	sq2 = sqrt(2.0);
  
	for(i=0;i<n;i++)
	{
		c[i]=cos(s[i])*sq2; 
		s[i]=sin(s[i])*sq2;
	}
}
