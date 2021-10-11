%{
#define YYSTYPE char*
#include "tabela_Simbolos.h"
#include <stdlib.h>
#include <stdio.h>
//#define YYDEBUG 1

extern int yylex();
extern int yylineno;

void yyerror(const char* s) {
	fprintf(stderr,"Erro sintático na linha %d -> %s\n", yylineno,s);
	exit(1);
}

void deerror(const char* s) {
	fprintf(stderr,"Erro o identificador '%s' na linha %d nao foi declarado!\n", s, yylineno);
	exit(1);
}

Tabela_Simbolos TabelaSimbolos;

%}

%token INT
%token FLOAT
%token CHAR
%token STRING
%token BOOLEAN
%token VOID
%token RETURN
%token BREAK
%token CONTINUE
%token NOT
%token OR
%token AND
%token IF
%token ELSIF
%token ELSE
%token WHILE
%token NUM_I
%token NUM_F
%token TR
%token CH
%token TRUE
%token FALSE
%token ID
%token LE
%token GE
%token EQ
%token NE
%token ATRIBUI
%token GRT
%token LESS
%token ADD
%token SUB
%token DIV
%token MUL
%token ABREPARENTESES
%token FECHAPARENTESES
%token ABRECOLCHETES
%token FECHACOLCHETES
%token ABRECHAVES
%token FECHACHAVES 
%token PVIRGULA
%token VIRGULA

%%

%%

int main() {
	Nova_Tabela(&TabelaSimbolos);
	yyparse();
	printf("Programa sintaticamente correto!\n");
	Printa_Tabela_Simbolos(&TabelaSimbolos);

	return 0;
}
