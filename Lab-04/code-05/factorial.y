%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *s);
int yylex();

unsigned long long factorial(int n) {
    if (n < 0) return 0;
    if (n == 0 || n == 1) return 1;
    return n * factorial(n -1);
}
%}

%token NUM
%start input

%%

input:
    NUM {
        unsigned long long f = factorial($1);
        printf("Factorial of %d = %llu\n", $1, f);
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