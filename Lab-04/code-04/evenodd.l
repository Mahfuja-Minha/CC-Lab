%option noyywrap

%{
#include "evenodd.tab.h"
#include <stdlib.h>
%}

digit  [0-9]
number ({digit}+)
ws     [ \t\n]+

%%

{ws}           {/* skip whitespace */}
{number}       { yylval = atoi(yytext); return NUM; }

.              { /* ignore unknown characters */ }

%%