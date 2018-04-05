library(jsonlite)
library("dplyr")
library(stringr)
library(rlist)

# Importação do arquivo JSON
rel_orientacao_json <- "./files/unb.relatorioOrientacao.json"
rel_orientacao_raw <- fromJSON(rel_orientacao_json)

df_final <- data.frame()

# Loop para gerar o dataframe final
for (lista in rel_orientacao_raw) {
  for (df in lista) {
    df_final <- rbind(df_final, df)
  }
}

# Definir quais são factors
df_final$natureza <- as.factor(df_final$natureza) 
df_final$ano <- as.factor(df_final$ano)
df_final$instituicao <- as.factor(df_final$instituicao) 
df_final$curso <- as.factor(df_final$curso) 
df_final$bolsa <- as.factor(df_final$bolsa) 

glimpse(df_final)
summary(df_final$ano)

plot(x = df_final$ano, y = df_final$bolsa)
