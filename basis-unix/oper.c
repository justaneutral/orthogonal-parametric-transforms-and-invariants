#include "inc.h"

void oper(float x1, float x2, float *y1, float *y2, int i1, int i2)
//float x1,x2,*y1,*y2;
//int i1,i2;
{ float y[2];
  int i[2],j,ind=1;
  i[0]=i1;i[1]=i2;
  for(j=0;j<2;j++)
  { if(i[j]>5) { i[j]-=5;ind=0;}
    switch (i[j])
    { case 1 : y[j]=x1+x2;break;
      case 2 : y[j]=x1*x2;break;
      case 3 : y[j]=x1>=x2?x1:x2;break;
      case 4 : y[j]=x1<=x2?x1:x2;break;
      case 5 : y[j]=x1-x2;
    }
    if(ind) y[j]=y[j]<0.0?-1.0*y[j]:y[j];
  }
  *y1=y[0];*y2=y[1];
}

