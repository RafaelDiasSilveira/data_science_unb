library(jsonlite)
library("dplyr")
library(stringr)
library(rlist)

# Importação do arquivo JSON
unb_perfis_json <- "./files/unb.perfis.json"
unb_perfis_raw <- fromJSON(unb_perfis_json)

# Garante que todos os supostos id's são do mesmo tamanho
id_size <- str_length(names(unb_perfis_raw))
any(id_size != 16)

# Garante que todos os supostos id's são únicos
any(duplicated(names(unb_perfis_raw)))

# unb_perfis_raw <- unname(unb_perfis_raw)
 
# # Conjunto para teste
# size <- length(unb_perfis_raw)
# sample <- sample(1:size, 1)
# 
# data <- unb_perfis_raw[sample]

data <- unlist(unb_perfis_raw, recursive = FALSE, use.names = FALSE)

nomes <- names(unb_perfis_raw)

# Analise de cada campo
# str(unb_perfis_raw[1], vec.len	= 0, max.level = 3)

i <- 1

pessoa_df                <- data.frame()
area_atuacao_df          <- data.frame()
endereco_profissional_df <- data.frame()

for (lista in unb_perfis_raw) {
  # print(str(lista, max.level = 3, vec.len = 1))
  
  # 1 - Criação do dataframe Pessoa
  sub_df           <- data_frame(nomes[i], lista[[1]], lista[[2]], lista[[7]])
  colnames(sub_df) <- c('id_pessoa', 'nome', 'resumo_cv', 'senioridade')
  pessoa_df        <- rbind(pessoa_df, sub_df)
  
  # 2 - Criação do dataframe Area_atuacao
  sub_df           <- data.frame(nomes[i], lista[3], stringsAsFactors = FALSE)
  colnames(sub_df) <- c('id_pessoa', 'grande_area', 'area', 'sub_area', 'especialidade')
  area_atuacao_df  <- rbind(area_atuacao_df, sub_df)

  # 3 - Criação do dataframe Endereco_profissional
  sub_df  <- as.data.frame(lista[[4]], stringsAsFactors = FALSE)
  sub_df  <- data.frame(nomes[i], sub_df, stringsAsFactors = FALSE)
  endereco_profissional_df <- rbind(endereco_profissional_df, sub_df)
  
  i <- i + 1
}

str(area_atuacao_df)

