#include <stdio.h>
#include "myscanner.h"

extern int yylex();
extern int yylineno;
extern char* yytext;

char *names[] = {NULL, "function", "name"};

int main(void)
{

	int ntoken, vtoken;
	
	ntoken = yylex();
	while(ntoken){
		
		printf("%d\n", ntoken);
		ntoken = yylex();		

	}
	return 0;

}
