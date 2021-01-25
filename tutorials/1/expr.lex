%{
#include <stdio.h>
#include <iostream>
#include <math.h>
#include "expr.y.hpp"
  
  //extern "C" {
  //  int yylex();
  //}

%}

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

"//".*\n  { }


.    { printf("Illegal character! "); }

%% // end tokens

//

// (the rest of the line is ignored)
