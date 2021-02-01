.PHONY: all clean

LLVMCONFIG=llvm-config-11
CXX = g++
CXXFLAGS = -g -std=c++11 -Wall -Wno-deprecated-register \
           -Wno-unneeded-internal-declaration \
           -Wno-unused-function

all:
	flex -o expr.lex.cpp expr.lex
	bison -d -o expr.y.cpp expr.y
	$(CXX) $(CXXFLAGS) -c -o expr.lex.o expr.lex.cpp `$(LLVMCONFIG) --cppflags`
	$(CXX) $(CXXFLAGS) -c -o expr.y.o expr.y.cpp `$(LLVMCONFIG) --cppflags`
	$(CXX) $(CXXFLAGS) -o t1 expr.y.o expr.lex.o -ly `$(LLVMCONFIG) --ldflags --libs --system-libs`

clean:
	rm -Rf t1 expr.lex.cpp expr.y.cpp expr.y.hpp *.o *~
