%option noyywrap

%{
#include <stdio.h>
%}

/* Definitions */
digit       [0-9]
letter      [a-zA-Z]
id          ({letter})({letter}|{digit})*

%%

"for"           { printf("%s -> FOR\n", yytext); }
"int"           { printf("%s -> INT\n", yytext); }
"printf"        { printf("%s -> PRINTF\n", yytext); }

"("             { printf("%s -> LP\n", yytext); }
")"             { printf("%s -> RP\n", yytext); }
"{"             { printf("%s -> LB\n", yytext); }
"}"             { printf("%s -> RB\n", yytext); }
";"             { printf("%s -> SEMI\n", yytext); }
","             { printf("%s -> COMMA\n", yytext); }

"<"             { printf("%s -> LT\n", yytext); }
"++"            { printf("%s -> INC\n", yytext); }
"="             { printf("%s -> ASSIGN\n", yytext); }

"\\n"           { printf("\\n -> NEWLINE\n"); }
"%d"            { printf("%%d -> FORMAT_SPECIFIER\n"); }

{id}            { printf("%s -> ID\n", yytext); }
{digit}+        { printf("%s -> NUMBER\n", yytext); }

[ \t\r\n]+      { /* skip whitespace */ }
.               { printf("%s -> UNKNOWN\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}
