library(jsonlite)
library("dplyr")

# Importação do arquivo JSON
prod_bibli_json <- "./files/unb.relatorioProducaoBibiografica.json"
prod_bibli_raw <- fromJSON(prod_bibli_json)

rel_orientacao_json <- "./files/unb.relatorioOrientacao.json"
rel_orientacao_raw <- fromJSON(rel_orientacao_json)


# Criação dos dataframes
############################################################################
temp <- prod_bibli_raw$PERIODICO
periodico_df <- bind_rows(temp)

temp <- prod_bibli_raw$LIVRO
livro_df <- bind_rows(temp)

temp <- prod_bibli_raw$CAPITULO_DE_LIVRO
capitulo_livro_df <- bind_rows(temp)

temp <- prod_bibli_raw$TEXTO_EM_JORNAIS
texto_jornal_df <- bind_rows(temp)

temp <- prod_bibli_raw$ARTIGO_ACEITO
artigo_df <- bind_rows(temp)
#############################################################################
tipo_orientacao <- (names(rel_orientacao_raw))
tipo_orientacao[[2]]

orientacao_df <- data_frame()
i <- 1

# Loop para gerar o dataframe final
for (lista in rel_orientacao_raw) {
  temp <- bind_rows(lista)
  temp <- mutate(temp, tipo = tipo_orientacao[i])
  orientacao_df <- bind_rows(orientacao_df, temp)
  i <- i + 1
}
#############################################################################
