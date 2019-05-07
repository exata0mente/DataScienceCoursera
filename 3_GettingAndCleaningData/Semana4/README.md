# Manipulação de Textos e Datas

## Editando variáveis texto

É importante saber lidar com variaveis com conteúdo de texto principalmente em mineiração de dados. Devemos lembrar que os dados nem sempre estarão limpos e no formato exato. É mais provável que esteja em formato de texto.

Abaixo algumas funções que podem ser de grande utilidade:

* `tolower()` e `toupper()`: estas funções convertem em minúscula e maiúscula, respectivamente, todos os caracteres de um vetor. Elas são úteis para quando for necessário comparar por exatidão determinado valor. Exemplo:

```r
str1 <- 'Exata0mente'
str2 <- 'EXATA0MENTE'
tolower(str1) == tolower(str2)
```

* `strsplit(x, split, ...)`: Esta função divide um vetor de caracteres em vários vetores dentro de uma lista, usando um valor _split_ (em expressão regular) para separar o texto. (Ver exemplos em `?strsplit`)

* `gsub(patter, replacement, x)`: Esta função substitui o valor de _pattern_ por _replacemente_ de uma string _x_. Exemplo:

```r
str3 <- 'exata0mente'
gsub("0", "", str3)
```
* `grep(pattern, x, value = FALSE)`: Retorna os índices do vetor _x_ em que o texto _pattern_ é
encontrado. Se for passado o argumento `value = TRUE` será retornado o conteúdo. Lembrando que o _pattern_ precisa ser passado como uma expressão regular. 

* `grepl(pattern, x)`: Possui o mesmo comportamento da função `grep` mas retorna um vetor lógico.

```r
grep("[exat0mn]", letters)
grep("[exat0mn]", letters, value = TRUE)
grepl("[exat0mn]", letters)
table(grepl("[exat0mn]", letters))
```
### Mais funções úteis

* `nchar(x)`: Retorna a quantidade de caracteres de cada elemento do vetor.
* `substr(x, start, stop)`: Separa uma string x começando pela posição _start_ até a _stop_
* `paste(x,...)` e `paste0(x,...)`: Concatena (com separação por espaço e sem separação, respectivamente) várias strings passadas por parâmetro.

## O pacote stringr

```r
library(stringr)
```

Possui diversas funções usuais para lidar com strings. Por exemplo a função `str_trim(string)` que retira espaços em branco que aparecem no começo e no fim de uma string



