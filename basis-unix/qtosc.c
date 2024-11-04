#include "inc.h"

void qtosc(int m,float *s,float *c)
//float *s,*c;
//int m;
{ int n,i;
  float sq2;
  n=1;n<<=(m-1);n*=m;
  sq2=sqrt(2.0);
  for(i=0;i<n;i++)
  { c[i]=cos(s[i])*sq2; 
    s[i]=sin(s[i])*sq2;
  }
}
