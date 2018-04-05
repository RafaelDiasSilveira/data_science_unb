library(jsonlite)
library("dplyr")
library(stringr)

# Importação do arquivo JSON
unb_perfis_json <- "./files/unb.perfis.json"
unb_perfis_raw <- fromJSON(unb_perfis_json)

# Garante que todos os supostos id's são do mesmo tamanho
id_size <- str_length(names(unb_perfis_raw))
any(id_size != 16)

# Garante que todos os supostos id's são únicos
any(duplicated(names(unb_perfis_raw)))

# unb_perfis_raw <- unname(unb_perfis_raw)

# Conjunto para teste
size <- length(unb_perfis_raw)
sample <- sample(1:size, 1)

data <- unb_perfis_raw[sample]
data2 <- unlist(data, recursive = FALSE, use.names = FALSE)

id_pessoa <- names(data)

########################################################################

########################################################################
# Analise de cada campo
str(data2[[1]])
str(data2[[2]])
str(data2[[3]])
str(data2[[4]])
str(data2[[5]])
str(data2[[6]])
str(data2[[7]])

# 1 - Criação do dataframe Pessoa
pessoa_df <- data_frame(id_pessoa, data2[[1]], data2[[2]], data2[[7]])
colnames(pessoa_df) <- c('id_pessoa', 'nome', 'resumo_cv', 'senioridade')
# glimpse(pessoa_df)

# 2 - Criação do dataframe Area_atuacao
area_atuacao_df <- data.frame(id_pessoa, data2[3], stringsAsFactors = FALSE)
# glimpse(area_atuacao_df)

# 3 - Criação do dataframe Endereco_profissional
sub_df <- as.data.frame(data2[[4]], stringsAsFactors = FALSE)
endereco_profissional_df <- data.frame(id_pessoa, sub_df, stringsAsFactors = FALSE)
# glimpse(endereco_profissional_df)
