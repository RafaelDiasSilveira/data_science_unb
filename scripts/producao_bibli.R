library(jsonlite)
library("dplyr")

# Importação do arquivo JSON
prod_bibli_json <- "./files/unb.relatorioProducaoBibiografica.json"
prod_bibli_raw <- fromJSON(prod_bibli_json)

# Verifica a estrutura do arquivo
str(prod_bibli_raw, vec.len	= 0, max.level = 3)


# Criação dos dataframes
temp <- prod_bibli_raw$PERIODICO
periodico_df <- do.call("rbind", temp)

temp <- prod_bibli_raw$LIVRO
livro_df <- do.call("rbind", temp)

temp <- prod_bibli_raw$CAPITULO_DE_LIVRO
capitulo_livro_df <- do.call("rbind", temp)

temp <- prod_bibli_raw$TEXTO_EM_JORNAIS
texto_jornal_df <- do.call("rbind", temp)

temp <- prod_bibli_raw$ARTIGO_ACEITO
artigo_df <- do.call("rbind", temp)
