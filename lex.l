%{
/*codigo colocado aqui aparece no arquivo gerado pelo flex*/

%}
/* This tells flex to read only one input file */
%option noyywrap
/* definicoes regulares */
delim [ \t\n]
ws {delim}+
digit [0-9]
letter [a-zA-Z]
id {letter}[a-zA-Z0-9]*  
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
/*Comentarios*/
ComentarioBegin \/\*
ComentarioEnd \*\/
Ascii [\\0-~ ]
Comentario {ComentarioBegin}{Ascii}*{ComentarioEnd}
/* Operadores*/
LE \<\=
GE \>\=
NE \<\>
EQ \=\=
OP [\<\>\=\+\-\*\/]|{LE}|{GE}|{NE}|{EQ} 
Atribui \=

ParentesesBegin \(
ParentesesEnd \)
PVirgula \;
ColchetesBegin \[
ColchetesEnd \]
ChavesBegin \{
ChavesEnd \}


%%
{ws} {/*nenhuma acao e nenhum retorno*/}

{Comentario} {printf("Token: COMENT -> Lexema: \"%s\"\n",yytext);}

{int} {printf("Token: INT -> Lexema: \"%s\"\n",yytext);}
{float} {printf("Token: FLOAT -> Lexema: \"%s\"\n",yytext);}
{char} {printf("Token: CHAR -> Lexema: \"%s\"\n",yytext);}
{string} {printf("Token: STRING -> Lexema: \"%s\"\n",yytext);}
{boolean} {printf("Token: BOOLEAN -> Lexema: \"%s\"\n",yytext);}
{void} {printf("Token: VOID -> Lexema: \"%s\"\n",yytext);}
{return} {printf("Token: RETURN -> Lexema: \"%s\"\n",yytext);}
{not} {printf("Token: NOT -> Lexema: \"%s\"\n",yytext);}
{or} {printf("Token: OR -> Lexema: \"%s\"\n",yytext);}
{and} {printf("Token: AND -> Lexema: \"%s\"\n",yytext);}
{if} {printf("Token: IF -> Lexema: \"%s\"\n",yytext);}
{elsif} {printf("Token: ELSIF -> Lexema: \"%s\"\n",yytext);}
{else} {printf("Token: ELSE -> Lexema: \"%s\"\n",yytext);}
{while} {printf("Token: WHILE -> Lexema: \"%s\"\n",yytext);}
{digit}* {printf("Token: NUM -> Lexema: \"%s\"\n",yytext);}
{true}  {printf("Token: TRUE -> Lexema: \"%s\"\n",yytext);}
{false} {printf("Token: FALSE -> Lexema: \"%s\"\n",yytext);}

{id} {printf("Token: ID -> Lexema: \"%s\"\n",yytext);}

{LE} {printf("Token: LE -> Lexema: \"%s\"\n",yytext);}
{GE} {printf("Token: GE -> Lexema: \"%s\"\n",yytext);}
{EQ} {printf("Token: EQ -> Lexema: \"%s\"\n",yytext);}
{NE} {printf("Token: NE -> Lexema: \"%s\"\n",yytext);}
{Atribui} {printf("Token: ATRIBUI -> Lexema: \"%s\"\n",yytext);}

{OP} {printf("Token: OP -> Lexema: \"%s\"\n",yytext);}


{ParentesesBegin} {printf("Token: ( -> Lexema: \"%s\"\n",yytext);}
{ParentesesEnd} {printf("Token: ) -> Lexema: \"%s\"\n",yytext);}
{ColchetesBegin} {printf("Token: [ -> Lexema: \"%s\"\n",yytext);}
{ColchetesEnd} {printf("Token: ] -> Lexema: \"%s\"\n",yytext);}
{ChavesBegin} {printf("Token: { -> Lexema: \"%s\"\n",yytext);}
{ChavesEnd} {printf("Token: } -> Lexema: \"%s\"\n",yytext);} 
{PVirgula} {printf("Token: ; -> Lexema: \"%s\"\n",yytext);}




 
{digit}+{id}+ {printf("ERRO \"%s\"\n",yytext); return 0;}

. { printf("ERRO %c.\n", yytext[0]);
exit(-1); }
%%


/*codigo em C. Foi criado o main, mas podem ser criadas outras funcoes aqui.*/


int main(void)
{

/* Call the lexer, then quit. */

yylex();

return 0;

}