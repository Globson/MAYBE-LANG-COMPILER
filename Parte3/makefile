all:
	bison -t -o yacc.tab.c -d syntax.y && flex -o lex.yy.c lexical.l && gcc yacc.tab.c lex.yy.c -o maybe