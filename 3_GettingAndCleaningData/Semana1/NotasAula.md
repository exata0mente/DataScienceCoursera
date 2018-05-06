Raw data (Dados brutos)
    Fonte original dos dados.
    Precisa ser processado para ser utilizado na analise dos dados
    Precisa ser processado apenas uma vez
Dados processados
    Dados prontos para análise
    Seu processamento pode incluir união, subconjuntos, transformações, etc (ou seja pode "mutar" os dados).
    Pode haver padrões para processar
    Todo o processo deve ser gravado
        Isso porque a apresentação final dos dados pode ter passador por várias etapas de processamento. O professor exemplifica utilizando o sequenciamento de genoma, que passa por várias etapas até chegar no resultado apresentado. Estas etapas são importantes para R & R.
    
Tidy Data (Dado arrumado)
    As quatro "coisas" que devemos ter.
        1. O dado bruto (raw data).
        2. O conjunto de dados arrumado.
        3. Um *code book* descrevendo cada variável e os valores do conjunto de dados arrumados.
        4. Os passos utilizados para chegar no tidy data.
        
1) Raw Data
    
    Você sabe que os dados brutos estão no formato certo se você:

     Não executou nenhum software nos dados
     Não modificou nenhum dos valores de dados
     Você não removeu nenhum dado do conjunto de dados
     Você não resumiu os dados de maneira alguma
https://github.com/jtleek/datasharing#the-raw-data

2) Tidy Data

    O conjunto de dados arrumado DEVE:
    
        1. Cada variável em uma coluna.
        2. Cada observação diferente desta variável deve estar em uma linha diferente.
        3. Deve haver uma tabela para cada "tipo" de variável.
        4. Se você tiver várias tabelas, elas devem incluir uma coluna na tabela que permita que elas sejam unidas ou mescladas (tipo banco de dados).
    
https://github.com/jtleek/datasharing#the-tidy-data-set

3) *Code Book*

    Descrever com o máximo de detalhes possíveis os dados e resultados que você obteve, basicamente:
    
    1. Informações sobre as variáveis (incluindo unidades!) No conjunto de dados não contido nos dados arrumados.
    2. Informações sobre as opções de resumo (aqui pode-se enteder como o script, código, algoritmo, etc)  que você fez.
    3. Informações sobre o desenho do estudo experimental que você usou.(que tipo de método foi utilizado).
    
    Um formato comum para este documento é um arquivo do Word (Markdown é bem aceitável na comunidade acadêmica). 
    Deve haver uma seção chamada **"Desenho do estudo"** que tenha uma descrição detalhada de como você coletou os dados.
    Deve haver uma seção chamada **"Code book"** que descreve cada variável e suas unidades.

https://github.com/jtleek/datasharing#the-code-book

4) A lista de instrução (script)

    1. Deve ser preferencialmente feita em linguagem de script (R por exemplo).
    2. A entrada deve ser o conjunto de dados bruto (raw data).
    3. A saída deve ser o conjunto de dados arrumados (tidy data).
    4. Não haver parâmetros (esta foi uma dica do professor que sinceramente não entendi. Vou pesquisar melhor).

    Pode ser necessário descrever alguns passos.
        Abra o arquivo versão x;
        etc.
        
    
### Palavras-chave

raw; tidy data

## Como baixar um arquivo

* Obter/Definir diretório
    getwd()
    setwd()
* Checar e criar o diretório
    file.exists("dirname") [retorna TRUE ou FALSE]
    dir.create("dirname")
* Obter arquivo da Web
    download.file("url", destfile, method)
        no linux, se o url for precedido por HTTPS, passe o parâmetro method="curl")

## Lendo arquivos locais

* read.table()
    função flexivel e robusta, pode receber diversos parâmetros
    pode ser lenta para grandes arquivos
    lê os arquivos na memória RAM (o que pode ser ruim para arquivos muito grandes)
    os parÂmetros mais importantes são file, header, sep, row.names, nrows

## Lendo arquivos Excel

Pacote xlsx 
read.xlsx() - Lê o arquivo em excel
    sheetIndex -> em qual "Planilha" ler
    colIndex -> coluna(s) a ler
    rowIndex -> linha(s) a ler
write.xlsx() - Escreve o arquivo em excel, utiliza parametros similar
read.xlsx2() - Parece ser melhor que o read.xlsx, mas apresenta instabilidade na leitura de subconjuntos
Pacote  XLConnect é mais flexivel

## Lendo arquivos XML

Componentes de um XML:
    Marcação: *Tag* de uma parte da estrutura
    Conteúdo: Texto dentro da tag
    
abre tag: <exemplo>
fecha tag: </exemplo>

elementos: são tags específicas, por exemplo: <saudacoes> Bom dia, cara </saudacoes>
atributos: são componentes da tag, exemplo: <img src="jeff.jpg" alt="instructor">

pacote XML

xmlTreeParse(file) - "converte" o conteúdo do XML para conteúdo analisável pelo R, ou seja, transforma o conteúdo do XML em um objeto que o R consiga interpretar.
xmlRoot(obj) - retorna um objeto XML, estruturado em lista, a partir do nó principal, retirando por exemplo as tags de identificação de versão e etc. Além disso, estrutura o XML para que seja possível acessar cada elemento. É possível extrair subconjuntos do objeto.
xmlName(obj) - retorna o nome do nó principal do objeto.
xmlValue(obj) - retorna o conteúdo das tags do arquivo XML. O resultado é um único vetor, sem caractere de separção.
xmlApply(obj, func) - Faz o mesmo papel do lapply e sapply. Acessa cada sub-nó do xml e aplica a função passada por parâmetro.
xmlSApply(obj, func) - Faz o mesmo papel do lapply e sapply. Acessa cada sub-nó do xml e aplica a função passada por parâmetro.
xpathSApply(obj, path, fun) - Utiliza a sintaxe XPath para localizar informações dentro de uma estrutura xml.

XPath
É uma linguagem de marcação que podemos utilizar para acessar nós do xml conforme sua estrutura. Para maiores informações, ler esta [publicação](https://www.stat.berkeley.edu/~statcur/Workshop2/Presentations/XML.pdf) recomendada.

## Lendo arquivo JSON

pacote jsonlite

estrutura de dados, permite vários tipos de dados
fromJSON(url) - retorna um objeto JSON a partir de uma url ou arquivo no formato json.
toJSON(url) - converte um arquivo do tipo data.frame e um arquivo json.

