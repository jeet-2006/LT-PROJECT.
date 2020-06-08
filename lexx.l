%{
#include<stdio.h>
#include<stdlib.h>
#include"y.tab.h"
%}
%%

[ \t]+ ;
[0-9]+ { yylval=atoi(yytext); return INTEGER; }
[-+*/^] { return *yytext; }
sum|sub |mul |of |and |is |division |power | resto |answer |Not| Valid	{return *yytext;} 
\n { return *yytext; }
. { char msg[25];	
    sprintf(msg,"%s <%s>","invalid character",yytext); 
    yyerror(msg); }
%% 
