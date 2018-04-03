# Dicionário de dados

Dicionário de dados para os arquivos utilizados no trabalho final da disciplina de **Data Science**.

## Arquivo ``` unb.perfis.json ```

Ao utilizar a função ```fromJSON()``` do pacote ``` jsonlite ```, é obitida uma lista de listas nomeadas heterogêneas com os seguintes campos cada:

| Campo                  |      Tipo     | Index |
|------------------------|:-------------:|:-----:|
| nome                   | chr           |   1   |
| resumo_cv              | chr           |   2   |
| areas\_de\_atuacao     | data.frame    |   3   |
| endereco_profissional  | list          |   4   |
| producao_bibliografica | list          |   5   |
| orientacoes_academicas | list          |   6   |
| senioridade            | chr           |   7   |

O nome da lista é uma string única de 16 caracteres numéricos. Não se sabe qual informação dentro do contexto esse nome representa. Essa string será utilizada como id única para conectar as informações entre os dataframes criados.

Ao final do tratamento, serão gerados X dataframes:

+ Pessoa
+ Area_atuacao
+ Endereco_profissional
+ Producao_bibliografica
+ Orientacao_academica