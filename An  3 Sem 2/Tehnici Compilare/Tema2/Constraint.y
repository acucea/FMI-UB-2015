%{

#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern int yyparse();
extern FILE* yyin;

void yyerror(const char* s);
%}

%union {
	char* cval;
}

%token T_QUIT
%token T_KEYWORD

%token T_CONSTRAINT
%token T_ORDER
%token T_PRIMARY
%token T_NEWLINE
%token T_COMMA
%token T_OPENP
%token T_CLOSEDP

%token<cval> T_STRING
%token<cval> T_QUOTED


%start calc

%%

calc: 
        |calc EXPRESSION;

EXPRESSION: T_CONSTRAINT T_NAME T_PRIMARY T_PARANTHESES T_NEWLINE { printf("\t Result: ok\n");}
        | T_QUIT T_NEWLINE                    { printf("bye!\n"); exit(0); }
        ;

T_PARANTHESES:T_OPENP T_COL T_CLOSEDP 
        ;

T_NAME: T_STRING
        | T_QUOTED 
        ;

T_COL: T_NAME
        |T_NAME T_ORDER
        | T_NAME T_COMMA T_COL
        |T_NAME T_ORDER T_COMMA T_COL
    ;

%%

int main() {
	yyin = stdin;

	do { 
		yyparse();
	} while(!feof(yyin));

	return 0;
}

void yyerror(const char* s) {
	fprintf(stderr, "Parse error: %s\n", s);
	exit(1);
}
