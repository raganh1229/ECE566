%{
#include <stdio.h>
#include <iostream>
#include <math.h>
#include "expr.y.hpp"

%}

%option debug
%option noyywrap

%% // begin tokens

[ \n\t]  // ignore a space, a tab, a newline

[Rr][0-7]
[0-9]+
"="
;
"("        
")"        
"["        
"]"        
"-"        
"+"        

"//".*\n

.

%% // end tokens

