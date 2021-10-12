#ifndef TABELA_SIMBOLOS
#define TABELA_SIMBOLOS

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct 
{
    char type[10];
    char id[100];
} Entrada_Tabela;

typedef struct
{
    Entrada_Tabela Tabela[1024];
    unsigned int Proxima_Entrada;
} Tabela_Simbolos;

void Nova_Tabela(Tabela_Simbolos *Tabela_Simbolos){
  Tabela_Simbolos->Proxima_Entrada = 0;
}

void Printa_Tabela_Simbolos(Tabela_Simbolos *Tabela_Simbolos){
  printf("Tabela de Simbolos:\n");
  printf("| N | ID | Tipo\n");
  printf("-------------\n");
  for (unsigned int i = 0; i < Tabela_Simbolos->Proxima_Entrada; i++){
      printf("| ");
      printf("%d | ",i+1);
      printf("%s", (*Tabela_Simbolos).Tabela[i].id);
      printf(" | ");
      printf("%s",(*Tabela_Simbolos).Tabela[i].type);
      printf(" | ");
      printf("\n");
  }
  printf("-------------\n");
}

void Adiciona_tipo_tabela(Tabela_Simbolos *Tabela_Simbolos, char *type){
  strcpy(Tabela_Simbolos->Tabela[Tabela_Simbolos->Proxima_Entrada].type,type);
}

void Adiciona_Entrada_Tabela_Simbolos(Tabela_Simbolos *Tabela_Simbolos, char *id){
  strcpy(Tabela_Simbolos->Tabela[Tabela_Simbolos->Proxima_Entrada].id, id);
  Tabela_Simbolos->Proxima_Entrada++;
}


int Entrada_Existente_Tabela(Tabela_Simbolos *Tabela_Simbolos, char *id){
  for (int i = 0; i < Tabela_Simbolos->Proxima_Entrada; i++){
    if (strcmp(Tabela_Simbolos->Tabela[i].id, id) == 0 ? 1 : 0)
      return 1;
  }
  return 0;
}

#endif