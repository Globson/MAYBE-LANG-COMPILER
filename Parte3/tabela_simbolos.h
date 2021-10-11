#ifndef TABELA_SIMBOLOS
#define TABELA_SIMBOLOS

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct 
{
    char id[100];
} Entrada_Tabela;

typedef struct
{
    Entrada_Tabela Tabela[1024];
    unsigned int Proxima_Entrada;
} Tabela_Simbolos;

int Adiciona_Entrada_Identificador(Entrada_Tabela* LinhaTab, char *id){
    strcpy(LinhaTab->id, id);
    return 0;
}

int Compara_Entrada(Entrada_Tabela *LinhaTab, char *id){
    return strcmp(LinhaTab->id, id) == 0 ? 1 : 0;
}

int Print_Entrada(Entrada_Tabela LinhaTab){
  return printf("%s \n", LinhaTab.id);
}

int Nova_Tabela(Tabela_Simbolos *Tabela_Simbolos){
  Tabela_Simbolos->Proxima_Entrada = 0;
  return 0;
}

int Printa_Tabela_Simbolos(Tabela_Simbolos *Tabela_Simbolos){
  printf("Tabela de Simbolos:");
  for (unsigned int i = 0; i < Tabela_Simbolos->Proxima_Entrada; i++){
      Print_Entrada((*Tabela_Simbolos).Tabela[i]);
  }
  return 0;
}

int Adiciona_Entrada_Tabela_Simbolos(Tabela_Simbolos *Tabela_Simbolos, char *id){
  Adiciona_Entrada_Identificador(&(Tabela_Simbolos->Tabela[Tabela_Simbolos->Proxima_Entrada]), id);
  Tabela_Simbolos->Proxima_Entrada++;
  return 0;
}

int Entrada_Existente_Tabela(Tabela_Simbolos *Tabela_Simbolos, char *id){
  for (int i = 0; i < Tabela_Simbolos->Proxima_Entrada; i++){
    if (Compara_Entrada(&(Tabela_Simbolos->Tabela[i]), id)) return 1;
  }
  return 0;
}

#endif