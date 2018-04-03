library(jsonlite)
library("dplyr")
library(stringr)

# Importação do arquivo JSON
unb_perfis_json <- "./files/unb.perfis.json"
unb_perfis_raw <- fromJSON(unb_perfis_json)

# Garante que todos os supostos id's são do mesmo tamanho
id_size <- str_length(names(unb_perfis_raw))
any(id_size != 16)

# Conjunto para teste
size <- length(unb_perfis_raw)
sample <- sample(1:size, 1)

data <- unb_perfis_raw[sample]
data2 <- unlist(data, recursive = FALSE, use.names = FALSE)
id <- names(data)

# 1 - Criação do dataframe Pessoa
pessoa_dt <- data_frame(id, data2[[1]], data2[[2]], data2[[7]])
colnames(pessoa_dt) <- c('id', 'nome', 'resumo_cv', 'senioridade')
glimpse(pessoa_dt)

# do.call('rbind', lista_pessoa) lista_pessoa 2 3 4 5 6 7

# data2 <- unlist(data, recursive = FALSE, use.names = FALSE)

# Transforma uma lista de dataframes em um único dataframe 
# dfs <- do.call("rbind", )

# glimpse(data2[7])
