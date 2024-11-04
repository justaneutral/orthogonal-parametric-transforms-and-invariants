#include <stdio.h>
#include <math.h>

void genbaf(int m,int k,double *x,double *q,double *z,int l)
{
	int n=1,n2,i,j,ir,k1,k2,k3,k4,k5,k6,k7,k8,k9;
	double s1=0.,s2=0.;
  
	n<<=m;
	n2=n/2;
	for(i=0;i<n;i++)
	{
		z[i] = x[i]*x[i];
		//z[i]= x[i]>=0.0 ? x[i]*x[i] : -x[i]*x[i];
	}


	for(ir=1;ir<=m;ir++)
	{
		k1 = (m==ir && k&1==0) ? -1 : 1;
		k8=1;
		k8<<=(ir-1);
		k7=0;
		k5=n/k8;
		k6=k5-1;
		k2=k5/2;
		k4=k2-1;
		k3=((k-1)/k2)&1 ? -1 : 1;

		for(i=1;i<=n2;i++)
		{
			k7++;
			if(k8<k7)
			{
				k7-=k8;
				if(l==0)
				{
					q[ir*i-1] = q[ir*k7-1];
				}
			}
			else
			{
				k9=k5*k7;
				
#if(0)				
				if(k4<=0)
				{
					s1=x[k9-1];
					s2=x[k9-k2-1];
				}
				else
#endif
				{
					s1=0.0;
					s2=0.0;
					for(j=0;j<=k4;j++)
					{
						s1+=z[k9-j-1];
					}

					for(j=k2;j<=k6;j++)
					{
						s2+=z[k9-j-1];
					}

					s1=sqrt(s1);
					s2=sqrt(s2);
				}

				if((s1!=0.0)||(s2!=0.0))
				{
					if(k3<0)
					{
						q[ir*i-1]=k1*atan2(s2,s1);
					}
					else
					{
						q[ir*i-1]=k1*atan2(s1,s2);
					}
				}
				else
				{
					if(l==0)
					{
						q[ir*i-1]=0.0;
						printf("\nParameter cingularity in core #(%d,%d)\n",ir,i);
					}
				}
			}
		}
	}
}

