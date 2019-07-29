%option noyywrap
%%
[a-zA-Z] { strcpy(yylval.s,yytext);
           return ID;
         }
[+*-/]   { return yytext[0];}
[0-9]    { return yytext[0];}
[\n]     { return 0;}
"("|")"  { return yytext[0];}
.        {;}
%%
