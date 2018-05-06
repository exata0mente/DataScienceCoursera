# Índice

# Notas de Aula [Semana 1]

## Raw Data (dados brutos)

O *raw data* é basicamente o dado bruto, "direto do forno", o que significa que ele não passou por nenhum processamento prévio, nem por nenhum software que possa ter alterado algum dado, nenhum dado foi movido entre colunas e nenhum script de limpeza foi executado. Ou seja, o dado definitivamente **bruto**, necessitando de lapidação.

Essas são simples caracteristicas de um *raw data*.

## Tidy Data (dados arrumados)

É a próxima etapa dos dados brutos, aqui o **raw data** foi processado e o(s) conjunto(s) resultante(s) já estão prontos para análise. *Tidy Data* possui um [*paper*](http://vita.had.co.nz/papers/tidy-data.pdf) bem conhecido no meio da análise de dados que tras definições mais precisas sobre o seu "estado".

[Define-se](https://github.com/jtleek/datasharing#the-tidy-data-set) que, o tidy data precisa ter algumas características:

* Cada variável em uma coluna.
* Cada observação diferente desta variável deve estar em uma linha diferente.
* Deve haver uma tabela para cada "tipo" de variável.
* Se você tiver várias tabelas, elas devem incluir uma coluna na tabela que permita que elas sejam unidas ou mescladas (tipo banco de dados).

## Code Book

Um *code book* possui todos as descrições sobre os dados em que trabalhamos. Nele por exemplo, possui descrições como as variáveis e suas unidades, métodos utilizados para obtenção de algum resultado, scripts utilizados, etc.

*Cabe neste tópico uma melhor abordagem já que precisaremos de um code book para o projeto final deste curso. Vamos alimentando-o com o decorrer do curso*

## Passos até chegar ao resultado da análise

Descreve-se como chegamos ao *tidy data*. Para o nosso caso, **Deve ser preferencialmente feita em linguagem de script (R por exemplo)**, que deve ter como entrada o raw data e como saída o tidy data. Nestas descrições deve-se informar também passos adicionais necessários, por exemplo: salvar o arquivo x na pasta yx, utilizar o algoritmo de versão 3.2.1, etc.

Estes tópicos, na sequência em que apareceram, formam um "boas-práticas" no envio de dados à um estatístico, além de ser uma forma bem aceita quando se divulga uma análise de dados.

Referência: https://github.com/jtleek/datasharing

Mapa mental resultante desta aula

![mindmap1](recursos/como_compartilhar_os_dados.png)

## Trabalhando com pastas

Como trabalhamos com muitos arquivos, locais ou na web, precisamos de um diretório de trabalho para seguirmos com as devidas manipulações.

Para definir um diretório de trabalho utilizamos a função `setwd("path")`, onde *path* pode ser o **caminho absoluto** da pasta (/home/exata/DataScience/dados") ou o **caminho relativo** a partir do diretório atual (./DataScience/dados).
Convém, ao trabalhar com scripts criarão automáticamente a pasta, verificar se a pasta a ser criada já existe:

    if(!file.exists("./data"){
        dir.create("data")
    }
    ....

![mindmap2](recursos/trabalhando_com_arquivos.png)
    
## Lendo arquivos

### Arquivos _flat_

Na grande maioria das vezes trabalha-se, localmente, com arquivos de estrutura simples, conhecidos como [flat files](http://www.revistabw.com.br/revistabw/flat-file/). CSV é um exemplo de *flat file*.

Podemos usar a função `read.table()` para ler este tipo de arquivo. Esta função é muito poderosa pois possui diversos parâmetros que podem otimizar o processo de leitura. Por exemplo:

* `header`: valor lógico, diz se o a primeira linha do arquivo corresponde ao cabeçalho.
* `sep`: string, informa qual o caractere que separa as colunas.
* `nrows`: inteiro, quantas linhas deseja ler do arquivo?
* `skip`: inteiro, quantas linhas deseja pular, a partir da primeira, do arquivo?
* diversos outros parâmetros, ver `help()` da função.

Além desta função temos também a `read.csv()` que possui é basicamente a mesma função porém com os parâmetros `header=TRUE` e `sep=","`.

### Arquivos xlsx (Excel)

**Pacote**: xlsx ou XLConnect

Os arquivos em excel podem ser lidos baseado em sua estrutura: planilha, linha e coluna.

Com o pacote xlsx temos:
* `read.xlsx()` - Lê o arquivo em excel,
    * `sheetIndex`: inteiro, em qual "Planilha" ler,
    * `colIndex`: inteiro, coluna(s) a ler,
    * `rowIndex`: inteiro, linha(s) a ler,
* `write.xlsx()` - Escreve o arquivo em excel, utiliza parametros similar.
* `read.xlsx2()` - Parece ser melhor que o `read.xlsx()`, mas apresenta instabilidade na leitura de subconjuntos.

### Arquivos XML

**Pacote**: XML

Os arquivos XML, muito utilizado em aplicações Web, podem ser lidos baseado em sua estrutura: etiqueta, atributo e conteúdo:

Funções básicas e de grande utilidade no pacote XML:

* `xmlTreeParse(file)` - "converte" o conteúdo do XML para conteúdo analisável pelo R, ou seja, transforma o conteúdo do XML em um objeto que o R consiga interpretar.
* `xmlRoot(obj)` - retorna um objeto XML, estruturado em lista, a partir do nó principal, retirando por exemplo as tags de identificação de versão e etc. Além disso, estrutura o XML para que seja possível acessar cada elemento. É possível extrair subconjuntos do objeto.
* `xmlName(obj)` - retorna o nome do nó principal do objeto.
* `xmlValue(obj)` - retorna o conteúdo das tags do arquivo XML. O resultado é um único vetor, sem caractere de separção.
* `xmlApply(obj, func)` - Faz o mesmo papel do lapply e sapply. Acessa cada sub-nó do xml e aplica a função passada por parâmetro.
* `xmlSApply(obj, func)` - Faz o mesmo papel do lapply e sapply. Acessa cada sub-nó do xml e aplica a função passada por parâmetro.
* `xpathSApply(obj, path, fun)` - Utiliza a sintaxe XPath para localizar informações dentro de uma estrutura xml.

#### XPath

Cabe aqui uma menção ao XPath, uma linguagem de marcação a ser utilizada com XML. Para maiores informações, ler esta [publicação](https://www.stat.berkeley.edu/~statcur/Workshop2/Presentations/XML.pdf) recomendada.

### Arquivos JSON

**Pacote**: jsonlite

Os arquivos JSON são bastante utilizado em API. Sua estrutura pode receber qualquer tipo de valor.

Funções básicas:

* `fromJSON(url)` - retorna um objeto JSON a partir de uma url ou arquivo no formato json.
* `toJSON(url)` - converte um arquivo do tipo data.frame e um arquivo json.

![mindmap3](recursos/lendo_arquivos.png)