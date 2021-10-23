all:
	bison -t -o Codigo/yacc.tab.c -d Codigo/translate.y && flex -o Codigo/lex.yy.c Codigo/lex.l && gcc Codigo/yacc.tab.c Codigo/lex.yy.c -o maybe
