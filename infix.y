%{
#include<string.h>
#include<stdio.h>
%}
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS
%union {
         char s[20];
       }
%token <s> ID NUM 
%type <s> E

%%
 S:E                  {printf("%s\n",$1);}
 ;
E:E'+'E {
                  strcat($1,$3);
                  strcat($1,"+");
                          strcpy($$,$1);
                }
 |E'*'E {
                          strcat($1,$3);
                  strcat($1,"*");
                  strcpy($$,$1);
                        }
 |E'/'E {            strcat($1,$3);
                strcat($1,"/");
                strcpy($$,$1);
         
        }
 |E'-'E {
                        strcat($1,$3);
                strcat($1,"-");
                strcpy($$,$1);
        }
 |'-'E %prec UMINUS {
                    strcat($2,"UMINUS");
                        strcpy($$,$2);
                    }
 |ID                  {strcpy($$,$1);}
 |NUM             {strcpy($$,$1);}
 |'('E')' {strcpy($$,$2);}
 ;
%%
#include "lex.yy.c"
int main()
{
yyparse();
}

yyerror (char * s)
{
printf ("% s \n", s);
exit (1);
}
