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

O nome da lista é uma string única de 16 caracteres numéricos. Não se sabe qual informação dentro do contexto esse nome representa. Essa string será utilizada como **id** única para conectar as informações entre os dataframes criados.

### Campos list
Os campos "endereco\_profissional", "producao\_bibliografica", "orientacoes\_academicas" são listas encadeadas compostas por:  

#### endereco\_profissional
Lista com os seguintes campos:

| Campo       |  Tipo  | Index |
|-------------|:------:|:-----:|
| instituicao | chr    |   1   |
| orgao       | chr    |   2   |
| unidade     | chr    |   3   |
| DDD         | chr    |   4   |
| telefone    | chr    |   5   |
| bairro      | chr    |   6   |
| cep         | chr    |   7   |
| cidade      | chr    |   8   |

#### producao_bibliografica
Uma lista de "data.frame" nomeados. Os nomes dos dataframes são relacionados ao tipo de produção realizada. Ex.: "PERIODICO", "CAPITULO\_DE\_LIVRO"

Após uma breve análise, percebe-se que será necessário criar um data.frame para cada tipo de produção, pois os campos em "PERIODICO" e "CAPITULO\_DE\_LIVRO", por exemplo, são distintos.

#### orientacoes_academicas

#### senioridade





Ao final do tratamento, serão gerados 5 dataframes:

+ Pessoa
+ Area_atuacao
+ Endereco_profissional
+ Producao_bibliografica
+ Orientacao_academica

### Dataframe Pessoa

| Campo                  |      Tipo     |
|------------------------|:-------------:|
| id                     | chr           |
| nome                   | chr           |
| resumo_cv              | chr           |
| senioridade            | chr           |

### Dataframe Area_atuacao
### Dataframe Endereco_profissional
### Dataframe Producao_bibliografica
### Dataframe Orientacao_academica

