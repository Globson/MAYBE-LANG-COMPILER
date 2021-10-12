all:
	bison -t -o Codigo/yacc.tab.c -d Codigo/sintax.y && flex -o Codigo/lex.yy.c Codigo/lexical.l && gcc Codigo/yacc.tab.c Codigo/lex.yy.c -o maybe
