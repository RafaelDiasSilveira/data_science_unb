library(jsonlite)
library("dplyr")

# Importação do arquivo JSON
bdtd_json <- "./files/bdtd_unb.json"
bdtd_raw <- fromJSON(bdtd_json)

str(bdtd_raw, max.level = 3, vec.len = 0)

df <- bdtd_raw$response$docs