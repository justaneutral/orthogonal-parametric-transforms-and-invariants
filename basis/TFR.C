void tfr(int m,int nap,float *s,float *c,float *x,float *z)
//float *x,*z,*s,*c;
//int m,nap;
{ int n,n2,l1,l,lm,i,in2,i20,i21,li,j;
  float sgn;
  n=1;n<<=m;n2=n/2;l1=m+1;
  for(l=1;l<=m;l++)
  { lm=l1-l;
    for(i=1;i<=n2;i++)
    { in2=i+n2;i20=i*2;i21=i20-1;
      if(nap>=0)
      { li=lm*i;
        z[i-1]=x[i21-1]*c[li-1]+x[i20-1]*s[li-1];
        z[in2-1]=x[i21-1]*s[li-1]-x[i20-1]*c[li-1];
      }
      else
      { li=l*i;
        z[i21-1]=x[i-1]*c[li-1]+x[in2-1]*s[li-1];
        z[i20-1]=x[i-1]*s[li-1]-x[in2-1]*c[li-1];
      }
    }
    for(j=0;j<n;j++) x[j]=z[j];
  }
  sgn=sqrt((double)n);
  for(j=0;j<n;j++) x[j]=x[j]/sgn;
}
