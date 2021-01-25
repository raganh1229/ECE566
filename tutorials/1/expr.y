%{
#include <cstdio>
#include <list>
#include <iostream>
#include <string>
#include <memory>
#include <stdexcept>

using namespace std;

extern FILE *yyin;
int yylex();
void yyerror(const char*);

extern "C" {
  int yyparse();
}

// helper code 
template<typename ... Args>
std::string format( const std::string& format, Args ... args )
{
    size_t size = snprintf( nullptr, 0, format.c_str(), args ... ) + 1; // Extra space for '\0'
    if( size <= 0 ){ throw std::runtime_error( "Error during formatting." ); }
    std::unique_ptr<char[]> buf( new char[ size ] ); 
    snprintf( buf.get(), size, format.c_str(), args ... );
    return std::string( buf.get(), buf.get() + size - 1 ); // We don't want the '\0' inside
}

 
%}

%token NONE

%%

NONE2: NONE
;

%%

void yyerror(const char* msg)
{
  printf("%s",msg);
}

int main(int argc, char *argv[])
{
  yyin = stdin;

  // We'll just read in tokens at first, then we'll fix this to call yyparse() later on.
  while(1)
    yylex();
  
  return 0;
}
