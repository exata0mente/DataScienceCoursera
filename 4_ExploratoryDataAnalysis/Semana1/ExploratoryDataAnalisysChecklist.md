---
livro: Exploratory Data Analysis
autor: Roger Peng
capitulo: Exploratory Data Analisys Checklist
pagina: 18
---

Decidi começar pelo livro de [Exploratory Data Analisys](https://leanpub.com/exdata) devido ao pequeno problema com a língua inglesa (os vídeos da primeira semana são longos e com bastante "conversação").

O capítulo é o _Exploratory Data Analisys Checklist_, página 18, em que o autor indica um checklist não oficial para guiar na análise exploratória dos dados:

### Checklist
#### Formular sua pergunta

É importante ter uma pergunta delimitada ao se realizar uma análise exploratória. Pense que trabalharemos com um conjunto de dados extensos e com diversas variáveis. Se explorarmos estes dados se uma pergunta ou sem uma hipótese perderemos muito tempo navegando nas diversas possibilidades que o conjunto pode apresentar.

No livro o autor utiliza o [conjunto de dados](https://github.com/rdpeng/exdata/tree/master/other_data) de poluição do ar fornecido pela _U.S. Environmental Protection Agency (EPA)_ e faz duas perguntas: *Os níveis de poluição do ar são mais altos na costa leste do que na costa oeste?* e *Os níveis de ozônio são, em média, mais altos na cidade de Nova York do que em Los Angeles?*.

Veja que a segunda pergunta tem maior delimitação já que analisariamos duas cidades ao invés de dezenas.

#### Ler o dado.

As etapas que envolvem o código estarão [neste script](codigos/bEDA_book.R).

Basicamente nesta etapa lemos o código para uma variável.

#### Checar a embalagem

Uma rápida olhada no tamanho do dataset com as funções `ncol()` e `nrow()`

#### Executar o `str()`

A função `str()` mostra a estrutura interna de um o objeto *R*. Para dataframes é super útil pois apresenta as colunas com as suas determinadas classes e um pequeno resumo do conteúdo de cada coluna.

#### Olhar o início e o fim do seu dado

A função `head()` e `tail()` mostram, respectivamente, os primeiros e últimos registros (ou linhas) do seu dado. É importante analisar esses pontos pois possivelmente há comentários na última linha do arquivo, podendo não ter sido ignorado no momento da leitura do conjunto de dados.

#### Valide os seus 'n's

Esta parte é muito interessante! 

Não basta apenas contar a quantidade de registros de uma tabela, precisamos ver se os dados ali dentro condizem com a realidade da amostra. Por exemplo, você possui um conjunto de dados que tem uma tabela com o ano (apenas o ano) que o sujeito nasceu. É uma boa prática olhar esse dado pois você pode encontrar erros de digitação, como 1900.

No livro Roger Peng dá dois exemplos sensacionais. O primeiro é que, dado o fato que o conjunto de dados possui medidas retiradas _hourly_ (de hora em hora), é pertinente verificar se as horas das medições possuem esta medição.

Outro ponto visto é que o Estados Unidos possui 50 condados oficiais mas há 52 condados distintos no conjunto de dados:

> We knew that there are only 50 states in the U.S., so seeing 52 state names was an immediate trigger that something might be off. In this case, all was well, but validating your data with an external data source can be very useful. 

#### Valide com uma fonte de dados externas

É uma redundância necessária. Sempre que possível validar os dados com uma outra fonte, que indique mais ou menos o _range_ dos valores. Por exemplo, você tem uma tabela com uma medida que tem valores entre 100 e 800 mas os padrões de publicações com estas medidas possuem valores entre 0,1 e 0,8.

#### Tente uma solução fácil

De fato tentar responder a pergunta feita lá no início de forma fácil (aqui sugiro dar uma olhada no livro, pois o Roger Peng faz análises sensacionais! Sou fã desse cara)

#### Desafie sua solução

Questione alguns aspectos da sua solução, por exemplo verificando se aquela faixa de valor se repetiu em outros anos.

#### Perguntas de acompanhamento

* Temos o conjunto de dados correto?
* Precisamos de outro conjunto de dados?
* Temos a pergunta certa?