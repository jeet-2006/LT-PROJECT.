%{

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "y.tab.h"
int yylex();
void yyerror(char *s);
void printMessage();

%}

%token INTEGER
%token sum division sub mul of and is Not Valid power resto answer
%%
program: line program
				|line;

line:  expr '\n'  { printf("RESULT : %d \n",$$); }
			
			
expr:  expr '+' mulex { $$=$1+$3; printf(" sum of %d and %d is %d \n",$1,$3,$$);}
			|expr '-' mulex { $$=$1-$3; printf(" sub of %d and %d is %d \n",$1,$3,$$); }
			|expr '*' mulex { $$=$1*$3; printf(" mul of %d and %d is %d\n",$1,$3,$$);}
			|expr '/' mulex { $$=$1/$3;
			if($3==0)
			{
			printf("Not Valid \n");
			}
			else {
			printf("division of %d and %d is %d\n",$$,$3,$$);
			}
			}
			|expr '^' mulex { $$=pow($1,$3);printf(" power of %d resto %d  is %d\n",$1,$3,$$);}
			|mulex { $$=$1; }
			
mulex:'(' expr ')' { $$=$2;}
			|INTEGER { $$=$1; }


%%

void yyerror(char *s)
{
	fprintf(stderr,"%s\n",s); 
	return;
}
yywrap()
{
	return(1);
}
int main(void)
{
printMessage();
yyparse();
return 0;
} void printMessage(){
    /*Print Helper Message*/
   printf("-----------------------------------------HELP-------------------------------------------------\n");
   printf(" num+num : to do sum of two num \n");
   printf(" num-num : to do sub of two num \n");
   printf(" num*num : to do mul of two num \n");
   printf(" num/num : to do division of two num \n");
   printf(" num^num : to do power of num \n");
   printf("-----------------------------------------------------------------------------------------------\n");
 }
