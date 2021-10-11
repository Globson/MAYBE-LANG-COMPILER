%{
#define YYSTYPE char*
#include "tabela_simbolos.h"
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
%token MOD
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

%start stmt
%%
stmt: expr expr expr stmt expr
    | expr

expr: ADD
    | SUB
    | MUL
    | DIV 
	| MOD 
	| EQ 
	| NE 
	| LE 
    | GE 
    | GRT 
    | LESS 
    | ABREPARENTESES stmt FECHAPARENTESES 
    | ABRECOLCHETES stmt FECHACOLCHETES 
    | ABRECHAVES stmt FECHACHAVES 
    | OR 
    | AND 
    | NOT 
    | ATRIBUI
    | conditional
    | term 
    |

term: NUM_I 
    | NUM_F 
    | ID 
    | RETURN 
    | CONTINUE 
    | BREAK 
    | INT
    | FLOAT 
    | STRING 
    | CHAR
    | BOOLEAN 
    | VOID 
    | PVIRGULA 
    | VIRGULA 

conditional: IF ABREPARENTESES expr FECHAPARENTESES ABRECHAVES stmt FECHACHAVES
	| ELSIF ABREPARENTESES expr FECHAPARENTESES ABRECHAVES stmt FECHACHAVES
	| ELSE ABREPARENTESES expr FECHAPARENTESES ABRECHAVES stmt FECHACHAVES
    | WHILE ABREPARENTESES expr FECHAPARENTESES ABRECHAVES stmt FECHACHAVES


%%

int main() {
	Nova_Tabela(&TabelaSimbolos);
	yyparse();
	printf("Programa sintaticamente correto!\n");
	Printa_Tabela_Simbolos(&TabelaSimbolos);

	return 0;
}