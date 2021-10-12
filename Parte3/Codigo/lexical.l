%{
/*codigo colocado aqui aparece no arquivo gerado pelo flex*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define YY_DECL int yylex()
#define YYSTYPE char*
#include "yacc.tab.h"

char * Valor_Semantico(char* yytext, int yyleng) //funcao criada para enviar nome de identificador para bison
{
    char * id_name = (char*)malloc((yyleng+1)*sizeof(char));
    if (id_name!=NULL){
        strcpy(id_name, yytext);
    }
    return id_name;
}
%}
/* This tells flex to read only one input file */
%option noyywrap
%option yylineno
/* definicoes regulares */
delim [ \t\n]
ws {delim}+
digit [0-9]
letter [a-zA-Z]
id {letter}[a-zA-Z0-9]*  
NumPos {digit}+ 
NumNeg \-[1-9]{digit}*
CasasDecimais \.{digit}+ 
PontoF_P {NumPos}{CasasDecimais}
PontoF_N \-{digit}+{CasasDecimais}
String \"(\\.|[^\"])*\"
Ch \'.\'
/* id = identificadores */
/* Palavras reservadas */
int int
float float 
char char  
string string
boolean boolean
void void  
return return
not not
or or  
and and
if if  
elsif elsif
else else
while while
true true
false false
mod mod
break break
continue continue
/*Comentarios*/
ComentarioBegin \/\*
ComentarioEnd \*\/
Ascii .
Comentario {ComentarioBegin}{Ascii}*{ComentarioEnd}
/* Operadores OP [\<\>\=\+\-\*\/]*/
LE \<\=
GE \>\=
NE \<\>
EQ \=\=

GRT \>
LESS \<
ADD \+
SUB \-
DIV \/
MUL \*
Atribui \=

ParentesesBegin \(
ParentesesEnd \)
Virgula \,
PVirgula \;
ColchetesBegin \[
ColchetesEnd \]
ChavesBegin \{
ChavesEnd \}


%%
{ws} {/*nenhuma acao e nenhum retorno*/}

{Comentario} {/*nenhuma acao e nenhum retorno*/}

{int} {return INT;}
{float} {return FLOAT;}
{char} {return CHAR;}
{string} {return STRING;}
{boolean} {return BOOLEAN;}
{void} {return VOID;}
{return} {return RETURN;}
{break} {return BREAK;}
{continue} {return CONTINUE;}
{not} {return NOT;}
{or} {return OR;}
{and} {return AND;}
{if} {return IF;}
{elsif} {return ELSIF;}
{else} {return ELSE;}
{while} {return WHILE;}
{NumPos} {return NUM_I;}
{NumNeg} {return NUM_I;}
{PontoF_P} {return NUM_F;}
{PontoF_N} {return NUM_F;}
{String} {return STR;}
{Ch} {return CH;}

{true}  {return TRUE;}
{false} {return FALSE;}



{LE} {return LE;}
{GE} {return GE;}
{EQ} {return EQ;}
{NE} {return NE;}
{Atribui} {return ATRIBUI;}
{mod} {return MOD;}
{GRT} {return GRT;}
{LESS} {return LESS;}
{ADD} {return ADD;}
{SUB} {return SUB;}
{DIV} {return DIV;}
{MUL} {return MUL;}

{ParentesesBegin} {return ABREPARENTESES;}
{ParentesesEnd} {return FECHAPARENTESES;}
{ColchetesBegin} {return ABRECOLCHETES;}
{ColchetesEnd} {return FECHACOLCHETES;}
{ChavesBegin} {return ABRECHAVES;}
{ChavesEnd} {return FECHACHAVES;} 
{PVirgula} {return PVIRGULA;}
{Virgula} {return VIRGULA;}


{id} {yylval = Valor_Semantico(yytext, yyleng); return ID;}
 
{digit}+{id}+ {printf("Programa sintaticamente incorreto!\nErro lexico na linha %d.\n",yylineno); exit(1);}

. { printf("Programa sintaticamente incorreto!\nErro lexico na linha %d.\n",yylineno); exit(1);}
%%
