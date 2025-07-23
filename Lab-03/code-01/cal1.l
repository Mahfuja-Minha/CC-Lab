%option noyywrap

%{
#include <stdio.h>
// Roll Number: 1703xxx
%}

/* Definitions */
digit       [0-9]
letter      [a-zA-Z]
under       [_]
id          ({letter}|{under})({letter}|{under}|{digit})*
float_num   {digit}+\.{digit}+      
ws          [ \t\r\n]

%%

"if"            { printf("%s -> IF\n", yytext); }
"("             { printf("%s -> LP\n", yytext); }
")"             { printf("%s -> RP\n", yytext); }
"{"             { printf("%s -> LB\n", yytext); }
"}"             { printf("%s -> RB\n", yytext); }
";"             { printf("%s -> SEMI\n", yytext); }
"="             { printf("%s -> ASSIGN\n", yytext); }
">"             { printf("%s -> GT\n", yytext); }
"+"             { printf("%s -> ADD\n", yytext); }
"-"             { printf("%s -> SUB\n", yytext); }
"*"             { printf("%s -> MUL\n", yytext); }
"/"             { printf("%s -> DIV\n", yytext); }

{id}            { printf("%s -> ID\n", yytext); }
{float_num}     { printf("%s -> FLOAT_NUM\n", yytext); }
{digit}+        { printf("%s -> NUMBER\n", yytext); }
{ws}            { /* Ignore whitespace */ }

.               { printf("%s -> UNKNOWN\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}
