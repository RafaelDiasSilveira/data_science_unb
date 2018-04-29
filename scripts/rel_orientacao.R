library(jsonlite)
library("dplyr")

# Importação do arquivo JSON
rel_orientacao_json <- "./files/unb.relatorioOrientacao.json"
rel_orientacao_raw <- fromJSON(rel_orientacao_json)

tipo_orientacao <- (names(rel_orientacao_raw))
tipo_orientacao[[2]]

df_final <- data_frame()
i <- 1

# Loop para gerar o dataframe final
for (lista in rel_orientacao_raw) {
  temp <- bind_rows(lista)
  temp <- mutate(temp, tipo = tipo_orientacao[i])
  df_final <- bind_rows(df_final, temp)
  i <- i + 1
}


# # Definir quais são factors
# df_final$natureza    <- as.factor(df_final$natureza)
# df_final$ano         <- as.factor(df_final$ano)
# df_final$instituicao <- as.factor(df_final$instituicao)
# df_final$curso       <- as.factor(df_final$curso)
# df_final$bolsa       <- as.factor(df_final$bolsa)
# df_final$tipo_orientacao.i. <- as.factor(df_final$tipo_orientacao.i.)
# 
# str(df_final, max.level = 1, ven.len = 0)
# 
# summary(df_final$ano)
# summary(df_final$tipo_orientacao.i.)
