void genyad(iq,n22)
int *iq,n22;
{ int i,j,k;
  char *symv,*symop[9]={"[+]","[*]","[>]","[<]","[-]","+","*",">","<"};
  for(i=0;i<n22;i++)
  { met1: printf(" Введите опеpацию %d из %d",i+1,n22);
    scanf("%s",symv);
    for(j=0;j<10;j++) if(strcmp(symv,symop[j])==0) goto met0;
    printf(" \n Вам необходима помощь\n");
    for(k=0;k<9;k++) printf("%s ",symop[k]);
    goto met1;
    met0: iq[i]=j+1;
  }
}
