%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
extern FILE *yyin; // for file input
%}

%token NUM ADD SUB MUL DIV
%start cal

%%

cal:
    exp { printf("RESULT = %d\n", $1); }
    ;

exp:
    exp ADD term { $$ = $1 + $3; }
    | exp SUB term { $$ = $1 - $3; }
    | term { $$ = $1; }
    ;

term:
    term MUL NUM { $$ = $1 * $3; }
    | term DIV NUM { $$ = $1 / $3; }
    | NUM { $$ = $1; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}


int main() {
    yyparse();
    printf("Parsing Finished\n");
    return 0;
}
