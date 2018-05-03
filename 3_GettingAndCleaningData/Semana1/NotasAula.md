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