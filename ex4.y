%{
#include<math.h>
#include<stdio.h>
#include<stdlib.h>
%}

%union{
	double dval;
}
%token<dval>num
%token SIN COS TAN LOG LN SQRT SQURE CUBE
%left '+' '-'
%left '*' '/'
%nonassoc uminu
%type<dval>exp
%%
ss: exp{ printf("= %g\n",$1);}
exp: exp'+'exp {$$=$1+$3;}
   | exp'-'exp { $$ = $1-$3;}
   | exp'*'exp {$$=$1*$3;}
   | exp'/'exp {if($3==0)
		{ printf("Divide By Zero"); exit(0);
		}
		else $$ = $1/$3;
	}
   |'-'exp	{$$=-$2;}
   |'('exp')'	{$$=$2;}
   |num;
%%
main(int argc, char**argv){
	yyparse();
}
yyerror(char*s){
	fprintf(stderr, "error: %s\n",s);
}


