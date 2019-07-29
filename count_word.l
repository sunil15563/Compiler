%{
int count_word=0;
int count_character=0;
#include<stdio.h>
#include<string.h>
%}

%%
[" "\t\n]+ {count_word++;}
. {count_character++;}
%%

int yywrap(){return 1;}

	
int main()
{
yyin=fopen("input.txt","r");
yylex();
printf("\n number of words are::%d",count_word);
printf("\n number of characters are::%d",count_character);
printf("\n\n");
return 0;
}
