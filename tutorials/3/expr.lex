%{
#include <stdio.h>
#include <iostream>
#include <math.h>
#include "expr.y.hpp" 
%}


%option noyywrap
  //%option debug

%% // begin tokens

[ \n\t]  // ignore a space, a tab, a newline

if        { return IF;     }
while     { return WHILE;  }
return    { return RETURN; }

[a-zA-Z]+ { yylval.id = strdup(yytext); return IDENTIFIER; }

[0-9]+    {
            yylval.imm = atoi(yytext);
            return IMMEDIATE;
          }
"="       { 
            return ASSIGN; }
";"         {
            return SEMI;
          }
"("       { 
            return LPAREN;
          }
")"       { 
            return RPAREN;
          } 
"{"       {
            return LBRACE;
          } 
"}"       {
            return RBRACE;
          } 
"-"       { 
            return MINUS;
          } 
"+"       { 
            return PLUS;
          }
"*"       {
            return MULTIPLY;
          }
"/"       {
             return DIVIDE;
          }

"!"       {
            return NOT;
          }

"//".*\n

.         { printf("syntax error!\n"); exit(1); }

%% // end tokens

// put more C code that I want in the final scanner
