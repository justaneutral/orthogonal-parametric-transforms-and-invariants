#include "inc.h"

void dek(float *x, int n, int *iq, int m, float *y)
//float *x,*y;
//int *iq,n,m;
{ int i,k,l,li,j,is,ic,nx1,nx2;
  for(i=0;i<m;i++)
  { k=2; k<<=i;
    l=n/k;li=l/2;
    for(j=0;j<k;j++)
    { is=j*l;
      for(ic=0;ic<li;ic++)
      { nx1=ic+is;nx2=nx1+li;
        oper(x[nx1],x[nx2],&y[nx1],&y[nx2],iq[i],iq[i+1]);
      }
    }
    for(j=0;j<n;j++) x[j]=y[j];
  }
}
