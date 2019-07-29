%{
    #include <stdio.h>
    #include<string.h>
    char* reverse;
%}

%%

[a-zA-Z0-9" "]+ {reverse=strdup(yytext);}
. {}

%%
int yywrap()
{
  return 1;
} 

int main()
{
  yyin = fopen("input.txt","r");
  int i;
  yylex();
  printf("Reverse String :");
  for(i=strlen(reverse)-1;i>=0;i--)
  {
    printf("%c",reverse[i]); 
  }    
  printf("\n\n");
  return 0;
}
 
