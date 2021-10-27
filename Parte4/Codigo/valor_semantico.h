#ifndef VALOR_SEMANTICO_H
#define VALOR_SEMANTICO_H

#include <stdio.h>

typedef enum
{
    VOID,
    INT,
    FLOAT,
    CHAR,
    BOOL,
    STRING
} Tipo;

int imprime_tipo(Tipo symbolTableType){
    switch (symbolTableType)
    {
    case INT:
        return printf("Int");

    case FLOAT:
        return printf("Float");

    case CHAR:
        return printf("Char");

    case BOOL:
        return printf("Bool");

    default:
        return 1;
    }
}

typedef struct
{
    char String[100];
    Tipo tipo;
} ValorSemantico;


#endif
