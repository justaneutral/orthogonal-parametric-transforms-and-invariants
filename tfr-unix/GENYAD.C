#include <stdio.h>
#include <string.h>
#include <math.h>

void genyad(int *iq, int n22)
{ 
	int i,j,k;
	char symv[4];
	char symop[9][4]={"[+]","[*]","[>]","[<]","[-]","+","*",">","<"};
  
	for(i=0;i<n22;i++)
	{ 
		while(1)
		{
			printf(" Enter operator %d of %d",i+1,n22);
			scanf("%s",symv);
			for(iq[i]=0,j=0;j<10;j++) 
			{
				if(strcmp(symv,symop[j])==0)
				{
					iq[i]=j+1;
					break;
				}
			}
			if(iq[i]==0)
			{
				printf(" \nYou need help.\n");
				for(k=0;k<9;k++)
				{
					printf("%s ",symop[k]);
				}
			}
			else
			{
				break;
			}
		}

	}
}
