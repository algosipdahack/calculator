%{
	#include "ex4.tab.h"
	#include <math.h>
	#include <stdlib.h>
%}
%%
[-+]?([0-9]*\.?[0-9]+|[0-9]+\.)	{ yylval.dval= atof(yytext); return num;}
[|][-+]?[0-9]*	{yylval.dval=abs(atof(yytext+1));return num;}
sin 	{return SIN;}
cos	{return COS;}
cube	{return CUBE;}
squre	{return SQURE;}
ln	{return LN;}
tan	{return TAN;}
log	{return LOG;}
sqtr	{return SQRT;}
\n	{ return 0;}
[ \t] 	{ /* ignore whitespace */}
.	return yytext[0];
%%
