%{
#include "myscanner.h"
%}

%%
"True" | "False" return BOOLEAN;
"None" return NONE;
"and" | "or" | "not"  return LOGICAL_OP;
"as" return ALIAS;
"assert" return ASSERT;
"break" | "continue" return INSEDE_LOOPS;
"class" return CLASS;
"def" return DEF_FUNCTION;
"del" return DELETE;
"if" | "else" | "elif" return CONDITIONAL;
"except" | "raise" | "try" return EXCEPTIONS;
"finally" return FINALLY;
"for" | "while" return LOOP;
"from" | "import" return IMPORTS;
"global" return GLOBAL;
["in", "is", "lambda","nonlocal", "pass", "return", "with", "yield"] return NOT_IMPL;


[a-zA-Z][_a-zA-Z0-9]* return VARIABLE;
[1-9][0-9]* return DIGIT;
[ \t\n] ;
. printf("unexpected character \n");


%%

int yywrap(void)
{
	return 1;
}  
