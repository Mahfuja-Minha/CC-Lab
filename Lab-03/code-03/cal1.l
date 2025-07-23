%option noyywrap

%{
#include <stdio.h>
// Roll Number: 1703xxx
%}

/* Definitions */
digit   [0-9]
ws      [ \t\r\n]

%%

{digit}+        { printf("%s -> NUMBER\n", yytext); }
"+"             { printf("%s -> ADD\n", yytext); }
"-"             { printf("%s -> SUB\n", yytext); }
"*"             { printf("%s -> MUL\n", yytext); }
"/"             { printf("%s -> DIV\n", yytext); }
{ws}+           { /* ignore whitespace */ }

.               { printf("%s -> UNKNOWN\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}
