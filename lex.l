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



%%
{ws} {/*nenhuma acao e nenhum retorno*/}

int {printf("Token: INT -> Lexema: \"%s\"\n",yytext);}
float {printf("Token: FLOAT -> Lexema: \"%s\"\n",yytext);}
char {printf("Token: CHAR -> Lexema: \"%s\"\n",yytext);}
string {printf("Token: STRING -> Lexema: \"%s\"\n",yytext);}
void {printf("Token: VOID -> Lexema: \"%s\"\n",yytext);}
return {printf("Token: RETURN -> Lexema: \"%s\"\n",yytext);}
"<=" {printf("Token: LE -> Lexema: \"%s\"\n",yytext);}
">=" {printf("Token: GE -> Lexema: \"%s\"\n",yytext);}
"==" {printf("Token: EQ -> Lexema: \"%s\"\n",yytext);}
"<>" {printf("Token: NE -> Lexema: \"%s\"\n",yytext);}
not {printf("Token: NOT -> Lexema: \"%s\"\n",yytext);}
or {printf("Token: OR -> Lexema: \"%s\"\n",yytext);}
and {printf("Token: AND -> Lexema: \"%s\"\n",yytext);}
if {printf("Token: IF -> Lexema: \"%s\"\n",yytext);}
elsif {printf("Token: ELSIF -> Lexema: \"%s\"\n",yytext);}
else {printf("Token: ELSE -> Lexema: \"%s\"\n",yytext);}
while {printf("Token: WHILE -> Lexema: \"%s\"\n",yytext);}
{digit}* {printf("Token: NUM -> Lexema: \"%s\"\n",yytext);}
{id} {printf("Token: ID -> Lexema: \"%s\"\n",yytext);}
"+" {printf("Token: + -> Lexema: \"%s\"\n",yytext);}
"-" {printf("Token: - -> Lexema: \"%s\"\n",yytext);}
"/" {printf("Token: / -> Lexema: \"%s\"\n",yytext);}
"*" {printf("Token: * -> Lexema: \"%s\"\n",yytext);}
"(" {printf("Token: ( -> Lexema: \"%s\"\n",yytext);}
")" {printf("Token: ) -> Lexema: \"%s\"\n",yytext);}
"[" {printf("Token: [ -> Lexema: \"%s\"\n",yytext);}
"]" {printf("Token: ] -> Lexema: \"%s\"\n",yytext);}
"{" {printf("Token: { -> Lexema: \"%s\"\n",yytext);}
"}" {printf("Token: } -> Lexema: \"%s\"\n",yytext);} 
";" {printf("Token: ; -> Lexema: \"%s\"\n",yytext);}




 
{digit}+{id}+ {printf("ERROR \"%s\"\n",yytext); return 0;}

. { printf("Erro - Caracter invalido: %c.\n", yytext[0]);
exit(-1); }
%%


/*codigo em C. Foi criado o main, mas podem ser criadas outras funcoes aqui.*/


int main(void)
{

/* Call the lexer, then quit. */

yylex();

return 0;

}