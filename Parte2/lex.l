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
NumPos \+?{digit}+ 
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
Ascii [\\0-~ ]
Comentario {ComentarioBegin}{Ascii}*{ComentarioEnd}
/* Operadores*/
LE \<\=
GE \>\=
NE \<\>
EQ \=\=
OP [\<\>\=\+\-\*\/]|{LE}|{GE}|{NE}|{EQ}|{mod} 
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

{Comentario} {printf("Token: COMENT -> Lexema: \"%s\"\n",yytext);}

{int} {printf("Token: INT -> Lexema: \"%s\"\n",yytext);}
{float} {printf("Token: FLOAT -> Lexema: \"%s\"\n",yytext);}
{char} {printf("Token: CHAR -> Lexema: \"%s\"\n",yytext);}
{string} {printf("Token: STRING -> Lexema: \"%s\"\n",yytext);}
{boolean} {printf("Token: BOOLEAN -> Lexema: \"%s\"\n",yytext);}
{void} {printf("Token: VOID -> Lexema: \"%s\"\n",yytext);}
{return} {printf("Token: RETURN -> Lexema: \"%s\"\n",yytext);}
{break} {printf("Token: BREAK -> Lexema: \"%s\"\n",yytext);}
{continue} {printf("Token: CONTINUE -> Lexema: \"%s\"\n",yytext);}
{not} {printf("Token: NOT -> Lexema: \"%s\"\n",yytext);}
{or} {printf("Token: OR -> Lexema: \"%s\"\n",yytext);}
{and} {printf("Token: AND -> Lexema: \"%s\"\n",yytext);}
{if} {printf("Token: IF -> Lexema: \"%s\"\n",yytext);}
{elsif} {printf("Token: ELSIF -> Lexema: \"%s\"\n",yytext);}
{else} {printf("Token: ELSE -> Lexema: \"%s\"\n",yytext);}
{while} {printf("Token: WHILE -> Lexema: \"%s\"\n",yytext);}
{NumPos} {printf("Token: NUM_I -> Lexema: \"%s\"\n",yytext);}
{NumNeg} {printf("Token: NUM_I -> Lexema: \"%s\"\n",yytext);}
{PontoF_P} {printf("Token: NUM_F -> Lexema: \"%s\"\n",yytext);}
{PontoF_N} {printf("Token: NUM_F -> Lexema: \"%s\"\n",yytext);}
{String} {printf("Token: STR -> Lexema: \"%s\"\n",yytext);}
{Ch} {printf("Token: CH -> Lexema: \"%s\"\n",yytext);}

{true}  {printf("Token: TRUE -> Lexema: \"%s\"\n",yytext);}
{false} {printf("Token: FALSE -> Lexema: \"%s\"\n",yytext);}

{id} {printf("Token: ID -> Lexema: \"%s\"\n",yytext);}

{LE} {printf("Token: LE -> Lexema: \"%s\"\n",yytext);}
{GE} {printf("Token: GE -> Lexema: \"%s\"\n",yytext);}
{EQ} {printf("Token: EQ -> Lexema: \"%s\"\n",yytext);}
{NE} {printf("Token: NE -> Lexema: \"%s\"\n",yytext);}
{Atribui} {printf("Token: ATRIBUI -> Lexema: \"%s\"\n",yytext);}

{OP} {printf("Token: OP -> Lexema: \"%s\"\n",yytext);}


{ParentesesBegin} {printf("Token: ABREPARENTESES -> Lexema: \"%s\"\n",yytext);}
{ParentesesEnd} {printf("Token: FECHAPARENTESES -> Lexema: \"%s\"\n",yytext);}
{ColchetesBegin} {printf("Token: ABRECOLCHETES -> Lexema: \"%s\"\n",yytext);}
{ColchetesEnd} {printf("Token: FECHACOLCHETES -> Lexema: \"%s\"\n",yytext);}
{ChavesBegin} {printf("Token: ABRECHAVES -> Lexema: \"%s\"\n",yytext);}
{ChavesEnd} {printf("Token: FECHACHAVES -> Lexema: \"%s\"\n",yytext);} 
{PVirgula} {printf("Token: PVIRGULA -> Lexema: \"%s\"\n",yytext);}
{Virgula} {printf("Token: VIRGULA -> Lexema: \"%s\"\n",yytext);}




 
{digit}+{id}+ {printf("ERRO \"%s\"\n",yytext);}

. { printf("ERRO %c.\n", yytext[0]);}
%%


/*codigo em C. Foi criado o main, mas podem ser criadas outras funcoes aqui.*/


int main(void)
{

/* Call the lexer, then quit. */

yylex();

return 0;

}