%option noyywrap

%{
#include <stdio.h>

#define YY_DECL int yylex()

#include "Constraint.tab.h"

%}

%%

(exit|quit)		{return T_QUIT;}
[pP][rR][iI][mM][aA][rR][yY][ ][kK][eE][yY] {return T_PRIMARY;}
\"([a-zA-Z0-9 ])+?\" {return T_QUOTED;}
[ \t]	; // ignore all whitespace
\n		{return T_NEWLINE;}

[cC][oO][nN][sS][tT][rR][aA][iI][nN][tT] {return T_CONSTRAINT;}
[aA][sS][cC]|[dD][eE][sS][cC] {return T_ORDER;}


\, {return T_COMMA;}
\( {return T_OPENP;}
\) {return T_CLOSEDP;}

[A-Za-z][A-Za-z0-9]+ {return T_STRING;}


%%