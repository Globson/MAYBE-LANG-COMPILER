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


else | if | elsif | while | void | return {printf("Token: KEYW -> Lexema: \"%s\"\n",yytext);} 

"+"|"-"|"*"|"/"|"<"|"<="|">"|">="|"=="|"<>"|"="|";"|"("|")"|"["|"]"|"{"|"}" {printf("Token: SIMB  \"%s\"\n",yytext);}

 
{digit}+ {printf("Token: NUM \"%s\" \n",yytext);}

{digit}+{id}+ {printf("ERROR \"%s\"\n",yytext); return 0;}

{id}+ {printf( "Token: ID -> Lexema: \"%s\"\n",yytext);}




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