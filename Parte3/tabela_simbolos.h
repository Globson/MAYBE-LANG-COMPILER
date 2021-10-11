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

void Adiciona_Entrada_Identificador(Entrada_Tabela* LinhaTab, char *id){
    strcpy(LinhaTab->id, id);
}

int Compara_Entrada(Entrada_Tabela *LinhaTab, char *id){
    return strcmp(LinhaTab->id, id) == 0 ? 1 : 0;
}

void Print_Entrada(Entrada_Tabela LinhaTab){
    printf("%s", LinhaTab.id);
}

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
      Print_Entrada((*Tabela_Simbolos).Tabela[i]);
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
  Adiciona_Entrada_Identificador(&(Tabela_Simbolos->Tabela[Tabela_Simbolos->Proxima_Entrada]), id);
  Tabela_Simbolos->Proxima_Entrada++;
}


int Entrada_Existente_Tabela(Tabela_Simbolos *Tabela_Simbolos, char *id){
  for (int i = 0; i < Tabela_Simbolos->Proxima_Entrada; i++){
    if (Compara_Entrada(&(Tabela_Simbolos->Tabela[i]), id)) return 1;
  }
  return 0;
}

#endif