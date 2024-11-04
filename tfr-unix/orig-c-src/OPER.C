void oper(x1,x2,y1,y2,i1,i2)
float x1,x2,*y1,*y2;
int i1,i2;
{ float y[2];
  int i[2],j,ind=1;
  i[0]=i1;i[1]=i2;
  for(j=0;j<2;j++)
  { if(i[j]>5) { i[j]-=5;ind=0;}
    switch (i[j])
    { case 1 : y[j]=x1+x2;break;
      case 2 : y[j]=x1*x2;break;
      case 3 : y[j]=max(x1,x2);break;
      case 4 : y[j]=min(x1,x2);break;
      case 5 : y[j]=x1-x2;
    }
    if(ind) y[j]=abs(y[j]);
  }
  *y1=y[0];*y2=y[1];
}

