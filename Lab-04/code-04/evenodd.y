%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *s);
int yylex();
%}

%token NUM
%start input

%%

input:
    NUM {
        if ($1 % 2 == 0)
            printf("%d is Even\n", $1);
        else
            printf("%d is Odd\n", $1);
    }
;

%%

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    printf("Parsing Finished\n");
    return 0;
}