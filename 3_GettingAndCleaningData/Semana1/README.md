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
